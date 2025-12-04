Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C2ECA3103
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516BC10E8F7;
	Thu,  4 Dec 2025 09:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tGyaleQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D5F10E8F7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:45:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F6BD60185;
 Thu,  4 Dec 2025 09:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3C2C4CEFB;
 Thu,  4 Dec 2025 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764841556;
 bh=2f3vgAhcU3dgW9En/Hjs2lUOgZWqrjrBicUJtS55NvI=;
 h=From:To:Cc:Subject:Date:From;
 b=tGyaleQ1z+W32h+gSZ/UcAo57LuIs+x3OOJPqsxwLTw4mgmH1ZnwKvuoe1w8ySka5
 bbldJvo65I0skfP2CUy77F4IYrl37KyIZzkwpKDtv2CfuivsTRI8VbJwNcoAslM1fy
 JE/jqbWTdO3MpO/zcr6N56irb3RzgYR2/pO154pWOnclr6nh2Hz/nQZtv5gvLY+1pK
 1QT6m3VH/8FoicLFeyZbSK64EH/Yc+N1Gvqv9BTjepDTatBkiwpVvlkU1ZaJu4zNS3
 2fkh6ks3CFKKdYdTt19o9lVHDcqzy4l3/nM+J94eOGACtKpZBabobQ1OLtP9cR/QTg
 uI9g/S3UvOVCw==
From: Arnd Bergmann <arnd@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Brigham Campbell <me@brighamcampbell.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <jesszhan0024@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: novatek-nt35560: avoid on-stack device structure
Date: Thu,  4 Dec 2025 10:45:45 +0100
Message-Id: <20251204094550.1030506-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

A cleanup patch apparently by accident used a local device structure
instead of a pointer to one in the nt35560_read_id() function, causing
a warning about stack usage:

drivers/gpu/drm/panel/panel-novatek-nt35560.c: In function 'nt35560_read_id':
drivers/gpu/drm/panel/panel-novatek-nt35560.c:249:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

Change this to a pointer as was liley intended here.

Fixes: 5fbc0dbb92d6 ("drm/panel: novatek-nt35560: Clean up driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 561e6643dcbb..6e5173f98a22 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -213,7 +213,7 @@ static const struct backlight_properties nt35560_bl_props = {
 
 static void nt35560_read_id(struct mipi_dsi_multi_context *dsi_ctx)
 {
-	struct device dev = dsi_ctx->dsi->dev;
+	struct device *dev = &dsi_ctx->dsi->dev;
 	u8 vendor, version, panel;
 	u16 val;
 
@@ -225,7 +225,7 @@ static void nt35560_read_id(struct mipi_dsi_multi_context *dsi_ctx)
 		return;
 
 	if (vendor == 0x00) {
-		dev_err(&dev, "device vendor ID is zero\n");
+		dev_err(dev, "device vendor ID is zero\n");
 		dsi_ctx->accum_err = -ENODEV;
 		return;
 	}
@@ -236,12 +236,12 @@ static void nt35560_read_id(struct mipi_dsi_multi_context *dsi_ctx)
 	case DISPLAY_SONY_ACX424AKP_ID2:
 	case DISPLAY_SONY_ACX424AKP_ID3:
 	case DISPLAY_SONY_ACX424AKP_ID4:
-		dev_info(&dev,
+		dev_info(dev,
 			 "MTP vendor: %02x, version: %02x, panel: %02x\n",
 			 vendor, version, panel);
 		break;
 	default:
-		dev_info(&dev,
+		dev_info(dev,
 			 "unknown vendor: %02x, version: %02x, panel: %02x\n",
 			 vendor, version, panel);
 		break;
-- 
2.39.5

