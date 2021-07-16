Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A583CB877
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FD96E98C;
	Fri, 16 Jul 2021 14:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2526E991
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:08:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D46D22B6E;
 Fri, 16 Jul 2021 14:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626444487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhoSg01bCydqku+GJOAIhCF7vsLeSMJTe0/WrEsfpbk=;
 b=XtqmDtBj0yjCSb1DYaGTP2RljoGHcUUMIYspONRsH2VzEGdtEY9GoXoC9w2rj8HI+iD8vO
 K/oKYovCQctcQxf5WhMbZOn7hqCE91f5l27fqz36oe1SBw8e26xHIJA7yXlXuct++jhc+3
 O4rtJB5xEzQ99CQB2LedNW54llnVnMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626444487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MhoSg01bCydqku+GJOAIhCF7vsLeSMJTe0/WrEsfpbk=;
 b=hsNP1yTVqTfd7GCyskhqQ7Vz5KGrcdFkR10Jys9F8b8gb7kiXblgXSMT8FTXm7pqtkBNk4
 Le7PfuwrBjfVQeDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02EBE13C70;
 Fri, 16 Jul 2021 14:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SFZYO8aS8WBTSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 14:08:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, hdegoede@redhat.com,
 david@lechnology.com, airlied@redhat.com, sean@poorly.run
Subject: [PATCH 6/7] drm/repaper: Use framebuffer dma-buf helpers
Date: Fri, 16 Jul 2021 16:08:00 +0200
Message-Id: <20210716140801.1215-7-tzimmermann@suse.de>
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
 drivers/gpu/drm/tiny/repaper.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 007d9d59f01c..4d07b21a16e6 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -14,7 +14,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/dma-buf.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/property.h>
@@ -532,7 +531,6 @@ static void repaper_gray8_to_mono_reversed(u8 *buf, u32 width, u32 height)
 static int repaper_fb_dirty(struct drm_framebuffer *fb)
 {
 	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
-	struct dma_buf_attachment *import_attach = cma_obj->base.import_attach;
 	struct repaper_epd *epd = drm_to_epd(fb->dev);
 	struct drm_rect clip;
 	int idx, ret = 0;
@@ -558,21 +556,13 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb)
 		goto out_exit;
 	}
 
-	if (import_attach) {
-		ret = dma_buf_begin_cpu_access(import_attach->dmabuf,
-					       DMA_FROM_DEVICE);
-		if (ret)
-			goto out_free;
-	}
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		goto out_free;
 
 	drm_fb_xrgb8888_to_gray8(buf, cma_obj->vaddr, fb, &clip);
 
-	if (import_attach) {
-		ret = dma_buf_end_cpu_access(import_attach->dmabuf,
-					     DMA_FROM_DEVICE);
-		if (ret)
-			goto out_free;
-	}
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
 	repaper_gray8_to_mono_reversed(buf, fb->width, fb->height);
 
-- 
2.32.0

