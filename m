Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E5EA707FA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400E010E253;
	Tue, 25 Mar 2025 17:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C049D10E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 17:20:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB0D21F397;
 Tue, 25 Mar 2025 17:20:42 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A609713957;
 Tue, 25 Mar 2025 17:20:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iCJMJ+rl4mfzWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 17:20:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com,
	airlied@redhat.com
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/4] drm/cirrus-qemu: Remove custom plane state
Date: Tue, 25 Mar 2025 18:12:52 +0100
Message-ID: <20250325171716.154097-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250325171716.154097-1-tzimmermann@suse.de>
References: <20250325171716.154097-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: DB0D21F397
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove struct cirrus_primary_plane_state and its helpers, which
are all unused. Use struct drm_shadow_plane_state instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus-qemu.c | 59 +-----------------------------
 1 file changed, 1 insertion(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
index 76744394e2a3..ccf3f6551344 100644
--- a/drivers/gpu/drm/tiny/cirrus-qemu.c
+++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
@@ -70,16 +70,6 @@ struct cirrus_device {
 
 #define to_cirrus(_dev) container_of(_dev, struct cirrus_device, dev)
 
-struct cirrus_primary_plane_state {
-	struct drm_shadow_plane_state base;
-};
-
-static inline struct cirrus_primary_plane_state *
-to_cirrus_primary_plane_state(struct drm_plane_state *plane_state)
-{
-	return container_of(plane_state, struct cirrus_primary_plane_state, base.base);
-};
-
 /* ------------------------------------------------------------------ */
 /*
  * The meat of this driver. The core passes us a mode and we have to program
@@ -374,58 +364,11 @@ static const struct drm_plane_helper_funcs cirrus_primary_plane_helper_funcs = {
 	.atomic_update = cirrus_primary_plane_helper_atomic_update,
 };
 
-static struct drm_plane_state *
-cirrus_primary_plane_atomic_duplicate_state(struct drm_plane *plane)
-{
-	struct drm_plane_state *plane_state = plane->state;
-	struct cirrus_primary_plane_state *new_primary_plane_state;
-	struct drm_shadow_plane_state *new_shadow_plane_state;
-
-	if (!plane_state)
-		return NULL;
-
-	new_primary_plane_state = kzalloc(sizeof(*new_primary_plane_state), GFP_KERNEL);
-	if (!new_primary_plane_state)
-		return NULL;
-	new_shadow_plane_state = &new_primary_plane_state->base;
-
-	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
-
-	return &new_shadow_plane_state->base;
-}
-
-static void cirrus_primary_plane_atomic_destroy_state(struct drm_plane *plane,
-						      struct drm_plane_state *plane_state)
-{
-	struct cirrus_primary_plane_state *primary_plane_state =
-		to_cirrus_primary_plane_state(plane_state);
-
-	__drm_gem_destroy_shadow_plane_state(&primary_plane_state->base);
-	kfree(primary_plane_state);
-}
-
-static void cirrus_reset_primary_plane(struct drm_plane *plane)
-{
-	struct cirrus_primary_plane_state *primary_plane_state;
-
-	if (plane->state) {
-		cirrus_primary_plane_atomic_destroy_state(plane, plane->state);
-		plane->state = NULL; /* must be set to NULL here */
-	}
-
-	primary_plane_state = kzalloc(sizeof(*primary_plane_state), GFP_KERNEL);
-	if (!primary_plane_state)
-		return;
-	__drm_gem_reset_shadow_plane(plane, &primary_plane_state->base);
-}
-
 static const struct drm_plane_funcs cirrus_primary_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = cirrus_reset_primary_plane,
-	.atomic_duplicate_state = cirrus_primary_plane_atomic_duplicate_state,
-	.atomic_destroy_state = cirrus_primary_plane_atomic_destroy_state,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static int cirrus_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
-- 
2.48.1

