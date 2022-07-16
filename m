Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD485770AD
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 20:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4979111B864;
	Sat, 16 Jul 2022 18:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F09C7113E13
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=h4kbD4QiBaOHyq8URESUECLWmkxVv78KKf9ZeeqemPw=;
 b=j/b+3bTpgx//cBYCTkSD5IvE/fQE5DyJf9qP1sb4N150KlRN2mexNWwARXNa50rTUYPGPNB+B0nAg
 r36N3w76MM11u6aSECyJUN/3wsvXVatAe9oZkOABUI9f62EOp+l+c3Ur6p1dSRzfQOcjZFBbcUM3e8
 jF69dwiv6Zie0c69fcoIa3WfrzQCWmVQLOCOzKGHvLYsVZr0NMJahslf9/P8ub0P2IZI/ZprklT19p
 GmNnJFz7rjdftZQNQ+MAeuvcDFq4a3bXxqkU7M9bwaxu5yN79vW196pMVNc9KE44pKmQnDbbxdBF+l
 dcxbOBOVt3RRGEkgENNt0p5djLi+pEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=h4kbD4QiBaOHyq8URESUECLWmkxVv78KKf9ZeeqemPw=;
 b=hbXKfNbahfl1rszE5RCHdmHCDh0CUF/kv9YVkXkPMgOfikPCNpntxGsOvHR5Iwn2yl7a+3fM+pzbi
 ngkX8XbDA==
X-HalOne-Cookie: 3cadd61769b7b3314661320526b2b3c09a9cd1b5
X-HalOne-ID: a7b878f7-0533-11ed-a917-d0431ea8a290
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a7b878f7-0533-11ed-a917-d0431ea8a290;
 Sat, 16 Jul 2022 18:18:13 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 10/11] drm/dri1: Move Kconfig logic to drm/dri1
Date: Sat, 16 Jul 2022 20:17:49 +0200
Message-Id: <20220716181750.3874838-11-sam@ravnborg.org>
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

Move the DRI1 section from drm/Kconfig to a new Kconfig
file that lives in the dri1/ directory.
This isolates more of the DRI1 functionality.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/Kconfig      | 77 +----------------------------------
 drivers/gpu/drm/dri1/Kconfig | 79 ++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 76 deletions(-)
 create mode 100644 drivers/gpu/drm/dri1/Kconfig

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 024081480fcf..fd2684c7481f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -403,82 +403,7 @@ config DRM_HYPERV
 	 If M is selected the module will be called hyperv_drm.
 
 # Keep legacy DRI1 drivers last
-
-menuconfig DRM_DRI1
-	bool "Enable legacy DRI1 drivers (DANGEROUS)"
-	depends on DRM && MMU
-	help
-	  Enable legacy DRI1 drivers. Those drivers expose unsafe and dangerous
-	  APIs to user-space, which can be used to circumvent access
-	  restrictions and other security measures. For backwards compatibility
-	  those drivers are still available, but their use is highly
-	  inadvisable and might harm your system.
-
-	  You are recommended to use the safe modeset-only drivers instead, and
-	  perform 3D emulation in user-space.
-
-	  Unless you have strong reasons to go rogue, say "N".
-
-if DRM_DRI1
-
-config DRM_TDFX
-	tristate "3dfx Banshee/Voodoo3+"
-	depends on DRM && PCI
-	help
-	  Choose this option if you have a 3dfx Banshee or Voodoo3 (or later),
-	  graphics card.  If M is selected, the module will be called tdfx.
-
-config DRM_R128
-	tristate "ATI Rage 128"
-	depends on DRM && PCI
-	select FW_LOADER
-	help
-	  Choose this option if you have an ATI Rage 128 graphics card.  If M
-	  is selected, the module will be called r128.  AGP support for
-	  this card is strongly suggested (unless you have a PCI version).
-
-config DRM_I810
-	tristate "Intel I810"
-	# !PREEMPTION because of missing ioctl locking
-	depends on DRM && AGP && AGP_INTEL && (!PREEMPTION || BROKEN)
-	help
-	  Choose this option if you have an Intel I810 graphics card.  If M is
-	  selected, the module will be called i810.  AGP support is required
-	  for this driver to work.
-
-config DRM_MGA
-	tristate "Matrox g200/g400"
-	depends on DRM && PCI
-	select FW_LOADER
-	help
-	  Choose this option if you have a Matrox G200, G400 or G450 graphics
-	  card.  If M is selected, the module will be called mga.  AGP
-	  support is required for this driver to work.
-
-config DRM_SIS
-	tristate "SiS video cards"
-	depends on DRM && AGP
-	depends on FB_SIS || FB_SIS=n
-	help
-	  Choose this option if you have a SiS 630 or compatible video
-	  chipset. If M is selected the module will be called sis. AGP
-	  support is required for this driver to work.
-
-config DRM_VIA
-	tristate "Via unichrome video cards"
-	depends on DRM && PCI
-	help
-	  Choose this option if you have a Via unichrome or compatible video
-	  chipset. If M is selected the module will be called via.
-
-config DRM_SAVAGE
-	tristate "Savage video cards"
-	depends on DRM && PCI
-	help
-	  Choose this option if you have a Savage3D/4/SuperSavage/Pro/Twister
-	  chipset. If M is selected the module will be called savage.
-
-endif # DRM_DRI1
+source "drivers/gpu/drm/dri1/Kconfig"
 
 config DRM_EXPORT_FOR_TESTS
 	bool
diff --git a/drivers/gpu/drm/dri1/Kconfig b/drivers/gpu/drm/dri1/Kconfig
new file mode 100644
index 000000000000..424b9a142aa2
--- /dev/null
+++ b/drivers/gpu/drm/dri1/Kconfig
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# DRI1 drm device drivers
+
+menuconfig DRM_DRI1
+	bool "Enable legacy DRI1 drivers (DANGEROUS)"
+	depends on DRM && MMU
+	help
+	  Enable legacy DRI1 drivers. Those drivers expose unsafe and dangerous
+	  APIs to user-space, which can be used to circumvent access
+	  restrictions and other security measures. For backwards compatibility
+	  those drivers are still available, but their use is highly
+	  inadvisable and might harm your system.
+
+	  You are recommended to use the safe modeset-only drivers instead, and
+	  perform 3D emulation in user-space.
+
+	  Unless you have strong reasons to go rogue, say "N".
+
+if DRM_DRI1
+
+config DRM_TDFX
+	tristate "3dfx Banshee/Voodoo3+"
+	depends on DRM && PCI
+	help
+	  Choose this option if you have a 3dfx Banshee or Voodoo3 (or later),
+	  graphics card.  If M is selected, the module will be called tdfx.
+
+config DRM_R128
+	tristate "ATI Rage 128"
+	depends on DRM && PCI
+	select FW_LOADER
+	help
+	  Choose this option if you have an ATI Rage 128 graphics card.  If M
+	  is selected, the module will be called r128. AGP support for
+	  this card is strongly suggested (unless you have a PCI version).
+
+config DRM_I810
+	tristate "Intel I810"
+	# !PREEMPTION because of missing ioctl locking
+	depends on DRM && AGP && AGP_INTEL && (!PREEMPTION || BROKEN)
+	help
+	  Choose this option if you have an Intel I810 graphics card.  If M is
+	  selected, the module will be called i810.  AGP support is required
+	  for this driver to work.
+
+config DRM_MGA
+	tristate "Matrox g200/g400"
+	depends on DRM && PCI
+	select FW_LOADER
+	help
+	  Choose this option if you have a Matrox G200, G400 or G450 graphics
+	  card.  If M is selected, the module will be called mga.  AGP
+	  support is required for this driver to work.
+
+config DRM_SIS
+	tristate "SiS video cards"
+	depends on DRM && AGP
+	depends on FB_SIS || FB_SIS=n
+	help
+	  Choose this option if you have a SiS 630 or compatible video
+	  chipset. If M is selected the module will be called sis. AGP
+	  support is required for this driver to work.
+
+config DRM_VIA
+	tristate "Via unichrome video cards"
+	depends on DRM && PCI
+	help
+	  Choose this option if you have a Via unichrome or compatible video
+	  chipset. If M is selected the module will be called via.
+
+config DRM_SAVAGE
+	tristate "Savage video cards"
+	depends on DRM && PCI
+	help
+	  Choose this option if you have a Savage3D/4/SuperSavage/Pro/Twister
+	  chipset. If M is selected the module will be called savage.
+
+endif # DRM_DRI1
-- 
2.34.1

