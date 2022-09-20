Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D1E5BE7C7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 15:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A4610E53B;
	Tue, 20 Sep 2022 13:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C68710E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 13:56:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E476D1F8A3;
 Tue, 20 Sep 2022 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663682181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzRRTpTKVFZlQdoPcqDOciTHPGQUeV5Cx+zrOJHoOTs=;
 b=V1fSPiFBR1DIF6lf38gDDV2ooaDvpitSMk+V0hglBZwckNUKML1agb9/JW+hBDu7E/gc0u
 vOm4ungF3+QO+xwbrJ1EV/LUknwS2gzRuVuvrzzPhaySM55RKxN5s4BNQ+6V8bVfC2s0nl
 PRqmMGTQtfEXrQxvbUiFGbagzwd8IIA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663682181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UzRRTpTKVFZlQdoPcqDOciTHPGQUeV5Cx+zrOJHoOTs=;
 b=4qZndteRjg0Dqh6keI5A/1z3mntM/2caZWgKS7gLrhlM0eET6kyTJ81+6T5dCRQCh6QucX
 ClDncMsH5K2N4lCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B79E413B11;
 Tue, 20 Sep 2022 13:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oPH2K4XGKWO9BgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 13:56:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robdclark@gmail.com, drawat.floss@gmail.com
Subject: [PATCH 3/5] drm/damage-helper: Do partial updates on legacy cursor
 changes
Date: Tue, 20 Sep 2022 15:56:17 +0200
Message-Id: <20220920135619.9209-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920135619.9209-1-tzimmermann@suse.de>
References: <20220920135619.9209-1-tzimmermann@suse.de>
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

In the case of a legacy cursor update, only update the cursor plane. Keep
other planes clear from changes. Setting the 'partial_update' flag when
these planes don't have damage-clipping areas acts as if no update will
be performed.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_damage_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
index 16f0d5a97ee3..a603a3563c03 100644
--- a/drivers/gpu/drm/drm_damage_helper.c
+++ b/drivers/gpu/drm/drm_damage_helper.c
@@ -69,6 +69,7 @@ void drm_atomic_helper_check_plane_damage(struct drm_atomic_state *state,
 					  struct drm_plane_state *new_plane_state)
 {
 	struct drm_crtc_state *new_crtc_state;
+	struct drm_plane *plane = new_plane_state->plane;
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	bool partial_update = false;
 
@@ -83,6 +84,17 @@ void drm_atomic_helper_check_plane_damage(struct drm_atomic_state *state,
 		 */
 		if (drm_atomic_crtc_needs_modeset(new_crtc_state))
 			goto out;
+
+		/*
+		 * On a legacy cursor update, only update the affected cursor
+		 * plane, but ignore all other planes. The non-cursor planes
+		 * won't have damage-clipping areas, so setting the flag for
+		 * a partial update acts like not doing any update.
+		 */
+		if (state->legacy_cursor_update) {
+			if (plane != new_crtc->cursor)
+				partial_update = true;
+		}
 	}
 
 	/*
-- 
2.37.3

