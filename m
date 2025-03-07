Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E471BA562B6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 09:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E6910EB05;
	Fri,  7 Mar 2025 08:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZSlVS/8L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="78jQdHvM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZSlVS/8L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="78jQdHvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA86F10EB05
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 08:40:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9BFCA2118B;
 Fri,  7 Mar 2025 08:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741336835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ot0504hqeH0irLnd9IPBaWFDa+NfLouZuEN8rsjtTKo=;
 b=ZSlVS/8Lsdop4/EOrv/RVjb4yTGUElblx7c6upi3NksELFltFq2msus9slMBytBYtPKxtH
 pipteJDcfq61HMSrONsPnPpr5HHqI9xoXHa6gDP1VRmPf4TXm2OU0HIArACc+4PHU7/7dk
 boim+dRh9qtQOj1p53lxsXSo+jaxkRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741336835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ot0504hqeH0irLnd9IPBaWFDa+NfLouZuEN8rsjtTKo=;
 b=78jQdHvMVh+F5bDaysQlI2+N5JuS947IKE3Vxpr+uX1YgHg06idRmD7ibbr6RVxvLU8ax+
 9HgzGXqCc+cU5wDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741336835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ot0504hqeH0irLnd9IPBaWFDa+NfLouZuEN8rsjtTKo=;
 b=ZSlVS/8Lsdop4/EOrv/RVjb4yTGUElblx7c6upi3NksELFltFq2msus9slMBytBYtPKxtH
 pipteJDcfq61HMSrONsPnPpr5HHqI9xoXHa6gDP1VRmPf4TXm2OU0HIArACc+4PHU7/7dk
 boim+dRh9qtQOj1p53lxsXSo+jaxkRI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741336835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ot0504hqeH0irLnd9IPBaWFDa+NfLouZuEN8rsjtTKo=;
 b=78jQdHvMVh+F5bDaysQlI2+N5JuS947IKE3Vxpr+uX1YgHg06idRmD7ibbr6RVxvLU8ax+
 9HgzGXqCc+cU5wDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7636913939;
 Fri,  7 Mar 2025 08:40:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BaaIGwOxymcPOAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Mar 2025 08:40:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: admin@kodeit.net,
	gargaditya08@live.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/appletbdrm: Fix ref-counting on dmadev
Date: Fri,  7 Mar 2025 09:36:53 +0100
Message-ID: <20250307083702.142675-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[kodeit.net,live.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_THREE(0.00)[4];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[live.com]
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

Remove the put_device() call on dmadev. The driver sets the field
without getting a reference, so it shouldn't put a reference either.
The dmadev field points to the regular USB device for which DRM
maintains a reference internally. Hence dmadev will not become dangling
during the DRM device's lifetime.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 Macs")
Cc: Aditya Garg <gargaditya08@live.com>
Cc: Aun-Ali Zaidi <admin@kodeit.net>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/tiny/appletbdrm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
index 394c8f9bd41a..4370ba22dd88 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -805,7 +805,6 @@ static void appletbdrm_disconnect(struct usb_interface *intf)
 	struct appletbdrm_device *adev = usb_get_intfdata(intf);
 	struct drm_device *drm = &adev->drm;
 
-	put_device(adev->dmadev);
 	drm_dev_unplug(drm);
 	drm_atomic_helper_shutdown(drm);
 }
-- 
2.48.1

