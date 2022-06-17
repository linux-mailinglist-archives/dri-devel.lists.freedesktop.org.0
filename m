Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562154F560
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E621A11A7D0;
	Fri, 17 Jun 2022 10:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC5111A7AB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:32:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6A8A21E55;
 Fri, 17 Jun 2022 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655461950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HY1PoCQlyI9nVmsyAQP6xNl9V28y9XFBJZv+X4Dc/fg=;
 b=xSkk62Ktksi9reWUX7f9t4Nr7kijPswtSaUBnF9+2tQEAxyZ+WtiMJ4WkULvwWoKLqPArn
 gbVgck0DeTJsS1yX9CrMpgj8NxF+RjZVo1vQJe1C8SjAvfCkXgO3+0luQiWypl++wCSgiQ
 K0wQbcxWf5h+DntdHEUQEh5EnT4uEXI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655461950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HY1PoCQlyI9nVmsyAQP6xNl9V28y9XFBJZv+X4Dc/fg=;
 b=ODqhrAepCi8WGLgLCPRtyE3TWt6nU6v1IdfwGYNseQRL3ilh2frQ5YhGPIVQFuCC42dzat
 4F27MCb2eZ1Bs2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 913521348E;
 Fri, 17 Jun 2022 10:32:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IEttIj5YrGKeSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jun 2022 10:32:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, javierm@redhat.com,
 noralf@tronnes.org, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH 2/3] drm/simple-kms: Use drm_atomic_helper_check_crtc_state()
Date: Fri, 17 Jun 2022 12:32:25 +0200
Message-Id: <20220617103226.25617-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617103226.25617-1-tzimmermann@suse.de>
References: <20220617103226.25617-1-tzimmermann@suse.de>
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

Simple-KMS helpers guarantee that the CRTC and plane enable
flags are synchronized. Implement this with atomic helpers
drm_atomic_helper_check_crtc_state() on the CRTC side, and
drm_atomic_helper_check_plane_state() on the plane side.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 72989ed1baba..36633590ebf3 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -100,14 +100,12 @@ drm_simple_kms_crtc_mode_valid(struct drm_crtc *crtc,
 static int drm_simple_kms_crtc_check(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
-									  crtc);
-	bool has_primary = crtc_state->plane_mask &
-			   drm_plane_mask(crtc->primary);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	int ret;
 
-	/* We always want to have an active plane with an active CRTC */
-	if (has_primary != crtc_state->enable)
-		return -EINVAL;
+	ret = drm_atomic_helper_check_crtc_state(crtc_state, false);
+	if (ret)
+		return ret;
 
 	return drm_atomic_add_affected_planes(state, crtc);
 }
@@ -227,7 +225,7 @@ static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
 	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
-						  false, true);
+						  false, false);
 	if (ret)
 		return ret;
 
-- 
2.36.1

