Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02006A27299
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D8910E22E;
	Tue,  4 Feb 2025 13:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5796F10E10D;
 Tue,  4 Feb 2025 13:21:46 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <dev@lankhorst.se>, Ingo Molnar <mingo@kernel.org>,
 David Lechner <dlechner@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH-resent-to-correct-ml 0/8] drm/xe: Convert xe_force_wake calls
 to guard helpers.
Date: Tue,  4 Feb 2025 14:22:29 +0100
Message-ID: <20250204132238.162608-1-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ignore my previous series please, it should have been sent to intel-xe, was sent to intel-gfx.

Instead of all this repetition of

{
	unsigned fw_ref;

	fw_ref = xe_force_wake_get(fw, domain);
	if (!xe_force_wake_ref_has_domain(..))
		return -ETIMEDOUT;

	...

out:
	xe_force_wake_put(fw_ref);
	return ret;
}

I thought I would look at how to replace it with the guard helpers.
It is easy, but it required some minor fixes to make DEFINE_LOCK_GUARD_1
work with extra init arguments.

So I changed the function signature slightly to make the first optional argument
a struct member (current behavior), and any additional argument goes to the init
call.

This replaces the previous code with
{
	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, domain) {
		....

		return ret;
	}
}

I' ve thought also of playing with this:
{
	CLASS(xe_force_wake_get, fw_ref)(fw, domain);
	if (!fw_ref.lock))
		return -ETIMEDOUT;

	...
	return ret;
}

I'm just fearing that the scoped_cond_guard makes it imposssible to get this
wrong, while in the second example it's not clear that it can fail, and that
you have to check.

Let me know what you think!
Feedback welcome for the header change as well, should probably go into the locking tree..

Cc: Ingo Molnar <mingo@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>

Maarten Lankhorst (8):
  header/cleanup.h: Add _init_args to DEFINE_LOCK_GUARD_1(_COND)
  drm/xe/gt: Unify xe_hw_fence_irq_finish() calls.
  drm/xe: Add scoped guards for xe_force_wake
  drm/xe: Add xe_force_wake_get_all
  drm/xe/coredump: Use guard helpers for xe_force_wake.
  drm/xe/gsc: Use guard helper for xe_gsc_print_info.
  drm/xe/vram: Use xe_force_wake guard helper
  drm/xe/gt: Convert to xe_force_wake guard helpers

 drivers/gpu/drm/xe/xe_devcoredump.c |  36 ++---
 drivers/gpu/drm/xe/xe_force_wake.c  | 161 ++++++++++++++----
 drivers/gpu/drm/xe/xe_force_wake.h  |  17 ++
 drivers/gpu/drm/xe/xe_gsc.c         |  22 +--
 drivers/gpu/drm/xe/xe_gt.c          | 243 ++++++++++------------------
 drivers/gpu/drm/xe/xe_vram.c        |  45 +++---
 include/linux/cleanup.h             |  30 ++--
 7 files changed, 293 insertions(+), 261 deletions(-)

-- 
2.47.1

