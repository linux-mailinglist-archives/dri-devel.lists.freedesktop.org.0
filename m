Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FE77BE228
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 16:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9038010E270;
	Mon,  9 Oct 2023 14:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19DF10E265
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 14:10:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 838272188E;
 Mon,  9 Oct 2023 14:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696860622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeD9o12gpl73r2BFv/LuPn3oaVBfmm8fM7YX3rtU2x8=;
 b=xRvUP8VLJ0RyGi+sYB3ZEYpgrpjNmZrLZIj3IIQCoqirCg86UXfX/TsOaRK8/yqJ6YxIjX
 E738FxJV/VIsswegzOirdJers6HnB39R2OtHymDqLdtoY+gKJZGd+D6DqM6+Pu1c7A2utS
 2VJI2kfNIQjanS5HqHpXD3GpQIrfoSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696860622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeD9o12gpl73r2BFv/LuPn3oaVBfmm8fM7YX3rtU2x8=;
 b=6ii+D25YnOYOf9+vEDvKFLOO1uSw8U5V0wsGMKSEm+/RW3G3PyjReyIKwWyrMtgV8dEWs0
 Sm6jvR8hvPCFR9CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 460621390B;
 Mon,  9 Oct 2023 14:10:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EAMjEM4JJGXaBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 14:10:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v5 6/7] drm/ssd130x: Fix atomic_check for disabled planes
Date: Mon,  9 Oct 2023 16:06:35 +0200
Message-ID: <20231009141018.11291-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009141018.11291-1-tzimmermann@suse.de>
References: <20231009141018.11291-1-tzimmermann@suse.de>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The plane's atomic_check returns -EINVAL if the CRTC has not been
set. This is the case for disabled planes, for which atomic_check
should return 0. For disabled planes, it also omits the mandatory
call to drm_atomic_helper_check_plane_state().

Replace the test with the boiler-plate code that first invokes
drm_atomic_helper_check_plane_state() and then tests for the plane
to be visible. Return early for non-visible planes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d51f9fbd98b6 ("drm/ssd130x: Store the HW buffer in the driver-private CRTC state")
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/solomon/ssd130x.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 3dd8e8a444b6f..dccbfe33edb5e 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -639,21 +639,22 @@ static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
 	struct drm_crtc *crtc = plane_state->crtc;
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *crtc_state = NULL;
 	const struct drm_format_info *fi;
 	unsigned int pitch;
 	int ret;
 
-	if (!crtc)
-		return -EINVAL;
-
-	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	if (IS_ERR(crtc_state))
-		return PTR_ERR(crtc_state);
+	if (crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	ret = drm_plane_helper_atomic_check(plane, state);
+	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
 	if (ret)
 		return ret;
+	else if (!plane_state->visible)
+		return 0;
 
 	fi = drm_format_info(DRM_FORMAT_R1);
 	if (!fi)
-- 
2.42.0

