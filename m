Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D656CFD1D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C348210ED21;
	Thu, 30 Mar 2023 07:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05ADF10ED15;
 Thu, 30 Mar 2023 07:41:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 68AF61FE94;
 Thu, 30 Mar 2023 07:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680162112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Fs0TSV7YnG4gHE7IXONT2StiMW8F6KBBESqQJ4Y8tQ=;
 b=ispgUMQfezZGd8KfSNuTJ8D8mOmKS12saNrk3sxCmKvi60U2/ofbZ40y9sGJwp10UMHeA5
 YqTI1yIaJvTqRiPS8Nw8jML9WEEyGIaH+NcewnYAzokn+utBM78qGsH3XXsmrAG3smeKHm
 xm+UVd0WySAxe1GGD0W5ZNNIjuKCq2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680162112;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Fs0TSV7YnG4gHE7IXONT2StiMW8F6KBBESqQJ4Y8tQ=;
 b=TrZOlcAE6K7Fnae3QgtvZdRNcATyPlT/NIlwCqkB6VoIuSU/upOQCz5oITYTU58SZ9hzrX
 DpHof8QR98w8pOCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6E31B1348E;
 Thu, 30 Mar 2023 07:41:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uEsAGkA9JWSZfQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:41:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 4/6] drm/msm: Remove fbdev from struct msm_drm_private
Date: Thu, 30 Mar 2023 09:41:47 +0200
Message-Id: <20230330074150.7637-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330074150.7637-1-tzimmermann@suse.de>
References: <20230330074150.7637-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DRM device stores a pointer to the fbdev helper. Remove struct
msm_drm_private.fbdev, which contains the same value. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 ++---
 drivers/gpu/drm/msm/msm_drv.c     | 4 ++--
 drivers/gpu/drm/msm/msm_drv.h     | 2 --
 drivers/gpu/drm/msm/msm_fbdev.c   | 8 ++------
 4 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index d6ecff0ab618..d4b31165708f 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -241,12 +241,11 @@ static int msm_fb_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = (struct drm_info_node *) m->private;
 	struct drm_device *dev = node->minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_framebuffer *fb, *fbdev_fb = NULL;
 
-	if (priv->fbdev) {
+	if (dev->fb_helper) {
 		seq_printf(m, "fbcon ");
-		fbdev_fb = priv->fbdev->fb;
+		fbdev_fb = dev->fb_helper->fb;
 		msm_framebuffer_describe(fbdev_fb, m);
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5211140ec50b..9f076b9ab19b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -242,7 +242,7 @@ static int msm_drm_uninit(struct device *dev)
 	msm_rd_debugfs_cleanup(priv);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
-	if (fbdev && priv->fbdev)
+	if (ddev->fb_helper)
 		msm_fbdev_free(ddev);
 #endif
 
@@ -537,7 +537,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 	if (kms && fbdev)
-		priv->fbdev = msm_fbdev_init(ddev);
+		msm_fbdev_init(ddev);
 #endif
 
 	ret = msm_debugfs_late_init(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9f0c184b02a0..852f88c36621 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -129,8 +129,6 @@ struct msm_drm_private {
 	bool is_a2xx;
 	bool has_cached_coherent;
 
-	struct drm_fb_helper *fbdev;
-
 	struct msm_rd_state *rd;       /* debugfs to dump all submits */
 	struct msm_rd_state *hangrd;   /* debugfs to dump hanging submits */
 	struct msm_perf_state *perf;
diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 0985486d194b..95b193a5e0d5 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -122,7 +122,6 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
 /* initialize fbdev helper */
 struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 {
-	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_fb_helper *helper;
 	int ret;
 
@@ -142,8 +141,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	if (ret)
 		goto fini;
 
-	priv->fbdev = helper;
-
 	return helper;
 
 fini:
@@ -155,8 +152,7 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 
 void msm_fbdev_free(struct drm_device *dev)
 {
-	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_fb_helper *helper = priv->fbdev;
+	struct drm_fb_helper *helper = dev->fb_helper;
 	struct drm_framebuffer *fb = helper->fb;
 
 	DBG();
@@ -175,5 +171,5 @@ void msm_fbdev_free(struct drm_device *dev)
 	drm_fb_helper_unprepare(helper);
 	kfree(helper);
 
-	priv->fbdev = NULL;
+	dev->fb_helper = NULL;
 }
-- 
2.40.0

