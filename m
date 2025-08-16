Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A848B28F33
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 17:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56F710E395;
	Sat, 16 Aug 2025 15:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="GuGp/UQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0217B10E395
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:34:50 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id D76A725C43;
 Sat, 16 Aug 2025 17:34:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2qCjzOpWtkC; Sat, 16 Aug 2025 17:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1755358487; bh=/BTHMpSsxFGcGqLg97eEU1oQoEm9/K6s0g4iNQIQMS0=;
 h=From:To:Cc:Subject:Date;
 b=GuGp/UQR1O1oOWkBU//Q+QGS4imjpSGNtAgoKNAluGxPBaR5PzlRSA0IQ4shCcRRP
 ZM8tyG7AF39bjZ5DnAH3vW+OIIyqiy5EKeHIrZxAVHyN3aUIEpsR5kkjLEbbszq2CQ
 qCM0WP6HDBWCIfqS/0pSoXgiEet1712LBMAF+s2ySpTUROa9wK9+Hd2tzHdf03Ujuk
 q38x4QgXALj63fVZIzZV3wWIqt5jpPe+LEzWu0BfEKA7Yxxj7wfGXraW0oGKx5cycs
 JIgZi0X708EizJqJkDYzhvOT6OTRietfdt8XbJySlz40oPwISGDWqUnr6xRpfy5PeS
 7Q8kJwdP64eDw==
From: Yao Zi <ziyao@disroot.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yao Zi <ziyao@disroot.org>
Subject: [PATCH 1/2] drm/vesadrm: Match framebuffer device by id instead of
 driver name
Date: Sat, 16 Aug 2025 15:34:29 +0000
Message-ID: <20250816153430.51235-1-ziyao@disroot.org>
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

Currently the driver matches the platform framebuffer device registered
by sysfb through driver name, "vesa-framebuffer", this is a little
confusing since this driver registers a DRM device, instead of a
framebuffer.

Moreover, we have a driver with the same name, enabled by
CONFIG_FB_VESA, that acts as a consumer of vesa-framebuffer as well.
They cannot be both loaded into the kernel.

Making these two drivers coexist is sometimes useful, e.g., a
distribution may want to build fbcon into the kernel image for debugging
purpose, but keep the whole DRM subsystem enabled as module. In such
case vesadrm could serve as a solution for running DRM-specific
userspace programs on platforms with only VESA VBIOS available.

Let's rename the driver as "vesa-display" to avoid possible confusion.
A platform_device_id table is introduced to match "vesa-framebuffer"
devices.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/gpu/drm/sysfb/vesadrm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 90615e9ac86b..16635dc3d5cc 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -3,6 +3,7 @@
 #include <linux/aperture.h>
 #include <linux/ioport.h>
 #include <linux/limits.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/screen_info.h>
 
@@ -517,10 +518,17 @@ static void vesadrm_remove(struct platform_device *pdev)
 	drm_dev_unplug(dev);
 }
 
+static const struct platform_device_id vesadrm_platform_id[] = {
+	{ "vesa-framebuffer" },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, vesadrm_platform_id);
+
 static struct platform_driver vesadrm_platform_driver = {
 	.driver = {
-		.name = "vesa-framebuffer",
+		.name = "vesa-display",
 	},
+	.id_table = vesadrm_platform_id,
 	.probe = vesadrm_probe,
 	.remove = vesadrm_remove,
 };
-- 
2.50.1

