Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4244947B87
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 15:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3305410E1DE;
	Mon,  5 Aug 2024 13:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bONQQjw1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="czdboDwe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bONQQjw1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="czdboDwe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513DF10E1DE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 13:06:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DAED81F841;
 Mon,  5 Aug 2024 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722863184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tIk+hX83xATzPe7ArZFmuwRdONiGxnnZVEFtR1z/PQ=;
 b=bONQQjw1lT0dft7MfkOJXGWNwk/CwuTi5tpJLBxKvp67zfjZy4oN9JIZCBt0j09IKww737
 gKZIASICr1UMFsk7Jg/OF2gZIWgLIVReldj7HCXyCAv4hZ5aZOQw+c23sTCVB96Ndsce0z
 fQGG6apkb+wcuWwRBpiKCYej1c+DXH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722863184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tIk+hX83xATzPe7ArZFmuwRdONiGxnnZVEFtR1z/PQ=;
 b=czdboDwejeFSSy0yDtF8ysqA7UB14eH9IcAzpGBlrUVj8KmgMvIRU9N2hL2OAXbQEJIAKH
 OHsu2UTOTHF7+zDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722863184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tIk+hX83xATzPe7ArZFmuwRdONiGxnnZVEFtR1z/PQ=;
 b=bONQQjw1lT0dft7MfkOJXGWNwk/CwuTi5tpJLBxKvp67zfjZy4oN9JIZCBt0j09IKww737
 gKZIASICr1UMFsk7Jg/OF2gZIWgLIVReldj7HCXyCAv4hZ5aZOQw+c23sTCVB96Ndsce0z
 fQGG6apkb+wcuWwRBpiKCYej1c+DXH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722863184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tIk+hX83xATzPe7ArZFmuwRdONiGxnnZVEFtR1z/PQ=;
 b=czdboDwejeFSSy0yDtF8ysqA7UB14eH9IcAzpGBlrUVj8KmgMvIRU9N2hL2OAXbQEJIAKH
 OHsu2UTOTHF7+zDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3A6413AEB;
 Mon,  5 Aug 2024 13:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qDGbJlDOsGaiMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Aug 2024 13:06:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm/mgag200: vga-bmc: Control CRTC VIDRST flag from
 encoder
Date: Mon,  5 Aug 2024 15:05:59 +0200
Message-ID: <20240805130622.63458-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240805130622.63458-1-tzimmermann@suse.de>
References: <20240805130622.63458-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Control the VIDRST pin from the VGA-BMC encoder's atomic_check and
remove the respective code from CRTC. Makes the VIDRST functionality
fully composable.

The VIDRST pin allows an external clock source to control the SYNC
signals of the Matrox chip. The functionality is part of the CRTC,
but depends on the presence of the clock source. This is the case for
some BMCs, so control the pin from the VGA-BMC output.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c    |  3 ---
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index dd125ef15559..8dc16821e1cd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -611,7 +611,6 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
 	struct mga_device *mdev = to_mga_device(dev);
 	const struct mgag200_device_funcs *funcs = mdev->funcs;
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
-	struct mgag200_crtc_state *new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
 	struct drm_property_blob *new_gamma_lut = new_crtc_state->gamma_lut;
 	int ret;
 
@@ -622,8 +621,6 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
 	if (ret)
 		return ret;
 
-	new_mgag200_crtc_state->set_vidrst = mdev->info->sync_bmc;
-
 	if (new_crtc_state->mode_changed) {
 		if (funcs->pixpllc_atomic_check) {
 			ret = funcs->pixpllc_atomic_check(crtc, new_state);
diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
index 3a958c3587ac..77340f2dee17 100644
--- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
@@ -8,6 +8,22 @@
 #include "mgag200_ddc.h"
 #include "mgag200_drv.h"
 
+static int mgag200_vga_bmc_encoder_atomic_check(struct drm_encoder *encoder,
+						struct drm_crtc_state *new_crtc_state,
+						struct drm_connector_state *new_connector_state)
+{
+	struct mga_device *mdev = to_mga_device(encoder->dev);
+	struct mgag200_crtc_state *new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
+
+	new_mgag200_crtc_state->set_vidrst = mdev->info->sync_bmc;
+
+	return 0;
+}
+
+static const struct drm_encoder_helper_funcs mgag200_dac_encoder_helper_funcs = {
+	.atomic_check = mgag200_vga_bmc_encoder_atomic_check,
+};
+
 static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
 	.destroy = drm_encoder_cleanup
 };
@@ -86,6 +102,8 @@ int mgag200_vga_bmc_output_init(struct mga_device *mdev)
 		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
 		return ret;
 	}
+	drm_encoder_helper_add(encoder, &mgag200_dac_encoder_helper_funcs);
+
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ddc = mgag200_ddc_create(mdev);
-- 
2.46.0

