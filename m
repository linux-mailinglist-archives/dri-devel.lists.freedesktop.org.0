Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EC037B9C0
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 11:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEFA6EB68;
	Wed, 12 May 2021 09:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC636EB4C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 09:55:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D914613C4;
 Wed, 12 May 2021 09:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620813359;
 bh=da3C51Ncqk3hJCyxwk/+fZLhfudJpIzDIP/B/QxRQ14=;
 h=Subject:To:Cc:From:Date:From;
 b=NDyIvvUwRtMrM+Q7rpvX3p8MHcZiUXidiH23VqUUzGiv9DLTKnARLuuox+9pkzyOY
 bmaZLPaTRHaviC8P5Uyz6/4laSKtL47ocfyi/Zx9zj2B/Oa0MACpPTv/0R2AFaNSvg
 lJ7/tlQT8Ph96Gb4IvWhyxEUSKCyVvayU1YN+ifM=
Subject: Patch "drm: bridge: fix ANX7625 use of mipi_dsi_() functions" has
 been added to the 5.12-stable tree
To: a.hajda@samsung.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, lkp@intel.com, narmstrong@baylibre.com,
 rdunlap@infradead.org, robert.foss@linaro.org, sam@ravnborg.org,
 xji@analogixsemi.com
From: <gregkh@linuxfoundation.org>
Date: Wed, 12 May 2021 11:55:21 +0200
Message-ID: <162081332122221@kroah.com>
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

    drm: bridge: fix ANX7625 use of mipi_dsi_() functions

to the 5.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-bridge-fix-anx7625-use-of-mipi_dsi_-functions.patch
and it can be found in the queue-5.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ed01fca38717169fcb61bd45ad1c3750d9c40d59 Mon Sep 17 00:00:00 2001
From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 15 Apr 2021 11:36:19 -0700
Subject: drm: bridge: fix ANX7625 use of mipi_dsi_() functions

From: Randy Dunlap <rdunlap@infradead.org>

commit ed01fca38717169fcb61bd45ad1c3750d9c40d59 upstream.

The Analogix DRM ANX7625 bridge driver uses mips_dsi_() function
interfaces so it should select DRM_MIPI_DSI to prevent build errors.

ERROR: modpost: "mipi_dsi_attach" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
ERROR: modpost: "mipi_dsi_device_register_full" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
ERROR: modpost: "of_find_mipi_dsi_host_by_node" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
ERROR: modpost: "mipi_dsi_device_unregister" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!

Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Cc: Xin Ji <xji@analogixsemi.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: stable@vger.kernel.org
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210415183619.1431-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/bridge/analogix/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -30,6 +30,7 @@ config DRM_ANALOGIX_ANX7625
 	tristate "Analogix Anx7625 MIPI to DP interface support"
 	depends on DRM
 	depends on OF
+	select DRM_MIPI_DSI
 	help
 	  ANX7625 is an ultra-low power 4K mobile HD transmitter
 	  designed for portable devices. It converts MIPI/DPI to


Patches currently in stable-queue which might be from rdunlap@infradead.org are

queue-5.12/drm-bridge-fix-lontium-use-of-mipi_dsi_-functions.patch
queue-5.12/drm-bridge-fix-anx7625-use-of-mipi_dsi_-functions.patch
queue-5.12/net-xilinx-drivers-need-depend-on-has_iomem.patch
