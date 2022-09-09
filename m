Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2935B36D0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374C910ECD0;
	Fri,  9 Sep 2022 11:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7709310E040
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662724617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drlpxa2HMWaFVZioF+KKkgkUJEhX6zWpmXjcWfhGzRs=;
 b=aOKOp3+UvRbbfy3WcOmIoGWYVUXncQ3n7+tjAxVeV2g4iYGrTfQBzMrJPU0Fsxu7BDoRnS
 BV4VvCE5EtXaIoeBYHENJBbdlI+fW4T8W+3c8L/BdxHCwU+E2Lr8XQAsZcfQlmxDXhDbW8
 669f67QheG32n9Or+ub4ZDjkdOCJ5L4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-cqY2LmukM4CPS_G6_rs8hQ-1; Fri, 09 Sep 2022 07:56:56 -0400
X-MC-Unique: cqY2LmukM4CPS_G6_rs8hQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5481380029D;
 Fri,  9 Sep 2022 11:56:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7CB61410F36;
 Fri,  9 Sep 2022 11:56:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 4/6] drm/gma500: Remove a couple of not useful function
 wrappers
Date: Fri,  9 Sep 2022 13:56:44 +0200
Message-Id: <20220909115646.99920-5-hdegoede@redhat.com>
In-Reply-To: <20220909115646.99920-1-hdegoede@redhat.com>
References: <20220909115646.99920-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gma_crtc_set_config() and psb_unlocked_ioctl() functions are 1:1
wrappers for drm_helpers. Drop these wrappers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/gma_display.c | 8 +-------
 drivers/gpu/drm/gma500/gma_display.h | 2 --
 drivers/gpu/drm/gma500/psb_drv.c     | 8 +-------
 3 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index bdbd2afa8171..fe7b8436f87a 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -555,17 +555,11 @@ int gma_crtc_page_flip(struct drm_crtc *crtc,
 	return ret;
 }
 
-int gma_crtc_set_config(struct drm_mode_set *set,
-			struct drm_modeset_acquire_ctx *ctx)
-{
-	return drm_crtc_helper_set_config(set, ctx);
-}
-
 const struct drm_crtc_funcs gma_crtc_funcs = {
 	.cursor_set = gma_crtc_cursor_set,
 	.cursor_move = gma_crtc_cursor_move,
 	.gamma_set = gma_crtc_gamma_set,
-	.set_config = gma_crtc_set_config,
+	.set_config = drm_crtc_helper_set_config,
 	.destroy = gma_crtc_destroy,
 	.page_flip = gma_crtc_page_flip,
 	.enable_vblank = gma_crtc_enable_vblank,
diff --git a/drivers/gpu/drm/gma500/gma_display.h b/drivers/gpu/drm/gma500/gma_display.h
index 113cf048105e..c8b611a2f6c6 100644
--- a/drivers/gpu/drm/gma500/gma_display.h
+++ b/drivers/gpu/drm/gma500/gma_display.h
@@ -69,8 +69,6 @@ extern int gma_crtc_page_flip(struct drm_crtc *crtc,
 			      struct drm_pending_vblank_event *event,
 			      uint32_t page_flip_flags,
 			      struct drm_modeset_acquire_ctx *ctx);
-extern int gma_crtc_set_config(struct drm_mode_set *set,
-			       struct drm_modeset_acquire_ctx *ctx);
 
 extern void gma_crtc_save(struct drm_crtc *crtc);
 extern void gma_crtc_restore(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 7a94e0d8fa6c..8266371aeac1 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -430,12 +430,6 @@ static inline void get_brightness(struct backlight_device *bd)
 #endif
 }
 
-static long psb_unlocked_ioctl(struct file *filp, unsigned int cmd,
-			       unsigned long arg)
-{
-	return drm_ioctl(filp, cmd, arg);
-}
-
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct drm_psb_private *dev_priv;
@@ -497,7 +491,7 @@ static const struct file_operations psb_gem_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
 	.release = drm_release,
-	.unlocked_ioctl = psb_unlocked_ioctl,
+	.unlocked_ioctl = drm_ioctl,
 	.compat_ioctl = drm_compat_ioctl,
 	.mmap = drm_gem_mmap,
 	.poll = drm_poll,
-- 
2.37.2

