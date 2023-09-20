Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F77A8682
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378DC10E4CF;
	Wed, 20 Sep 2023 14:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4D210E16A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 14:25:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5FE8E21DBA;
 Wed, 20 Sep 2023 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695219939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZ9wh6LAOBPze+O/DbBY/8tUFsMzm7ATol1SOMCfXEw=;
 b=dKDq1KgRPu0o7zVrQH1+PMN0E1cjpZ3LCMzGtGEtHXVcLMfRy6wUL8RFNu3MAsNEBdnOXF
 EVc4HpvGwkO25k0DeSr2q8m2HgJXyEYeWElA1buDhlAcNKn0U5VllxMeSSbJ5a0FXNplLI
 ca5+TpsWOQI+goKUpCGMZ9Q0bU6faJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695219939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZ9wh6LAOBPze+O/DbBY/8tUFsMzm7ATol1SOMCfXEw=;
 b=OpSBilcXDPIp204MbqOJYfllimmgwga5evKzYutWKVNaXDF1vQVMONBs0spekZvzhWiPtH
 H/Zhgc8gNaJcV7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C2F913A64;
 Wed, 20 Sep 2023 14:25:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IN3xAeMAC2W+IQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 14:25:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v2 5/5] drm/ssd130x: Store xfrm buffer in device instance
Date: Wed, 20 Sep 2023 16:24:31 +0200
Message-ID: <20230920142535.19321-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920142535.19321-1-tzimmermann@suse.de>
References: <20230920142535.19321-1-tzimmermann@suse.de>
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
possibly reallocating temporary memory on each display update. Instead
preallocate temporary memory during initialization. Releasing the DRM
device also releases the xfrm buffer.

v2:
	* reserve storage during probe

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/solomon/ssd130x.c | 19 +++++++++++++++----
 drivers/gpu/drm/solomon/ssd130x.h |  3 +++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index d11079733bc0e..93a5df31d0d9a 100644
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
 
@@ -1084,6 +1081,8 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 	struct ssd130x_device *ssd130x;
 	struct backlight_device *bl;
 	struct drm_device *drm;
+	const struct drm_format_info *fi;
+	void *buf;
 	int ret;
 
 	ssd130x = devm_drm_dev_alloc(dev, &ssd130x_drm_driver,
@@ -1117,6 +1116,18 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
 	bl->props.max_brightness = MAX_CONTRAST;
 	ssd130x->bl_dev = bl;
 
+	ret = drmm_xfrm_buf_init(drm, &ssd130x->xfrm);
+	if (ret)
+		return ERR_PTR(ret);
+	fi = drm_format_info(DRM_FORMAT_R1);
+	if (!fi)
+		return ERR_PTR(-EINVAL);
+	buf = drm_xfrm_buf_reserve(&ssd130x->xfrm,
+				   drm_format_info_min_pitch(fi, 0, ssd130x->width),
+				   GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
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

