Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF5AA6E51A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0E010E363;
	Mon, 24 Mar 2025 21:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R9MdASJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7947A10E363
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 21:08:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A744E5C5465;
 Mon, 24 Mar 2025 21:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F1DC4CEDD;
 Mon, 24 Mar 2025 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742850510;
 bh=DoITmuJ3b3WOGd7I+KeumI4DPUboRPzOkttm2Ikla9I=;
 h=From:To:Cc:Subject:Date:From;
 b=R9MdASJAsUM0hFhYVVEzZ3U60/C7i09hn1bmiutfAjfsZhYHb9PhpaOz7Tt3+qLzv
 IqETLEYI9oS4F7tN2oH4sKDgZS1t+LpYnCBnsK6aJrgvMQODJkN0azZkksZ3HqgxZ1
 pZ+a0nV+3CQze0d9DgIlU+28R2XSeVnGFyW2+AMcnSrs41Nlc6a7c3W/9bhq9pdgbh
 kEp6OrHj7Atusr0dTns2/HXL0bDqB7qs/HH6E8+lz1aQUXq89B3xf9Epwh5St9t/55
 vQ/7NExMz5pQ4jXCv6PRQ3ObAVy0WZOTfngioztSPI3L2arG0A4AEbZjmkfc+8rum6
 lFQ+RKKslc6PQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER
Date: Mon, 24 Mar 2025 22:08:07 +0100
Message-Id: <20250324210824.3094660-1-arnd@kernel.org>
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

This fails to build without the KMS helper functions:

x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o: in function `tda998x_detect_work':
tda998x_drv.c:(.text+0x4e6): undefined reference to `drm_kms_helper_hotplug_event'
x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o: in function `tda998x_bind':
tda998x_drv.c:(.text.unlikely+0x33): undefined reference to `drm_simple_encoder_init'
x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x584): undefined reference to `drm_atomic_helper_connector_reset'
x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x590): undefined reference to `drm_helper_probe_single_connector_modes'
x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x5a4): undefined reference to `drm_atomic_helper_connector_duplicate_state'
x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x5a8): undefined reference to `drm_atomic_helper_connector_destroy_state'

Select the missing symbol and fix up the broken whitespace.

Fixes: 325ba852d148 ("drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/bridge/Kconfig | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index d20f1646dac2..09a1be234f71 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -91,12 +91,13 @@ config DRM_FSL_LDB
 	  Support for i.MX8MP DPI-to-LVDS on-SoC encoder.
 
 config DRM_I2C_NXP_TDA998X
-       tristate "NXP Semiconductors TDA998X HDMI encoder"
-       default m if DRM_TILCDC
-       select CEC_CORE if CEC_NOTIFIER
-       select SND_SOC_HDMI_CODEC if SND_SOC
-       help
-         Support for NXP Semiconductors TDA998X HDMI encoders.
+	tristate "NXP Semiconductors TDA998X HDMI encoder"
+	default m if DRM_TILCDC
+	select CEC_CORE if CEC_NOTIFIER
+	select DRM_KMS_HELPER
+	select SND_SOC_HDMI_CODEC if SND_SOC
+	help
+	  Support for NXP Semiconductors TDA998X HDMI encoders.
 
 config DRM_ITE_IT6263
 	tristate "ITE IT6263 LVDS/HDMI bridge"
-- 
2.39.5

