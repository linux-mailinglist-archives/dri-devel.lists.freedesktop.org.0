Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BBE441530
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 09:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE4489A56;
	Mon,  1 Nov 2021 08:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07CD89A56
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 08:17:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4B0DE218A4;
 Mon,  1 Nov 2021 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635754673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMoSwwK/pfh7Kj6+Hqz5fZrZ0Yl9Hll6M89/fJzUn2s=;
 b=Ch4x2SRMXWTzDoy+FRcwAZBhIGeeFDMll298RCRpgAXhAH6vGOU9tnpExUUDOS8wiyRdTr
 q99H9cE17CU9eo8LA6A6Jk3x7NqviI5bungpanjS++LwPf/tW8SK88Sc1AqgK2V1UAfebo
 HVb0u55HkkmlvXXyjG7NAlu1ONmnLA4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635754673;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMoSwwK/pfh7Kj6+Hqz5fZrZ0Yl9Hll6M89/fJzUn2s=;
 b=N8Z2oNom8XhMXjE90Bnp1uHzW6+CcFM9q9gfnqAn94sl4xl9H4VP6KmF8oDuewQzhjvRiE
 +8zFNt+YU/+rwGAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECC6913AB5;
 Mon,  1 Nov 2021 08:17:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gFrJOLCif2EIIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 08:17:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, marcel@ziswiler.com,
 naresh.kamboju@linaro.org
Subject: [PATCH 1/2] drm/mipi-dbi: Remove dependency on GEM CMA helper library
Date: Mon,  1 Nov 2021 09:17:50 +0100
Message-Id: <20211101081751.24613-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101081751.24613-1-tzimmermann@suse.de>
References: <20211101081751.24613-1-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MIPI DBI helpers access struct drm_gem_cma_object.vaddr in a
few places. Replace all instances with the correct generic GEM
functions. Use drm_gem_fb_vmap() for mapping a framebuffer's GEM
objects and drm_gem_fb_vunmap() for unmapping them. This removes
the dependency on CMA helpers within MIPI DBI.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 71b646c4131f..f80fd6c0ccf8 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -15,9 +15,10 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_file.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modes.h>
@@ -200,13 +201,19 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		      struct drm_rect *clip, bool swap)
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
-	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
-	void *src = cma_obj->vaddr;
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
+	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
+	void *src;
 	int ret;
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return ret;
+	src = data[0].vaddr; /* TODO: Use mapping abstraction properly */
+
+	ret = drm_gem_fb_vmap(fb, map, data);
+	if (ret)
+		goto out_drm_gem_fb_end_cpu_access;
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
@@ -221,9 +228,11 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 	default:
 		drm_err_once(fb->dev, "Format is not supported: %p4cc\n",
 			     &fb->format->format);
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
+	drm_gem_fb_vunmap(fb, map);
+out_drm_gem_fb_end_cpu_access:
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
 	return ret;
@@ -249,8 +258,8 @@ static void mipi_dbi_set_window_address(struct mipi_dbi_dev *dbidev,
 
 static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 {
-	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
-	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
+	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	unsigned int height = rect->y2 - rect->y1;
 	unsigned int width = rect->x2 - rect->x1;
@@ -266,6 +275,10 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 	if (!drm_dev_enter(fb->dev, &idx))
 		return;
 
+	ret = drm_gem_fb_vmap(fb, map, data);
+	if (ret)
+		goto err_drm_dev_exit;
+
 	full = width == fb->width && height == fb->height;
 
 	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
@@ -277,7 +290,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 		if (ret)
 			goto err_msg;
 	} else {
-		tr = cma_obj->vaddr;
+		tr = data[0].vaddr; /* TODO: Use mapping abstraction properly */
 	}
 
 	mipi_dbi_set_window_address(dbidev, rect->x1, rect->x2 - 1, rect->y1,
@@ -289,6 +302,9 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 	if (ret)
 		drm_err_once(fb->dev, "Failed to update display %d\n", ret);
 
+	drm_gem_fb_vunmap(fb, map);
+
+err_drm_dev_exit:
 	drm_dev_exit(idx);
 }
 
@@ -1117,8 +1133,8 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
 
 	/*
 	 * Even though it's not the SPI device that does DMA (the master does),
-	 * the dma mask is necessary for the dma_alloc_wc() in
-	 * drm_gem_cma_create(). The dma_addr returned will be a physical
+	 * the dma mask is necessary for the dma_alloc_wc() in the GEM code
+	 * (e.g., drm_gem_cma_create()). The dma_addr returned will be a physical
 	 * address which might be different from the bus address, but this is
 	 * not a problem since the address will not be used.
 	 * The virtual address is used in the transfer and the SPI core
-- 
2.33.1

