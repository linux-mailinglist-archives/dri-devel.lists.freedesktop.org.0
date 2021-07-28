Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFE73D9054
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E266EA5D;
	Wed, 28 Jul 2021 14:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Wed, 28 Jul 2021 08:49:33 UTC
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8F06E03A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 08:49:33 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1627461793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jx2hXfqdAkDWctPjiDQKqFGoOGkOYJlfY8w9c6leveA=;
 b=xg7i8BjZqk5aeo6d77b5MOfEf6roimot7tALvI6Vcri0m+mRi22J3QcYPFXvHgjJCaOY28
 HBKBc3/NrTjDjKU3OS5dXIakbAeN55mgRImDJrDO90UsHFYItPQBjNXBb8IyJWCS57XHJi
 Kr2zwrx7WqGe/Bzf38gXxKFqCPovbwk=
From: Jackie Liu <liu.yun@linux.dev>
To: laurent.pinchart@ideasonboard.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: crtc: force depends on cmm
Date: Wed, 28 Jul 2021 16:42:40 +0800
Message-Id: <20210728084240.566677-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
X-Mailman-Approved-At: Wed, 28 Jul 2021 14:22:24 +0000
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
Cc: airlied@linux.ie, liuyun01@kylinos.cn,
 kieran.bingham+renesas@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jackie Liu <liuyun01@kylinos.cn>

After the patch 78b6bb1d24db ("drm: rcar-du: crtc: Control CMM operations"),
the cmm module must be included in the crtc. We cannot remove this
configuration option separately. Therefore, simply linking them together
is the best solution, otherwise some errors will be reported.

 rcar_du_crtc.c:(.text+0x194): undefined reference to `rcar_cmm_setup'
 rcar_du_crtc.c:(.text+0x11bc): undefined reference to `rcar_cmm_enable'
 rcar_du_crtc.c:(.text+0x1604): undefined reference to `rcar_cmm_disable'
 rcar_du_kms.c:(.text+0x768): undefined reference to `rcar_cmm_init'

Fixes: 78b6bb1d24db ("rm: rcar-du: crtc: Control CMM operations")
Reported-by: kernel-bot <k2ci@kylinos.cn>
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/gpu/drm/rcar-du/Kconfig  | 8 --------
 drivers/gpu/drm/rcar-du/Makefile | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index b47e74421e34..bc71ad2a472f 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -4,7 +4,6 @@ config DRM_RCAR_DU
 	depends on DRM && OF
 	depends on ARM || ARM64
 	depends on ARCH_RENESAS || COMPILE_TEST
-	imply DRM_RCAR_CMM
 	imply DRM_RCAR_LVDS
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
@@ -14,13 +13,6 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
-config DRM_RCAR_CMM
-	tristate "R-Car DU Color Management Module (CMM) Support"
-	depends on DRM && OF
-	depends on DRM_RCAR_DU
-	help
-	  Enable support for R-Car Color Management Module (CMM).
-
 config DRM_RCAR_DW_HDMI
 	tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
 	depends on DRM && OF
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 4d1187ccc3e5..76ff2e15bc2d 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -5,6 +5,7 @@ rcar-du-drm-y := rcar_du_crtc.o \
 		 rcar_du_group.o \
 		 rcar_du_kms.o \
 		 rcar_du_plane.o \
+		 rcar_cmm.o
 
 rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
 					   rcar_du_of_lvds_r8a7790.dtb.o \
@@ -15,7 +16,6 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 
-obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
-- 
2.25.1

