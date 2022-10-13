Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B15FD865
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC4A10E848;
	Thu, 13 Oct 2022 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D00410E848
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:29:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9BB041F461;
 Thu, 13 Oct 2022 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665660566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sb1xU33OF72UtwbeaIWUIw4sCo6cl4DBJwvrHmrJgxQ=;
 b=EbmE4jajuoxaNIOIVy8AMF37+r7ApQWQWtvPmUIJE3QlgFSyDTyccHyUdZMD1yvn/fPzSO
 f2eni4EVoKa0/Ko3cOA0hBzAtMEQ8/B16EWBx81YJ58vCT1aejv9S+mlaBzS8RXWZNCiz5
 7NWQAo3kPqDfuIlrhkyAjfIbGEUG0Rk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665660566;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sb1xU33OF72UtwbeaIWUIw4sCo6cl4DBJwvrHmrJgxQ=;
 b=fCuPEWiIIT3pHGAhntTeIYvOQ5YGdUFst4jw0OzmlxwdeSBjzUbLneJl3mk0ye8VfIVhil
 /qeQAKOesowto+Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A34713AFF;
 Thu, 13 Oct 2022 11:29:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GJ18FJb2R2NwYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Oct 2022 11:29:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 javierm@redhat.com, ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH v2 1/8] drm/ast: Acquire I/O-register lock in
 atomic_commit_tail function
Date: Thu, 13 Oct 2022 13:29:16 +0200
Message-Id: <20221013112923.769-2-tzimmermann@suse.de>
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

Hold I/O-register lock in atomic_commit_tail to protect all pipeline
updates at once. Protects modesetting against concurrent EDID reads.

Complex modesetting operations involve mode changes and plane updates.
These steps used to be protected individually against concurrent I/O.
Make all this atomic wrt to reading display modes via EDID. The EDID
code in the connector's get_modes helper already acquires the necessary
lock.

A similar issue was fixed in commit 2d70b9a1482e ("drm/mgag200: Acquire
I/O-register lock in atomic_commit_tail function") for mgag200.

v2:
	* fix typo in commit message (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
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

