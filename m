Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D50FCA312A
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A70F910E907;
	Thu,  4 Dec 2025 09:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jlXgHREn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F208410E907
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 09:47:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 408B560128;
 Thu,  4 Dec 2025 09:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291C6C4CEFB;
 Thu,  4 Dec 2025 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764841660;
 bh=4XTFLiGe3rteiGnr+N5SWr/pwuXlcKOACJghGkoqs1s=;
 h=From:To:Cc:Subject:Date:From;
 b=jlXgHREnNSskCk60DdQVCUNvuZ/t/Hyyb05zjg+1wxhHMOEXokbzb27RaOMztmy4e
 GHJ9L2D8U7xKWSI3YarCyAU2OJ5UsrJoYOhw8ObAYMw76VNVNjegSAIX4o8zejuhkZ
 nG9uO6YEbMDmC8bZfTjsH04yzJgBkZ83iu2wCDNj5CpyVXJCcANbgnybsNgVIsPXMg
 kdzcF+t3bfVjTxo6Az6L5mfCCXk6gN2JMTERPKB3l2ANtTzyTd+Oec699mNiYr66rt
 lXcvPe83eZ+UaaAKmeAVMeQO9R+dV/fvegdhWoUrbL3tSfsU2QOUqGQyhEADR2/fUv
 lfHNujFpx/pZQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <jesszhan0024@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, David Heidelberg <david@ixit.cz>,
 Linus Walleij <linus.walleij@linaro.org>,
 Kaustabh Chakraborty <kauschluss@disroot.org>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Colin Ian King <colin.i.king@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: visionox-rm69299: add backlight dependency
Date: Thu,  4 Dec 2025 10:47:26 +0100
Message-Id: <20251204094734.1031114-1-arnd@kernel.org>
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

The recently added backlight support breaks when CONFIG_BACKLIGHT_CLASS_DEVICE
is turned off:

arm-linux-gnueabi-ld: drivers/gpu/drm/panel/panel-visionox-rm69299.o: in function `visionox_rm69299_probe':
panel-visionox-rm69299.c:(.text.visionox_rm69299_probe+0x92): undefined reference to `devm_backlight_device_register'
arm-linux-gnueabi-ld: (devm_backlight_device_register): Unknown destination type (ARM/Thumb) in drivers/gpu/drm/panel/panel-visionox-rm69299.o

Add the appropriate Kconfig dependency.

Fixes: 7911d8cab554 ("drm/panel: visionox-rm69299: Add backlight support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 76f6af819037..2923148dcf07 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1163,6 +1163,7 @@ config DRM_PANEL_VISIONOX_R66451
 
 config DRM_PANEL_VISIONOX_RM69299
 	tristate "Visionox RM69299"
+	depends on BACKLIGHT_CLASS_DEVICE
 	depends on OF
 	depends on DRM_MIPI_DSI
 	help
-- 
2.39.5

