Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 400B96CFCF4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBDC10ED10;
	Thu, 30 Mar 2023 07:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6FD10ED0D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:36:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 323921FE93;
 Thu, 30 Mar 2023 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kXm8bYvQ3dmgdus+3W+I2N4JISx8iIQGevzOGQX8T4Y=;
 b=XofIzXAtE4h4pP78hg7WSpLndrVyVNo7VGzxbiE0Kyr5kMupLAFoCQjQVmPy4F2fUWQjdK
 tvVK93y0cQEOk2Z8cr0GV22k2Z8a+ALNQro0xiZ8uRgZe3HhUbQLwkAqsq/DYLqAEuChK3
 GUTvAGxIbRsXVZRHje+sAlnCFxY/2Jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161800;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kXm8bYvQ3dmgdus+3W+I2N4JISx8iIQGevzOGQX8T4Y=;
 b=UiMtTwYuswQJCgtG4UZwasgerV9XyyQDOFQ72CMBPri9C4mCUcSllDlDPYuUBHORY/a7Jv
 knBsZ+M9KKX6PqCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD5171348E;
 Thu, 30 Mar 2023 07:36:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8J0tNQc8JWQJewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:36:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com
Subject: [PATCH 4/5] drm/exynos: Initialize fbdev DRM client
Date: Thu, 30 Mar 2023 09:36:34 +0200
Message-Id: <20230330073635.7409-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330073635.7409-1-tzimmermann@suse.de>
References: <20230330073635.7409-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize the fbdev client in the fbdev code with empty helper
functions. Also clean up the client. The helpers will later
implement various functionality of the DRM client. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 35 +++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index 81f909cb5c9b..d1de49530c48 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -135,6 +135,30 @@ static const struct drm_fb_helper_funcs exynos_drm_fb_helper_funcs = {
 	.fb_probe =	exynos_drm_fbdev_create,
 };
 
+/*
+ * struct drm_client
+ */
+
+static void exynos_drm_fbdev_client_unregister(struct drm_client_dev *client)
+{ }
+
+static int exynos_drm_fbdev_client_restore(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static int exynos_drm_fbdev_client_hotplug(struct drm_client_dev *client)
+{
+	return 0;
+}
+
+static const struct drm_client_funcs exynos_drm_fbdev_client_funcs = {
+	.owner		= THIS_MODULE,
+	.unregister	= exynos_drm_fbdev_client_unregister,
+	.restore	= exynos_drm_fbdev_client_restore,
+	.hotplug	= exynos_drm_fbdev_client_hotplug,
+};
+
 int exynos_drm_fbdev_init(struct drm_device *dev)
 {
 	struct drm_fb_helper *helper;
@@ -149,11 +173,15 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 
 	drm_fb_helper_prepare(dev, helper, PREFERRED_BPP, &exynos_drm_fb_helper_funcs);
 
+	ret = drm_client_init(dev, &helper->client, "exynos-fbdev", &exynos_drm_fbdev_client_funcs);
+	if (ret)
+		goto err_drm_fb_helper_unprepare;
+
 	ret = drm_fb_helper_init(dev, helper);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev->dev,
 			      "failed to initialize drm fb helper.\n");
-		goto err_init;
+		goto err_drm_client_release;
 	}
 
 	ret = drm_fb_helper_initial_config(helper);
@@ -167,7 +195,9 @@ int exynos_drm_fbdev_init(struct drm_device *dev)
 
 err_setup:
 	drm_fb_helper_fini(helper);
-err_init:
+err_drm_client_release:
+	drm_client_release(&helper->client);
+err_drm_fb_helper_unprepare:
 	drm_fb_helper_unprepare(helper);
 	kfree(helper);
 
@@ -199,6 +229,7 @@ void exynos_drm_fbdev_fini(struct drm_device *dev)
 		return;
 
 	exynos_drm_fbdev_destroy(dev, fb_helper);
+	drm_client_release(&fb_helper->client);
 	drm_fb_helper_unprepare(fb_helper);
 	kfree(fb_helper);
 }
-- 
2.40.0

