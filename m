Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C311942E43
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A2C10E5FD;
	Wed, 31 Jul 2024 12:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="K8YjXVQ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4XhnPci8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K8YjXVQ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4XhnPci8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0381310E5E5;
 Wed, 31 Jul 2024 12:23:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 370E521B98;
 Wed, 31 Jul 2024 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xgV9WVKcqmC0UTttpJnA0rzzGxPQK5W3SqSTqt+mBM=;
 b=K8YjXVQ+lLJPFbFl8ghXvPIvtsS4cZR0YAh7OZGLSY90+QvjEBfw+mSbo021dKH+tniK+t
 Yba0QOwz5GHCDLsjfThjIHppbaFhWtmKJo6wIBAdbd7Dn2+6LoXRhq0gwdISpWQuhgPWPJ
 Rti6INRRO2QiztD2cCNP/m5x+oGcScw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428599;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xgV9WVKcqmC0UTttpJnA0rzzGxPQK5W3SqSTqt+mBM=;
 b=4XhnPci8D2e0+I0Q02MQ8GudBN0sMycU1XDeGY4XBBYaShNBgomBAkJFdHa99ZBlxA4YnC
 Tn96rIQipf2H8IBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xgV9WVKcqmC0UTttpJnA0rzzGxPQK5W3SqSTqt+mBM=;
 b=K8YjXVQ+lLJPFbFl8ghXvPIvtsS4cZR0YAh7OZGLSY90+QvjEBfw+mSbo021dKH+tniK+t
 Yba0QOwz5GHCDLsjfThjIHppbaFhWtmKJo6wIBAdbd7Dn2+6LoXRhq0gwdISpWQuhgPWPJ
 Rti6INRRO2QiztD2cCNP/m5x+oGcScw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428599;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xgV9WVKcqmC0UTttpJnA0rzzGxPQK5W3SqSTqt+mBM=;
 b=4XhnPci8D2e0+I0Q02MQ8GudBN0sMycU1XDeGY4XBBYaShNBgomBAkJFdHa99ZBlxA4YnC
 Tn96rIQipf2H8IBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E13B313ADE;
 Wed, 31 Jul 2024 12:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OAjBNbYsqmacTQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:23:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 6/9] drm/panel: panel-samsung-s6e3ha2: Use backlight power
 constants
Date: Wed, 31 Jul 2024 14:17:18 +0200
Message-ID: <20240731122311.1143153-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731122311.1143153-1-tzimmermann@suse.de>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,linaro.org:email,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60
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

Replace FB_BLANK_ constants with their counterparts from the
backlight subsystem. The values are identical, so there's no
change in functionality or semantics.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
index 639a4fdf57bb..ab8b58545284 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
@@ -458,7 +458,7 @@ static int s6e3ha2_set_brightness(struct backlight_device *bl_dev)
 		return -EINVAL;
 	}
 
-	if (bl_dev->props.power > FB_BLANK_NORMAL)
+	if (bl_dev->props.power > BACKLIGHT_POWER_REDUCED)
 		return -EPERM;
 
 	s6e3ha2_call_write_func(ret, s6e3ha2_test_key_on_f0(ctx));
@@ -508,7 +508,7 @@ static int s6e3ha2_disable(struct drm_panel *panel)
 	s6e3ha2_call_write_func(ret, mipi_dsi_dcs_set_display_off(dsi));
 
 	msleep(40);
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_REDUCED;
 
 	return 0;
 }
@@ -554,7 +554,7 @@ static int s6e3ha2_prepare(struct drm_panel *panel)
 	if (ret < 0)
 		goto err;
 
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_REDUCED;
 
 	return 0;
 
@@ -601,7 +601,7 @@ static int s6e3ha2_enable(struct drm_panel *panel)
 	s6e3ha2_call_write_func(ret, s6e3ha2_test_key_off_f0(ctx));
 
 	s6e3ha2_call_write_func(ret, mipi_dsi_dcs_set_display_on(dsi));
-	ctx->bl_dev->props.power = FB_BLANK_UNBLANK;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_ON;
 
 	return 0;
 }
@@ -729,7 +729,7 @@ static int s6e3ha2_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bl_dev->props.max_brightness = S6E3HA2_MAX_BRIGHTNESS;
 	ctx->bl_dev->props.brightness = S6E3HA2_DEFAULT_BRIGHTNESS;
-	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
 
 	drm_panel_init(&ctx->panel, dev, &s6e3ha2_drm_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
-- 
2.45.2

