Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DE6297DB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F8810E3B1;
	Tue, 15 Nov 2022 11:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A85710E3B1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:58:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D174C1F8B4;
 Tue, 15 Nov 2022 11:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668513502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGfTFwey8SdgPxwnK1endgDN3o0KGNC0QJEtl7871FE=;
 b=ZK+plwnzvVFQmKZ139XOwTlhL9+GFph3pduOXT/xZ9gX8HCmJPkF0JMk/oMnYTk6Ytlg/2
 RgpdGLkmwExFawxie7o9YOpCZLWe4u589PbqFdpoED9Afe3gbiOpXFtIcWduk9jjprkXKj
 MHMXjTiPvXzjh5aUDLiQhG8o6mHlF0M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668513502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jGfTFwey8SdgPxwnK1endgDN3o0KGNC0QJEtl7871FE=;
 b=llrCtBVSCmIK4wl0KlI5utQXQzMR2rkvdY6IwTal0VPXS/7TEpcCIaT4W1VA3tG/VW91Ke
 FGcoG+jsuCcJ2oCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3EDC13273;
 Tue, 15 Nov 2022 11:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kKUvJ95+c2OELgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Nov 2022 11:58:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 2/6] drm/fb-helper: Move dirty-fb update into helper
 function
Date: Tue, 15 Nov 2022 12:58:15 +0100
Message-Id: <20221115115819.23088-3-tzimmermann@suse.de>
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

Move the dirty-fb update from the damage-worker callback into the
new helper drm_fb_helper_fb_dirty(), so that it can run outside the
damage worker. This change will help to remove the damage worker
entirely. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 178615565760e..be8ecb5e50b56 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -367,9 +367,8 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
 	console_unlock();
 }
 
-static void drm_fb_helper_damage_work(struct work_struct *work)
+static void drm_fb_helper_fb_dirty(struct drm_fb_helper *helper)
 {
-	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
 	struct drm_device *dev = helper->dev;
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	struct drm_clip_rect clip_copy;
@@ -404,6 +403,13 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
 	spin_unlock_irqrestore(&helper->damage_lock, flags);
 }
 
+static void drm_fb_helper_damage_work(struct work_struct *work)
+{
+	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);
+
+	drm_fb_helper_fb_dirty(helper);
+}
+
 /**
  * drm_fb_helper_prepare - setup a drm_fb_helper structure
  * @dev: DRM device
-- 
2.38.1

