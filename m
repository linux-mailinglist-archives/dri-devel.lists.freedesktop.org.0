Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704ED6CFD1A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324DF10ED1D;
	Thu, 30 Mar 2023 07:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D670110ED17;
 Thu, 30 Mar 2023 07:41:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74ED521B02;
 Thu, 30 Mar 2023 07:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680162112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vcvhcEND3/VqOUwWY/SeF/V2jpDMmKQzcmR38yg5AUE=;
 b=H6XGFuFH0bOqILWli3e2CAPzycS/vX7IPY6VUUa9+w7feMaUnLGrF7jjJhdeTEipg2dfs0
 td2b0ml5bGohkztNC4N6ZoWKIY7BMP62jW7g7Ut8GUgnnnINzUXe71EY5XpwPci/AnVPVG
 j7BATlLdrdlkgFeurwoedTckLvJBWWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680162112;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vcvhcEND3/VqOUwWY/SeF/V2jpDMmKQzcmR38yg5AUE=;
 b=uqcDY3w0og4FOhlasw1uowo+lrl3uu6r5c+CCCK4HYlPbZ2n7FWMxAnZAPN2rm6M/gmuGy
 tsFxEEQnUDrcYqBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3442A1390D;
 Thu, 30 Mar 2023 07:41:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YGXjC0A9JWSZfQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:41:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 3/6] drm/msm: Remove struct msm_fbdev
Date: Thu, 30 Mar 2023 09:41:46 +0200
Message-Id: <20230330074150.7637-4-tzimmermann@suse.de>
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

Remove struct msm_fbdev, which is an empty wrapper around struct
drm_fb_helper. Use the latter directly. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 323a79d9ef83..0985486d194b 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -18,12 +18,6 @@
  * fbdev funcs, to implement legacy fbdev interface on top of drm driver
  */
 
-#define to_msm_fbdev(x) container_of(x, struct msm_fbdev, base)
-
-struct msm_fbdev {
-	struct drm_fb_helper base;
-};
-
 static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
@@ -129,16 +123,13 @@ static const struct drm_fb_helper_funcs msm_fb_helper_funcs = {
 struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_fbdev *fbdev;
 	struct drm_fb_helper *helper;
 	int ret;
 
-	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
-	if (!fbdev)
+	helper = kzalloc(sizeof(*helper), GFP_KERNEL);
+	if (!helper)
 		return NULL;
 
-	helper = &fbdev->base;
-
 	drm_fb_helper_prepare(dev, helper, 32, &msm_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, helper);
@@ -159,7 +150,6 @@ struct drm_fb_helper *msm_fbdev_init(struct drm_device *dev)
 	drm_fb_helper_fini(helper);
 fail:
 	drm_fb_helper_unprepare(helper);
-	kfree(fbdev);
 	return NULL;
 }
 
@@ -168,7 +158,6 @@ void msm_fbdev_free(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_fb_helper *helper = priv->fbdev;
 	struct drm_framebuffer *fb = helper->fb;
-	struct msm_fbdev *fbdev;
 
 	DBG();
 
@@ -176,8 +165,6 @@ void msm_fbdev_free(struct drm_device *dev)
 
 	drm_fb_helper_fini(helper);
 
-	fbdev = to_msm_fbdev(priv->fbdev);
-
 	/* this will free the backing object */
 	if (fb) {
 		struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
@@ -186,7 +173,7 @@ void msm_fbdev_free(struct drm_device *dev)
 	}
 
 	drm_fb_helper_unprepare(helper);
-	kfree(fbdev);
+	kfree(helper);
 
 	priv->fbdev = NULL;
 }
-- 
2.40.0

