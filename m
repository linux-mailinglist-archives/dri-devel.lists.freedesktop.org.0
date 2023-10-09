Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7C7BE224
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 16:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E9210E268;
	Mon,  9 Oct 2023 14:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FAC10E265
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 14:10:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0E402188F;
 Mon,  9 Oct 2023 14:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696860622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mx2TBEKYLc5tnEY+e00ouUVK35x+HS+JZuSn39c3/yE=;
 b=KJxJvRTLIlZ0o3npWJ3bHnuYcrwccw86y15H26+n37JD0HK4hKACuOLhpKWGfSUY+LMysa
 DK+HbSugy0mDH8rNYnW8cKKyo7GGTcVOrWpuYkEThgAfoT/fWP/XHmcC1fYYe08VJPiHcO
 4BHIJRWFNEi8ocw9x+paWL+nyDVh3Cc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696860622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mx2TBEKYLc5tnEY+e00ouUVK35x+HS+JZuSn39c3/yE=;
 b=TxQElTKbgZE+8mO1E982EWv1v7CLvk1/KVxMFLCSr0fvu3OywBCZKFYI7hi5R9wLBGhSlt
 1zZllYLGPNmd0KBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88B0313905;
 Mon,  9 Oct 2023 14:10:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cPB+IM4JJGXaBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 14:10:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v5 7/7] drm/ssd130x: Preallocate format-conversion buffer in
 atomic_check
Date: Mon,  9 Oct 2023 16:06:36 +0200
Message-ID: <20231009141018.11291-8-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Preallocate the format-conversion state's storage in the plane's
atomic_check function if a format conversion is necessary. Allows
the update to fail if no memory is available. Avoids the same
allocation within atomic_update, which may not fail.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index dccbfe33edb5e..d3761e48bca12 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -638,6 +638,7 @@ static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
+	struct drm_shadow_plane_state *shadow_plane_state = &ssd130x_state->base;
 	struct drm_crtc *crtc = plane_state->crtc;
 	struct drm_crtc_state *crtc_state = NULL;
 	const struct drm_format_info *fi;
@@ -662,6 +663,16 @@ static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
 
 	pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
 
+	if (plane_state->fb->format != fi) {
+		void *buf;
+
+		/* format conversion necessary; reserve buffer */
+		buf = drm_format_conv_state_reserve(&shadow_plane_state->fmtcnv_state,
+						    pitch, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
 	ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
 	if (!ssd130x_state->buffer)
 		return -ENOMEM;
-- 
2.42.0

