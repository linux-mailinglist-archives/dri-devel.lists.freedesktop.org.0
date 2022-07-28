Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32607583F13
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A189443C;
	Thu, 28 Jul 2022 12:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF208FCE1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 12:41:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 28E69336C1;
 Thu, 28 Jul 2022 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659012065; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=US3SZt+NntNgJdLjO0kcmpbhdUkBaOvAEH3vHlwki1M=;
 b=lGjRM6uuziSqCEASRYL+a84UL/YvkI9573hhT9mHYZr555593ljSmCNdrKD/gsgzulOtIm
 yxAAG9guJ1MLtRiQS0QXhX++6JeA+zfRKHSzJJyBGd7uFdI0wHj8R1wE1NHE6vGSNctBGZ
 ew9w2NpDIq+ILVkn3zx8bzGjrVaAXFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659012065;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=US3SZt+NntNgJdLjO0kcmpbhdUkBaOvAEH3vHlwki1M=;
 b=bT74zGWMEGWABWg2F93KfUbm601MYUYivRXAtX3IkHibK8Wq8AMidMvIpYNIHIErKfabxL
 so2s6ZApefccSKBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 010E813AB4;
 Thu, 28 Jul 2022 12:41:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iISaOuCD4mJwMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Jul 2022 12:41:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, sam@ravnborg.org, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 01/14] drm/mgag200: Split mgag200_modeset_init()
Date: Thu, 28 Jul 2022 14:40:50 +0200
Message-Id: <20220728124103.30159-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728124103.30159-1-tzimmermann@suse.de>
References: <20220728124103.30159-1-tzimmermann@suse.de>
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
index a02f599cb9cf..78fdb3148ed7 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1047,23 +1047,16 @@ static const struct drm_mode_config_funcs mgag200_mode_config_funcs = {
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
 
@@ -1073,6 +1066,18 @@ int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available
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
@@ -1113,6 +1118,24 @@ int mgag200_modeset_init(struct mga_device *mdev, resource_size_t vram_available
 
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
2.37.1

