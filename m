Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192E5770A7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB5910E710;
	Sat, 16 Jul 2022 18:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867AC1137EF
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=5NJM7fz2FGxexzXwoCO/wKqC9c3x7sQGSr/Z1Sccvtc=;
 b=FvAo3HAXx6Yxi3v0Y6tnEWc93EZsoEaPQItDkMvvFSYQToX3oSJYGA2HVMaK8zAGZqOxvWGbxcpwA
 tOMBLwJVlwl+510laPUdU2bDDoS/3P2CUyAkw7vmAeIsGLW8Ynb8t2mgRAY7+bTxAQ/bQQyZC9nAAa
 93CMSwYjg7U38AyS6rLYy212Hfxj22CXh3OyiE4/mCZYf/LNpRJyRyk/JGJjTgmo7nMSCjaqIdnvCy
 u7V00V0An242+VyU0l+LQJ6CNWOQtuzn7A0Xu+JIhXbkptYJbsYCrsmQaBAS5ccXRgRKHAh/G4HfJi
 qQmN2w+y9W5Dlzd0zUcPLxUtHSs4y5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=5NJM7fz2FGxexzXwoCO/wKqC9c3x7sQGSr/Z1Sccvtc=;
 b=U2RWaaurND4gp2AM5Z1KeOkUrsDdlnCbVuwW1aewFbQgWvCLkqH6eSGUKASW+HNUSSil5H+8ppLF+
 JlFDf2KDg==
X-HalOne-Cookie: e5398646f7218ce47fb20540379e7ed9b6f06203
X-HalOne-ID: a72d56e5-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a72d56e5-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:12 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 08/11] drm/via: Move the via driver to drm/dri1/
Date: Sat, 16 Jul 2022 20:17:47 +0200
Message-Id: <20220716181750.3874838-9-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220716181750.3874838-1-sam@ravnborg.org>
References: <20220716181750.3874838-1-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm/dri1 is the new home for all the legacy DRI1 drivers.
Used the opportunity to rename the file to via.c to match the
name of the driver.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/Makefile                           | 1 -
 drivers/gpu/drm/dri1/Makefile                      | 1 +
 drivers/gpu/drm/{ => dri1}/via/Makefile            | 4 +---
 drivers/gpu/drm/{via/via_dri1.c => dri1/via/via.c} | 2 +-
 4 files changed, 3 insertions(+), 5 deletions(-)
 rename drivers/gpu/drm/{ => dri1}/via/Makefile (77%)
 rename drivers/gpu/drm/{via/via_dri1.c => dri1/via/via.c} (99%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 7de784da6345..bb3d8ffb9dd6 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -93,7 +93,6 @@ obj-$(CONFIG_DRM_V3D)  += v3d/
 obj-$(CONFIG_DRM_VC4)  += vc4/
 obj-$(CONFIG_DRM_SAVAGE)+= savage/
 obj-$(CONFIG_DRM_VMWGFX)+= vmwgfx/
-obj-$(CONFIG_DRM_VIA)	+=via/
 obj-$(CONFIG_DRM_VGEM)	+= vgem/
 obj-$(CONFIG_DRM_VKMS)	+= vkms/
 obj-$(CONFIG_DRM_NOUVEAU) +=nouveau/
diff --git a/drivers/gpu/drm/dri1/Makefile b/drivers/gpu/drm/dri1/Makefile
index 23e33398fdf5..73c0aa1c7b94 100644
--- a/drivers/gpu/drm/dri1/Makefile
+++ b/drivers/gpu/drm/dri1/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_DRM_MGA)		+= mga/
 obj-$(CONFIG_DRM_R128)		+= r128/
 obj-$(CONFIG_DRM_SIS)		+= sis/
 obj-$(CONFIG_DRM_TDFX)		+= tdfx/
+obj-$(CONFIG_DRM_VIA)		+= via/
diff --git a/drivers/gpu/drm/via/Makefile b/drivers/gpu/drm/dri1/via/Makefile
similarity index 77%
rename from drivers/gpu/drm/via/Makefile
rename to drivers/gpu/drm/dri1/via/Makefile
index 8b978dd51a25..b7cd59c2e226 100644
--- a/drivers/gpu/drm/via/Makefile
+++ b/drivers/gpu/drm/dri1/via/Makefile
@@ -3,6 +3,4 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-via-y    := via_dri1.o
-
-obj-$(CONFIG_DRM_VIA)	+=via.o
+obj-$(CONFIG_DRM_VIA)	+= via.o
diff --git a/drivers/gpu/drm/via/via_dri1.c b/drivers/gpu/drm/dri1/via/via.c
similarity index 99%
rename from drivers/gpu/drm/via/via_dri1.c
rename to drivers/gpu/drm/dri1/via/via.c
index c5708a3f4530..24bc3ebe66e1 100644
--- a/drivers/gpu/drm/via/via_dri1.c
+++ b/drivers/gpu/drm/dri1/via/via.c
@@ -44,7 +44,7 @@
 #include <drm/drm_vblank.h>
 #include <drm/via_drm.h>
 
-#include "via_3d_reg.h"
+#include "../../via/via_3d_reg.h"
 
 #define DRIVER_AUTHOR	"Various"
 
-- 
2.34.1

