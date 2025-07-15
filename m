Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6F5B05748
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 11:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0139B10E57A;
	Tue, 15 Jul 2025 09:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VxFrL7a/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6U9ouOwp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VxFrL7a/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6U9ouOwp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0525610E57A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 09:58:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9CB3321224;
 Tue, 15 Jul 2025 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752573525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bmn+D0QYHSMpmvznWKvzmcttq0te/vi5lmLpXRnOtA=;
 b=VxFrL7a/CbHx9J21o11eRL+HJITgnjwmC/8tIf+d3XTAAbQGjKZOv3vBDlmsJHDOfapr/j
 Y6wkIIBLmwc7p8bjFWJ0+F442WW3XAh4R2e2F5U0szhrhdpV0iCEXHofjfRFCSeUx2uLnV
 B4nOLJpiWci6TTJzjFPFBcRDyjU6j8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752573525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bmn+D0QYHSMpmvznWKvzmcttq0te/vi5lmLpXRnOtA=;
 b=6U9ouOwptP+GLHdgSRAomDfpJSyAF5tf6aOGDpbw4XSKWFNDo+aZSPkE8kXNAb9DAcRZca
 S2mr/w0oNPJX5tBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752573525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bmn+D0QYHSMpmvznWKvzmcttq0te/vi5lmLpXRnOtA=;
 b=VxFrL7a/CbHx9J21o11eRL+HJITgnjwmC/8tIf+d3XTAAbQGjKZOv3vBDlmsJHDOfapr/j
 Y6wkIIBLmwc7p8bjFWJ0+F442WW3XAh4R2e2F5U0szhrhdpV0iCEXHofjfRFCSeUx2uLnV
 B4nOLJpiWci6TTJzjFPFBcRDyjU6j8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752573525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bmn+D0QYHSMpmvznWKvzmcttq0te/vi5lmLpXRnOtA=;
 b=6U9ouOwptP+GLHdgSRAomDfpJSyAF5tf6aOGDpbw4XSKWFNDo+aZSPkE8kXNAb9DAcRZca
 S2mr/w0oNPJX5tBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54F5B13A6C;
 Tue, 15 Jul 2025 09:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2G1bE1UmdmhdcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 09:58:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 1/2] drm/radeon: Do not hold console lock while suspending
 clients
Date: Tue, 15 Jul 2025 11:50:53 +0200
Message-ID: <20250715095536.58757-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715095536.58757-1-tzimmermann@suse.de>
References: <20250715095536.58757-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[9];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email, qualcomm.com:email,
 suse.de:email, suse.de:mid, imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
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

The radeon driver holds the console lock while suspending in-kernel
DRM clients. This creates a circular dependency with the client-list
mutex, which is supposed to be acquired first. Reported when combining
radeon with another DRM driver.

Therefore, do not take the console lock in radeon, but let the fbdev
DRM client acquire the lock when needed. This is what all other DRM
drivers so.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Closes: https://lore.kernel.org/dri-devel/0a087cfd-bd4c-48f1-aa2f-4a3b12593935@oss.qualcomm.com/
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/radeon/radeon_device.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index bbd39348a7ab..6f50cfdfe5a2 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1635,11 +1635,9 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 		pci_set_power_state(pdev, PCI_D3hot);
 	}
 
-	if (notify_clients) {
-		console_lock();
-		drm_client_dev_suspend(dev, true);
-		console_unlock();
-	}
+	if (notify_clients)
+		drm_client_dev_suspend(dev, false);
+
 	return 0;
 }
 
-- 
2.50.0

