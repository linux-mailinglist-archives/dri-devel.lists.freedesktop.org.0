Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B101367785F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 11:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5278E10E20B;
	Mon, 23 Jan 2023 10:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C42D882D0;
 Mon, 23 Jan 2023 10:06:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E92381F88D;
 Mon, 23 Jan 2023 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674468363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bIGptZFfSoD5WJxS1vaUVITwwhclc5PpfsYYgkXcHI=;
 b=SUuP23Q2ZFfkocL6W6/SsSFMDE9DCgHq2PwTyXJ63EtN4k3uDowLlxKnJiZoo4k14lrd6s
 XHIWDrd6U7Lti81xzBd7yvJFZi0FkQp9vfA7Tds7n9QzWMlNUN1a/f+Y92vHA3kEdt5gZk
 9CqVv0eO3+sCfTpQG+RPm4Tn7ObNE9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674468363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0bIGptZFfSoD5WJxS1vaUVITwwhclc5PpfsYYgkXcHI=;
 b=QDNDK0JM/de1SMaCMBI6LrdbgBb5bphjkE32rI4pK6sb5JRz0/CnctANbug6kkkkRkZA0/
 2mIFKk8hX030pbDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3E22139FE;
 Mon, 23 Jan 2023 10:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJ4PJwtczmO+DwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 23 Jan 2023 10:06:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com
Subject: [PATCH 03/10] drm/fb-helper: Introduce drm_fb_helper_unprepare()
Date: Mon, 23 Jan 2023 11:05:52 +0100
Message-Id: <20230123100559.12351-4-tzimmermann@suse.de>
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

Move the fb-helper clean-up code into drm_fb_helper_unprepare(). No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 14 +++++++++++++-
 include/drm/drm_fb_helper.h     |  4 ++++
 2 files changed, 17 insertions(+), 1 deletion(-)

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
index f443e1f11654..123f2ef035c5 100644
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
@@ -295,6 +296,9 @@ static inline void drm_fb_helper_prepare(struct drm_device *dev,
 					const struct drm_fb_helper_funcs *funcs)
 {
 }
+void drm_fb_helper_unprepare(struct drm_fb_helper *fb_helper)
+{
+}
 
 static inline int drm_fb_helper_init(struct drm_device *dev,
 		       struct drm_fb_helper *helper)
-- 
2.39.0

