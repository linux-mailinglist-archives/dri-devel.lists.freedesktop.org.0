Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44585942E41
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAC010E5FC;
	Wed, 31 Jul 2024 12:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fpfeIIIB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6BuHuU18";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JLrDXcAH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oNleu+ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE3910E5E8;
 Wed, 31 Jul 2024 12:23:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE57B21B96;
 Wed, 31 Jul 2024 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkVEm6dSDSS737jUkryYGeIIfba5GV2NR8daJs4+fqQ=;
 b=fpfeIIIBz4wjiP4WLpElW2c1+wygP5tsPOEmVzmJVRfzgOFqDAlmFjzWEw0v/V83gpJ9cd
 LeZZY90rMincMCcA50cFAM2+ap5WQ4XWO2cGfBAN3UDaV88wA84wntpy7YsRB/GVgFFX6M
 Bm1lEQ5V2aVHqEX5/+I6ZCAnMqKaQUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428599;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkVEm6dSDSS737jUkryYGeIIfba5GV2NR8daJs4+fqQ=;
 b=6BuHuU18pY7TZGIUeg43cjnseUMz5GzkjfyHR77fUPuEWx2fQqkrg5Pl5LmvvPCETnucIl
 +0pqlWl3Se2TvNCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JLrDXcAH;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oNleu+ip
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkVEm6dSDSS737jUkryYGeIIfba5GV2NR8daJs4+fqQ=;
 b=JLrDXcAHXTge5jS3m/YW38oVbRek9RXYcOm5fZa7IgI6U8JTKJ596VKZ4JdZOmH/TfVVHX
 CS8e1wiKeYfHozLf47Pn2sFblev+mz5BHgKCTQlocG5jw2t5oTZz6gR4D2M20hBTch4OMT
 N8QhPjG1IKTGqSp3ngZRAkKHLsf3wBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkVEm6dSDSS737jUkryYGeIIfba5GV2NR8daJs4+fqQ=;
 b=oNleu+ip9wVGeDk5xl/IusHeF7N6mPXd/LDIsxiyR1G8VWIOIyCzc8ZNRu0IzYheiC6wfL
 K57G31r+fHjWnBDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 917E713ADB;
 Wed, 31 Jul 2024 12:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6PIbIrYsqmacTQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:23:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 5/9] drm/panel: panel-samsung-s6e63j0x03: Use backlight power
 constants
Date: Wed, 31 Jul 2024 14:17:17 +0200
Message-ID: <20240731122311.1143153-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731122311.1143153-1-tzimmermann@suse.de>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: DE57B21B96
X-Spam-Score: -4.81
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.81 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,quicinc.com:email,linaro.org:email];
 RCVD_TLS_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_HAS_DN(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index 46d6f4a87bf7..ed53787d1dea 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -225,7 +225,7 @@ static int s6e63j0x03_disable(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_REDUCED;
 
 	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
 	if (ret < 0)
@@ -245,7 +245,7 @@ static int s6e63j0x03_unprepare(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
 
 	return 0;
 }
@@ -332,7 +332,7 @@ static int s6e63j0x03_prepare(struct drm_panel *panel)
 	if (ret < 0)
 		goto err;
 
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_REDUCED;
 
 	return 0;
 
@@ -393,7 +393,7 @@ static int s6e63j0x03_enable(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ctx->bl_dev->props.power = FB_BLANK_UNBLANK;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_ON;
 
 	return 0;
 }
@@ -473,7 +473,7 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bl_dev->props.max_brightness = MAX_BRIGHTNESS;
 	ctx->bl_dev->props.brightness = DEFAULT_BRIGHTNESS;
-	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
 
 	drm_panel_add(&ctx->panel);
 
-- 
2.45.2

