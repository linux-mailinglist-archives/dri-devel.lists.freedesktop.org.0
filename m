Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889AF8C4127
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 14:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265D210E75A;
	Mon, 13 May 2024 12:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uldQcrGV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1rYacHQ/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uldQcrGV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1rYacHQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37B910E131
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 12:56:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 699BC5BED1;
 Mon, 13 May 2024 12:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715604990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyT3KlIGKMeIylUlj0rKzXt4QbD0pcQH6nUkg7PvOVc=;
 b=uldQcrGV95AMpga7eYdYMVnI1w5TJwGZ2U3Yi/Bpgk+uBQzz0X6KHUdp4AlejpriinNEBI
 uVTudT65WifkR05LUflU9sh3akFMZ9zL68FR2Afw4WeoqCikxvIlvMvNspHaky7skAYqzc
 HpxL1q9P22N47VSJBRUAg22TAHWags0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715604990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyT3KlIGKMeIylUlj0rKzXt4QbD0pcQH6nUkg7PvOVc=;
 b=1rYacHQ/92Om0+okIFzulSTwTYdvXzT/sEOU4NVYxawXNkgxqmlAt8WKFeJ42jBuGgaHzq
 AmL5dZf/3avCxjCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715604990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyT3KlIGKMeIylUlj0rKzXt4QbD0pcQH6nUkg7PvOVc=;
 b=uldQcrGV95AMpga7eYdYMVnI1w5TJwGZ2U3Yi/Bpgk+uBQzz0X6KHUdp4AlejpriinNEBI
 uVTudT65WifkR05LUflU9sh3akFMZ9zL68FR2Afw4WeoqCikxvIlvMvNspHaky7skAYqzc
 HpxL1q9P22N47VSJBRUAg22TAHWags0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715604990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YyT3KlIGKMeIylUlj0rKzXt4QbD0pcQH6nUkg7PvOVc=;
 b=1rYacHQ/92Om0+okIFzulSTwTYdvXzT/sEOU4NVYxawXNkgxqmlAt8WKFeJ42jBuGgaHzq
 AmL5dZf/3avCxjCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 345EA13A52;
 Mon, 13 May 2024 12:56:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GCGdC/4NQmZpfwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 13 May 2024 12:56:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/10] drm/mgag200: Use drm_connector_helper_get_modes()
Date: Mon, 13 May 2024 14:51:15 +0200
Message-ID: <20240513125620.6337-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513125620.6337-1-tzimmermann@suse.de>
References: <20240513125620.6337-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLhthb38qh1ntkuzcrgoc19dwi)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

Mgag200's .get_modes() function is identical to the common helper.
Use the latter.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  4 +---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 17 -----------------
 2 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 008fdd5af09c8..20e3710e056b3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -420,10 +420,8 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 #define MGAG200_DAC_ENCODER_FUNCS \
 	.destroy = drm_encoder_cleanup
 
-int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector);
-
 #define MGAG200_VGA_CONNECTOR_HELPER_FUNCS \
-	.get_modes  = mgag200_vga_connector_helper_get_modes
+	.get_modes = drm_connector_helper_get_modes
 
 #define MGAG200_VGA_CONNECTOR_FUNCS \
 	.reset                  = drm_atomic_helper_connector_reset, \
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index a04c2b550be02..d566e8476bf81 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -737,23 +737,6 @@ void mgag200_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_st
 	kfree(mgag200_crtc_state);
 }
 
-/*
- * Connector
- */
-
-int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
-{
-	const struct drm_edid *drm_edid;
-	int count;
-
-	drm_edid = drm_edid_read(connector);
-	drm_edid_connector_update(connector, drm_edid);
-	count = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
-
-	return count;
-}
-
 /*
  * Mode config
  */
-- 
2.45.0

