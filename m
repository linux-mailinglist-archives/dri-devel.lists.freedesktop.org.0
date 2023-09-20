Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C3C7A7A62
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9AA10E48D;
	Wed, 20 Sep 2023 11:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B39810E485
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:25:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2045A21C28;
 Wed, 20 Sep 2023 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695209112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKd79diIMbeOaR9tToHBwqcvjn6vE1LL4P5M+tq2aGA=;
 b=hGDz2BBlXdRSARP7/ybexHMmFzJTwPt5pgVC9eIUuZKm6NmzKj7fg88KMqdXdhvojnUn0g
 h3z+mtWoWPYCp6gDQta5qhHdEQt76ePLdqVCYSzLiCa0pF2JQwp7EXGslGY1t1Kvk0IixP
 NzGlLkPO2db3dzep+wVHDPpSLStwRLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695209112;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKd79diIMbeOaR9tToHBwqcvjn6vE1LL4P5M+tq2aGA=;
 b=e0T27mB/9sKposOXkVGxzxbNTbPG5GXUFX0y6TXAEMNX5yRtBhxUhZAnKM2tEKVAWlArkL
 m9tIZw2sLQI9qNCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC3431333E;
 Wed, 20 Sep 2023 11:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uJ/NNJfWCmX3NwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 11:25:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH 7/8] drm/ssd130x: Store xfrm buffer in device instance
Date: Wed, 20 Sep 2023 13:10:19 +0200
Message-ID: <20230920112508.11770-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112508.11770-1-tzimmermann@suse.de>
References: <20230920112508.11770-1-tzimmermann@suse.de>
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

Store and instance of struct drm_xfrm_buf in struct ssd130x_device and
keep the allocated memory allocated across display updates. Avoid
possibly reallocating temporary memory on each display update. Unloading
the DRM device also releases the xfrm buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/solomon/ssd130x.c | 9 +++++----
 drivers/gpu/drm/solomon/ssd130x.h | 3 +++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index d11079733bc0e..508588bd2d565 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -571,7 +571,6 @@ static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
 	unsigned int page_height = ssd130x->device_info->page_height;
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(state);
-	struct drm_xfrm_buf xfrm = DRM_XFRM_BUF_INIT;
 	u8 *buf = ssd130x_state->buffer;
 	struct iosys_map dst;
 	unsigned int dst_pitch;
@@ -588,14 +587,12 @@ static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
 		return ret;
 
 	iosys_map_set_vaddr(&dst, buf);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, &xfrm);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, &ssd130x->xfrm);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
 	ssd130x_update_rect(ssd130x, ssd130x_state, rect);
 
-	drm_xfrm_buf_release(&xfrm);
-
 	return ret;
 }
 
@@ -1117,6 +1114,10 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 	bl->props.max_brightness = MAX_CONTRAST;
 	ssd130x->bl_dev = bl;
 
+	ret = drmm_xfrm_buf_init(drm, &ssd130x->xfrm);
+	if (ret)
+		return ERR_PTR(ret);
+
 	ret = ssd130x_init_modeset(ssd130x);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
index 87968b3e7fb82..f4e525feb2188 100644
--- a/drivers/gpu/drm/solomon/ssd130x.h
+++ b/drivers/gpu/drm/solomon/ssd130x.h
@@ -17,6 +17,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_format_helper.h>
 #include <drm/drm_plane_helper.h>
 
 #include <linux/regmap.h>
@@ -55,6 +56,8 @@ struct ssd130x_device {
 	struct drm_connector connector;
 	struct i2c_client *client;
 
+	struct drm_xfrm_buf xfrm;
+
 	struct regmap *regmap;
 
 	const struct ssd130x_deviceinfo *device_info;
-- 
2.42.0

