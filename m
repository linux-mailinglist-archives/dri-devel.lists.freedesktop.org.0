Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDE460FBAB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA2110E673;
	Thu, 27 Oct 2022 15:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B76010E673;
 Thu, 27 Oct 2022 15:20:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 94BB7B826D6;
 Thu, 27 Oct 2022 15:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33F7C433C1;
 Thu, 27 Oct 2022 15:20:38 +0000 (UTC)
Date: Thu, 27 Oct 2022 11:20:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH v2 13/31] timers: drm: Use del_timer_shutdown()
 before freeing timer
Message-ID: <20221027112053.20208401@gandalf.local.home>
In-Reply-To: <20221027150927.611233945@goodmis.org>
References: <20221027150525.753064657@goodmis.org>
 <20221027150927.611233945@goodmis.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 intel-gfx@lists.freedesktop.org,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[
  quilt mail --send still can't handle unicode characters.
    Here's the patch again
]

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Before a timer is freed, del_timer_shutdown() must be called.

Link: https://lore.kernel.org/all/20220407161745.7d6754b3@gandalf.local.hom=
e/

Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 drivers/gpu/drm/gud/gud_pipe.c       | 2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 7c6dc2bcd14a..5117a24ca4b5 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -272,7 +272,7 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t=
 len)
=20
 	usb_sg_wait(&ctx.sgr);
=20
-	if (!del_timer_sync(&ctx.timer))
+	if (!del_timer_shutdown(&ctx.timer))
 		ret =3D -ETIMEDOUT;
 	else if (ctx.sgr.status < 0)
 		ret =3D ctx.sgr.status;
diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i9=
15_sw_fence.c
index 6fc0d1b89690..c762e99c8fdf 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -465,7 +465,7 @@ static void irq_i915_sw_fence_work(struct irq_work *wrk)
 	struct i915_sw_dma_fence_cb_timer *cb =3D
 		container_of(wrk, typeof(*cb), work);
=20
-	del_timer_sync(&cb->timer);
+	del_timer_shutdown(&cb->timer);
 	dma_fence_put(cb->dma);
=20
 	kfree_rcu(cb, rcu);
--=20
2.35.1
