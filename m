Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BE984CBF8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 14:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F48113268;
	Wed,  7 Feb 2024 13:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AZJlFZUD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J2e20baY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AZJlFZUD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J2e20baY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24310E7C3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 13:49:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 317631FBF8;
 Wed,  7 Feb 2024 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707313777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nIJiLe5quPC+6Ikbcjh207Bt00KbJX4HrhaGRAuxM4=;
 b=AZJlFZUDq3j39jNobePEvEXdFgGmR+gWWbgbJfAinGa1pW9Opno6B36QQRZy2+QGK45K1p
 h9lMY+/L8c4j9szeS+1ZYzaNs6A/kuao/UdPAlzrF8CIpHmGvvNltauAKhFSTno750coXA
 mTQE7FL6MVTMGZSdT6nd29/6t4qUldU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707313777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nIJiLe5quPC+6Ikbcjh207Bt00KbJX4HrhaGRAuxM4=;
 b=J2e20baYWfVBRFn2inwCCso2HkKiXg4IFP94vr6OTZBDyxUq/YWftKM1ysxFAtF3rBLWHZ
 HJIvo4d1osLJrZAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707313777; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nIJiLe5quPC+6Ikbcjh207Bt00KbJX4HrhaGRAuxM4=;
 b=AZJlFZUDq3j39jNobePEvEXdFgGmR+gWWbgbJfAinGa1pW9Opno6B36QQRZy2+QGK45K1p
 h9lMY+/L8c4j9szeS+1ZYzaNs6A/kuao/UdPAlzrF8CIpHmGvvNltauAKhFSTno750coXA
 mTQE7FL6MVTMGZSdT6nd29/6t4qUldU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707313777;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nIJiLe5quPC+6Ikbcjh207Bt00KbJX4HrhaGRAuxM4=;
 b=J2e20baYWfVBRFn2inwCCso2HkKiXg4IFP94vr6OTZBDyxUq/YWftKM1ysxFAtF3rBLWHZ
 HJIvo4d1osLJrZAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E318E139B9;
 Wed,  7 Feb 2024 13:49:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IBDqNXCKw2V7IQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Feb 2024 13:49:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sui.jingfeng@linux.dev, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 6/8] fbdev/efifb: Do not track parent device status
Date: Wed,  7 Feb 2024 14:47:15 +0100
Message-ID: <20240207134932.7321-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207134932.7321-1-tzimmermann@suse.de>
References: <20240207134932.7321-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[]
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

There will be no EFI framebuffer device for disabled parent devices
and thus we never probe efifb in that case. Hence remove the tracking
code from efifb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/efifb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index e66ef35fa6b62..f76b7ae007518 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -348,8 +348,6 @@ static struct attribute *efifb_attrs[] = {
 };
 ATTRIBUTE_GROUPS(efifb);
 
-static bool pci_dev_disabled;	/* FB base matches BAR of a disabled device */
-
 static struct resource *bar_resource;
 static u64 bar_offset;
 
@@ -377,7 +375,7 @@ static int efifb_probe(struct platform_device *dev)
 	if (!si)
 		return -ENOMEM;
 
-	if (si->orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI)
 		return -ENODEV;
 
 	if (fb_get_options("efifb", &option))
@@ -653,7 +651,6 @@ static void record_efifb_bar_resource(struct pci_dev *dev, int idx, u64 offset)
 
 	pci_read_config_word(dev, PCI_COMMAND, &word);
 	if (!(word & PCI_COMMAND_MEMORY)) {
-		pci_dev_disabled = true;
 		dev_err(&dev->dev,
 			"BAR %d: assigned to efifb but device is disabled!\n",
 			idx);
-- 
2.43.0

