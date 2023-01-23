Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9568167785D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 11:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA07F10E336;
	Mon, 23 Jan 2023 10:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7970C89089;
 Mon, 23 Jan 2023 10:06:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C7271F88E;
 Mon, 23 Jan 2023 10:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674468364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JNXSH2jIbyrZQ/ublt+0Y9YLxXlg5ibmb+zIaFCthg=;
 b=v0ipOVKW+5HbZeCnPjx/h3dH6elhmcluoYIHKQnZtD+Lme43fZIgP/KmKLp1qLVlJVD+xr
 eFtxyeFivhDhEG19Fp1egwdmS1r7mWTrg/RosM8XjSS+wSv+53LLzKsgVBgmZqvMbxmcG7
 vsUa8pnrH0gU1LgbZ27mPCswYFL7/Gw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674468364;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JNXSH2jIbyrZQ/ublt+0Y9YLxXlg5ibmb+zIaFCthg=;
 b=lEYBjAsoXnbb87EjUyIdrE5Z1+Pq08Hl5eLEJWAzdQcZdOoREGSnqkkHHPv8hv7KMxZovD
 KhtnOhgv8aTtBeDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEAED134F5;
 Mon, 23 Jan 2023 10:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SDAXOQtczmO+DwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 10:06:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: [PATCH 04/10] drm/fbdev-generic: Initialize fb-helper structure in
 generic setup
Date: Mon, 23 Jan 2023 11:05:53 +0100
Message-Id: <20230123100559.12351-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123100559.12351-1-tzimmermann@suse.de>
References: <20230123100559.12351-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize the fb-helper structure immediately after its allocation
in drm_fbdev_generic_setup(). That will make it easier to fill it with
driver-specific values, such as the preferred BPP.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 135d58b8007b..63f66325a8a5 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -385,8 +385,6 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	if (dev->fb_helper)
 		return drm_fb_helper_hotplug_event(dev->fb_helper);
 
-	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
-
 	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
 		goto err;
@@ -456,12 +454,12 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
 	fb_helper = kzalloc(sizeof(*fb_helper), GFP_KERNEL);
 	if (!fb_helper)
 		return;
+	drm_fb_helper_prepare(dev, fb_helper, &drm_fb_helper_generic_funcs);
 
 	ret = drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_client_funcs);
 	if (ret) {
-		kfree(fb_helper);
 		drm_err(dev, "Failed to register client: %d\n", ret);
-		return;
+		goto err_drm_client_init;
 	}
 
 	/*
@@ -484,5 +482,12 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
 		drm_dbg_kms(dev, "client hotplug ret=%d\n", ret);
 
 	drm_client_register(&fb_helper->client);
+
+	return;
+
+err_drm_client_init:
+	drm_fb_helper_unprepare(fb_helper);
+	kfree(fb_helper);
+	return;
 }
 EXPORT_SYMBOL(drm_fbdev_generic_setup);
-- 
2.39.0

