Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA3F5F9CDE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 12:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30A210E116;
	Mon, 10 Oct 2022 10:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C414710E116
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:36:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7128321923;
 Mon, 10 Oct 2022 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665398187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hO/GmsCHEgOzgMu5EyqFUqs2Vgqaca1gWYfZWBciSxI=;
 b=qq8e/beA70apyYD+/W8LXlvn2WRmeZUNCd/ZhOWRnx9m6tyI5+5vdgjKiXrYcSLU/QmcL9
 6HSPaLZ/MChxBSkj26GIlryZHpGfo+Z9pAImPxT3xnhaeyBVwepXotv7UivNesFSGhlT/g
 6O4BiGx1HqrUU5AuDQMu69JeuNRSsk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665398187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hO/GmsCHEgOzgMu5EyqFUqs2Vgqaca1gWYfZWBciSxI=;
 b=x62nkLOyGm2N24sM5zxLLr6blel0iJuZMnh70GloVxFnNoyr9vBxwhTjKikx794ZxBxMwM
 EdzLKoo230MKCIBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F99F13AF4;
 Mon, 10 Oct 2022 10:36:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eDBxDqv1Q2M4LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Oct 2022 10:36:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH 1/8] drm/ast: Acquire I/O-register lock in atomic_commit_tail
 function
Date: Mon, 10 Oct 2022 12:36:18 +0200
Message-Id: <20221010103625.19958-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010103625.19958-1-tzimmermann@suse.de>
References: <20221010103625.19958-1-tzimmermann@suse.de>
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

Hold I/O-register lock in atomic_commit_tail to protect all pipeline
updates at once. Protects modesetting against concurrent EDID reads.

Complex modesetting operations involve mode changes and plane updates.
These steps used to be protected individually against concurrent I/O.
Make all this atomic wrt to reading display modes via EDID. The EDID
code in the conenctor's get_modes helper already acquires the necessary
lock.

A similar issue was fixed in commit 2d70b9a1482e ("drm/mgag200: Acquire
I/O-register lock in atomic_commit_tail function") for mgag200.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d5ee3ad538a8..e1e07928906e 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1200,20 +1200,6 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	return drm_atomic_add_affected_planes(state, crtc);
 }
 
-static void ast_crtc_helper_atomic_begin(struct drm_crtc *crtc, struct drm_atomic_state *state)
-{
-	struct drm_device *dev = crtc->dev;
-	struct ast_private *ast = to_ast_private(dev);
-
-	/*
-	 * Concurrent operations could possibly trigger a call to
-	 * drm_connector_helper_funcs.get_modes by trying to read the
-	 * display modes. Protect access to I/O registers by acquiring
-	 * the I/O-register lock. Released in atomic_flush().
-	 */
-	mutex_lock(&ast->ioregs_lock);
-}
-
 static void
 ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 			     struct drm_atomic_state *state)
@@ -1241,8 +1227,6 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	//Set Aspeed Display-Port
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
 		ast_dp_set_mode(crtc, vbios_mode_info);
-
-	mutex_unlock(&ast->ioregs_lock);
 }
 
 static void
@@ -1301,7 +1285,6 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
 	.mode_valid = ast_crtc_helper_mode_valid,
 	.atomic_check = ast_crtc_helper_atomic_check,
-	.atomic_begin = ast_crtc_helper_atomic_begin,
 	.atomic_flush = ast_crtc_helper_atomic_flush,
 	.atomic_enable = ast_crtc_helper_atomic_enable,
 	.atomic_disable = ast_crtc_helper_atomic_disable,
@@ -1771,8 +1754,23 @@ static int ast_astdp_output_init(struct ast_private *ast)
  * Mode config
  */
 
+static void ast_mode_config_helper_atomic_commit_tail(struct drm_atomic_state *state)
+{
+	struct ast_private *ast = to_ast_private(state->dev);
+
+	/*
+	 * Concurrent operations could possibly trigger a call to
+	 * drm_connector_helper_funcs.get_modes by trying to read the
+	 * display modes. Protect access to I/O registers by acquiring
+	 * the I/O-register lock. Released in atomic_flush().
+	 */
+	mutex_lock(&ast->ioregs_lock);
+	drm_atomic_helper_commit_tail_rpm(state);
+	mutex_unlock(&ast->ioregs_lock);
+}
+
 static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs = {
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = ast_mode_config_helper_atomic_commit_tail,
 };
 
 static const struct drm_mode_config_funcs ast_mode_config_funcs = {
-- 
2.37.3

