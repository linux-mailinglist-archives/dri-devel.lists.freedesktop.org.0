Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E655D7B9C07
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 11:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B3F10E129;
	Thu,  5 Oct 2023 09:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E1C10E12E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 09:05:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B48A31F893;
 Thu,  5 Oct 2023 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696496727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbkEP6hp9sJrI+3qWgfMvRdiVfhsq1LeUdWXaEmhEb0=;
 b=yThRe9Hi1xtm8E5+EN/qDD4bbJd86vj8EU5fM2Paygex0D5pxCz56pgGTqispJdkJJ4fCP
 qtyx6vZDlFhRFpJz0OOlg0vZrT37PUegmF2uOuUYW6Cjrlwf7Pa3nxlqUbP+XnsBP8voD3
 xJGK4PD99dJv6vw8fPRwjuPwsDh7iDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696496727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbkEP6hp9sJrI+3qWgfMvRdiVfhsq1LeUdWXaEmhEb0=;
 b=kKuXkjh9J6AM0/sQ6lehdH69RkS/Z7G+TTVWoOtq7PeXsbO1IfiSCPTfkMwZc/o9631txU
 wHKlvFCaT0BOFjDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81375139C2;
 Thu,  5 Oct 2023 09:05:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4KyuHld8HmXkcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Oct 2023 09:05:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v4 4/7] drm/ofdrm: Preallocate format-conversion buffer in
 atomic_check
Date: Thu,  5 Oct 2023 11:04:24 +0200
Message-ID: <20231005090520.16511-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005090520.16511-1-tzimmermann@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
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

