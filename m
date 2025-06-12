Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09239AD700F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D28610E821;
	Thu, 12 Jun 2025 12:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="bh2bFZDj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0lEpqsbz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bh2bFZDj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0lEpqsbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7D310E817
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:20:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 74A1D1F7EC;
 Thu, 12 Jun 2025 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azdlD+4D347y6sRbHa3GPnVFXPFtLD3ZL1sWt+3AgQc=;
 b=bh2bFZDj0gQA6KAEcqBzD6yCgNcVsCZFoe2mGhAKXjaKF7BxmUvmZ8V82UUMNH8SrZ75jH
 VEsH3hb0m6O8rt48PqDmiz6Oh6z4hkhvQeE9F2yfw5lf0LGOhg1rWRHSNASW3atnz/Krjn
 fuPnnD7R9eU86Yp4uANHthfABlmo+fE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azdlD+4D347y6sRbHa3GPnVFXPFtLD3ZL1sWt+3AgQc=;
 b=0lEpqsbzKVgcc8Ro+A42MVG+96UjasdBaRRfA88RtF0oCosC6bkcsxeOUceT4Fxn+eCBXN
 7b0mCXDtnPL173CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749730821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azdlD+4D347y6sRbHa3GPnVFXPFtLD3ZL1sWt+3AgQc=;
 b=bh2bFZDj0gQA6KAEcqBzD6yCgNcVsCZFoe2mGhAKXjaKF7BxmUvmZ8V82UUMNH8SrZ75jH
 VEsH3hb0m6O8rt48PqDmiz6Oh6z4hkhvQeE9F2yfw5lf0LGOhg1rWRHSNASW3atnz/Krjn
 fuPnnD7R9eU86Yp4uANHthfABlmo+fE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749730821;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=azdlD+4D347y6sRbHa3GPnVFXPFtLD3ZL1sWt+3AgQc=;
 b=0lEpqsbzKVgcc8Ro+A42MVG+96UjasdBaRRfA88RtF0oCosC6bkcsxeOUceT4Fxn+eCBXN
 7b0mCXDtnPL173CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 298FC132D8;
 Thu, 12 Jun 2025 12:20:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yCbMCAXGSmhBdAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 12:20:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona.vetter@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/9] drm/panel: Include <linux/export.h>
Date: Thu, 12 Jun 2025 14:10:01 +0200
Message-ID: <20250612121633.229222-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612121633.229222-1-tzimmermann@suse.de>
References: <20250612121633.229222-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.997];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 R_RATELIMIT(0.00)[to_ip_from(RLyg698ibz7joe4egepamx3qut)];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[6];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
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

Fix the compile-time warnings

  drivers/gpu/drm/drm_panel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_panel_backlight_quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/drm_panel_orientation_quirks.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_panel.c                    | 1 +
 drivers/gpu/drm/drm_panel_backlight_quirks.c   | 1 +
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 805b4151ccef..c8bb28dccdc1 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -23,6 +23,7 @@
 
 #include <linux/backlight.h>
 #include <linux/err.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/of.h>
 
diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index c477d98ade2b..598f812b7cb3 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -2,6 +2,7 @@
 
 #include <linux/array_size.h>
 #include <linux/dmi.h>
+#include <linux/export.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 7ac0fd5391fe..3a218fb592ce 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/dmi.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_utils.h>
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
index 6917ffda5b2b..ea241c89593b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
@@ -13,6 +13,7 @@
 
 #include <linux/backlight.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/property.h>
-- 
2.49.0

