Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCC898FE1F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 09:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B9110E004;
	Fri,  4 Oct 2024 07:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VuWOYsPf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mIf5NIsa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VuWOYsPf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mIf5NIsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C5F10E004
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 07:54:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A66B321DC1;
 Fri,  4 Oct 2024 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728028448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=V/ENkmqp3N06BEqVmLrPytv7DPYivEUsdgqGm9z40OE=;
 b=VuWOYsPfQZP8mkA1xr1a9VWUErmh+xwoNKaxq9K5o7VytKTcP5JfzrkzXpbRNuWj5P5emF
 qftteW2BNsAZ0kk5Impsr0bLwakS4oED8rGb17VBHIDzBzwjxC2Ye+Kbkrg0XSRQWBlVW/
 hrxboiKqqH3odiuOPXpZzT6AgdWMAm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728028448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=V/ENkmqp3N06BEqVmLrPytv7DPYivEUsdgqGm9z40OE=;
 b=mIf5NIsayv6i/cxF5UMyhqYv+I1vg8oIhQ2v2cE60XJ8WZAUQD3bRVi0TY6/pglg4LFti6
 ry8T62QvIkpxMMCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VuWOYsPf;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mIf5NIsa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728028448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=V/ENkmqp3N06BEqVmLrPytv7DPYivEUsdgqGm9z40OE=;
 b=VuWOYsPfQZP8mkA1xr1a9VWUErmh+xwoNKaxq9K5o7VytKTcP5JfzrkzXpbRNuWj5P5emF
 qftteW2BNsAZ0kk5Impsr0bLwakS4oED8rGb17VBHIDzBzwjxC2Ye+Kbkrg0XSRQWBlVW/
 hrxboiKqqH3odiuOPXpZzT6AgdWMAm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728028448;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=V/ENkmqp3N06BEqVmLrPytv7DPYivEUsdgqGm9z40OE=;
 b=mIf5NIsayv6i/cxF5UMyhqYv+I1vg8oIhQ2v2cE60XJ8WZAUQD3bRVi0TY6/pglg4LFti6
 ry8T62QvIkpxMMCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A5AE13A6E;
 Fri,  4 Oct 2024 07:54:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9IyjGCCf/2bBawAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Oct 2024 07:54:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Kees Bakker <kees@ijzerbout.nl>
Subject: [PATCH] drm/bochs: Return error from correct pointer
Date: Fri,  4 Oct 2024 09:52:47 +0200
Message-ID: <20241004075404.41743-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A66B321DC1
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 RCVD_TLS_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

In probe, return the error code from the variable bochs, not dev. The
variable dev has not been initialized at this point. In the case of an
allocation error, the returned value would have been undefined.

Reported-by: Kees Bakker <kees@ijzerbout.nl>
Closes: https://lore.kernel.org/dri-devel/8c5bfc12-cbcc-4102-9826-494060df4179@ijzerbout.nl/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 04826f588682 ("drm/bochs: Allocate DRM device in struct bochs_device")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux.dev
---
 drivers/gpu/drm/tiny/bochs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 5d2d34976d4b..3ba7f09f3e7b 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -717,7 +717,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 
 	bochs = devm_drm_dev_alloc(&pdev->dev, &bochs_driver, struct bochs_device, dev);
 	if (IS_ERR(bochs))
-		return PTR_ERR(dev);
+		return PTR_ERR(bochs);
 	dev = &bochs->dev;
 
 	ret = pcim_enable_device(pdev);
-- 
2.46.0

