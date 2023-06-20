Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C55DF736BB0
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 14:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9C710E2DB;
	Tue, 20 Jun 2023 12:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF99E10E2C9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 12:12:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2F9C1F38A;
 Tue, 20 Jun 2023 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687263125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0StLaEV9t2bJwgKygVMZYw7cxkeD85gCdMq65G977o=;
 b=Ay//wprv7O21AW5J+hlW74XI+t4LeXz4puYQl0kA1RdHz4cZfFxdViDgWGebwqy/de+ezG
 E3gsuXCa+aWbYTQeWm5tDxXuC30xORNcizHZ/ekF8ho/kZcGYtJMXDiAx0ddhncHPeKiLV
 MQuKDYJzlh7d0Q7jUPIG3qMyNhd8n9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687263125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0StLaEV9t2bJwgKygVMZYw7cxkeD85gCdMq65G977o=;
 b=3lwNBgmHAodF4AoGrOwavr97ZrO5qBME48sSYQJas4o7FYoiQndEDUaTNbxv13+NfLvczG
 /wAgcgYsjHou0CCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B14DF139C7;
 Tue, 20 Jun 2023 12:12:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YLBbKpSXkWSwEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 12:12:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de
Subject: [PATCH 1/3] drm/rcar-du: Import buffers with GEM DMA's helpers
Date: Tue, 20 Jun 2023 14:03:21 +0200
Message-ID: <20230620121202.28263-2-tzimmermann@suse.de>
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

Call __drm_gem_dma_create() to create an object for imported buffers,
instead of reimplementing the function within the driver. Reduces
code duplication and will later allow to un-export a number of symbols
from the GEM DMA helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_dma_helper.c          |  5 +--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 33 +++----------------
 include/drm/drm_gem_dma_helper.h              |  3 ++
 3 files changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 870b90b78bc4e..e9aa3ac140654 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -67,8 +67,8 @@ static const struct drm_gem_object_funcs drm_gem_dma_default_funcs = {
  * A struct drm_gem_dma_object * on success or an ERR_PTR()-encoded negative
  * error code on failure.
  */
-static struct drm_gem_dma_object *
-__drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
+struct drm_gem_dma_object *__drm_gem_dma_create(struct drm_device *drm,
+						size_t size, bool private)
 {
 	struct drm_gem_dma_object *dma_obj;
 	struct drm_gem_object *gem_obj;
@@ -112,6 +112,7 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
 	kfree(dma_obj);
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(__drm_gem_dma_create);
 
 /**
  * drm_gem_dma_create - allocate an object with the given size
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index adfb36b0e8154..ea7487e270f13 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -356,49 +356,24 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
  * Frame buffer
  */
 
-static const struct drm_gem_object_funcs rcar_du_gem_funcs = {
-	.free = drm_gem_dma_object_free,
-	.print_info = drm_gem_dma_object_print_info,
-	.get_sg_table = drm_gem_dma_object_get_sg_table,
-	.vmap = drm_gem_dma_object_vmap,
-	.mmap = drm_gem_dma_object_mmap,
-	.vm_ops = &drm_gem_dma_vm_ops,
-};
-
 struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
 				struct dma_buf_attachment *attach,
 				struct sg_table *sgt)
 {
 	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
 	struct drm_gem_dma_object *dma_obj;
-	struct drm_gem_object *gem_obj;
-	int ret;
 
 	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		return drm_gem_dma_prime_import_sg_table(dev, attach, sgt);
 
-	/* Create a DMA GEM buffer. */
-	dma_obj = kzalloc(sizeof(*dma_obj), GFP_KERNEL);
-	if (!dma_obj)
-		return ERR_PTR(-ENOMEM);
-
-	gem_obj = &dma_obj->base;
-	gem_obj->funcs = &rcar_du_gem_funcs;
-
-	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
-	dma_obj->map_noncoherent = false;
-
-	ret = drm_gem_create_mmap_offset(gem_obj);
-	if (ret) {
-		drm_gem_object_release(gem_obj);
-		kfree(dma_obj);
-		return ERR_PTR(ret);
-	}
+	dma_obj = __drm_gem_dma_create(dev, attach->dmabuf->size, true);
+	if (IS_ERR(dma_obj))
+		return ERR_CAST(dma_obj);
 
 	dma_obj->dma_addr = 0;
 	dma_obj->sgt = sgt;
 
-	return gem_obj;
+	return &dma_obj->base;
 }
 
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index 61da596780b64..3877cbf0e927c 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -32,6 +32,9 @@ struct drm_gem_dma_object {
 #define to_drm_gem_dma_obj(gem_obj) \
 	container_of(gem_obj, struct drm_gem_dma_object, base)
 
+struct drm_gem_dma_object *__drm_gem_dma_create(struct drm_device *drm,
+						size_t size, bool private);
+
 struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 					      size_t size);
 void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj);
-- 
2.41.0

