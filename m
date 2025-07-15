Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F223B0574A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 11:58:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3969A10E57F;
	Tue, 15 Jul 2025 09:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EBUXtGTo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S16+nOSk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EBUXtGTo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S16+nOSk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635EF10E57D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 09:58:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D7F0E1F7A6;
 Tue, 15 Jul 2025 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752573525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1RJPbWiiNlgt+G2SzCUKLq5AhZ8w5qbUt9T24+Iw1M=;
 b=EBUXtGTotIjl7Pk6Iw7jaF7k53d04wvI/oSMgRYS4NYVDXmgXjIHGwOmEFjBNqjF9VIjKE
 PuP1VH7WzbGM7OK0lnI4OuQ5aMJkISX0wgjvudkkMx3Pki6C6aPeJVD3PZ/Li5sFoZrzv2
 iFJVM5x0O7NAU539WswYKO6IY8UjKQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752573525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1RJPbWiiNlgt+G2SzCUKLq5AhZ8w5qbUt9T24+Iw1M=;
 b=S16+nOSkVIORAt8/5t9Sul05hs5+FVtZVFXjSZbWY9MQ9r+jEqzvni6u57g7HMLswt0UyJ
 S6QOaKX5IeghfXAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752573525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1RJPbWiiNlgt+G2SzCUKLq5AhZ8w5qbUt9T24+Iw1M=;
 b=EBUXtGTotIjl7Pk6Iw7jaF7k53d04wvI/oSMgRYS4NYVDXmgXjIHGwOmEFjBNqjF9VIjKE
 PuP1VH7WzbGM7OK0lnI4OuQ5aMJkISX0wgjvudkkMx3Pki6C6aPeJVD3PZ/Li5sFoZrzv2
 iFJVM5x0O7NAU539WswYKO6IY8UjKQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752573525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1RJPbWiiNlgt+G2SzCUKLq5AhZ8w5qbUt9T24+Iw1M=;
 b=S16+nOSkVIORAt8/5t9Sul05hs5+FVtZVFXjSZbWY9MQ9r+jEqzvni6u57g7HMLswt0UyJ
 S6QOaKX5IeghfXAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0B1813A68;
 Tue, 15 Jul 2025 09:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GHzXJVUmdmhdcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 09:58:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/radeon: Do not hold console lock during resume
Date: Tue, 15 Jul 2025 11:50:54 +0200
Message-ID: <20250715095536.58757-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715095536.58757-1-tzimmermann@suse.de>
References: <20250715095536.58757-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
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

The function radeon_resume_kms() acquires the console lock. It is
inconsistent, as it depends on the notify_client argument. That
lock then covers a number of suspend operations that are unrelated
to the console.

Remove the calls to console_lock() and console_unlock() from the
radeon function. The console lock is only required by DRM's fbdev
emulation, which acquires it as necessary.

Also fixes a possible circular dependency between the console lock
and the client-list mutex, where the mutex is supposed to be taken
first.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_device.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 6f50cfdfe5a2..7a3e510327b7 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -26,7 +26,6 @@
  *          Jerome Glisse
  */
 
-#include <linux/console.h>
 #include <linux/efi.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
@@ -1659,17 +1658,11 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool notify_clients)
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 		return 0;
 
-	if (notify_clients) {
-		console_lock();
-	}
 	if (resume) {
 		pci_set_power_state(pdev, PCI_D0);
 		pci_restore_state(pdev);
-		if (pci_enable_device(pdev)) {
-			if (notify_clients)
-				console_unlock();
+		if (pci_enable_device(pdev))
 			return -1;
-		}
 	}
 	/* resume AGP if in use */
 	radeon_agp_resume(rdev);
@@ -1745,10 +1738,8 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool notify_clients)
 	if ((rdev->pm.pm_method == PM_METHOD_DPM) && rdev->pm.dpm_enabled)
 		radeon_pm_compute_clocks(rdev);
 
-	if (notify_clients) {
-		drm_client_dev_resume(dev, true);
-		console_unlock();
-	}
+	if (notify_clients)
+		drm_client_dev_resume(dev, false);
 
 	return 0;
 }
-- 
2.50.0

