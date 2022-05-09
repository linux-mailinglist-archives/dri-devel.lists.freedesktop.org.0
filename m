Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2701951F672
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 10:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB2610E1E1;
	Mon,  9 May 2022 08:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E6A10E054
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 08:16:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E752E21C04;
 Mon,  9 May 2022 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652084164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7HQMqWrFgA6pkEPag42lh/+YR2NntFICEqwMS8bq9c=;
 b=YiyQvS8gV8u4q2BN/EpKEFlEAUvTXi5Jwl/xTdehgyRVKIqcvfwm0aNSTPGTkYfusWIh7s
 ZzJGEBqZt+Nzvk0Kq3V3Z9xB9sR3CHus2JzOfSl6nQnBZVYQA4zBNDrSFJxw8s5xc4KG4w
 LKiDk27QEo3+gcCL5O3YjGh/m74hCxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652084164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7HQMqWrFgA6pkEPag42lh/+YR2NntFICEqwMS8bq9c=;
 b=OC3eXy1+l7XQ+4QpTY3ahag9XxbiI0w+U6lpsNQuMgrHHCz7FubVpLWHvdf5M/f4EZK2HK
 hXrdpOjZb37k/aCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEA4613B12;
 Mon,  9 May 2022 08:16:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gGS2LcTNeGL5OgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 May 2022 08:16:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 christian.koenig@amd.com
Subject: [PATCH 1/4] drm/gem: Share code between drm_gem_fb_{begin,
 end}_cpu_access()
Date: Mon,  9 May 2022 10:15:59 +0200
Message-Id: <20220509081602.474-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220509081602.474-1-tzimmermann@suse.de>
References: <20220509081602.474-1-tzimmermann@suse.de>
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

The error-recovery code in drm_gem_fb_begin() is the same pattern
as drm_gem_fb_end(). Implement both this an internal helper. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 62 ++++++++------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index f4619803acd0..2fcacab9f812 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -403,6 +403,27 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
 }
 EXPORT_SYMBOL(drm_gem_fb_vunmap);
 
+static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir,
+					unsigned int num_planes)
+{
+	struct dma_buf_attachment *import_attach;
+	struct drm_gem_object *obj;
+	int ret;
+
+	while (num_planes) {
+		--num_planes;
+		obj = drm_gem_fb_get_obj(fb, num_planes);
+		if (!obj)
+			continue;
+		import_attach = obj->import_attach;
+		if (!import_attach)
+			continue;
+		ret = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
+		if (ret)
+			drm_err(fb->dev, "dma_buf_end_cpu_access() failed: %d\n", ret);
+	}
+}
+
 /**
  * drm_gem_fb_begin_cpu_access - prepares GEM buffer objects for CPU access
  * @fb: the framebuffer
@@ -422,7 +443,7 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direct
 	struct dma_buf_attachment *import_attach;
 	struct drm_gem_object *obj;
 	size_t i;
-	int ret, ret2;
+	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(fb->obj); ++i) {
 		obj = drm_gem_fb_get_obj(fb, i);
@@ -433,28 +454,13 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direct
 			continue;
 		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, dir);
 		if (ret)
-			goto err_dma_buf_end_cpu_access;
+			goto err___drm_gem_fb_end_cpu_access;
 	}
 
 	return 0;
 
-err_dma_buf_end_cpu_access:
-	while (i) {
-		--i;
-		obj = drm_gem_fb_get_obj(fb, i);
-		if (!obj)
-			continue;
-		import_attach = obj->import_attach;
-		if (!import_attach)
-			continue;
-		ret2 = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
-		if (ret2) {
-			drm_err(fb->dev,
-				"dma_buf_end_cpu_access() failed during error handling: %d\n",
-				ret2);
-		}
-	}
-
+err___drm_gem_fb_end_cpu_access:
+	__drm_gem_fb_end_cpu_access(fb, dir, i);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fb_begin_cpu_access);
@@ -472,23 +478,7 @@ EXPORT_SYMBOL(drm_gem_fb_begin_cpu_access);
  */
 void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir)
 {
-	size_t i = ARRAY_SIZE(fb->obj);
-	struct dma_buf_attachment *import_attach;
-	struct drm_gem_object *obj;
-	int ret;
-
-	while (i) {
-		--i;
-		obj = drm_gem_fb_get_obj(fb, i);
-		if (!obj)
-			continue;
-		import_attach = obj->import_attach;
-		if (!import_attach)
-			continue;
-		ret = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
-		if (ret)
-			drm_err(fb->dev, "dma_buf_end_cpu_access() failed: %d\n", ret);
-	}
+	__drm_gem_fb_end_cpu_access(fb, dir, ARRAY_SIZE(fb->obj));
 }
 EXPORT_SYMBOL(drm_gem_fb_end_cpu_access);
 
-- 
2.36.0

