Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430029536F2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 17:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A427210E465;
	Thu, 15 Aug 2024 15:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ec7ZI9lg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wq5zxFeG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ec7ZI9lg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wq5zxFeG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C21A10E456
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 15:20:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E6D922202;
 Thu, 15 Aug 2024 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZsznkOPuRWPHYNiI+saKs3UCgoAWQlNaLgP0IjJWT8=;
 b=Ec7ZI9lgA0+Ynxiw8gIZ9NiIuUDqyxGpdFxGBuHbyen64m4BAO3E2ZKSO88xX9rgZVotWE
 RbqN6FdVdrd4MQZO5Cl4deeHGjzy/kVut6Sr4nPBTzJS4OCi2WtTerJ8IlNop6G8GqTbfr
 IT+fRE+f3LiwnNjEgJT8YRpAdNA865k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZsznkOPuRWPHYNiI+saKs3UCgoAWQlNaLgP0IjJWT8=;
 b=wq5zxFeG4nrVt8LwwO22taN4UUGz/PsUts6mTb09BdGnTZpc6Rq3fhRVnNiP2Ur34Smu5k
 XJ3wZPPuKV5kHgCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZsznkOPuRWPHYNiI+saKs3UCgoAWQlNaLgP0IjJWT8=;
 b=Ec7ZI9lgA0+Ynxiw8gIZ9NiIuUDqyxGpdFxGBuHbyen64m4BAO3E2ZKSO88xX9rgZVotWE
 RbqN6FdVdrd4MQZO5Cl4deeHGjzy/kVut6Sr4nPBTzJS4OCi2WtTerJ8IlNop6G8GqTbfr
 IT+fRE+f3LiwnNjEgJT8YRpAdNA865k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hZsznkOPuRWPHYNiI+saKs3UCgoAWQlNaLgP0IjJWT8=;
 b=wq5zxFeG4nrVt8LwwO22taN4UUGz/PsUts6mTb09BdGnTZpc6Rq3fhRVnNiP2Ur34Smu5k
 XJ3wZPPuKV5kHgCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED2C813B0C;
 Thu, 15 Aug 2024 15:19:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sB29OJ4cvmb6DAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Aug 2024 15:19:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 05/11] drm/ast: astdp: Simplify power management when
 detecting display
Date: Thu, 15 Aug 2024 17:18:47 +0200
Message-ID: <20240815151953.184679-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815151953.184679-1-tzimmermann@suse.de>
References: <20240815151953.184679-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Remove the CRTC handling in the ASTDP detect_ctx helper and enable
power while the detecting the display. Unconditionally wait a few
milliseconds after switching power. Simplifies the code and makes it
more robust.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 45e5c92d19c2..ffbcc397ee6b 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -170,6 +170,8 @@ static void ast_dp_power_on_off(struct drm_device *dev, bool on)
 
 	// DP Power on/off
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_PHY_SLEEP, bE3);
+
+	msleep(50);
 }
 
 static void ast_dp_link_training(struct ast_device *ast)
@@ -367,27 +369,18 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 	struct drm_device *dev = connector->dev;
 	struct ast_device *ast = to_ast_device(connector->dev);
 	enum drm_connector_status status = connector_status_disconnected;
-	struct drm_connector_state *connector_state = connector->state;
-	bool is_active = false;
+	bool power_is_on;
 
 	mutex_lock(&ast->modeset_lock);
 
-	if (connector_state && connector_state->crtc) {
-		struct drm_crtc_state *crtc_state = connector_state->crtc->state;
-
-		if (crtc_state && crtc_state->active)
-			is_active = true;
-	}
-
-	if (!is_active && !ast_dp_power_is_on(ast)) {
+	power_is_on = ast_dp_power_is_on(ast);
+	if (!power_is_on)
 		ast_dp_power_on_off(dev, true);
-		msleep(50);
-	}
 
 	if (ast_astdp_is_connected(ast))
 		status = connector_status_connected;
 
-	if (!is_active && status == connector_status_disconnected)
+	if (!power_is_on && status == connector_status_disconnected)
 		ast_dp_power_on_off(dev, false);
 
 	mutex_unlock(&ast->modeset_lock);
-- 
2.46.0

