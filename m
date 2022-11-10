Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0666243B0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890F510E7D7;
	Thu, 10 Nov 2022 13:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376BE10E7D0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:55:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9D66622AA3;
 Thu, 10 Nov 2022 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668088521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uS1ubEDgZOCboLhD8v1qzuxTMKvLMpSWRMmbHtl2y1A=;
 b=mHu8/HF/OjQvcPBWx60VgUca6FilbFM+ew9K/x8jpOZIdnKmYmOywgYKlGtTrFbR1fsdMy
 FkOzrdvXxzhsRYtLabAHxvCKQhs9n5YTJq4xLLqzDdldNrAI7whQGJxbJE37/v3RCgU4LK
 rnnSTN58aJ9mLkMzcpvO0FosehkLiho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668088521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uS1ubEDgZOCboLhD8v1qzuxTMKvLMpSWRMmbHtl2y1A=;
 b=fd9CGlAxKkAyXxg3LeTGWQct3ZXORpIzrL/515TEegza+TLzdYPK6gJGKwN0mXS+hZFoOA
 irvz5zzoEFlWBUAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79FF11332F;
 Thu, 10 Nov 2022 13:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mNIJHckCbWP/DAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Nov 2022 13:55:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/5] drm/fb-helper: Set damage-clip area in helper
Date: Thu, 10 Nov 2022 14:55:15 +0100
Message-Id: <20221110135519.30029-2-tzimmermann@suse.de>
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

Set the damage area in the new helper drm_fb_helper_add_damage_clip().
It can now be updated without scheduling the damage worker. This change
will help to remove the damage worker entirely. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index e0384f967c0b3..178615565760e 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -576,8 +576,8 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 }
 EXPORT_SYMBOL(drm_fb_helper_fini);
 
-static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
-				 u32 width, u32 height)
+static void drm_fb_helper_add_damage_clip(struct drm_fb_helper *helper, u32 x, u32 y,
+					  u32 width, u32 height)
 {
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	unsigned long flags;
@@ -588,6 +588,12 @@ static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
 	clip->x2 = max_t(u32, clip->x2, x + width);
 	clip->y2 = max_t(u32, clip->y2, y + height);
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
+}
+
+static void drm_fb_helper_damage(struct drm_fb_helper *helper, u32 x, u32 y,
+				 u32 width, u32 height)
+{
+	drm_fb_helper_add_damage_clip(helper, x, y, width, height);
 
 	schedule_work(&helper->damage_work);
 }
-- 
2.38.0

