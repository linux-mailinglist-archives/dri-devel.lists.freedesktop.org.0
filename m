Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B27F5F0BCB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 14:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768378825E;
	Fri, 30 Sep 2022 12:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D05D8825E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 12:37:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7B821F895;
 Fri, 30 Sep 2022 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664541469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WbrJDIKRTpPTftVnGPVS3Ez7TYqFzE8uDnSUPfPfZtU=;
 b=H545mzcx8oX8MI4bL7nuw/UR5G3qMy+ZSOhHAkmvSc7s9TNYMONcMVyJiLcGnfP1QbYMkl
 0hZ/36ti/wLRMNwiqacymHaP4B2TOM8z09BOmL/u7wvuRGBImx+4oJ6gj32Gv/Apl17dWV
 j/0F7fsIxVXupknasFnl2JChZUD5Rhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664541469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WbrJDIKRTpPTftVnGPVS3Ez7TYqFzE8uDnSUPfPfZtU=;
 b=nKTTI8O3QXxtJG2Gt3X5gX5gwUxG7JNZrahdrk1/zvRNNZKqQv/QiHseqPU1D77NotOJBo
 rP2y85IVt9Ua9TCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A0F4313677;
 Fri, 30 Sep 2022 12:37:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JqeGJh3jNmORKwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Sep 2022 12:37:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, daniel@ffwll.ch, airlied@gmail.com,
 ville.syrjala@linux.intel.com, daniel@fooishbar.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v3] drm/atomic-helper: Don't allocated plane state in CRTC
 check
Date: Fri, 30 Sep 2022 14:37:48 +0200
Message-Id: <20220930123748.10426-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In drm_atomic_helper_check_crtc_state(), do not add a new plane state
to the global state if it does not exist already. Adding a new plane
state will result in overhead for the plane during the atomic-commit
step.

For the test in drm_atomic_helper_check_crtc_state() to succeed, it
is important that the CRTC has an enabled primary plane after the
commit. Simply testing the CRTC state's plane_mask for a primary plane
is sufficient.

Note that the helper still only tests for an attached primary plane.
Drivers have to ensure that the plane contains valid pixel information.

v3:
	* test for a primary plane in plane_mask (Ville)
v2:
	* remove unnecessary test for plane->crtc (Ville)
	* inline drm_atomic_get_next_plane_state() (Ville)
	* acquire plane lock before accessing plane->state (Ville)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d6b9af1097fe ("drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_atomic_helper.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 98cc3137c062..02b4a7dc92f5 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -945,7 +945,6 @@ int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
 				       bool can_disable_primary_planes)
 {
 	struct drm_device *dev = crtc_state->crtc->dev;
-	struct drm_atomic_state *state = crtc_state->state;
 
 	if (!crtc_state->enable)
 		return 0;
@@ -956,14 +955,7 @@ int drm_atomic_helper_check_crtc_state(struct drm_crtc_state *crtc_state,
 		struct drm_plane *plane;
 
 		drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
-			struct drm_plane_state *plane_state;
-
-			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-				continue;
-			plane_state = drm_atomic_get_plane_state(state, plane);
-			if (IS_ERR(plane_state))
-				return PTR_ERR(plane_state);
-			if (plane_state->fb && plane_state->crtc) {
+			if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
 				has_primary_plane = true;
 				break;
 			}
-- 
2.37.3

