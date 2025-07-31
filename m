Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0882EB16EAB
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 11:30:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5487B10E00D;
	Thu, 31 Jul 2025 09:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gDfTz4sZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537D210E00D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 09:30:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6436B601F0;
 Thu, 31 Jul 2025 09:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D23C4CEF5;
 Thu, 31 Jul 2025 09:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753954248;
 bh=/aNQjQHtj7pCmn3Pkk5hk5UlaMfxeMxDUeslc601hdc=;
 h=From:To:Cc:Subject:Date:From;
 b=gDfTz4sZhUil6BEsal0RQrY+KKrMbzZuaRajDu8wsowGnjc6++giIR2Fwc7MYbDbn
 2nbTQRuP5NhHhE9IL/uotJ+uBh9ph05RFwvK1xh0aOTMAKloWMs+vWEapv4r0ieay1
 7+xjDYQSyOBD3rxVQziQexxLsR9Ov1MvGJ1JYWsZYBk8h4Dhk2w3lW/OIN3svND0UE
 zQF448W0guVzDxeTkQVw0V05mt2e9cNuwkQ5dr/yRAJEv4tbMDAcxP2kedxUDecyTv
 Ww2IlHqqoW7+sv5vvVjcZFNF/L98upeJYWH8ZbyCrHzsEh6QkIxYdRXaJkvWiIYN41
 +QGIwcH7xwTOQ==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 James Flowers <bold.zone2373@fastmail.com>
Subject: [PATCH] drm/sched: Document race condition in drm_sched_fini()
Date: Thu, 31 Jul 2025 11:30:09 +0200
Message-ID: <20250731093008.45267-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

In drm_sched_fini() all entities are marked as stopped - without taking
the appropriate lock, because that would deadlock. That means that
drm_sched_fini() and drm_sched_entity_push_job() can race against each
other.

This should most likely be fixed by establishing the rule that all
entities associated with a scheduler must be torn down first. Then,
however, the locking should be removed from drm_sched_fini() alltogether
with an appropriate comment.

Reported-by: James Flowers <bold.zone2373@fastmail.com>
Link: https://lore.kernel.org/dri-devel/20250720235748.2798-1-bold.zone2373@fastmail.com/
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 5a550fd76bf0..738aefed727c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1424,6 +1424,22 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 * Prevents reinsertion and marks job_queue as idle,
 			 * it will be removed from the rq in drm_sched_entity_fini()
 			 * eventually
+			 *
+			 * FIXME:
+			 * This lacks the proper spin_lock(&s_entity->lock) and
+			 * is, therefore, a race condition. Most notably, it
+			 * can race with drm_sched_entity_push_job(). The lock
+			 * cannot be taken here, however, because this would
+			 * lead to lock inversion -> deadlock.
+			 *
+			 * The best solution probably is to enforce the life
+			 * time rule of all entities having to be torn down
+			 * before their scheduler. Then, however, locking could
+			 * be dropped alltogether from this function.
+			 *
+			 * For now, this remains a potential race in all
+			 * drivers that keep entities aliver for longer than
+			 * the scheduler.
 			 */
 			s_entity->stopped = true;
 		spin_unlock(&rq->lock);
-- 
2.49.0

