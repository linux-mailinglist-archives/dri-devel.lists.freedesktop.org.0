Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9DA942E38
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 14:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FA010E5F3;
	Wed, 31 Jul 2024 12:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zvAjUxKS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g8A0Lbnm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z8dpdXuf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B2CFou3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580D710E5D9;
 Wed, 31 Jul 2024 12:23:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8CA821B3C;
 Wed, 31 Jul 2024 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOTdCVaEnYGtfzTCQMNlTu9oxJH8V7lV/p5wiT3z57w=;
 b=zvAjUxKSvjWVQRVdDndV+jDEFK9TH0jercAEgFfBYcmMUOHslDkCqM8P1b8/j5hDGvZlC0
 epm8++gA1WlB61yhaAMjIZ/mmhgSLQhgFlogjVCGxjPWYlDTBe3Wcwac/LnOse/oYyV3RS
 O/dlzhYahbNap7o05jNlsd+6gSYKBB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428599;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOTdCVaEnYGtfzTCQMNlTu9oxJH8V7lV/p5wiT3z57w=;
 b=g8A0LbnmGMo5w3T0+iwYRWddDEnLLNVVTN29j9+gK1uW9Ul2M4iRUSLfCQV8Pu1/kP8zvj
 A5ABv7HP8OlrDBDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722428597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOTdCVaEnYGtfzTCQMNlTu9oxJH8V7lV/p5wiT3z57w=;
 b=z8dpdXufM+P1Myhaaospgg5kt0lZYMLGVLy9RhEa3DcyitoDCThX/MTGRJew7VerH8LuAz
 b2nLQMfRNeZoVtfpmk0oGxbn+u/YfNTfyP2t0AZc8OkHXlv3sHVBTw011vU7vIFS4o6mx5
 p2PrSZFnpJfytdd7yC33KRkY8Pnqpxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722428597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mOTdCVaEnYGtfzTCQMNlTu9oxJH8V7lV/p5wiT3z57w=;
 b=B2CFou3zXQ0f+EadaDIqls49cBrWInTvbSgYjOp4z312RLBOMxe1OMoeJvWh1SRuPGqZkq
 3xKxkbLrC0D2ulDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8496F13297;
 Wed, 31 Jul 2024 12:23:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6BwnH7UsqmacTQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 12:23:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 2/9] drm/i915: Use backlight power constants
Date: Wed, 31 Jul 2024 14:17:14 +0200
Message-ID: <20240731122311.1143153-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731122311.1143153-1-tzimmermann@suse.de>
References: <20240731122311.1143153-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.40 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email,ursulin.net:email];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: 0.40
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
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
---
 drivers/gpu/drm/i915/display/intel_backlight.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
index 071668bfe5d1..6f678c039ed8 100644
--- a/drivers/gpu/drm/i915/display/intel_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_backlight.c
@@ -455,7 +455,7 @@ void intel_backlight_disable(const struct drm_connector_state *old_conn_state)
 	mutex_lock(&i915->display.backlight.lock);
 
 	if (panel->backlight.device)
-		panel->backlight.device->props.power = FB_BLANK_POWERDOWN;
+		panel->backlight.device->props.power = BACKLIGHT_POWER_OFF;
 	panel->backlight.enabled = false;
 	panel->backlight.funcs->disable(old_conn_state, 0);
 
@@ -773,7 +773,7 @@ static void __intel_backlight_enable(const struct intel_crtc_state *crtc_state,
 	panel->backlight.funcs->enable(crtc_state, conn_state, panel->backlight.level);
 	panel->backlight.enabled = true;
 	if (panel->backlight.device)
-		panel->backlight.device->props.power = FB_BLANK_UNBLANK;
+		panel->backlight.device->props.power = BACKLIGHT_POWER_ON;
 }
 
 void intel_backlight_enable(const struct intel_crtc_state *crtc_state,
@@ -870,12 +870,12 @@ static int intel_backlight_device_update_status(struct backlight_device *bd)
 	 */
 	if (panel->backlight.enabled) {
 		if (panel->backlight.power) {
-			bool enable = bd->props.power == FB_BLANK_UNBLANK &&
+			bool enable = bd->props.power == BACKLIGHT_POWER_ON &&
 				bd->props.brightness != 0;
 			panel->backlight.power(connector, enable);
 		}
 	} else {
-		bd->props.power = FB_BLANK_POWERDOWN;
+		bd->props.power = BACKLIGHT_POWER_OFF;
 	}
 
 	drm_modeset_unlock(&i915->drm.mode_config.connection_mutex);
@@ -945,9 +945,9 @@ int intel_backlight_device_register(struct intel_connector *connector)
 					    props.max_brightness);
 
 	if (panel->backlight.enabled)
-		props.power = FB_BLANK_UNBLANK;
+		props.power = BACKLIGHT_POWER_ON;
 	else
-		props.power = FB_BLANK_POWERDOWN;
+		props.power = BACKLIGHT_POWER_OFF;
 
 	name = kstrdup_const("intel_backlight", GFP_KERNEL);
 	if (!name)
-- 
2.45.2

