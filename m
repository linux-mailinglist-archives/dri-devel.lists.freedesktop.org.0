Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD61A76B70
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E43910E443;
	Mon, 31 Mar 2025 15:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="iAjRLWYf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q5VUVJUy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iAjRLWYf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q5VUVJUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E41610E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:59:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 194E91F45B;
 Mon, 31 Mar 2025 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743436741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR+uy/+NXPdAI4DTiji5IqwYWdblFXaZKj/QLehlO0U=;
 b=iAjRLWYfO0YuTr91YRytfqoBsbfTXX+Yak7vGGKyosrDxX4n4D/30g9G+rQkDG+n0WX2vY
 y7/PzlfCdggPr5k0VBi13VMUNsAZUHPIxZa8m5Yn/cbmamKy7X4sKrL4mDTsBbgLQW7HuL
 kxBdu3Mo2QT4R5XD1bO57hDxdPRaAj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743436741;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR+uy/+NXPdAI4DTiji5IqwYWdblFXaZKj/QLehlO0U=;
 b=q5VUVJUyqG0hbOlWBMedc1bjDbQMHNgOdKKdi5TTl7HWfflvt409SzElAXsFMiHmg+w2hZ
 cpnKsVKfwc5DQWBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743436741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR+uy/+NXPdAI4DTiji5IqwYWdblFXaZKj/QLehlO0U=;
 b=iAjRLWYfO0YuTr91YRytfqoBsbfTXX+Yak7vGGKyosrDxX4n4D/30g9G+rQkDG+n0WX2vY
 y7/PzlfCdggPr5k0VBi13VMUNsAZUHPIxZa8m5Yn/cbmamKy7X4sKrL4mDTsBbgLQW7HuL
 kxBdu3Mo2QT4R5XD1bO57hDxdPRaAj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743436741;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR+uy/+NXPdAI4DTiji5IqwYWdblFXaZKj/QLehlO0U=;
 b=q5VUVJUyqG0hbOlWBMedc1bjDbQMHNgOdKKdi5TTl7HWfflvt409SzElAXsFMiHmg+w2hZ
 cpnKsVKfwc5DQWBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D443A13A1F;
 Mon, 31 Mar 2025 15:59:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QNSVMsS76mfdVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Mar 2025 15:59:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 02/18] drm/ofdrm: Open-code drm_simple_encoder_init()
Date: Mon, 31 Mar 2025 17:52:05 +0200
Message-ID: <20250331155538.1173333-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331155538.1173333-1-tzimmermann@suse.de>
References: <20250331155538.1173333-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The helper drm_simple_encoder_init() is a trivial helper around
drm_encoder_init() and therefore deprecated. Open-code the function
and remove the dependency.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/ofdrm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 7469dd2810837..7d5beaf6a42cd 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -21,7 +21,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #define DRIVER_NAME	"ofdrm"
 #define DRIVER_DESC	"DRM driver for OF platform devices"
@@ -999,6 +998,10 @@ static const struct drm_crtc_funcs ofdrm_crtc_funcs = {
 	.atomic_destroy_state = ofdrm_crtc_atomic_destroy_state,
 };
 
+static const struct drm_encoder_funcs ofdrm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int ofdrm_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct ofdrm_device *odev = ofdrm_device_of_dev(connector->dev);
@@ -1309,7 +1312,7 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	/* Encoder */
 
 	encoder = &odev->encoder;
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_NONE);
+	ret = drm_encoder_init(dev, encoder, &ofdrm_encoder_funcs, DRM_MODE_ENCODER_NONE, NULL);
 	if (ret)
 		return ERR_PTR(ret);
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-- 
2.49.0

