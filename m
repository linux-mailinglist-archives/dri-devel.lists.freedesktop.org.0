Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3AA64BDC5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 21:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB7D10E34D;
	Tue, 13 Dec 2022 20:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD5310E349
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:12:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E1EF1FE29;
 Tue, 13 Dec 2022 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670962358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1r38X8zC468pOw0HcVA6+y6enXpQx2KwhZdNFkdBZWc=;
 b=B1lSwoOW52qWRzE80FImr9xKxMgnTCCm1KWJt5Mjqm6tBASfZHJ50bgWTco0f+c2A02Zfr
 uUvH943vK1EWxNlsaaXxYxhRM7uI+jDvwQhmP4Ykhi8rS4+3psF3EOVNSgfEtEE0/2TEtH
 iFbxrQg5EDwKwaJVWehzLlIVkQj5Ijw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670962358;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1r38X8zC468pOw0HcVA6+y6enXpQx2KwhZdNFkdBZWc=;
 b=u884Rb2cWv+G9xxSJoFlmkjQMndsHo93olGK20Zv/vOvW55QWuf6UbtyVY6Hjp0TYe4tzL
 S71jqLonujt0ZdAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6432A138EE;
 Tue, 13 Dec 2022 20:12:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iCKsF7bcmGNyJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Dec 2022 20:12:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jose.exposito89@gmail.com,
 mairacanal@riseup.net
Subject: [PATCH 6/9] drm/fh-helper: Split fbdev single-probe helper
Date: Tue, 13 Dec 2022 21:12:30 +0100
Message-Id: <20221213201233.9341-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213201233.9341-1-tzimmermann@suse.de>
References: <20221213201233.9341-1-tzimmermann@suse.de>
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

Split the single-probe helper's implementation into multiple
functions and get locking and overallocation out of the way of
the surface setup. Simplifies later changes to the setup code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 116 ++++++++++++++++++++------------
 1 file changed, 73 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index b3a731b9170a..af1495394d38 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1726,36 +1726,30 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 }
 EXPORT_SYMBOL(drm_fb_helper_pan_display);
 
-/*
- * Allocates the backing storage and sets up the fbdev info structure through
- * the ->fb_probe callback.
- */
-static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
-					 int preferred_bpp)
+
+static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferred_bpp,
+				      struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
-	struct drm_mode_config *config = &dev->mode_config;
-	int ret = 0;
 	int crtc_count = 0;
 	struct drm_connector_list_iter conn_iter;
-	struct drm_fb_helper_surface_size sizes;
 	struct drm_connector *connector;
 	struct drm_mode_set *mode_set;
 	int best_depth = 0;
 
-	memset(&sizes, 0, sizeof(struct drm_fb_helper_surface_size));
-	sizes.surface_depth = 24;
-	sizes.surface_bpp = 32;
-	sizes.fb_width = (u32)-1;
-	sizes.fb_height = (u32)-1;
+	memset(sizes, 0, sizeof(struct drm_fb_helper_surface_size));
+	sizes->surface_depth = 24;
+	sizes->surface_bpp = 32;
+	sizes->fb_width = (u32)-1;
+	sizes->fb_height = (u32)-1;
 
 	/*
 	 * If driver picks 8 or 16 by default use that for both depth/bpp
 	 * to begin with
 	 */
-	if (preferred_bpp != sizes.surface_bpp)
-		sizes.surface_depth = sizes.surface_bpp = preferred_bpp;
+	if (preferred_bpp != sizes->surface_bpp)
+		sizes->surface_depth = sizes->surface_bpp = preferred_bpp;
 
 	drm_connector_list_iter_begin(fb_helper->dev, &conn_iter);
 	drm_client_for_each_connector_iter(connector, &conn_iter) {
@@ -1766,21 +1760,21 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 		if (cmdline_mode->bpp_specified) {
 			switch (cmdline_mode->bpp) {
 			case 8:
-				sizes.surface_depth = sizes.surface_bpp = 8;
+				sizes->surface_depth = sizes->surface_bpp = 8;
 				break;
 			case 15:
-				sizes.surface_depth = 15;
-				sizes.surface_bpp = 16;
+				sizes->surface_depth = 15;
+				sizes->surface_bpp = 16;
 				break;
 			case 16:
-				sizes.surface_depth = sizes.surface_bpp = 16;
+				sizes->surface_depth = sizes->surface_bpp = 16;
 				break;
 			case 24:
-				sizes.surface_depth = sizes.surface_bpp = 24;
+				sizes->surface_depth = sizes->surface_bpp = 24;
 				break;
 			case 32:
-				sizes.surface_depth = 24;
-				sizes.surface_bpp = 32;
+				sizes->surface_depth = 24;
+				sizes->surface_bpp = 32;
 				break;
 			}
 			break;
@@ -1793,7 +1787,6 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 	 * supports RGBA5551 (16 bpp, depth 15) but not RGB565 (16 bpp, depth
 	 * 16) we need to scale down the depth of the sizes we request.
 	 */
-	mutex_lock(&client->modeset_mutex);
 	drm_client_for_each_modeset(mode_set, client) {
 		struct drm_crtc *crtc = mode_set->crtc;
 		struct drm_plane *plane = crtc->primary;
@@ -1817,13 +1810,13 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 				continue;
 
 			/* We found a perfect fit, great */
-			if (fmt->depth == sizes.surface_depth) {
+			if (fmt->depth == sizes->surface_depth) {
 				best_depth = fmt->depth;
 				break;
 			}
 
 			/* Skip depths above what we're looking for */
-			if (fmt->depth > sizes.surface_depth)
+			if (fmt->depth > sizes->surface_depth)
 				continue;
 
 			/* Best depth found so far */
@@ -1831,10 +1824,10 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 				best_depth = fmt->depth;
 		}
 	}
-	if (sizes.surface_depth != best_depth && best_depth) {
+	if (sizes->surface_depth != best_depth && best_depth) {
 		drm_info(dev, "requested bpp %d, scaled depth down to %d",
-			 sizes.surface_bpp, best_depth);
-		sizes.surface_depth = best_depth;
+			 sizes->surface_bpp, best_depth);
+		sizes->surface_depth = best_depth;
 	}
 
 	/* first up get a count of crtcs now in use and new min/maxes width/heights */
@@ -1858,8 +1851,10 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 		x = mode_set->x;
 		y = mode_set->y;
 
-		sizes.surface_width  = max_t(u32, desired_mode->hdisplay + x, sizes.surface_width);
-		sizes.surface_height = max_t(u32, desired_mode->vdisplay + y, sizes.surface_height);
+		sizes->surface_width  =
+			max_t(u32, desired_mode->hdisplay + x, sizes->surface_width);
+		sizes->surface_height =
+			max_t(u32, desired_mode->vdisplay + y, sizes->surface_height);
 
 		for (j = 0; j < mode_set->num_connectors; j++) {
 			struct drm_connector *connector = mode_set->connectors[j];
@@ -1875,28 +1870,63 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
 		}
 
 		if (lasth)
-			sizes.fb_width  = min_t(u32, desired_mode->hdisplay + x, sizes.fb_width);
+			sizes->fb_width  = min_t(u32, desired_mode->hdisplay + x, sizes->fb_width);
 		if (lastv)
-			sizes.fb_height = min_t(u32, desired_mode->vdisplay + y, sizes.fb_height);
+			sizes->fb_height = min_t(u32, desired_mode->vdisplay + y, sizes->fb_height);
 	}
-	mutex_unlock(&client->modeset_mutex);
 
-	if (crtc_count == 0 || sizes.fb_width == -1 || sizes.fb_height == -1) {
+	if (crtc_count == 0 || sizes->fb_width == -1 || sizes->fb_height == -1) {
 		drm_info(dev, "Cannot find any crtc or sizes\n");
-
-		/* First time: disable all crtc's.. */
-		if (!fb_helper->deferred_setup)
-			drm_client_modeset_commit(client);
 		return -EAGAIN;
 	}
 
+	return 0;
+}
+
+static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferred_bpp,
+				    struct drm_fb_helper_surface_size *sizes)
+{
+	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_device *dev = fb_helper->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+	int ret;
+
+	mutex_lock(&client->modeset_mutex);
+	ret = __drm_fb_helper_find_sizes(fb_helper, preferred_bpp, sizes);
+	mutex_unlock(&client->modeset_mutex);
+
+	if (ret)
+		return ret;
+
 	/* Handle our overallocation */
-	sizes.surface_height *= drm_fbdev_overalloc;
-	sizes.surface_height /= 100;
-	if (sizes.surface_height > config->max_height) {
+	sizes->surface_height *= drm_fbdev_overalloc;
+	sizes->surface_height /= 100;
+	if (sizes->surface_height > config->max_height) {
 		drm_dbg_kms(dev, "Fbdev over-allocation too large; clamping height to %d\n",
 			    config->max_height);
-		sizes.surface_height = config->max_height;
+		sizes->surface_height = config->max_height;
+	}
+
+	return 0;
+}
+
+/*
+ * Allocates the backing storage and sets up the fbdev info structure through
+ * the ->fb_probe callback.
+ */
+static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
+					 int preferred_bpp)
+{
+	struct drm_client_dev *client = &fb_helper->client;
+	struct drm_fb_helper_surface_size sizes;
+	int ret;
+
+	ret = drm_fb_helper_find_sizes(fb_helper, preferred_bpp, &sizes);
+	if (ret) {
+		/* First time: disable all crtc's.. */
+		if (!fb_helper->deferred_setup)
+			drm_client_modeset_commit(client);
+		return ret;
 	}
 
 #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-- 
2.38.1

