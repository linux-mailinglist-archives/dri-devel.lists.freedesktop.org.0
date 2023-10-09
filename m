Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892C67BE225
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 16:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467910E26B;
	Mon,  9 Oct 2023 14:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A3210E268
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 14:10:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05B692188C;
 Mon,  9 Oct 2023 14:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696860622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwxRpXSOkMg7TIHs1Ihq4o7xNn8xP0MSRbISIh1MDvg=;
 b=O/AVFEI4btWe1gscieK8KmV7wrAyxL8S2iy00dMvmD/HooP30gxegYXAhlehaSWi7a64m1
 CIkBEaE9wzQqeLR23eMCXxqKe+tyB3WBKiN5UdWr/RHOz5S0scQETbve3ephRsqYiL95Zl
 E+BbkMgt/aBg3mG29AFmwJg/zvZueKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696860622;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwxRpXSOkMg7TIHs1Ihq4o7xNn8xP0MSRbISIh1MDvg=;
 b=+KMmBbjvgbdRpRnEPrhsuh02e87r0Lyl9xb8H0ptOAUPr0zRH/zxSrKxeubcU/8ee4Qx6J
 Gv777W1I4dc4pkDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C0FEC1390B;
 Mon,  9 Oct 2023 14:10:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AFRVLs0JJGXaBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 14:10:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v5 4/7] drm/ofdrm: Preallocate format-conversion buffer in
 atomic_check
Date: Mon,  9 Oct 2023 16:06:33 +0200
Message-ID: <20231009141018.11291-5-tzimmermann@suse.de>
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
---
 drivers/gpu/drm/tiny/ofdrm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 404c83032cecc..05a72473cfc65 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -758,7 +758,11 @@ static const uint64_t ofdrm_primary_plane_format_modifiers[] = {
 static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						   struct drm_atomic_state *new_state)
 {
+	struct drm_device *dev = plane->dev;
+	struct ofdrm_device *odev = ofdrm_device_of_dev(dev);
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
+	struct drm_shadow_plane_state *new_shadow_plane_state =
+		to_drm_shadow_plane_state(new_plane_state);
 	struct drm_framebuffer *new_fb = new_plane_state->fb;
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
@@ -777,6 +781,16 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
+	if (new_fb->format != odev->format) {
+		void *buf;
+
+		/* format conversion necessary; reserve buffer */
+		buf = drm_format_conv_state_reserve(&new_shadow_plane_state->fmtcnv_state,
+						    odev->pitch, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
 	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
 
 	new_ofdrm_crtc_state = to_ofdrm_crtc_state(new_crtc_state);
-- 
2.42.0

