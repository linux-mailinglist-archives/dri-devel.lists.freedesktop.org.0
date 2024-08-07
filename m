Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442D994A333
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 10:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A52810E463;
	Wed,  7 Aug 2024 08:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="wSuwtphm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d/6UjeS3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wSuwtphm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d/6UjeS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D963810E469;
 Wed,  7 Aug 2024 08:45:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9DED121B89;
 Wed,  7 Aug 2024 08:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723020344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQGOESYpIAcNzB95beTlCL72x1f7tI7sFqhF4LkqDlw=;
 b=wSuwtphmoVXHmshraHUZ9RcoSwQidPVhMi6SYwxFIjvZwfKj0qBUA66RoF706rbHpcMMXf
 LnDrsp5G6CBvrhx/t4YFOQEq92Kd76SxdqMULqOki1gI44/PR8E9i3W/5QkvFvJnOqm8md
 hH27/o2A4tMxilNLTxV1SBcxx+C8w/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723020344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQGOESYpIAcNzB95beTlCL72x1f7tI7sFqhF4LkqDlw=;
 b=d/6UjeS3DHj0e6YSZ0oMF/6RvBcnv46HE8AUnazGSAcmb6wNnqIvisS0XODVPswgCcA5Qe
 1S+QhNbzSLwjR4Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723020344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQGOESYpIAcNzB95beTlCL72x1f7tI7sFqhF4LkqDlw=;
 b=wSuwtphmoVXHmshraHUZ9RcoSwQidPVhMi6SYwxFIjvZwfKj0qBUA66RoF706rbHpcMMXf
 LnDrsp5G6CBvrhx/t4YFOQEq92Kd76SxdqMULqOki1gI44/PR8E9i3W/5QkvFvJnOqm8md
 hH27/o2A4tMxilNLTxV1SBcxx+C8w/8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723020344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQGOESYpIAcNzB95beTlCL72x1f7tI7sFqhF4LkqDlw=;
 b=d/6UjeS3DHj0e6YSZ0oMF/6RvBcnv46HE8AUnazGSAcmb6wNnqIvisS0XODVPswgCcA5Qe
 1S+QhNbzSLwjR4Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F9F713B03;
 Wed,  7 Aug 2024 08:45:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YE3zCTg0s2ZmfQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Aug 2024 08:45:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/8] drm/nouveau: Implement switcheroo reprobe with
 drm_client_dev_hotplug()
Date: Wed,  7 Aug 2024 10:41:37 +0200
Message-ID: <20240807084539.304014-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807084539.304014-1-tzimmermann@suse.de>
References: <20240807084539.304014-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00]; REPLY(-4.00)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[14];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.80
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

Replace the callto drm_fb_helper_output_poll_changed() with a call
to drm_client_dev_hotplug(). It's equivalent in functionality, but
use the DRM client infrastructure.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_vga.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index ee637f1fe03d..ab4e11dc0b8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -58,8 +58,9 @@ static void
 nouveau_switcheroo_reprobe(struct pci_dev *pdev)
 {
 	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	struct drm_device *dev = drm->dev;
 
-	drm_fb_helper_output_poll_changed(drm->dev);
+	drm_client_dev_hotplug(dev);
 }
 
 static bool
-- 
2.46.0

