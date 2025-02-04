Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21788A272D5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7AC10E647;
	Tue,  4 Feb 2025 13:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ykVEvxJx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L6vJH/DT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ykVEvxJx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L6vJH/DT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCCF10E33D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 13:32:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A1C621101;
 Tue,  4 Feb 2025 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738675934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRvbGDyOv23ynl8nZNiSkJNTuL/AYl/d/vYdF2QpfkM=;
 b=ykVEvxJxcxdNDoi2qI0oX7WTQjXT6KrFbgEHgn6hRPWFaiXvBx0+rw5Ik4bPZOZ7yc1Hou
 waSA3Jd4iqd+REAWmkkrtCpTuCNTTb8AAHB/E2a8MHKmNL06v1HBL261J1lvnYFRNL1U+e
 cV9WcvlEKd1SDqFd7+pFgwJ48CbuWTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738675934;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRvbGDyOv23ynl8nZNiSkJNTuL/AYl/d/vYdF2QpfkM=;
 b=L6vJH/DTUDx+MJDVMvcCXuW1gamT2/JpyVVMQOBdTC40y8ik93adhjbrnBiNZ66Jy4ovpu
 3K40yAymVoyQOdDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738675934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRvbGDyOv23ynl8nZNiSkJNTuL/AYl/d/vYdF2QpfkM=;
 b=ykVEvxJxcxdNDoi2qI0oX7WTQjXT6KrFbgEHgn6hRPWFaiXvBx0+rw5Ik4bPZOZ7yc1Hou
 waSA3Jd4iqd+REAWmkkrtCpTuCNTTb8AAHB/E2a8MHKmNL06v1HBL261J1lvnYFRNL1U+e
 cV9WcvlEKd1SDqFd7+pFgwJ48CbuWTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738675934;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PRvbGDyOv23ynl8nZNiSkJNTuL/AYl/d/vYdF2QpfkM=;
 b=L6vJH/DTUDx+MJDVMvcCXuW1gamT2/JpyVVMQOBdTC40y8ik93adhjbrnBiNZ66Jy4ovpu
 3K40yAymVoyQOdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A1FD13A21;
 Tue,  4 Feb 2025 13:32:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8P/pDN4WomfsVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Feb 2025 13:32:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/4] drm/ast: astdp: Add connector state
Date: Tue,  4 Feb 2025 14:26:37 +0100
Message-ID: <20250204133209.403327-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204133209.403327-1-tzimmermann@suse.de>
References: <20250204133209.403327-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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

Add dedicated connector state for ASTDP connectors. The state will
store values for programming the transmitter chip.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 62 ++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index db3eb9ce1498..9c49b507a0d2 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -42,6 +42,16 @@ static const struct ast_astdp_mode_index_table_entry ast_astdp_mode_index_table[
 	{ 0 }
 };
 
+struct ast_astdp_connector_state {
+	struct drm_connector_state base;
+};
+
+static struct ast_astdp_connector_state *
+to_ast_astdp_connector_state(const struct drm_connector_state *state)
+{
+	return container_of(state, struct ast_astdp_connector_state, base);
+}
+
 static int __ast_astdp_get_mode_index(unsigned int hdisplay, unsigned int vdisplay)
 {
 	const struct ast_astdp_mode_index_table_entry *entry = ast_astdp_mode_index_table;
@@ -442,18 +452,58 @@ static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs
 	.detect_ctx = ast_astdp_connector_helper_detect_ctx,
 };
 
-/*
- * Output
- */
+static void ast_astdp_connector_reset(struct drm_connector *connector)
+{
+	struct ast_astdp_connector_state *astdp_state =
+		kzalloc(sizeof(*astdp_state), GFP_KERNEL);
+
+	if (connector->state)
+		connector->funcs->atomic_destroy_state(connector, connector->state);
+
+	if (astdp_state)
+		__drm_atomic_helper_connector_reset(connector, &astdp_state->base);
+	else
+		__drm_atomic_helper_connector_reset(connector, NULL);
+}
+
+static struct drm_connector_state *
+ast_astdp_connector_atomic_duplicate_state(struct drm_connector *connector)
+{
+	struct ast_astdp_connector_state *new_astdp_state;
+	struct drm_device *dev = connector->dev;
+
+	if (drm_WARN_ON(dev, !connector->state))
+		return NULL;
+
+	new_astdp_state = kmalloc(sizeof(*new_astdp_state), GFP_KERNEL);
+	if (!new_astdp_state)
+		return NULL;
+	__drm_atomic_helper_connector_duplicate_state(connector, &new_astdp_state->base);
+
+	return &new_astdp_state->base;
+}
+
+static void ast_astdp_connector_atomic_destroy_state(struct drm_connector *connector,
+						     struct drm_connector_state *state)
+{
+	struct ast_astdp_connector_state *astdp_state = to_ast_astdp_connector_state(state);
+
+	__drm_atomic_helper_connector_destroy_state(&astdp_state->base);
+	kfree(astdp_state);
+}
 
 static const struct drm_connector_funcs ast_astdp_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = ast_astdp_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state = ast_astdp_connector_atomic_duplicate_state,
+	.atomic_destroy_state = ast_astdp_connector_atomic_destroy_state,
 };
 
+/*
+ * Output
+ */
+
 int ast_astdp_output_init(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
-- 
2.48.1

