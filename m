Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6EF37B818
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 10:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508446EB59;
	Wed, 12 May 2021 08:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1476EB59
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:34:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5B41613C8;
 Wed, 12 May 2021 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620808481;
 bh=MP4W21O8g/g6ilXKwMcOOlAUrigSrlaIlaRHC6r5b/s=;
 h=Subject:To:Cc:From:Date:From;
 b=mEAxOmns5BV+6+n/FiICElLI1P6JaC6HTMzvqOvVP62IWsdPve4romdq94Y4WSai0
 zX33hghvWRW+TP0hwvo8vL49Cs7yAtwvfoHOFAweRIS6tlaIcZENiQYPgb13HUtjGR
 i1cAJJpPdTJcwsbrrVaUYJL6PbVcx3431MyaYnz4=
Subject: Patch "drm: bridge: fix LONTIUM use of mipi_dsi_() functions" has
 been added to the 5.11-stable tree
To: a.hajda@samsung.com, adrien.grassein@gmail.com, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, lkp@intel.com, narmstrong@baylibre.com,
 rdunlap@infradead.org, robert.foss@linaro.org, sam@ravnborg.org,
 srinivas.kandagatla@linaro.org, vkoul@kernel.org
From: <gregkh@linuxfoundation.org>
Date: Wed, 12 May 2021 10:33:53 +0200
Message-ID: <16208084331023@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm: bridge: fix LONTIUM use of mipi_dsi_() functions

to the 5.11-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-bridge-fix-lontium-use-of-mipi_dsi_-functions.patch
and it can be found in the queue-5.11 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ad085b3a712a89e4a48472121b231add7a8362e4 Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 15 Apr 2021 11:36:39 -0700
Subject: drm: bridge: fix LONTIUM use of mipi_dsi_() functions

From: Randy Dunlap <rdunlap@infradead.org>

commit ad085b3a712a89e4a48472121b231add7a8362e4 upstream.

The Lontium DRM bridge drivers use mipi_dsi_() function interfaces so
they need to select DRM_MIPI_DSI to prevent build errors.

ERROR: modpost: "mipi_dsi_attach" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "mipi_dsi_device_register_full" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "of_find_mipi_dsi_host_by_node" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "mipi_dsi_device_unregister" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/bridge/lontium-lt9611uxc.ko] undefined!
ERROR: modpost: "mipi_dsi_attach" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
ERROR: modpost: "mipi_dsi_device_register_full" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
ERROR: modpost: "of_find_mipi_dsi_host_by_node" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
ERROR: modpost: "mipi_dsi_device_unregister" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/bridge/lontium-lt9611.ko] undefined!
WARNING: modpost: suppressed 5 unresolved symbol warnings because there were too many)

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Adren Grassein <adrien.grassein@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Adrien Grassein <adrien.grassein@gmail.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210415183639.1487-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/bridge/Kconfig |    3 +++
 1 file changed, 3 insertions(+)

--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -67,6 +67,7 @@ config DRM_LONTIUM_LT9611UXC
 	depends on OF
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
 	select REGMAP_I2C
 	help
 	  Driver for Lontium LT9611UXC DSI to HDMI bridge
@@ -151,6 +152,7 @@ config DRM_SII902X
 	tristate "Silicon Image sii902x RGB/HDMI bridge"
 	depends on OF
 	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
 	select REGMAP_I2C
 	select I2C_MUX
 	select SND_SOC_HDMI_CODEC if SND_SOC
@@ -200,6 +202,7 @@ config DRM_TOSHIBA_TC358767
 	tristate "Toshiba TC358767 eDP bridge"
 	depends on OF
 	select DRM_KMS_HELPER
+	select DRM_MIPI_DSI
 	select REGMAP_I2C
 	select DRM_PANEL
 	help


Patches currently in stable-queue which might be from rdunlap@infradead.org are

queue-5.11/drm-bridge-fix-lontium-use-of-mipi_dsi_-functions.patch
