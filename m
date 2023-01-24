Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D055167998B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 14:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A97A10E696;
	Tue, 24 Jan 2023 13:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96B710E68C;
 Tue, 24 Jan 2023 13:40:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FA201FDC3;
 Tue, 24 Jan 2023 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674567612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWHAeVwiu+7Pt1XKK8+Xbu9HCfPR9qcjYa+iK3HlDeo=;
 b=yiClVrJ58vs8iV78LiMLGdn+UPGtz9XD03fu7eyixwqJ39B/IP41Opy+RJGOfXcE6yKs/u
 hYieBJlA0nIFBJfSha4xAdkAKXh65ybZOVPI6F32QHpOCGl/BhVNQdZS6sBsjIOLZaeMlu
 H1zzWV/xxVhgDi+o6J/eRX0dgEVi9rY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674567612;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWHAeVwiu+7Pt1XKK8+Xbu9HCfPR9qcjYa+iK3HlDeo=;
 b=7M0NCnXbuQxu9SAUTdw6OKsAcvxWhkzu1iDFMcy0gzkneSAbi5oACmbnipoXorPUEQNEC0
 mTmkNm6zps7UzQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4958E13487;
 Tue, 24 Jan 2023 13:40:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8Kr0ELzfz2PWZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 13:40:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: [PATCH v2 03/10] drm/fb-helper: Introduce drm_fb_helper_unprepare()
Date: Tue, 24 Jan 2023 14:40:03 +0100
Message-Id: <20230124134010.30263-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134010.30263-1-tzimmermann@suse.de>
References: <20230124134010.30263-1-tzimmermann@suse.de>
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

Move the fb-helper clean-up code into drm_fb_helper_unprepare(). No
functional changes.

v2:
	* declare as static inline (kernel test robot)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 14 +++++++++++++-
 include/drm/drm_fb_helper.h     |  5 +++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index c5c13e192b64..4379bcd7718b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -435,6 +435,18 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 }
 EXPORT_SYMBOL(drm_fb_helper_prepare);
 
+/**
+ * drm_fb_helper_unprepare - clean up a drm_fb_helper structure
+ * @fb_helper: driver-allocated fbdev helper structure to set up
+ *
+ * Cleans up the framebuffer helper. Inverse of drm_fb_helper_prepare().
+ */
+void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
+{
+	mutex_destroy(&fb_helper->lock);
+}
+EXPORT_SYMBOL(drm_fb_helper_unprepare);
+
 /**
  * drm_fb_helper_init - initialize a &struct drm_fb_helper
  * @dev: drm device
@@ -561,7 +573,7 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 	}
 	mutex_unlock(&kernel_fb_helper_lock);
 
-	mutex_destroy(&fb_helper->lock);
+	drm_fb_helper_unprepare(fb_helper);
 
 	if (!fb_helper->client.funcs)
 		drm_client_release(&fb_helper->client);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index f443e1f11654..39710c570a04 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -230,6 +230,7 @@ drm_fb_helper_from_client(struct drm_client_dev *client)
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 			   const struct drm_fb_helper_funcs *funcs);
+void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_init(struct drm_device *dev, struct drm_fb_helper *helper);
 void drm_fb_helper_fini(struct drm_fb_helper *helper);
 int drm_fb_helper_blank(int blank, struct fb_info *info);
@@ -296,6 +297,10 @@ static inline void drm_fb_helper_prepare(struct drm_device *dev,
 {
 }
 
+static inline void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
+{
+}
+
 static inline int drm_fb_helper_init(struct drm_device *dev,
 		       struct drm_fb_helper *helper)
 {
-- 
2.39.0

