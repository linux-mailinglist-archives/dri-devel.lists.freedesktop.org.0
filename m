Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D117577E97
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3748AA3CE;
	Mon, 18 Jul 2022 09:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C85A11AA8D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:27:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 33C6420D38;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658136475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vukc+DExgPERW50LbY8+rEeWUMsTX6tHuUFwPN/12D0=;
 b=cjOWbfk9Ni/Xpah1P38WBX18U3V0xeohyO8fULKe2ASL+kZZ/6cjS1ZXQ8+s4c/AoShtfU
 RjHpUypIrSDz6p6Eyjr9hgEaMIPiDxcx1d0To76ms0fp3LeHkMAaq7xdvrLVpDqokk7LpH
 jQWXWU0tmvCnJBE8zNK6nNjXn9cs9Uw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658136475;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vukc+DExgPERW50LbY8+rEeWUMsTX6tHuUFwPN/12D0=;
 b=+BFBbHwQOnX1MuQoCpS64gfRMbOwEV4hBgGJrfukWi548MuoL8zfwb6IPfFh3SDy+p7Lyy
 Kp/Arf9/Ao1PapAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C4EF13AB4;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kIYtApsn1WJ6LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 09:27:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, airlied@redhat.com, airlied@linux.ie,
 jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH v2 01/14] drm/mgag200: Split mgag200_modeset_init()
Date: Mon, 18 Jul 2022 11:27:40 +0200
Message-Id: <20220718092753.9598-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718092753.9598-1-tzimmermann@suse.de>
References: <20220718092753.9598-1-tzimmermann@suse.de>
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

Split mgag200_modeset_init() into smaller helpers to initialize
the mode_config structure and the pipeline. This will be helpful
for transforming this code into per-model functions. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 41 ++++++++++++++++++++------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 225cca2ed60e..e08852482fe2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1048,23 +1048,16 @@ static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available)
+static int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available)
 {
 	struct drm_device *dev = &mdev->base;
-	struct mga_i2c_chan *i2c = &mdev->i2c;
-	struct drm_connector *connector = &mdev->connector;
-	struct drm_simple_display_pipe *pipe = &mdev->display_pipe;
-	size_t format_count = ARRAY_SIZE(mgag200_simple_display_pipe_formats);
 	int ret;
 
-	mgag200_init_regs(mdev);
-
 	mdev->vram_available = vram_available;
 
 	ret = drmm_mode_config_init(dev);
 	if (ret) {
-		drm_err(dev, "drmm_mode_config_init() failed, error %d\n",
-			ret);
+		drm_err(dev, "drmm_mode_config_init() failed: %d\n", ret);
 		return ret;
 	}
 
@@ -1074,6 +1067,18 @@ int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available
 	dev->mode_config.fb_base = mdev->vram_res->start;
 	dev->mode_config.funcs = &mgag200_mode_config_funcs;
 
+	return 0;
+}
+
+static int mgag200_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
+	struct drm_connector *connector = &mdev->connector;
+	struct drm_simple_display_pipe *pipe = &mdev->display_pipe;
+	size_t format_count = ARRAY_SIZE(mgag200_simple_display_pipe_formats);
+	int ret;
+
 	ret = mgag200_i2c_init(mdev, i2c);
 	if (ret) {
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
@@ -1114,6 +1119,24 @@ int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available
 
 	drm_crtc_enable_color_mgmt(&pipe->crtc, 0, false, MGAG200_LUT_SIZE);
 
+	return 0;
+}
+
+int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available)
+{
+	struct drm_device *dev = &mdev->base;
+	int ret;
+
+	mgag200_init_regs(mdev);
+
+	ret = mgag200_mode_config_init(mdev, vram_available);
+	if (ret)
+		return ret;
+
+	ret = mgag200_pipeline_init(mdev);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.36.1

