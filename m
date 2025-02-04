Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5785CA272D6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A4C10E64D;
	Tue,  4 Feb 2025 13:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="P8Pezoy1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zmMmO149";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H1vJUOS1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F1nNBX9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3512C10E32F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 13:32:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF21C21111;
 Tue,  4 Feb 2025 13:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738675935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3zRnawTAZf+7j5LhGzeklVfOHlsg2v3oT06CAXKXVs=;
 b=P8Pezoy1ef+82dB+nXk1NEBIgQvNa+tmrRyqQ6wvuEWF7WGhm/CHomGMWMHnddi6TTpA5z
 Tx2mf7y0/fj10uX8wBFXp1a5UCKjhyl49tnN3JO5S6um/Q7sUBtd4FYFJMLc4MHVGB6INz
 gBsav+z3Xta8h3aN2U/RUjREVIfbKPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738675935;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3zRnawTAZf+7j5LhGzeklVfOHlsg2v3oT06CAXKXVs=;
 b=zmMmO14988vwsIVAG8BqWojvEkysu4COhu/LIB/W3wdvF0tlmlcGcEwDVjjLHwsyyXkxBn
 BiSG9oVPRFVmM+CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738675934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3zRnawTAZf+7j5LhGzeklVfOHlsg2v3oT06CAXKXVs=;
 b=H1vJUOS1R2CzfxXAzZMBgxAUt6RoKO7tl+OFaGxRMB9boSfPPlamNWikcFWeHwvPgMvaYT
 RH58Qnh3HL1YQR7VyJwn2pY15Y57j7k9LUfD1v0Xay5WsNyT28/Ojcv9F+3DJ5zezxswnf
 5bi4X4yNXhDsdIQwHtp9W2qI2InELv4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738675934;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3zRnawTAZf+7j5LhGzeklVfOHlsg2v3oT06CAXKXVs=;
 b=F1nNBX9MLYvHTtgRuHacdg0hCm5jwdqZvzAUlZ7O7LzxGwdFWi2LUaq/stm13E0K6oGIOA
 FsAxRb65hvpmjxAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BEDCB1393E;
 Tue,  4 Feb 2025 13:32:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gOthLd4WomfsVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Feb 2025 13:32:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/4] drm/ast: astdp: Validate display modes
Date: Tue,  4 Feb 2025 14:26:40 +0100
Message-ID: <20250204133209.403327-5-tzimmermann@suse.de>
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

Validate each display mode against the astdp transmitter chips. Filters
out modes that the chip does not support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 056991afde7f..19c04687b0fe 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -300,6 +300,19 @@ static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
+static enum drm_mode_status
+ast_astdp_encoder_helper_mode_valid(struct drm_encoder *encoder,
+				    const struct drm_display_mode *mode)
+{
+	int res;
+
+	res = ast_astdp_get_mode_index(mode->hdisplay, mode->vdisplay);
+	if (res < 0)
+		return MODE_NOMODE;
+
+	return MODE_OK;
+}
+
 static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder,
 						     struct drm_crtc_state *crtc_state,
 						     struct drm_connector_state *conn_state)
@@ -389,6 +402,7 @@ static int ast_astdp_encoder_helper_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
+	.mode_valid = ast_astdp_encoder_helper_mode_valid,
 	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
 	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
 	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
-- 
2.48.1

