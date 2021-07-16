Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31533CB878
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C548F6E991;
	Fri, 16 Jul 2021 14:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2D36E993
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:08:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01C501FEBF;
 Fri, 16 Jul 2021 14:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626444487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNi6J7YDSdxxTP66DQFOPcUpdvGYoeocEhlnZWkeIYI=;
 b=L2PJ+z+Ckq5KJFSnnkfjGVq4+EXMs4ARGkifSuAWF4VmpJXNG7ZHl5YsTyXrs5Jpso0mXG
 e7y86gz00xP7td0r2Vprqr8OfjWCYfEgCDtS6T9nWlElxQ+3S8N/eEDy64EcVKU18u9U83
 2RA1z5UlUauW/1Hkhtdv/L/L9eWKX90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626444487;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bNi6J7YDSdxxTP66DQFOPcUpdvGYoeocEhlnZWkeIYI=;
 b=GCKrqgmYxPQzYUOn2ugjbxqNCL7Z2XF+OGDX0f30Uyx7uiQSW9pvIZtdhdvV84Q7gj+3x4
 10ck5sSO8hBWH8CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B979513C75;
 Fri, 16 Jul 2021 14:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kOpELMaS8WBTSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 14:08:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, hdegoede@redhat.com,
 david@lechnology.com, airlied@redhat.com, sean@poorly.run
Subject: [PATCH 5/7] drm/gm12u320: Use framebuffer dma-buf helpers
Date: Fri, 16 Jul 2021 16:07:59 +0200
Message-Id: <20210716140801.1215-6-tzimmermann@suse.de>
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
 drivers/gpu/drm/tiny/gm12u320.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index a233c86d428b..cf7287fccd72 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -3,7 +3,6 @@
  * Copyright 2019 Hans de Goede <hdegoede@redhat.com>
  */
 
-#include <linux/dma-buf.h>
 #include <linux/module.h>
 #include <linux/usb.h>
 
@@ -268,13 +267,10 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 	y2 = gm12u320->fb_update.rect.y2;
 	vaddr = gm12u320->fb_update.src_map.vaddr; /* TODO: Use mapping abstraction properly */
 
-	if (fb->obj[0]->import_attach) {
-		ret = dma_buf_begin_cpu_access(
-			fb->obj[0]->import_attach->dmabuf, DMA_FROM_DEVICE);
-		if (ret) {
-			GM12U320_ERR("dma_buf_begin_cpu_access err: %d\n", ret);
-			goto put_fb;
-		}
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret) {
+		GM12U320_ERR("drm_gem_fb_begin_cpu_access err: %d\n", ret);
+		goto put_fb;
 	}
 
 	src = vaddr + y1 * fb->pitches[0] + x1 * 4;
@@ -311,12 +307,7 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
 		src += fb->pitches[0];
 	}
 
-	if (fb->obj[0]->import_attach) {
-		ret = dma_buf_end_cpu_access(fb->obj[0]->import_attach->dmabuf,
-					     DMA_FROM_DEVICE);
-		if (ret)
-			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
-	}
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 put_fb:
 	drm_framebuffer_put(fb);
 	gm12u320->fb_update.fb = NULL;
-- 
2.32.0

