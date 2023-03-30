Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9486CFE56
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 10:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F28710ED36;
	Thu, 30 Mar 2023 08:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135FD10E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 08:32:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3C6C1FEAB;
 Thu, 30 Mar 2023 08:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680165128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INMv775rcytI6Ox2a2WuQpFcMmGCeI/Dno3P7lG29nM=;
 b=AKp5HucY5t3Bu/4hL8CICL+kJBwe/nJ4L38vBsj2mPtQ7RiwRXxpYzRE2xJg1tIvdIcW61
 vlEzY7CAjWEQlVVDWArqEEmtg2k5VZV56fYy48MHyvHaq4ufvSR1MU9c/DTLxy+5E3NiyJ
 3C+xR2ISLxuanICtZsMvkfDawlRcWig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680165128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INMv775rcytI6Ox2a2WuQpFcMmGCeI/Dno3P7lG29nM=;
 b=pfKWO+sccBRQBylSPc6iQ1inbBMXqIx9b9+XcO3JPZx49XpoeT6nNeLgUkMB54oTb+ts0E
 VJAl6nOwY0HTyPCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C8A8138FF;
 Thu, 30 Mar 2023 08:32:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aBCEHAhJJWTlGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:32:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 5/6] drm/omapdrm: Initialize fbdev DRM client
Date: Thu, 30 Mar 2023 10:32:04 +0200
Message-Id: <20230330083205.12621-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083205.12621-1-tzimmermann@suse.de>
References: <20230330083205.12621-1-tzimmermann@suse.de>
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

Initialize the fbdev client in the fbdev code with empty helper
functions. Also clean up the client. The helpers will later
implement various functionality of the DRM client. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 33 +++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index 79e417b391bf..f0e35f4764a7 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -221,6 +221,30 @@ static struct drm_fb_helper *get_fb(struct fb_info *fbi)
 	return fbi->par;
 }
 
+/*
+ * struct drm_client
+ */
+
+static void omap_fbdev_client_unregister(struct drm_client_dev *client)
+{ }
+
+static int omap_fbdev_client_restore(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static int omap_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static const struct drm_client_funcs omap_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= omap_fbdev_client_unregister,
+	.restore	= omap_fbdev_client_restore,
+	.hotplug	= omap_fbdev_client_hotplug,
+};
+
 /* initialize fbdev helper */
 void omap_fbdev_init(struct drm_device *dev)
 {
@@ -242,10 +266,14 @@ void omap_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, helper, 32, &omap_fb_helper_funcs);
 
-	ret = drm_fb_helper_init(dev, helper);
+	ret = drm_client_init(dev, &helper->client, "fbdev", &omap_fbdev_client_funcs);
 	if (ret)
 		goto fail;
 
+	ret = drm_fb_helper_init(dev, helper);
+	if (ret)
+		goto err_drm_client_release;
+
 	ret = drm_fb_helper_initial_config(helper);
 	if (ret)
 		goto fini;
@@ -254,6 +282,8 @@ void omap_fbdev_init(struct drm_device *dev)
 
 fini:
 	drm_fb_helper_fini(helper);
+err_drm_client_release:
+	drm_client_release(&helper->client);
 fail:
 	drm_fb_helper_unprepare(helper);
 	kfree(fbdev);
@@ -291,6 +321,7 @@ void omap_fbdev_fini(struct drm_device *dev)
 	if (fb)
 		drm_framebuffer_remove(fb);
 
+	drm_client_release(&helper->client);
 	drm_fb_helper_unprepare(helper);
 	kfree(fbdev);
 
-- 
2.40.0

