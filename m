Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F110A52A07A
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 13:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C3910E11F;
	Tue, 17 May 2022 11:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2B810E06D
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 11:33:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D66C1F8F6;
 Tue, 17 May 2022 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652787209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jduvk+DskBUd5qHjTj/Eo+onJdLTW07nVcN82R++30I=;
 b=HhkBl33+emAJcuGUEYYdo5wh/Gmofkw2NuPIFfwCvpUSfsFh3oDQN0Yj/g71N9tgdvRst/
 AODIW9IXnOFKQ520Hesonu/N6KWIgmyxwIktc7NLaCIBxYj88OZ//e/IGcakpo23yiVSw0
 9FERzfr+C9ZsvUxN/Xw986uyjADoN08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652787209;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jduvk+DskBUd5qHjTj/Eo+onJdLTW07nVcN82R++30I=;
 b=aT5G9ItRetYEUyrVWSdkLt2v+g4fRCEqESwwnX2k9Birc/75S1PjSuG+MZWMZ8wUNR/JFE
 qzxHTnnfXvBIriBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F38413AA2;
 Tue, 17 May 2022 11:33:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cAevBgmIg2KqdQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 May 2022 11:33:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, noralf@tronnes.org,
 christian.koenig@amd.com
Subject: [PATCH v2 4/5] drm/gem-vram: Ignore planes that are unused by
 framebuffer format
Date: Tue, 17 May 2022 13:33:26 +0200
Message-Id: <20220517113327.26919-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517113327.26919-1-tzimmermann@suse.de>
References: <20220517113327.26919-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Only handle color planes that exist in a framebuffer's color format.
Ignore non-existing planes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 566d139f0fa0..d607043716d3 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -667,17 +667,22 @@ int
 drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
 				     struct drm_plane_state *new_state)
 {
-	size_t i;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_gem_vram_object *gbo;
+	struct drm_gem_object *obj;
+	unsigned int i;
 	int ret;
 
-	if (!new_state->fb)
+	if (!fb)
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(new_state->fb->obj); ++i) {
-		if (!new_state->fb->obj[i])
-			continue;
-		gbo = drm_gem_vram_of_gem(new_state->fb->obj[i]);
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj) {
+			ret = -EINVAL;
+			goto err_drm_gem_vram_unpin;
+		}
+		gbo = drm_gem_vram_of_gem(obj);
 		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
 		if (ret)
 			goto err_drm_gem_vram_unpin;
@@ -714,7 +719,7 @@ drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
 	if (!fb)
 		return;
 
-	__drm_gem_vram_plane_helper_cleanup_fb(plane, old_state, ARRAY_SIZE(fb->obj));
+	__drm_gem_vram_plane_helper_cleanup_fb(plane, old_state, fb->format->num_planes);
 }
 EXPORT_SYMBOL(drm_gem_vram_plane_helper_cleanup_fb);
 
-- 
2.36.1

