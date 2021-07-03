Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D07383BA8DD
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 16:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D3089C3F;
	Sat,  3 Jul 2021 14:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAFA89C37
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Jul 2021 14:13:48 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 624B720A2B;
 Sat,  3 Jul 2021 16:13:45 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/gud: Add async_flush module parameter
Date: Sat,  3 Jul 2021 16:13:21 +0200
Message-Id: <20210703141321.35494-2-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210703141321.35494-1-noralf@tronnes.org>
References: <20210703141321.35494-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fOAXI6Se c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=KKAkSRfTAAAA:8 a=SJz97ENfAAAA:8
 a=y-Eh0KzKh6msMjfXOo4A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Peter Stuge <peter@stuge.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide a way for userspace to choose synchronous flushing/pageflips.
This helps save CPU and power.

It is also useful for test scripts since userspace can know when a flush
has happended and wait before doing the next visual test.

Cc: Peter Stuge <peter@stuge.se>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_pipe.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index e0fb6cc969a3..8f56bf618ac2 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -23,6 +23,19 @@
 
 #include "gud_internal.h"
 
+/*
+ * Some userspace rendering loops runs all displays in the same loop.
+ * This means that a fast display will have to wait for a slow one.
+ * For this reason gud does flushing asynchronous by default.
+ * The down side is that in e.g. a single display setup userspace thinks
+ * the display is insanely fast since the driver reports back immediately
+ * that the flush/pageflip is done. This wastes CPU and power.
+ * Such users might want to set this module parameter to false.
+ */
+static bool gud_async_flush = true;
+module_param_named(async_flush, gud_async_flush, bool, 0644);
+MODULE_PARM_DESC(async_flush, "Enable asynchronous flushing [default=true]");
+
 /*
  * FIXME: The driver is probably broken on Big Endian machines.
  * See discussion:
@@ -578,6 +591,8 @@ void gud_pipe_update(struct drm_simple_display_pipe *pipe,
 		if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE)
 			drm_rect_init(&damage, 0, 0, fb->width, fb->height);
 		gud_fb_queue_damage(gdrm, fb, &damage);
+		if (!gud_async_flush)
+			flush_work(&gdrm->work);
 	}
 
 	if (!crtc->state->enable)
-- 
2.23.0

