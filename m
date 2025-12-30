Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F96CEA4D9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 18:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D72E10E54C;
	Tue, 30 Dec 2025 17:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 626BE10E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 17:20:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E45CA1515;
 Tue, 30 Dec 2025 09:20:47 -0800 (PST)
Received: from 010265703453.localdomain (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B9BC53F63F;
 Tue, 30 Dec 2025 09:20:52 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de, neil.armstrong@linaro.org, dianders@chromium.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] drm/panel-edp: Move FriendlyELEC HD702E
Date: Tue, 30 Dec 2025 17:20:32 +0000
Message-Id: <027763b36fbad2005d09eeb289b7716c57f65e76.1767111809.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767111804.git.robin.murphy@arm.com>
References: <cover.1767111804.git.robin.murphy@arm.com>
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

FriendlyELEC's HD702E module is an eDP panel (in as much as it's some
LVDS LCD behind a Chrontel CH7511B eDP bridge), so move its data over
to the eDP driver, also resolving the warning about the missing bpc
value in the process.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/panel/panel-edp.c    | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c | 25 -------------------------
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 415b894890ad..dd53ccc209ce 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1256,6 +1256,29 @@ static const struct panel_desc boe_nv140fhmn49 = {
 	},
 };
 
+static const struct drm_display_mode friendlyarm_hd702e_mode = {
+	.clock		= 67185,
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 20,
+	.hsync_end	= 800 + 20 + 24,
+	.htotal		= 800 + 20 + 24 + 20,
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 4,
+	.vsync_end	= 1280 + 4 + 8,
+	.vtotal		= 1280 + 4 + 8 + 4,
+	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
+};
+
+static const struct panel_desc friendlyarm_hd702e = {
+	.modes = &friendlyarm_hd702e_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width	= 94,
+		.height	= 151,
+	},
+};
+
 static const struct drm_display_mode innolux_n116bca_ea1_mode = {
 	.clock = 76420,
 	.hdisplay = 1366,
@@ -1663,6 +1686,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "boe,nv140fhmn49",
 		.data = &boe_nv140fhmn49,
+	}, {
+		.compatible = "friendlyarm,hd702e",
+		.data = &friendlyarm_hd702e,
 	}, {
 		.compatible = "innolux,n116bca-ea1",
 		.data = &innolux_n116bca_ea1,
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b26b682826bc..3ea52667b858 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2359,28 +2359,6 @@ static const struct panel_desc frida_frd350h54004 = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
-static const struct drm_display_mode friendlyarm_hd702e_mode = {
-	.clock		= 67185,
-	.hdisplay	= 800,
-	.hsync_start	= 800 + 20,
-	.hsync_end	= 800 + 20 + 24,
-	.htotal		= 800 + 20 + 24 + 20,
-	.vdisplay	= 1280,
-	.vsync_start	= 1280 + 4,
-	.vsync_end	= 1280 + 4 + 8,
-	.vtotal		= 1280 + 4 + 8 + 4,
-	.flags		= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
-static const struct panel_desc friendlyarm_hd702e = {
-	.modes = &friendlyarm_hd702e_mode,
-	.num_modes = 1,
-	.size = {
-		.width	= 94,
-		.height	= 151,
-	},
-};
-
 static const struct drm_display_mode giantplus_gpg482739qs5_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -5235,9 +5213,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "frida,frd350h54004",
 		.data = &frida_frd350h54004,
-	}, {
-		.compatible = "friendlyarm,hd702e",
-		.data = &friendlyarm_hd702e,
 	}, {
 		.compatible = "giantplus,gpg482739qs5",
 		.data = &giantplus_gpg482739qs5
-- 
2.34.1

