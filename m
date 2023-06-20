Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99174736BAF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 14:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D3D10E2D9;
	Tue, 20 Jun 2023 12:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2408F10E2DC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 12:12:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 474801F37C;
 Tue, 20 Jun 2023 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687263125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6XkXAfdTUAGyLfwxszMC+bPXZ6kElStSDtG0UQxN1E=;
 b=A6beC6BVgirwu2Nw6CAZoiZ+VtfjqlphCPYhDWtl086Q2zysAjHpUJR52bxGml3sE/LPtP
 fC/Q9d8KdGkR4PrsuycQq34ZK9WEf24S6Glm5hnKGjNKK2tBclijN2Ro50jfnloE7G/SFp
 4GZSglu94+iYKv4/Pr6MJBbr5gXwMI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687263125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6XkXAfdTUAGyLfwxszMC+bPXZ6kElStSDtG0UQxN1E=;
 b=ddLksiyxF2xqH1d02sVvi1XsKFHI/V32xC1Bne50Xs5i2I3cUnMz8dHj0IMYK3dvKj+7X8
 be2p7SWOimda1cAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04C8B133A9;
 Tue, 20 Jun 2023 12:12:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IFqQO5SXkWSwEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 12:12:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de
Subject: [PATCH 2/3] drm/rockchip: Resolve dependency in GEM DMA helpers
Date: Tue, 20 Jun 2023 14:03:22 +0200
Message-ID: <20230620121202.28263-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620121202.28263-1-tzimmermann@suse.de>
References: <20230620121202.28263-1-tzimmermann@suse.de>
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
Cc: linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the dependency on the GEM DMA helper library. Rockchip comes
with its own implementation of the GEM interface. It only uses the VM
callbacks in drm_gem_dma_vm_ops from the GEM DMA helpers. These are
not DMA specific.

Duplicate drm_gem_dma_vm_ops in rockchip and remove all dependencies on
the GEM DMA helper library.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/rockchip/Kconfig            | 1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 8 ++++++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 1bf3e2829cd07..5f49cd0210e6b 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -2,7 +2,6 @@
 config DRM_ROCKCHIP
 	tristate "DRM Support for Rockchip"
 	depends on DRM && ROCKCHIP_IOMMU
-	select DRM_GEM_DMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select VIDEOMODE_HELPERS
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index b8cf89f0cc566..b090b8abb6637 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -18,7 +18,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_generic.h>
-#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index b8f8b45ebf594..acb6f122a2dca 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -11,13 +11,17 @@
 #include <drm/drm.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
 #include <drm/drm_vma_manager.h>
 
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_gem.h"
 
+static const struct vm_operations_struct rockchip_gem_vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
 static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 {
 	struct drm_device *drm = rk_obj->base.dev;
@@ -276,7 +280,7 @@ static const struct drm_gem_object_funcs rockchip_gem_object_funcs = {
 	.vmap = rockchip_gem_prime_vmap,
 	.vunmap	= rockchip_gem_prime_vunmap,
 	.mmap = rockchip_drm_gem_object_mmap,
-	.vm_ops = &drm_gem_dma_vm_ops,
+	.vm_ops = &rockchip_gem_vm_ops,
 };
 
 static struct rockchip_gem_object *
-- 
2.41.0

