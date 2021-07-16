Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A943CB870
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C9E6E992;
	Fri, 16 Jul 2021 14:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC05D6E991
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:08:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B2D922B46;
 Fri, 16 Jul 2021 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626444486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sR4Gd3VN+rI5IJCk8Lvg/eV3wTnkYV6vkjGbOuaKX6s=;
 b=LhLSAkJ9f0t2f2qYTeGhiTNajNVWX4SgAt5Wx4Xff+DjUWGWVV1WYWm8Oox4a1UZYXSADb
 nWRbUsknt+KWOHOA8JoAh+t8PEtHn3cWXlFkVifqtSssRVApLHhEmLvCofqTYZPMKQ2rkh
 jpG5fb7sJv+Dig5eiiVWGWdgkJ/G8Jc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626444486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sR4Gd3VN+rI5IJCk8Lvg/eV3wTnkYV6vkjGbOuaKX6s=;
 b=VMlx/zfWIVzKDtQMudSK0ig00zBKsnIGcDjNjl7LOipubp2N8qxL2T4u30aiVG4+nY+Ft5
 TrqFf+d1beI28aAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 03EC113C70;
 Fri, 16 Jul 2021 14:08:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eNoCAMaS8WBTSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 14:08:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, hdegoede@redhat.com,
 david@lechnology.com, airlied@redhat.com, sean@poorly.run
Subject: [PATCH 2/7] drm/udl: Use framebuffer dma-buf helpers
Date: Fri, 16 Jul 2021 16:07:56 +0200
Message-Id: <20210716140801.1215-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716140801.1215-1-tzimmermann@suse.de>
References: <20210716140801.1215-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace dma_buf_begin_cpu_access() with drm_gem_fb_begin_cpu_access();
same for _end_cpu_access(). Remove some boiler-plate code. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 8d98bf69d075..8a6b94b1511b 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -6,11 +6,8 @@
  * Copyright (C) 2009 Roberto De Ioris <roberto@unbit.it>
  * Copyright (C) 2009 Jaya Kumar <jayakumar.lkml@gmail.com>
  * Copyright (C) 2009 Bernie Thompson <bernie@plugable.com>
-
  */
 
-#include <linux/dma-buf.h>
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
@@ -271,9 +268,8 @@ static int udl_handle_damage(struct drm_framebuffer *fb, const struct dma_buf_ma
 			     int x, int y, int width, int height)
 {
 	struct drm_device *dev = fb->dev;
-	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
 	void *vaddr = map->vaddr; /* TODO: Use mapping abstraction properly */
-	int i, ret, tmp_ret;
+	int i, ret;
 	char *cmd;
 	struct urb *urb;
 	struct drm_rect clip;
@@ -290,17 +286,14 @@ static int udl_handle_damage(struct drm_framebuffer *fb, const struct dma_buf_ma
 	else if ((clip.x2 > fb->width) || (clip.y2 > fb->height))
 		return -EINVAL;
 
-	if (import_attach) {
-		ret = dma_buf_begin_cpu_access(import_attach->dmabuf,
-					       DMA_FROM_DEVICE);
-		if (ret)
-			return ret;
-	}
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
 
 	urb = udl_get_urb(dev);
 	if (!urb) {
 		ret = -ENOMEM;
-		goto out_dma_buf_end_cpu_access;
+		goto out_drm_gem_fb_end_cpu_access;
 	}
 	cmd = urb->transfer_buffer;
 
@@ -313,7 +306,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb, const struct dma_buf_ma
 				       &cmd, byte_offset, dev_byte_offset,
 				       byte_width);
 		if (ret)
-			goto out_dma_buf_end_cpu_access;
+			goto out_drm_gem_fb_end_cpu_access;
 	}
 
 	if (cmd > (char *)urb->transfer_buffer) {
@@ -329,14 +322,8 @@ static int udl_handle_damage(struct drm_framebuffer *fb, const struct dma_buf_ma
 
 	ret = 0;
 
-out_dma_buf_end_cpu_access:
-	if (import_attach) {
-		tmp_ret = dma_buf_end_cpu_access(import_attach->dmabuf,
-						 DMA_FROM_DEVICE);
-		if (tmp_ret && !ret)
-			ret = tmp_ret; /* only update ret if not set yet */
-	}
-
+out_drm_gem_fb_end_cpu_access:
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 	return ret;
 }
 
-- 
2.32.0

