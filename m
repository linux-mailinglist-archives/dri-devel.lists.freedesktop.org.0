Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484F6C27DF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 03:10:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBED010E399;
	Tue, 21 Mar 2023 02:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2283310E399
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 02:09:56 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 4F803327B51;
 Tue, 21 Mar 2023 02:09:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1679364594; bh=p8JbTrPnIlP96PBlQgyynuBoE5QntvKojhSepuzrjY0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CeZGY9ZqNP3uzWzxPmjwb9Eqaxkr4uaSOR1Lww5AOzCBKicJavicaCRb8BO8wOJIY
 dtFUgRaxeSfLaCIxM8ZiorW/p8E7oiMpSOIaVcyCq1n9o8SEJOoNsMLwNEhfDdJCnK
 eC73EmxhwNm+63tfcGIYWWVDZa9/38ZE1g8j9UYd500Q9DrfcfvA6uG96VchxfP2in
 JtdIlXR4wjft6Ug42/tv3TsOogQQrt7dcOWQ78w6RLGKWdyHJkX/v8I7wM5SqCNhAZ
 SsQlpiYTURzfw86zVNvBitnYpTOuRvOC9HzcQXG3iwLRHD6/iIYhKxmBil/o2gxVal
 NcULICq/627lA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/vmwgfx: Print errors when running on
 broken/unsupported configs
Date: Mon, 20 Mar 2023 22:09:48 -0400
Message-Id: <20230321020949.335012-2-zack@kde.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230321020949.335012-1-zack@kde.org>
References: <20230321020949.335012-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, iforbes@vmware.com, banackm@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

virtualbox implemented an incomplete version of the svga device which
they decided to drop soon after the initial release. The device was
always broken in various ways and never supported by vmwgfx.

vmwgfx should refuse to load on those configurations but currently
drm has no way of reloading fbdev when the specific pci driver refuses
to load, which would leave users without a usable fb. Instead of
refusing to load print an error and disable a bunch of functionality
that virtualbox never implemented to at least get fb to work on their
setup.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c |  9 +++++++++
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 2588615a2a38..8b24ecf60e3e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -45,6 +45,9 @@
 #include <drm/ttm/ttm_placement.h>
 #include <generated/utsrelease.h>
 
+#ifdef CONFIG_X86
+#include <asm/hypervisor.h>
+#endif
 #include <linux/cc_platform.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
@@ -897,6 +900,16 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 				 cap2_names, ARRAY_SIZE(cap2_names));
 	}
 
+	if (!vmwgfx_supported(dev_priv)) {
+		vmw_disable_backdoor();
+		drm_err_once(&dev_priv->drm,
+			     "vmwgfx seems to be running on an unsupported hypervisor.");
+		drm_err_once(&dev_priv->drm,
+			     "This configuration is likely broken.");
+		drm_err_once(&dev_priv->drm,
+			     "Please switch to a supported graphics device to avoid problems.");
+	}
+
 	ret = vmw_dma_select_mode(dev_priv);
 	if (unlikely(ret != 0)) {
 		drm_info(&dev_priv->drm,
@@ -1320,6 +1333,22 @@ static void vmw_master_drop(struct drm_device *dev,
 	vmw_kms_legacy_hotspot_clear(dev_priv);
 }
 
+bool vmwgfx_supported(struct vmw_private *vmw)
+{
+#if defined(CONFIG_X86)
+	return hypervisor_is_type(X86_HYPER_VMWARE);
+#elif defined(CONFIG_ARM64)
+	/*
+	 * On aarch64 only svga3 is supported
+	 */
+	return vmw->pci_id == VMWGFX_PCI_ID_SVGA3;
+#else
+	drm_warn_once(&vmw->drm,
+		      "vmwgfx is running on an unknown architecture.");
+	return false;
+#endif
+}
+
 /**
  * __vmw_svga_enable - Enable SVGA mode, FIFO and use of VRAM.
  *
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index fb8f0c0642c0..3810a9984a7f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -773,6 +773,7 @@ static inline u32 vmw_max_num_uavs(struct vmw_private *dev_priv)
 
 extern void vmw_svga_enable(struct vmw_private *dev_priv);
 extern void vmw_svga_disable(struct vmw_private *dev_priv);
+bool vmwgfx_supported(struct vmw_private *vmw);
 
 
 /**
@@ -1358,6 +1359,7 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 		    struct vmw_diff_cpy *diff);
 
 /* Host messaging -vmwgfx_msg.c: */
+void vmw_disable_backdoor(void);
 int vmw_host_get_guestinfo(const char *guest_info_param,
 			   char *buffer, size_t *length);
 __printf(1, 2) int vmw_host_printf(const char *fmt, ...);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index ca1a3fe44fa5..2651fe0ef518 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -1179,3 +1179,12 @@ int vmw_mksstat_remove_ioctl(struct drm_device *dev, void *data,
 
 	return -EAGAIN;
 }
+
+/**
+ * vmw_disable_backdoor: Disables all backdoor communication
+ * with the hypervisor.
+ */
+void vmw_disable_backdoor(void)
+{
+	vmw_msg_enabled = 0;
+}
-- 
2.38.1

