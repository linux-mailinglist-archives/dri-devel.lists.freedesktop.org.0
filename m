Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A28E9BCDAC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 14:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2143E10E035;
	Tue,  5 Nov 2024 13:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZIUxFi8o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="do1UWIzM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZIUxFi8o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="do1UWIzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC4210E035
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 13:20:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A44331FC0A;
 Tue,  5 Nov 2024 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730812849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lNv8gAxaKZbM9ADP3B21nSjTvEUUv2GmvZIOXekUGFU=;
 b=ZIUxFi8oyUWXU9XZ7nBjoFdMNwsinA/zLU7JWoBaVtg/UKmfZYsQkk+SL6PJgdqUA79cHE
 /yw0x69ij8/HT5pHcOFzw3k1apOoCBeZBppEemCVXIzyJ5TcOiUynidA+LAUDSQJHkdnIe
 +8J7cu+W8XkfymFfv+JmF+GckX3cuUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730812849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lNv8gAxaKZbM9ADP3B21nSjTvEUUv2GmvZIOXekUGFU=;
 b=do1UWIzMOrM10Sb91/5SH/CulV8oW6HnKInI2SG/DJYhXMWszqERZgzKLMRLotl9rMtxRf
 h3kU95eJnmxxlcBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730812849; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lNv8gAxaKZbM9ADP3B21nSjTvEUUv2GmvZIOXekUGFU=;
 b=ZIUxFi8oyUWXU9XZ7nBjoFdMNwsinA/zLU7JWoBaVtg/UKmfZYsQkk+SL6PJgdqUA79cHE
 /yw0x69ij8/HT5pHcOFzw3k1apOoCBeZBppEemCVXIzyJ5TcOiUynidA+LAUDSQJHkdnIe
 +8J7cu+W8XkfymFfv+JmF+GckX3cuUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730812849;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lNv8gAxaKZbM9ADP3B21nSjTvEUUv2GmvZIOXekUGFU=;
 b=do1UWIzMOrM10Sb91/5SH/CulV8oW6HnKInI2SG/DJYhXMWszqERZgzKLMRLotl9rMtxRf
 h3kU95eJnmxxlcBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 658D513A42;
 Tue,  5 Nov 2024 13:20:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SObtFrEbKmdDCwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Nov 2024 13:20:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/vmwgfx: Remove initialization of connector status
Date: Tue,  5 Nov 2024 14:20:10 +0100
Message-ID: <20241105132045.471856-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[broadcom.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch]; 
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
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

Remove the connector-status initialization from several of vmwgfx's
functions. It is not required by the driver or DRM helpers.

DRM initializes the connector to unknown status in __drm_connector_init()
and reads the physical status when DRM clients or the user needs the
information, or if it detects/polls a change to the status.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 39949e0a493f..f0b429525467 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -479,7 +479,6 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
 	}
 
 	drm_connector_helper_add(connector, &vmw_ldu_connector_helper_funcs);
-	connector->status = vmw_du_connector_detect(connector, true);
 
 	ret = drm_encoder_init(dev, encoder, &vmw_legacy_encoder_funcs,
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
index 0f4bfd98480a..32029d80b72b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
@@ -868,7 +868,6 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
 	}
 
 	drm_connector_helper_add(connector, &vmw_sou_connector_helper_funcs);
-	connector->status = vmw_du_connector_detect(connector, true);
 
 	ret = drm_encoder_init(dev, encoder, &vmw_screen_object_encoder_funcs,
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 82d18b88f4a7..114a75069e1c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1593,7 +1593,6 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 	}
 
 	drm_connector_helper_add(connector, &vmw_stdu_connector_helper_funcs);
-	connector->status = vmw_du_connector_detect(connector, false);
 
 	ret = drm_encoder_init(dev, encoder, &vmw_stdu_encoder_funcs,
 			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-- 
2.47.0

