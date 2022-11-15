Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFB76297DC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7A010E3B3;
	Tue, 15 Nov 2022 11:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A28110E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:58:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8F031F8C5;
 Tue, 15 Nov 2022 11:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668513503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcECsEfIoiguUG+xz9n/QsUHXZyUPlg91oWpP1WOAXM=;
 b=L4w0QYEMZOhF+CaV8/mNQJivAQ0QuMgakNbHNA4DrDspkdipqTbcrTRrIJ7h2smn6rchzb
 kY8KisDHr+i5Vqoimn39t+opnbGI0zOcmQD6BMT+0uGCaMvsfRzeNAxodfXlj+Yk9Ar9p7
 OAdGyxbs08iTzoylLCv6mtK/7gbZgXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668513503;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcECsEfIoiguUG+xz9n/QsUHXZyUPlg91oWpP1WOAXM=;
 b=qJYP+1Btlako9/xzQ2FPlDIqhuDolEztJHIbTLuYqfdnkI62+3oPJnwR7k8sJjmSmp4B3I
 Zkiz6Q0EIOAw2wBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8908A13A9C;
 Tue, 15 Nov 2022 11:58:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YM4VIN9+c2OELgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Nov 2022 11:58:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 6/6] drm/fb-helper: Remove damage worker
Date: Tue, 15 Nov 2022 12:58:19 +0100
Message-Id: <20221115115819.23088-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115115819.23088-1-tzimmermann@suse.de>
References: <20221115115819.23088-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbdev damage worker is unused, so remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_fb_helper.c | 9 ---------
 include/drm/drm_fb_helper.h     | 2 --
 2 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index fbb9088f7defc..c7831e168b63d 100644
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
index b111dc7ada78d..455f6c2b8117a 100644
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
2.38.1

