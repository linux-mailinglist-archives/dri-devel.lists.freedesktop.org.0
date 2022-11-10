Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3697B6243AF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204EA10E7D1;
	Thu, 10 Nov 2022 13:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221A510E7CF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:55:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4406722AA7;
 Thu, 10 Nov 2022 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668088522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9eBXxN7mXkEdLsNGtlvbjv7IIOoP5uxEM08fIfHnIQ=;
 b=uoeBzXHC3WayvfkNFjrJxvmkNe8WTjyYbN8fBMjUl7f0CEhlKDKGb7wK71XKrqdT2h9hG7
 xBXMdauaI/wIAtQ9CEulhIzOurKrwBT4ZgtymZrB6wstaiwHw+aw1uj2wKmQUSV+B28m5Q
 cFEsO4t2Dzs70weAzy7jbAXfZFW/or4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668088522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i9eBXxN7mXkEdLsNGtlvbjv7IIOoP5uxEM08fIfHnIQ=;
 b=0ro/S61W9UWwHuoGZKmzlA4inrbQSsCQShoOxiK3akjWH4kZcljgy1Tsbz13/3TbFtUiCb
 Q546BCFSocHsyyAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 219C01332F;
 Thu, 10 Nov 2022 13:55:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8H12B8oCbWP/DAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Nov 2022 13:55:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 5/5] drm/fb-helper: Remove damage worker
Date: Thu, 10 Nov 2022 14:55:19 +0100
Message-Id: <20221110135519.30029-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221110135519.30029-1-tzimmermann@suse.de>
References: <20221110135519.30029-1-tzimmermann@suse.de>
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

The fbdev damage worker is unused, so remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 9 ---------
 include/drm/drm_fb_helper.h     | 2 --
 2 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 8cb644e4ecf90..47b8ef03a1f89 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -403,13 +403,6 @@ static void drm_fb_helper_fb_dirty(struct drm_fb_helper *helper)
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
 }
 
-static void drm_fb_helper_damage_work(struct work_struct *work)
-{
-	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
-
-	drm_fb_helper_fb_dirty(helper);
-}
-
 /**
  * drm_fb_helper_prepare - setup a drm_fb_helper structure
  * @dev: DRM device
@@ -425,7 +418,6 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 	INIT_LIST_HEAD(&helper->kernel_fb_list);
 	spin_lock_init(&helper->damage_lock);
 	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
-	INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
 	helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
 	mutex_init(&helper->lock);
 	helper->funcs = funcs;
@@ -557,7 +549,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 		return;
 
 	cancel_work_sync(&fb_helper->resume_work);
-	cancel_work_sync(&fb_helper->damage_work);
 
 	info = fb_helper->info;
 	if (info) {
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index ecfcd2c56d95a..f37bb2832ba41 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -116,7 +116,6 @@ struct drm_fb_helper_funcs {
  * @damage_clip: clip rectangle used with deferred_io to accumulate damage to
  *                the screen buffer
  * @damage_lock: spinlock protecting @damage_clip
- * @damage_work: worker used to flush the framebuffer
  * @resume_work: worker used during resume if the console lock is already taken
  *
  * This is the main structure used by the fbdev helpers. Drivers supporting
@@ -146,7 +145,6 @@ struct drm_fb_helper {
 	u32 pseudo_palette[17];
 	struct drm_clip_rect damage_clip;
 	spinlock_t damage_lock;
-	struct work_struct damage_work;
 	struct work_struct resume_work;
 
 	/**
-- 
2.38.0

