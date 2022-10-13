Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BB65FD866
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E9810E87F;
	Thu, 13 Oct 2022 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4B110E838
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:29:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EFB3D21CBF;
 Thu, 13 Oct 2022 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665660566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCnwK8ErzqTQCw/RAj9i1bHUxKw96d8TN6O7cWke2+w=;
 b=Vq/pCBd1HIcbqcyZ/wYZtAtFQj+7CN6iJar3ejrAP7R1M111wKkesd/XJF1aauLdMtMya6
 SMtSFOSIlCbH09YUHoDEmZ3hgiqMgMRdjgB2IG9PwgZjF4IdYD0S+xEmriJ8HZYmBV6dYl
 HvSrrmz2oCxBmtFUbj1V/zOHFuNC9s8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665660566;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCnwK8ErzqTQCw/RAj9i1bHUxKw96d8TN6O7cWke2+w=;
 b=Y7CXQkIE5/zVsTE+XLCr/BckCWsCSs1dydqccXjLEXPGnLYCIaR8AuC70wtKlcpn3+KR4h
 BRLF3+c6w1xRXjBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A2F113AAA;
 Thu, 13 Oct 2022 11:29:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6BWcJJb2R2NwYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Oct 2022 11:29:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 javierm@redhat.com, ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH v2 2/8] drm/ast: Call drm_atomic_helper_check_plane_state()
 unconditionally
Date: Thu, 13 Oct 2022 13:29:17 +0200
Message-Id: <20221013112923.769-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013112923.769-1-tzimmermann@suse.de>
References: <20221013112923.769-1-tzimmermann@suse.de>
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

Always call drm_atomic_helper_check_plane_state() in each plane's
atomic_check function. At the minimum, it needs to set or clear the
plane state's 'visible' field. Otherwise the plane-state handling
is bogus and would keep updating planes that have been disabled.

While at it, also warn if the primary plane has been enabled, but is
not visible. This cannot legally happen as the plane always covers
the entire screen.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 35 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e1e07928906e..e26471ecffb1 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -578,27 +578,28 @@ static const uint32_t ast_primary_plane_formats[] = {
 static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 						 struct drm_atomic_state *state)
 {
+	struct drm_device *dev = plane->dev;
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *crtc_state = NULL;
 	struct ast_crtc_state *ast_crtc_state;
 	int ret;
 
-	if (!new_plane_state->crtc)
-		return 0;
-
-	crtc_state = drm_atomic_get_new_crtc_state(state,
-						   new_plane_state->crtc);
+	if (new_plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
 						  false, true);
-	if (ret)
+	if (ret) {
 		return ret;
-
-	if (!new_plane_state->visible)
-		return 0;
+	} else if (!new_plane_state->visible) {
+		if (drm_WARN_ON(dev, new_plane_state->crtc)) /* cannot legally happen */
+			return -EINVAL;
+		else
+			return 0;
+	}
 
 	ast_crtc_state = to_ast_crtc_state(crtc_state);
 
@@ -805,25 +806,19 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct drm_framebuffer *fb = new_plane_state->fb;
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *crtc_state = NULL;
 	int ret;
 
-	if (!new_plane_state->crtc)
-		return 0;
-
-	crtc_state = drm_atomic_get_new_crtc_state(state,
-						   new_plane_state->crtc);
+	if (new_plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
 
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
 						  true, true);
-	if (ret)
+	if (ret || !new_plane_state->visible)
 		return ret;
 
-	if (!new_plane_state->visible)
-		return 0;
-
 	if (fb->width > AST_MAX_HWC_WIDTH || fb->height > AST_MAX_HWC_HEIGHT)
 		return -EINVAL;
 
-- 
2.37.3

