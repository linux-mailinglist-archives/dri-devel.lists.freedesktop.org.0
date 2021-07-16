Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5FF3CB876
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169846E995;
	Fri, 16 Jul 2021 14:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29446E992
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:08:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 766431FEBB;
 Fri, 16 Jul 2021 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626444486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAaJJMvVtQXcHXuLDGFkZ+BL4IKW8SYL8qdo0nk6Ka4=;
 b=FIV2CcTTie8BTdvZZBFf/QfrVD8h6q/YSEyJSZ/0EKkgmXtmVQAqCksNQHSGrVKSa3ekvU
 Ksb/+9BKn1KBz70OLSdEhcMwHydojv9p/ivsMaKtF20O+1XhJV0wtK7EP8H7Lnwlhb+l50
 5Jqelgc/nUcBOspeY0fgg4RQiVFXAno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626444486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAaJJMvVtQXcHXuLDGFkZ+BL4IKW8SYL8qdo0nk6Ka4=;
 b=x58NlSggGsI47Duai+XVW8D060Hfo9RYmtt5RppvAjiyfKBLCy0RFe6r+wTRaE7R8GUxs3
 eka7wVdEZXaZf6BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E4F813C76;
 Fri, 16 Jul 2021 14:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kM9BDsaS8WBTSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 14:08:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, hdegoede@redhat.com,
 david@lechnology.com, airlied@redhat.com, sean@poorly.run
Subject: [PATCH 3/7] drm/mipi-dbi: Use framebuffer dma-buf helpers
Date: Fri, 16 Jul 2021 16:07:57 +0200
Message-Id: <20210716140801.1215-4-tzimmermann@suse.de>
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

There's one left-over reference to the imported attachment that we
keep. GEM BOs with imported attachment are considered uncached and
enables special handling within the drm_fb_swab().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 10b4e59384ae..71b646c4131f 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -7,7 +7,6 @@
 
 #include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/dma-buf.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/regulator/consumer.h>
@@ -202,21 +201,17 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(fb, 0);
 	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(gem);
-	struct dma_buf_attachment *import_attach = gem->import_attach;
 	void *src = cma_obj->vaddr;
-	int ret = 0;
+	int ret;
 
-	if (import_attach) {
-		ret = dma_buf_begin_cpu_access(import_attach->dmabuf,
-					       DMA_FROM_DEVICE);
-		if (ret)
-			return ret;
-	}
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return ret;
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
 		if (swap)
-			drm_fb_swab(dst, src, fb, clip, !import_attach);
+			drm_fb_swab(dst, src, fb, clip, !gem->import_attach);
 		else
 			drm_fb_memcpy(dst, src, fb, clip);
 		break;
@@ -229,9 +224,8 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		return -EINVAL;
 	}
 
-	if (import_attach)
-		ret = dma_buf_end_cpu_access(import_attach->dmabuf,
-					     DMA_FROM_DEVICE);
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+
 	return ret;
 }
 EXPORT_SYMBOL(mipi_dbi_buf_copy);
-- 
2.32.0

