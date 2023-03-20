Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31136C16B1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34E610E2D6;
	Mon, 20 Mar 2023 15:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EC610E00C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:07:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 410AB21AC1;
 Mon, 20 Mar 2023 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679324874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDrGS6vTpomC624UixG7Duf045qZsPbFDoWWn4PkCs4=;
 b=WLa/dVrq4RMvfiKUpr2RaVduaKbc0O0vr/4zBrZM9eo5JuN/3m44AEVB4cyE+lBA/1Owgb
 cQ7QWgLXvE1FzNOl+BhnPAWx9DhDXQwIqK5g7MGKHFl9OcX5kN4soHbilbF5wUa8BjXZJv
 yMSSGnjoVoqJkUvSegiZFXkNwVXZwX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679324874;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDrGS6vTpomC624UixG7Duf045qZsPbFDoWWn4PkCs4=;
 b=21l2P8DpPuOdH8UzmxCSTkMY+NesmR37l0lox0QFNdZ2CRh30d8iQh1mVi1Zqp/+KqWSfd
 6npfixbHVEFPFbCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0A9B613A2F;
 Mon, 20 Mar 2023 15:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uN+nAcp2GGTXOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 15:07:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2 3/8] drm/fb-helper: Export drm_fb_helper_release_info()
Date: Mon, 20 Mar 2023 16:07:46 +0100
Message-Id: <20230320150751.20399-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230320150751.20399-1-tzimmermann@suse.de>
References: <20230320150751.20399-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export the fb_info release code as drm_fb_helper_release_info(). Will
help with cleaning up failed fbdev probing.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 33 ++++++++++++++++++++++++---------
 include/drm/drm_fb_helper.h     |  5 +++++
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index a39998047f8a..7e96ed9efdb5 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -538,6 +538,29 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
 }
 EXPORT_SYMBOL(drm_fb_helper_alloc_info);
 
+/**
+ * drm_fb_helper_release_info - release fb_info and its members
+ * @fb_helper: driver-allocated fbdev helper
+ *
+ * A helper to release fb_info and the member cmap.  Drivers do not
+ * need to release the allocated fb_info structure themselves, this is
+ * automatically done when calling drm_fb_helper_fini().
+ */
+void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
+{
+	struct fb_info *info = fb_helper->info;
+
+	if (!info)
+		return;
+
+	fb_helper->info = NULL;
+
+	if (info->cmap.len)
+		fb_dealloc_cmap(&info->cmap);
+	framebuffer_release(info);
+}
+EXPORT_SYMBOL(drm_fb_helper_release_info);
+
 /**
  * drm_fb_helper_unregister_info - unregister fb_info framebuffer device
  * @fb_helper: driver-allocated fbdev helper, can be NULL
@@ -561,8 +584,6 @@ EXPORT_SYMBOL(drm_fb_helper_unregister_info);
  */
 void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 {
-	struct fb_info *info;
-
 	if (!fb_helper)
 		return;
 
@@ -574,13 +595,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 	cancel_work_sync(&fb_helper->resume_work);
 	cancel_work_sync(&fb_helper->damage_work);
 
-	info = fb_helper->info;
-	if (info) {
-		if (info->cmap.len)
-			fb_dealloc_cmap(&info->cmap);
-		framebuffer_release(info);
-	}
-	fb_helper->info = NULL;
+	drm_fb_helper_release_info(fb_helper);
 
 	mutex_lock(&kernel_fb_helper_lock);
 	if (!list_empty(&fb_helper->kernel_fb_list)) {
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 013654de3fc5..c5822ec2fdd1 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -256,6 +256,7 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper);
 
 struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper);
+void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper);
 void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper);
 void drm_fb_helper_fill_info(struct fb_info *info,
 			     struct drm_fb_helper *fb_helper,
@@ -365,6 +366,10 @@ drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
 	return NULL;
 }
 
+static inline void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper)
+{
+}
+
 static inline void drm_fb_helper_unregister_info(struct drm_fb_helper *fb_helper)
 {
 }
-- 
2.40.0

