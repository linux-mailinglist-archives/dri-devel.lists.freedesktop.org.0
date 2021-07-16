Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EFC3CB875
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1679F6E994;
	Fri, 16 Jul 2021 14:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D881A6E994
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:08:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C5E6205E6;
 Fri, 16 Jul 2021 14:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626444487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnALY7j8K+wzeEPjg5PXtyiJPUNcivqdbmho8DuHSZU=;
 b=tu555Ep0U9rS6QUQTXDsiTbVJJ9JQl/AID8tqnpbwiBYiC2R86gVvvijkV4B0rALuAgrVt
 PzGYVJ7NpzRC/6BHA92GllTNGDjbRZpd8MpoXQDeK6eXlI1DibmIlFYh0vREAK6aCDctdB
 jSD+9dDYDlj6RnliHp/9HywfD5/+dcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626444487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pnALY7j8K+wzeEPjg5PXtyiJPUNcivqdbmho8DuHSZU=;
 b=W3clzocuahq48T/BO4rC2jY4O1AtAV4m32NmDMvmdtVRMweffJ2vXwhk5/QO0kN4n4eXAG
 R4Pw8DhQgLhmu4Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 414DD13C75;
 Fri, 16 Jul 2021 14:08:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MK3wDseS8WBTSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 14:08:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, hdegoede@redhat.com,
 david@lechnology.com, airlied@redhat.com, sean@poorly.run
Subject: [PATCH 7/7] drm/st7586: Use framebuffer dma-buf helpers
Date: Fri, 16 Jul 2021 16:08:01 +0200
Message-Id: <20210716140801.1215-8-tzimmermann@suse.de>
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
 drivers/gpu/drm/tiny/st7586.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 1be55bed609a..ad0faa8723c2 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -6,7 +6,6 @@
  */
 
 #include <linux/delay.h>
-#include <linux/dma-buf.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/property.h>
@@ -21,6 +20,7 @@
 #include <drm/drm_format_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_rect.h>
@@ -92,24 +92,18 @@ static int st7586_buf_copy(void *dst, struct drm_framebuffer *fb,
 			   struct drm_rect *clip)
 {
 	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
-	struct dma_buf_attachment *import_attach = cma_obj->base.import_attach;
 	void *src = cma_obj->vaddr;
 	int ret = 0;
 
-	if (import_attach) {
-		ret = dma_buf_begin_cpu_access(import_attach->dmabuf,
-					       DMA_FROM_DEVICE);
-		if (ret)
-			return ret;
-	}
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
 
 	st7586_xrgb8888_to_gray332(dst, src, fb, clip);
 
-	if (import_attach)
-		ret = dma_buf_end_cpu_access(import_attach->dmabuf,
-					     DMA_FROM_DEVICE);
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
-	return ret;
+	return 0;
 }
 
 static void st7586_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
-- 
2.32.0

