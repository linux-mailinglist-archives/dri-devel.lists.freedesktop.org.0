Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47CF94278B
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 09:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE1C10E097;
	Wed, 31 Jul 2024 07:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="HNuwuJNr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uao/HULh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HNuwuJNr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uao/HULh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BFC10E097
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 07:10:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 95DB81F846;
 Wed, 31 Jul 2024 07:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722409808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EwZjZOFPsXWIS7cnMMHGsZiJ76Hpre6jzRZmxryd7wE=;
 b=HNuwuJNr2xBwxG1i93ICb56j1+BGIu8kMeHIYuhvqjpC1hJvm03oO/iW5+zCQeI0UKz56l
 4WAbd0KUax6YW6JouHKOhfD0bItYST+P5ZOuEhXdrtE4eyAdpFxpCQyz4QRd/sMaN4GXvN
 VsWu6MEeJuYNeiOSK0wOA2PiEHWXIxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722409808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EwZjZOFPsXWIS7cnMMHGsZiJ76Hpre6jzRZmxryd7wE=;
 b=uao/HULhPy4zn63TYGkU3g1p0McVXhjXhkyydCM/WcsID2jHOgtmufqscLiLlnznJ94tVM
 Xm2m1J+8hrcPxIDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722409808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EwZjZOFPsXWIS7cnMMHGsZiJ76Hpre6jzRZmxryd7wE=;
 b=HNuwuJNr2xBwxG1i93ICb56j1+BGIu8kMeHIYuhvqjpC1hJvm03oO/iW5+zCQeI0UKz56l
 4WAbd0KUax6YW6JouHKOhfD0bItYST+P5ZOuEhXdrtE4eyAdpFxpCQyz4QRd/sMaN4GXvN
 VsWu6MEeJuYNeiOSK0wOA2PiEHWXIxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722409808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EwZjZOFPsXWIS7cnMMHGsZiJ76Hpre6jzRZmxryd7wE=;
 b=uao/HULhPy4zn63TYGkU3g1p0McVXhjXhkyydCM/WcsID2jHOgtmufqscLiLlnznJ94tVM
 Xm2m1J+8hrcPxIDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4778E13297;
 Wed, 31 Jul 2024 07:10:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lsg4EFDjqWagcgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jul 2024 07:10:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/mgag200: Fix VBLANK interrupt handling
Date: Wed, 31 Jul 2024 09:09:40 +0200
Message-ID: <20240731071004.519566-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.60 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[10];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.60
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

Fix support for VBLANK interrupts on G200ER, G200EV and G200SE, which
use a slightly different implementation than the others. The original
commits forgot to update the custom helpers when adding interrupt
handling for VBLANK events.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 89c6ea2006e2 ("drm/mgag200: Add vblank support")
Fixes: d5070c9b2944 ("drm/mgag200: Implement struct drm_crtc_funcs.get_vblank_timestamp")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/mgag200/mgag200_g200er.c | 5 ++++-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c | 5 ++++-
 drivers/gpu/drm/mgag200/mgag200_g200se.c | 5 ++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 6d727ab1a7aa..e65d59173939 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -209,6 +209,8 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	if (mdev->info->sync_bmc)
 		mgag200_bmc_start_scanout(mdev);
+
+	drm_crtc_vblank_on(crtc);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
@@ -216,7 +218,8 @@ static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
 	.atomic_check = mgag200_crtc_helper_atomic_check,
 	.atomic_flush = mgag200_crtc_helper_atomic_flush,
 	.atomic_enable = mgag200_g200er_crtc_helper_atomic_enable,
-	.atomic_disable = mgag200_crtc_helper_atomic_disable
+	.atomic_disable = mgag200_crtc_helper_atomic_disable,
+	.get_scanout_position = mgag200_crtc_helper_get_scanout_position,
 };
 
 static const struct drm_crtc_funcs mgag200_g200er_crtc_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index e6c9ba61bf97..a4890b496050 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -210,6 +210,8 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	if (mdev->info->sync_bmc)
 		mgag200_bmc_start_scanout(mdev);
+
+	drm_crtc_vblank_on(crtc);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
@@ -217,7 +219,8 @@ static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
 	.atomic_check = mgag200_crtc_helper_atomic_check,
 	.atomic_flush = mgag200_crtc_helper_atomic_flush,
 	.atomic_enable = mgag200_g200ev_crtc_helper_atomic_enable,
-	.atomic_disable = mgag200_crtc_helper_atomic_disable
+	.atomic_disable = mgag200_crtc_helper_atomic_disable,
+	.get_scanout_position = mgag200_crtc_helper_get_scanout_position,
 };
 
 static const struct drm_crtc_funcs mgag200_g200ev_crtc_funcs = {
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 2a53ebf41539..fcb97e4253c4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -341,6 +341,8 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	if (mdev->info->sync_bmc)
 		mgag200_bmc_start_scanout(mdev);
+
+	drm_crtc_vblank_on(crtc);
 }
 
 static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
@@ -348,7 +350,8 @@ static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
 	.atomic_check = mgag200_crtc_helper_atomic_check,
 	.atomic_flush = mgag200_crtc_helper_atomic_flush,
 	.atomic_enable = mgag200_g200se_crtc_helper_atomic_enable,
-	.atomic_disable = mgag200_crtc_helper_atomic_disable
+	.atomic_disable = mgag200_crtc_helper_atomic_disable,
+	.get_scanout_position = mgag200_crtc_helper_get_scanout_position,
 };
 
 static const struct drm_crtc_funcs mgag200_g200se_crtc_funcs = {
-- 
2.45.2

