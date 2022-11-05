Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C1961D7B0
	for <lists+dri-devel@lfdr.de>; Sat,  5 Nov 2022 07:01:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC42A10E0DF;
	Sat,  5 Nov 2022 06:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEB110E0B6;
 Sat,  5 Nov 2022 06:01:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B10F860A55;
 Sat,  5 Nov 2022 06:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF33C43141;
 Sat,  5 Nov 2022 06:01:32 +0000 (UTC)
Received: from rostedt by gandalf.local.home with local (Exim 4.96)
 (envelope-from <rostedt@goodmis.org>) id 1orCFk-007OwK-2G;
 Sat, 05 Nov 2022 02:02:00 -0400
Message-ID: <20221105060200.540142479@goodmis.org>
User-Agent: quilt/0.66
Date: Sat, 05 Nov 2022 02:00:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4a 31/38] timers: drm: Use timer_shutdown_sync() for on stack
 timers
References: <20221105060024.598488967@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Before a timer is released, timer_shutdown_sync() must be called.

Link: https://lore.kernel.org/all/20221104054053.431922658@goodmis.org/

Cc: "Noralf Trønnes" <noralf@tronnes.org>
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
 drivers/gpu/drm/gud/gud_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 7c6dc2bcd14a..08429bdd57cf 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -272,7 +272,7 @@ static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
 
 	usb_sg_wait(&ctx.sgr);
 
-	if (!del_timer_sync(&ctx.timer))
+	if (!timer_shutdown_sync(&ctx.timer))
 		ret = -ETIMEDOUT;
 	else if (ctx.sgr.status < 0)
 		ret = ctx.sgr.status;
-- 
2.35.1
