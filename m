Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB486CFCC0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746BB10ED03;
	Thu, 30 Mar 2023 07:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5859210ED07
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:30:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E880B218E5;
 Thu, 30 Mar 2023 07:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIipWtcPYLGUYNJ/w0WyTLqvPr0m5USIx4BqYyLdSY4=;
 b=Yl2Mr3VcQ5+g4vXeixuRVOBIScNWnpysZxQk5cS8ulnxQH14B8+7uXHgXhbRtMwecHlEPv
 t0JLa25dkHnPGV6eBeSxtli5nq0TB900QaYoaqI1o6EJEiqiui4W7ojLNT2GUc1OuOH4ZP
 70jp4falEY+Bz1XEAr66oj273R03boY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161449;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIipWtcPYLGUYNJ/w0WyTLqvPr0m5USIx4BqYyLdSY4=;
 b=EHJIppmHl7fo4PTrQApL+lzjOCbYmP3UEj4iRJ+V85VxutcylGW9hfJz/GJ9gcOy21Hyl0
 hjZmQS2BMwwlpVAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C928D1390D;
 Thu, 30 Mar 2023 07:30:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IO9RMKk6JWRNeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:30:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: linux@armlinux.org.uk, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 3/4] drm/armada: Initialize fbdev DRM client
Date: Thu, 30 Mar 2023 09:30:45 +0200
Message-Id: <20230330073046.7150-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330073046.7150-1-tzimmermann@suse.de>
References: <20230330073046.7150-1-tzimmermann@suse.de>
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
 drivers/gpu/drm/armada/armada_fbdev.c | 43 ++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 0e44f53e9fa4..303c55704225 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -117,6 +117,32 @@ static const struct drm_fb_helper_funcs armada_fb_helper_funcs = {
 	.fb_probe	= armada_fb_probe,
 };
 
+/*
+ * Fbdev client and struct drm_client_funcs
+ */
+
+static void armada_fbdev_client_unregister(struct drm_client_dev *client)
+{ }
+
+static int armada_fbdev_client_restore(struct drm_client_dev *client)
+{
+	drm_fb_helper_lastclose(client->dev);
+
+	return 0;
+}
+
+static int armada_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static const struct drm_client_funcs armada_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= armada_fbdev_client_unregister,
+	.restore	= armada_fbdev_client_restore,
+	.hotplug	= armada_fbdev_client_hotplug,
+};
+
 int armada_fbdev_init(struct drm_device *dev)
 {
 	struct armada_private *priv = drm_to_armada_dev(dev);
@@ -131,22 +157,30 @@ int armada_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, fbh, 32, &armada_fb_helper_funcs);
 
+	ret = drm_client_init(dev, &fbh->client, "armada-fbdev",
+			      &armada_fbdev_client_funcs);
+	if (ret)
+		goto err_drm_fb_helper_unprepare;
+
 	ret = drm_fb_helper_init(dev, fbh);
 	if (ret) {
 		DRM_ERROR("failed to initialize drm fb helper\n");
-		goto err_fb_helper;
+		goto err_drm_client_release;
 	}
 
 	ret = drm_fb_helper_initial_config(fbh);
 	if (ret) {
 		DRM_ERROR("failed to set initial config\n");
-		goto err_fb_setup;
+		goto err_drm_fb_helper_fini;
 	}
 
 	return 0;
- err_fb_setup:
+
+err_drm_fb_helper_fini:
 	drm_fb_helper_fini(fbh);
- err_fb_helper:
+err_drm_client_release:
+	drm_client_release(&fbh->client);
+err_drm_fb_helper_unprepare:
 	drm_fb_helper_unprepare(fbh);
 	priv->fbdev = NULL;
 	return ret;
@@ -161,6 +195,7 @@ void armada_fbdev_fini(struct drm_device *dev)
 		drm_fb_helper_unregister_info(fbh);
 
 		drm_fb_helper_fini(fbh);
+		drm_client_release(&fbh->client);
 
 		if (fbh->fb)
 			fbh->fb->funcs->destroy(fbh->fb);
-- 
2.40.0

