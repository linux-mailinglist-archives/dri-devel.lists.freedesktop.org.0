Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583AF5285B3
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3D810FA7D;
	Mon, 16 May 2022 13:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A6310E631
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:43:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A4FE1F92D;
 Mon, 16 May 2022 13:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652708625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ClNSUA6qYBQ6cu68/y/n7fZLEa5jHOEP+TvUI16qkM=;
 b=tDWkge6+YoT2mNJ0b7TPbSRFjdMdSJteBRRUL5aVjKciYMahWKg6vNa8dQQ+bjdChkVGhC
 MKluJ7tfnzy9NR4oTHGsK1zxACXrXNHMMAJ5JksTvNxF2WzMujMYO3kvmno1NwoDfXMGtL
 r2EZVmmteFnjXN94Q0hiIl0XBgwnLYw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652708625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ClNSUA6qYBQ6cu68/y/n7fZLEa5jHOEP+TvUI16qkM=;
 b=vG4rq933cnUPv7MwjqB4Wy133NbLIITbR9NO2HiHrHcxp/PbXuAUUfBBD1doFKjlVYnZGJ
 Z2bewyC44uaEozBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 724AE13ADC;
 Mon, 16 May 2022 13:43:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AFwfGxFVgmLtBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 May 2022 13:43:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 5/7] drm/mgag200: Remove struct mga_connector
Date: Mon, 16 May 2022 15:43:41 +0200
Message-Id: <20220516134343.6085-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516134343.6085-1-tzimmermann@suse.de>
References: <20220516134343.6085-1-tzimmermann@suse.de>
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

struct mga_connector has outlived its purpose. Inline the rsp init
helper into the mode-config code and remove the data structure. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  8 +----
 drivers/gpu/drm/mgag200/mgag200_mode.c | 44 ++++++++------------------
 2 files changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 5bdd09432114..5634fc003ca4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -168,8 +168,6 @@ static inline struct mgag200_crtc_state *to_mgag200_crtc_state(struct drm_crtc_s
 	return container_of(base, struct mgag200_crtc_state, base);
 }
 
-#define to_mga_connector(x) container_of(x, struct mga_connector, base)
-
 struct mga_i2c_chan {
 	struct i2c_adapter adapter;
 	struct drm_device *dev;
@@ -177,10 +175,6 @@ struct mga_i2c_chan {
 	int data, clock;
 };
 
-struct mga_connector {
-	struct drm_connector base;
-};
-
 struct mga_mc {
 	resource_size_t			vram_size;
 	resource_size_t			vram_base;
@@ -236,9 +230,9 @@ struct mga_device {
 		} g200se;
 	} model;
 
-	struct mga_connector connector;
 	struct mgag200_pll pixpll;
 	struct mga_i2c_chan i2c;
+	struct drm_connector connector;
 	struct drm_simple_display_pipe display_pipe;
 };
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index ae78950e270b..0baaec117502 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -824,31 +824,6 @@ static const struct drm_connector_funcs mga_vga_connector_funcs = {
 	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
 };
 
-static int mgag200_vga_connector_init(struct mga_device *mdev)
-{
-	struct drm_device *dev = &mdev->base;
-	struct mga_connector *mconnector = &mdev->connector;
-	struct drm_connector *connector = &mconnector->base;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
-	int ret;
-
-	ret = mgag200_i2c_init(mdev, i2c);
-	if (ret) {
-		drm_err(dev, "failed to add DDC bus: %d\n", ret);
-		return ret;
-	}
-
-	ret = drm_connector_init_with_ddc(dev, connector,
-					  &mga_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA,
-					  &i2c->adapter);
-	if (ret)
-		return ret;
-	drm_connector_helper_add(connector, &mga_vga_connector_helper_funcs);
-
-	return 0;
-}
-
 /*
  * Simple Display Pipe
  */
@@ -1109,7 +1084,8 @@ static unsigned int mgag200_preferred_depth(struct mga_device *mdev)
 int mgag200_modeset_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = &mdev->base;
-	struct drm_connector *connector = &mdev->connector.base;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
 	struct drm_simple_display_pipe *pipe = &mdev->display_pipe;
 	size_t format_count = ARRAY_SIZE(mgag200_simple_display_pipe_formats);
 	int ret;
@@ -1132,14 +1108,22 @@ int mgag200_modeset_init(struct mga_device *mdev)
 
 	dev->mode_config.funcs = &mgag200_mode_config_funcs;
 
-	ret = mgag200_vga_connector_init(mdev);
+	ret = mgag200_i2c_init(mdev, i2c);
 	if (ret) {
-		drm_err(dev,
-			"mgag200_vga_connector_init() failed, error %d\n",
-			ret);
+		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
 
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &mga_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &i2c->adapter);
+	if (ret) {
+		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &mga_vga_connector_helper_funcs);
+
 	ret = mgag200_pixpll_init(&mdev->pixpll, mdev);
 	if (ret)
 		return ret;
-- 
2.36.1

