Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6DC7A7A5E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F017010E48B;
	Wed, 20 Sep 2023 11:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D109C10E484
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 11:25:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5EC6E21CEE;
 Wed, 20 Sep 2023 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695209112; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bKqEo0072BkdPApn8FPNvTRQh3WDDsLnfyCvM6q4FM=;
 b=X8XWE8dHbmcj4vFE9Bc9tOAiZYsdsQJ6Z2f7cqAWFjRUkSLFBcLRM2oE+ArE0OiEx7knQy
 d+0ULu8vHqXYIYCjylXY04xbH7A6GfG3BQwK7J9nDjnBpiCI7N4gonpoyS1MB/josttJrj
 A/K4gJBmriWOZzErboHsbaCvvTcXfMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695209112;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/bKqEo0072BkdPApn8FPNvTRQh3WDDsLnfyCvM6q4FM=;
 b=IjPhrUrc4Jkn8skoT3dp4xdf1XVZW+4t0DV8ixSaM4Pa4aEQtsudJYscwbzxJ2Ziq7gmOs
 JuONNWm29mADL9DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24F2513A64;
 Wed, 20 Sep 2023 11:25:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GEUsCJjWCmX3NwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Sep 2023 11:25:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH 8/8] drm/ssd130x: Preallocate xfrm buffer in plane's
 atomic_check
Date: Wed, 20 Sep 2023 13:10:20 +0200
Message-ID: <20230920112508.11770-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920112508.11770-1-tzimmermann@suse.de>
References: <20230920112508.11770-1-tzimmermann@suse.de>
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

Preallocate the xfrm buffer's storage in the plane's atomic_check
function if a format conversion will be necessary. Allows the update
to fail if no memory is available. Avoids the same allocation within
atomic_update, which may not fail.

Also inline drm_plane_helper_atomic_check() into the driver and thus
return early for invisible planes. Avoids memory allocation entirely
in this case.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/solomon/ssd130x.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 508588bd2d565..3788d847e50ff 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -601,17 +601,27 @@ static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
 {
 	struct drm_device *drm = plane->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
-	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
-	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(new_plane_state);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
 	unsigned int page_height = ssd130x->device_info->page_height;
 	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
 	const struct drm_format_info *fi;
 	unsigned int pitch;
 	int ret;
 
-	ret = drm_plane_helper_atomic_check(plane, state);
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
 	if (ret)
 		return ret;
+	else if (!new_plane_state->visible)
+		return 0;
 
 	fi = drm_format_info(DRM_FORMAT_R1);
 	if (!fi)
@@ -619,6 +629,15 @@ static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
 
 	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
+	if (new_plane_state->fb->format != fi) {
+		void *buf;
+
+		/* format conversion necessary; reserve buffer */
+		buf = drm_xfrm_buf_reserve(&ssd130x->xfrm, pitch, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
 	ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->buffer)
 		return -ENOMEM;
-- 
2.42.0

