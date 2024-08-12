Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26F294E8A4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F304210E15E;
	Mon, 12 Aug 2024 08:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LnLq8Cpe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D3Sr95y7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LnLq8Cpe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D3Sr95y7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B0510E08A;
 Mon, 12 Aug 2024 08:30:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C302920240;
 Mon, 12 Aug 2024 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t87THOtseNvsM7YLJKHqHZ2Csmi8+la9wFqDAbvhcl0=;
 b=LnLq8CpepIe4+XRLOIF8k7sur2CJ3Rv2pK0xpmVatsmYkEa9JLkDkxb7gKa0HvlNLfHR7O
 nV0m+K/Wd/PU5WKTW7qikx0LKG7x9VwZjtbImrj3vE3GWj2YJ6SRimFnJmfkSGfbInnp5g
 YIbDgzgffM2tC6t2sOZk8tpBSM/Oytc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t87THOtseNvsM7YLJKHqHZ2Csmi8+la9wFqDAbvhcl0=;
 b=D3Sr95y7QPNDVYBkRlczhb7WAHuS+8thNECVTk2zkSkW/x55iSLbtPrVErNL3WSqzaEQHV
 eZ30+cWlDszixpCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t87THOtseNvsM7YLJKHqHZ2Csmi8+la9wFqDAbvhcl0=;
 b=LnLq8CpepIe4+XRLOIF8k7sur2CJ3Rv2pK0xpmVatsmYkEa9JLkDkxb7gKa0HvlNLfHR7O
 nV0m+K/Wd/PU5WKTW7qikx0LKG7x9VwZjtbImrj3vE3GWj2YJ6SRimFnJmfkSGfbInnp5g
 YIbDgzgffM2tC6t2sOZk8tpBSM/Oytc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t87THOtseNvsM7YLJKHqHZ2Csmi8+la9wFqDAbvhcl0=;
 b=D3Sr95y7QPNDVYBkRlczhb7WAHuS+8thNECVTk2zkSkW/x55iSLbtPrVErNL3WSqzaEQHV
 eZ30+cWlDszixpCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F13213A3D;
 Mon, 12 Aug 2024 08:30:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +MTxGQ7IuWZpHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 08:30:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/9] drm/nouveau: Do not set struct drm_driver.lastclose
Date: Mon, 12 Aug 2024 10:28:24 +0200
Message-ID: <20240812083000.337744-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812083000.337744-1-tzimmermann@suse.de>
References: <20240812083000.337744-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[14];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: 0.20
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

Remove the implementation of struct drm_driver.lastclose. The hook
was only necessary before in-kernel DRM clients existed, but is now
obsolete. The code in nouveau_vga_lastclose() is performed by
drm_lastclose().

v2:
- update commit description

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
 drivers/gpu/drm/nouveau/nouveau_vga.c | 7 -------
 drivers/gpu/drm/nouveau/nouveau_vga.h | 1 -
 3 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ac7c60fb14d3..4a9a9b9c3935 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1303,7 +1303,6 @@ driver_stub = {
 			   DRIVER_RENDER,
 	.open = nouveau_drm_open,
 	.postclose = nouveau_drm_postclose,
-	.lastclose = nouveau_vga_lastclose,
 
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = nouveau_drm_debugfs_init,
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 2525e08938b3..ee637f1fe03d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -127,10 +127,3 @@ nouveau_vga_fini(struct nouveau_drm *drm)
 	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
 		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
 }
-
-
-void
-nouveau_vga_lastclose(struct drm_device *dev)
-{
-	vga_switcheroo_process_delayed_switch();
-}
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.h b/drivers/gpu/drm/nouveau/nouveau_vga.h
index 951a83f984dd..63be415d2a44 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.h
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.h
@@ -4,6 +4,5 @@
 
 void nouveau_vga_init(struct nouveau_drm *);
 void nouveau_vga_fini(struct nouveau_drm *);
-void nouveau_vga_lastclose(struct drm_device *dev);
 
 #endif
-- 
2.46.0

