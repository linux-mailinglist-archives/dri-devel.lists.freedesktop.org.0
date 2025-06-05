Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99360ACF312
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 17:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB82B10E8B2;
	Thu,  5 Jun 2025 15:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RLEXE/wG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IC+wXith";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RLEXE/wG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IC+wXith";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2524A10E8A8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 14EB833750;
 Thu,  5 Jun 2025 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nO6naUWWgIkz+0okOJRPU8dLIUvsMwaGAwslI8u71Y=;
 b=RLEXE/wGybtfcAANdNb7Qu2uiFYd9ZNGOhw4VxGThbXI6EhWficOMEnV1FA0wOAvi6RsQJ
 rELKx2TIWCrku2qUh4jBXfyhO+TggSwZgDKrD1hwd1xUEy3X3R0jjZw2V1k78wQwo/GMMq
 yNE17ca/deUOoQEiEhXIQQfr9rEJiHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nO6naUWWgIkz+0okOJRPU8dLIUvsMwaGAwslI8u71Y=;
 b=IC+wXithYPlw8sao7+hqpBdqgJlBgJcNCfioDeFK6pUPaEnBJrUALbWC9atcY4RZmFl72m
 1HnlT/qMAINklgAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="RLEXE/wG";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IC+wXith
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nO6naUWWgIkz+0okOJRPU8dLIUvsMwaGAwslI8u71Y=;
 b=RLEXE/wGybtfcAANdNb7Qu2uiFYd9ZNGOhw4VxGThbXI6EhWficOMEnV1FA0wOAvi6RsQJ
 rELKx2TIWCrku2qUh4jBXfyhO+TggSwZgDKrD1hwd1xUEy3X3R0jjZw2V1k78wQwo/GMMq
 yNE17ca/deUOoQEiEhXIQQfr9rEJiHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6nO6naUWWgIkz+0okOJRPU8dLIUvsMwaGAwslI8u71Y=;
 b=IC+wXithYPlw8sao7+hqpBdqgJlBgJcNCfioDeFK6pUPaEnBJrUALbWC9atcY4RZmFl72m
 1HnlT/qMAINklgAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F8FC1373E;
 Thu,  5 Jun 2025 15:30:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eKWPJQq4QWj3XwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jun 2025 15:30:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mhklinux@outlook.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 drawat.floss@gmail.com, javierm@redhat.com, kraxel@redhat.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/6] drm/bochs: Use vblank timer
Date: Thu,  5 Jun 2025 17:24:42 +0200
Message-ID: <20250605152637.98493-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605152637.98493-1-tzimmermann@suse.de>
References: <20250605152637.98493-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[16];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[outlook.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,bootlin.com,suse.com];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RL4xcm599wuy3aaiwfjdd1c6ky)];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 14EB833750
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -1.51
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

Bochs' virtual hardware does not provide vblank interrupts. Use a
vblank timer to simulate the interrupt in software. Rate-limits the
display's update frequency to the display-mode settings. Avoids
excessive CPU overhead with compositors that do not rate-limit their
output.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/bochs.c | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8706763af8fb..dbc6a15c1a58 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -21,6 +21,8 @@
 #include <drm/drm_module.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_timer.h>
 
 #include <video/vga.h>
 
@@ -95,6 +97,7 @@ struct bochs_device {
 
 	/* drm */
 	struct drm_plane primary_plane;
+	struct drm_vblank_timer vtimer;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_connector connector;
@@ -501,12 +504,35 @@ static int bochs_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	return drm_atomic_helper_check_crtc_primary_plane(crtc_state);
 }
 
+static void bochs_crtc_helper_atomic_flush(struct drm_crtc *crtc,
+					   struct drm_atomic_state *state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_pending_vblank_event *event;
+
+	spin_lock_irq(&dev->event_lock);
+
+	event = crtc_state->event;
+	crtc_state->event = NULL;
+
+	if (event) {
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+	}
+
+	spin_unlock_irq(&dev->event_lock);
+}
+
 static void bochs_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 					    struct drm_atomic_state *state)
 {
 	struct bochs_device *bochs = to_bochs_device(crtc->dev);
 
 	bochs_hw_blank(bochs, false);
+	drm_crtc_vblank_on(crtc);
 }
 
 static void bochs_crtc_helper_atomic_disable(struct drm_crtc *crtc,
@@ -514,16 +540,44 @@ static void bochs_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 {
 	struct bochs_device *bochs = to_bochs_device(crtc->dev);
 
+	drm_crtc_vblank_off(crtc);
 	bochs_hw_blank(bochs, true);
 }
 
 static const struct drm_crtc_helper_funcs bochs_crtc_helper_funcs = {
 	.mode_set_nofb = bochs_crtc_helper_mode_set_nofb,
 	.atomic_check = bochs_crtc_helper_atomic_check,
+	.atomic_flush = bochs_crtc_helper_atomic_flush,
 	.atomic_enable = bochs_crtc_helper_atomic_enable,
 	.atomic_disable = bochs_crtc_helper_atomic_disable,
 };
 
+static int bochs_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct bochs_device *bochs = to_bochs_device(crtc->dev);
+
+	drm_vblank_timer_start(&bochs->vtimer);
+
+	return 0;
+}
+
+static void bochs_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct bochs_device *bochs = to_bochs_device(crtc->dev);
+
+	drm_vblank_timer_cancel(&bochs->vtimer);
+}
+
+static bool bochs_crtc_get_vblank_timestamp(struct drm_crtc *crtc,
+					    int *max_error, ktime_t *vblank_time,
+					    bool in_vblank_irq)
+{
+	struct bochs_device *bochs = to_bochs_device(crtc->dev);
+
+	return drm_vblank_timer_get_vblank_timestamp(&bochs->vtimer, max_error,
+						     vblank_time, in_vblank_irq);
+}
+
 static const struct drm_crtc_funcs bochs_crtc_funcs = {
 	.reset = drm_atomic_helper_crtc_reset,
 	.destroy = drm_crtc_cleanup,
@@ -531,6 +585,9 @@ static const struct drm_crtc_funcs bochs_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank = bochs_crtc_enable_vblank,
+	.disable_vblank = bochs_crtc_disable_vblank,
+	.get_vblank_timestamp = bochs_crtc_get_vblank_timestamp,
 };
 
 static const struct drm_encoder_funcs bochs_encoder_funcs = {
@@ -602,6 +659,7 @@ static int bochs_kms_init(struct bochs_device *bochs)
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
+	struct drm_vblank_timer *vtimer;
 	int ret;
 
 	ret = drmm_mode_config_init(dev);
@@ -651,6 +709,16 @@ static int bochs_kms_init(struct bochs_device *bochs)
 	drm_connector_attach_edid_property(connector);
 	drm_connector_attach_encoder(connector, encoder);
 
+	/* Vertical blanking */
+
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ret;
+	vtimer = &bochs->vtimer;
+	ret = drmm_vblank_timer_init(vtimer, crtc, NULL);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.49.0

