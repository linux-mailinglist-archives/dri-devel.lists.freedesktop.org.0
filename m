Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F7B590F9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D919A10E731;
	Tue, 16 Sep 2025 08:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Pu90mqzl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zbonbxeA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Pu90mqzl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zbonbxeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665D110E730
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 08:41:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0C34228CD;
 Tue, 16 Sep 2025 08:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758012070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Hf45k6LfNv+kb1tSqXwsQXQ1mw9M4d2//Vc9IDaFrQ=;
 b=Pu90mqzlmmjogVNE79CyOgdftjHh7QKqX1mVQB89lON7pLa+IV3u276MQKW0JvICcfzyRg
 83OCTcOOOJIFoo3maOUV3skD9jie+vqcNsS7CCZRI7McaFDcaS7Hxa+HHZ3sv54jFzugpx
 I9oro35JfDMUaPBZ2ptXUcYddXvf2aU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758012070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Hf45k6LfNv+kb1tSqXwsQXQ1mw9M4d2//Vc9IDaFrQ=;
 b=zbonbxeAES6NIGfcngbk2NSRWjrIHRjOs+WqVo6NDuDAdGstuRLq3ROn+PpMt3QSiaOTG6
 cZ5zq4TcCD8W7zCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758012070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Hf45k6LfNv+kb1tSqXwsQXQ1mw9M4d2//Vc9IDaFrQ=;
 b=Pu90mqzlmmjogVNE79CyOgdftjHh7QKqX1mVQB89lON7pLa+IV3u276MQKW0JvICcfzyRg
 83OCTcOOOJIFoo3maOUV3skD9jie+vqcNsS7CCZRI7McaFDcaS7Hxa+HHZ3sv54jFzugpx
 I9oro35JfDMUaPBZ2ptXUcYddXvf2aU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758012070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Hf45k6LfNv+kb1tSqXwsQXQ1mw9M4d2//Vc9IDaFrQ=;
 b=zbonbxeAES6NIGfcngbk2NSRWjrIHRjOs+WqVo6NDuDAdGstuRLq3ROn+PpMt3QSiaOTG6
 cZ5zq4TcCD8W7zCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 859CC13A63;
 Tue, 16 Sep 2025 08:41:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6GZuH6YiyWgvJAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 08:41:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: louis.chauvet@bootlin.com, drawat.floss@gmail.com, hamohammed.sa@gmail.com,
 melissa.srw@gmail.com, mhklinux@outlook.com, ptsm@linux.microsoft.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, lyude@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 4/4] drm/hypervdrm: Use vblank timer
Date: Tue, 16 Sep 2025 10:36:22 +0200
Message-ID: <20250916083816.30275-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916083816.30275-1-tzimmermann@suse.de>
References: <20250916083816.30275-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[15]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 FREEMAIL_TO(0.00)[bootlin.com,gmail.com,outlook.com,linux.microsoft.com,ffwll.ch,linux.intel.com,redhat.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLgb6padn6wcu17bxtda1k7h6p)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.30
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

HyperV's virtual hardware does not provide vblank interrupts. Use a
vblank timer to simulate the interrupt. Rate-limits the display's
update frequency to the display-mode settings. Avoids excessive CPU
overhead with compositors that do not rate-limit their output.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 945b9482bcb3..6e6eb1c12a68 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -19,6 +19,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>
 
 #include "hyperv_drm.h"
 
@@ -111,11 +113,15 @@ static void hyperv_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 				crtc_state->mode.hdisplay,
 				crtc_state->mode.vdisplay,
 				plane_state->fb->pitches[0]);
+
+	drm_crtc_vblank_on(crtc);
 }
 
 static const struct drm_crtc_helper_funcs hyperv_crtc_helper_funcs = {
 	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_flush = drm_crtc_vblank_atomic_flush,
 	.atomic_enable = hyperv_crtc_helper_atomic_enable,
+	.atomic_disable = drm_crtc_vblank_atomic_disable,
 };
 
 static const struct drm_crtc_funcs hyperv_crtc_funcs = {
@@ -125,6 +131,7 @@ static const struct drm_crtc_funcs hyperv_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	DRM_CRTC_VBLANK_TIMER_FUNCS,
 };
 
 static int hyperv_plane_atomic_check(struct drm_plane *plane,
@@ -321,6 +328,10 @@ int hyperv_mode_config_init(struct hyperv_drm_device *hv)
 		return ret;
 	}
 
+	ret = drm_vblank_init(dev, 1);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.51.0

