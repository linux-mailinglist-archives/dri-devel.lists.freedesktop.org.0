Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43535736BB1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 14:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6085610E2DC;
	Tue, 20 Jun 2023 12:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB8310E2DB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 12:12:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 91E14218BB;
 Tue, 20 Jun 2023 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687263125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0Y3PkLzO5C8O1e77DfS9r0CpVVFDaovCyRftFBwQK4=;
 b=t4mWsyIr3KeqwKvkcKjmqVYgZPiZjuGzbQ30wGX0U6y0Mg+nJbJ1A0OMGsw9rMN/xowWSd
 jAMt17ppzl1lgAQkD7BVvQNm2udXaR3s/yapd1PkHcIUVmV8y0cqvXZzzKGAzoPCXVZPQo
 DYLl5nwalG6Ss8XGnw+3Cz1XusSl7T0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687263125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0Y3PkLzO5C8O1e77DfS9r0CpVVFDaovCyRftFBwQK4=;
 b=/fMlEQ84LVNetCmTd7ax38tUic15tIua892kh7iGlH0yQS8rLGCuQah4f7YWmPjAFv/8ic
 CQ/P4xPMLPgsAvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CEEC133A9;
 Tue, 20 Jun 2023 12:12:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cC+QEZWXkWSwEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 12:12:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de
Subject: [PATCH 3/3] drm/gem-dma: Unexport drm_gem_dma_vm_ops
Date: Tue, 20 Jun 2023 14:03:23 +0200
Message-ID: <20230620121202.28263-4-tzimmermann@suse.de>
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

There are no external users of drm_gem_dma_vm_ops. Unexport the symbol.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 11 +++++------
 include/drm/drm_gem_dma_helper.h     |  2 --
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index e9aa3ac140654..d8a415c3d156c 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -45,6 +45,11 @@
  * drm_gem_dma_vmap()). These helpers perform the necessary type conversion.
  */
 
+static const struct vm_operations_struct drm_gem_dma_vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
 static const struct drm_gem_object_funcs drm_gem_dma_default_funcs = {
 	.free = drm_gem_dma_object_free,
 	.print_info = drm_gem_dma_object_print_info,
@@ -315,12 +320,6 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 }
 EXPORT_SYMBOL_GPL(drm_gem_dma_dumb_create);
 
-const struct vm_operations_struct drm_gem_dma_vm_ops = {
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-EXPORT_SYMBOL_GPL(drm_gem_dma_vm_ops);
-
 #ifndef CONFIG_MMU
 /**
  * drm_gem_dma_get_unmapped_area - propose address for mapping in noMMU cases
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index 3877cbf0e927c..88a810f954fce 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -45,8 +45,6 @@ int drm_gem_dma_vmap(struct drm_gem_dma_object *dma_obj,
 		     struct iosys_map *map);
 int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *vma);
 
-extern const struct vm_operations_struct drm_gem_dma_vm_ops;
-
 /*
  * GEM object functions
  */
-- 
2.41.0

