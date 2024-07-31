Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C92942E3F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DA810E5F4;
	Wed, 31 Jul 2024 12:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LgwVuBbC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o6WiVRVI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mAzjFuLm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sRK1JjGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DB910E5D9;
 Wed, 31 Jul 2024 12:23:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D7B921B91;
 Wed, 31 Jul 2024 12:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVWaVob/7LNt16AIaHxjwq6RwAFHI6gy9kBArD5iSYk=;
 b=LgwVuBbCgPrHv4XfT4L3lIKWpiN29qcQ9NXRUdezFIaqG0kk+n2+asJ45RVjYv1BBPRxqk
 U5hFSI1tZnKBWSs/NpQDfOosQaialEjMpQ39YqgdOkArd6+v/+nBRmh2AGYSwxZnQLpETF
 Arx0Aozzemlc1T8ntTWxxpRV6Iahnqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428599;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVWaVob/7LNt16AIaHxjwq6RwAFHI6gy9kBArD5iSYk=;
 b=o6WiVRVIRjRjHyhlbq/KD4+Sc/gEm8teOU6vOGhdU2cSbMk86LT0Cve0Jz3K4ZiHh+J56B
 pyYYVcxgpQKtoDAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mAzjFuLm;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sRK1JjGp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVWaVob/7LNt16AIaHxjwq6RwAFHI6gy9kBArD5iSYk=;
 b=mAzjFuLmUgS65EbRv+zJdvegD0aqVHUriiFrl7Rju/+eybYJqZFWJeLm1RGVLrSNnhkBIW
 cPVH92qgBzaiAKRKqtyc4lo2JyGEkPE0lDDiHz1phq9NbedQS5SQlR8vo13WkXQM2eKs5u
 8G8u9+/oKvbSQ1kfJsHmU4+LA5r4K4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVWaVob/7LNt16AIaHxjwq6RwAFHI6gy9kBArD5iSYk=;
 b=sRK1JjGp+N0MJyl7rjrDdcXkfbUjzEOxhvzUPvgtJ9WvfTOncRYKUiskUJmhSlUD//HBDX
 lFwX5+3dtEjl65Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4114B13ADA;
 Wed, 31 Jul 2024 12:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qEqVDrYsqmacTQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:23:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 4/9] drm/panel: panel-orisetech-otm8009a: Use backlight power
 constants
Date: Wed, 31 Jul 2024 14:17:16 +0200
Message-ID: <20240731122311.1143153-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731122311.1143153-1-tzimmermann@suse.de>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.81 / 50.00];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,linaro.org:email,suse.de:email,suse.de:dkim];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_HAS_DN(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[11];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -1.81
X-Rspamd-Queue-Id: 8D7B921B91
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
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 93183f30d7d6..a9b5dad70bc1 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -389,7 +389,7 @@ static int otm8009a_backlight_update_status(struct backlight_device *bd)
 		return -ENXIO;
 	}
 
-	if (bd->props.power <= FB_BLANK_NORMAL) {
+	if (bd->props.power <= BACKLIGHT_POWER_REDUCED) {
 		/* Power on the backlight with the requested brightness
 		 * Note We can not use mipi_dsi_dcs_set_display_brightness()
 		 * as otm8009a driver support only 8-bit brightness (1 param).
@@ -465,7 +465,7 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bl_dev->props.max_brightness = OTM8009A_BACKLIGHT_MAX;
 	ctx->bl_dev->props.brightness = OTM8009A_BACKLIGHT_DEFAULT;
-	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
+	ctx->bl_dev->props.power = BACKLIGHT_POWER_OFF;
 	ctx->bl_dev->props.type = BACKLIGHT_RAW;
 
 	drm_panel_add(&ctx->panel);
-- 
2.45.2

