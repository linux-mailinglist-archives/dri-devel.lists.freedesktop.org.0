Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD6BC42D5
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 11:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E095A10E1E4;
	Wed,  8 Oct 2025 09:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YTN5PDGo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KxG9KnjA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YTN5PDGo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KxG9KnjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E071C10E7C3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 09:42:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A67BD1F395;
 Wed,  8 Oct 2025 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759916541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Wl/svooCdz0i4ez+EPnV8gGjvQ2i3nZZi5joqOKCaWU=;
 b=YTN5PDGoQB9vrAC50EVIzDIl89lZyEKCA7/ahTSZ3EW/k/nMjyXSZrIELjAR1tL17iLWh+
 Lu5RSaw8U3CtHrb9ofk/lLA+BDJrV5fGaaAQLX0EcUU7pHYaT4VlMxv5kDjRCZ3StC2TMW
 kkTEUB5rBGQCAsM5POOkLAIFMV6EURQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759916541;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Wl/svooCdz0i4ez+EPnV8gGjvQ2i3nZZi5joqOKCaWU=;
 b=KxG9KnjA+ot6mUHQNcN/Hj/Emur8CHqYqMAPC/itueoTzrKPdigCl7ucp9k4pMVtNM38YL
 VvKbCh+VCCctjJAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759916541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Wl/svooCdz0i4ez+EPnV8gGjvQ2i3nZZi5joqOKCaWU=;
 b=YTN5PDGoQB9vrAC50EVIzDIl89lZyEKCA7/ahTSZ3EW/k/nMjyXSZrIELjAR1tL17iLWh+
 Lu5RSaw8U3CtHrb9ofk/lLA+BDJrV5fGaaAQLX0EcUU7pHYaT4VlMxv5kDjRCZ3StC2TMW
 kkTEUB5rBGQCAsM5POOkLAIFMV6EURQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759916541;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Wl/svooCdz0i4ez+EPnV8gGjvQ2i3nZZi5joqOKCaWU=;
 b=KxG9KnjA+ot6mUHQNcN/Hj/Emur8CHqYqMAPC/itueoTzrKPdigCl7ucp9k4pMVtNM38YL
 VvKbCh+VCCctjJAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D47713A3D;
 Wed,  8 Oct 2025 09:42:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3O59Gf0x5mgYBQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Oct 2025 09:42:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/bochs: Use vblank timer
Date: Wed,  8 Oct 2025 11:36:55 +0200
Message-ID: <20251008093931.19138-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Use a vblank timer to simulate the vblank interrupt. The DRM vblank
helpers provide an implementation on top of Linux' hrtimer. Bochs
enables and disables the timer as part of the CRTC. The atomic_flush
callback sets up the event. Like vblank interrupts, the vblank timer
fires at the rate of the display refresh.

Most userspace limits its page flip rate according to the DRM vblank
event. Bochs' virtual hardware does not provide vblank interrupts, so
DRM sends each event ASAP. With the fast access time of virtual display
memory, the event rate is much higher than the display mode's refresh
rate; creating the next page flip almost immediately. This leads to
excessive CPU overhead from even small display updates, such as moving
the mouse pointer.

This problem affects bochs and all other virtual displays. See [1] for
a discussion in the context of hypervdrm.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com/ # [1]
---
 drivers/gpu/drm/tiny/bochs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index d2d5e9f1269f..71e874c19610 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -22,6 +22,8 @@
 #include <drm/drm_panic.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>
 
 #include <video/vga.h>
 
@@ -526,6 +528,7 @@ static void bochs_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 	struct bochs_device *bochs = to_bochs_device(crtc->dev);
 
 	bochs_hw_blank(bochs, false);
+	drm_crtc_vblank_on(crtc);
 }
 
 static void bochs_crtc_helper_atomic_disable(struct drm_crtc *crtc,
@@ -533,12 +536,14 @@ static void bochs_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 {
 	struct bochs_device *bochs = to_bochs_device(crtc->dev);
 
+	drm_crtc_vblank_off(crtc);
 	bochs_hw_blank(bochs, true);
 }
 
 static const struct drm_crtc_helper_funcs bochs_crtc_helper_funcs = {
 	.mode_set_nofb = bochs_crtc_helper_mode_set_nofb,
 	.atomic_check = bochs_crtc_helper_atomic_check,
+	.atomic_flush = drm_crtc_vblank_atomic_flush,
 	.atomic_enable = bochs_crtc_helper_atomic_enable,
 	.atomic_disable = bochs_crtc_helper_atomic_disable,
 };
@@ -550,6 +555,7 @@ static const struct drm_crtc_funcs bochs_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	DRM_CRTC_VBLANK_TIMER_FUNCS,
 };
 
 static const struct drm_encoder_funcs bochs_encoder_funcs = {
@@ -670,6 +676,10 @@ static int bochs_kms_init(struct bochs_device *bochs)
 	drm_connector_attach_edid_property(connector);
 	drm_connector_attach_encoder(connector, encoder);
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.51.0

