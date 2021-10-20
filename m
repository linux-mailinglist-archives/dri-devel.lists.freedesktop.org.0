Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C022B434BF1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 15:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE12D893A7;
	Wed, 20 Oct 2021 13:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6C689DC1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 13:19:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 284DF1FDA4;
 Wed, 20 Oct 2021 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634735983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svQS9U0S9gFFtnUZsuH5tuQ5WlDPVOrM13Gy0k1JB+c=;
 b=dCIpfqCqT9BpeNdC8pIzF+yPo5xZbkuY/q/QXD7hGogsR/QhKg35m55HGtDSpm1DcLvf5P
 Bol/s0WwaDBDGWHtgk0yap4uXksEkyDqbJ91ybnLW3g1ShBtbCyzKw+WsJzJnlyB2AHfsR
 MlfiYgNi+m1nfFdL6AmfWIeihfYYUrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634735983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svQS9U0S9gFFtnUZsuH5tuQ5WlDPVOrM13Gy0k1JB+c=;
 b=HVtGMx0rk3tiP2AqC5fPWWkFOWau2NoKczmlhTFbhTMaof09ZHukwCVVUy0fgw9YPR1dzd
 I4NMfJiI/vv8WLBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04ECE140A6;
 Wed, 20 Oct 2021 13:19:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SIVQAG8XcGHsdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Oct 2021 13:19:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm: Move GEM memory managers into modules
Date: Wed, 20 Oct 2021 15:19:41 +0200
Message-Id: <20211020131941.15367-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020131941.15367-1-tzimmermann@suse.de>
References: <20211020131941.15367-1-tzimmermann@suse.de>
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

DRM core uses the GEM base object to access GEM functionality. It does
not depend on individual implementations. Move the code into modules.

Also move the CMA framebuffer helpers into the CMA's module, as they're
not usable without CMA.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                |  4 ++--
 drivers/gpu/drm/Makefile               | 10 +++++++---
 drivers/gpu/drm/drm_gem_cma_helper.c   |  4 ++++
 drivers/gpu/drm/drm_gem_shmem_helper.c |  4 ++++
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b91f0ce8154c..fb144617055b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -212,7 +212,7 @@ config DRM_TTM_HELPER
 	  Helpers for ttm-based gem objects
 
 config DRM_GEM_CMA_HELPER
-	bool
+	tristate
 	depends on DRM
 	help
 	  Choose this if you need the GEM CMA helper functions
@@ -225,7 +225,7 @@ config DRM_KMS_CMA_HELPER
 	  Choose this if you need the KMS CMA helper functions
 
 config DRM_GEM_SHMEM_HELPER
-	bool
+	tristate
 	depends on DRM && MMU
 	help
 	  Choose this if you need the GEM shmem helper functions
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0f8dae0a21c5..7f6eb11b6aac 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -24,8 +24,6 @@ drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o
 			    drm_scatter.o drm_vm.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
-drm-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_gem_cma_helper.o
-drm-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_gem_shmem_helper.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
 drm-$(CONFIG_PCI) += drm_pci.o
@@ -35,6 +33,13 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.
 
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
+drm_cma_helper-y := drm_gem_cma_helper.o
+drm_cma_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
+obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
+
+drm_shmem_helper-y := drm_gem_shmem_helper.o
+obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
+
 drm_vram_helper-y := drm_gem_vram_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
@@ -54,7 +59,6 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
 
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
-drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
 drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index d53388199f34..6f7b3f8ec04d 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -13,6 +13,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/export.h>
 #include <linux/mm.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 
@@ -578,3 +579,6 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 	return obj;
 }
 EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
+
+MODULE_DESCRIPTION("DRM CMA memory-management helpers");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 0e0986dfbe0c..57ceecb3f4d8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -5,6 +5,7 @@
 
 #include <linux/dma-buf.h>
 #include <linux/export.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
@@ -774,3 +775,6 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 	return &shmem->base;
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
+
+MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
+MODULE_LICENSE("GPL v2");
-- 
2.33.0

