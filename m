Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8367E850F51
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 10:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A657C10E35A;
	Mon, 12 Feb 2024 09:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tlJYvG7g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7BU8fR5v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tlJYvG7g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7BU8fR5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4220810E35A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 09:07:44 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4DA02219E;
 Mon, 12 Feb 2024 09:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707728862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fkPFHB33BnHhA7zwTJ35rGKDko8RHZulpnEaY3lAD0=;
 b=tlJYvG7g8mG+Aq3KeoNS2zasVSC8mgJvKMEPhwrOaPz55Bc3xB2G+hZ5SffBB/t2ylVnQ2
 CQc5Z4mdJ8IwKONh/rrpjK407jTJwofPufgoM+4D+SMh/hcd6gaiCNkrif/cf6x9iGM/Gm
 2pblOI9y4JHYsR+omkzXQh5Sl8zieYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707728862;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fkPFHB33BnHhA7zwTJ35rGKDko8RHZulpnEaY3lAD0=;
 b=7BU8fR5v1u8n2ALHQND+shP7vNm2YDyTtwsdNlO27PIPBknFzEzypAd1VH1ad/8TF+0A10
 Lgv0pAZlgD75unCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707728862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fkPFHB33BnHhA7zwTJ35rGKDko8RHZulpnEaY3lAD0=;
 b=tlJYvG7g8mG+Aq3KeoNS2zasVSC8mgJvKMEPhwrOaPz55Bc3xB2G+hZ5SffBB/t2ylVnQ2
 CQc5Z4mdJ8IwKONh/rrpjK407jTJwofPufgoM+4D+SMh/hcd6gaiCNkrif/cf6x9iGM/Gm
 2pblOI9y4JHYsR+omkzXQh5Sl8zieYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707728862;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fkPFHB33BnHhA7zwTJ35rGKDko8RHZulpnEaY3lAD0=;
 b=7BU8fR5v1u8n2ALHQND+shP7vNm2YDyTtwsdNlO27PIPBknFzEzypAd1VH1ad/8TF+0A10
 Lgv0pAZlgD75unCg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FEEE13212;
 Mon, 12 Feb 2024 09:07:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 2P5vHd7fyWXecwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 09:07:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sui.jingfeng@linux.dev, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 5/8] firmware/sysfb: Create firmware device only for
 enabled PCI devices
Date: Mon, 12 Feb 2024 10:06:13 +0100
Message-ID: <20240212090736.11464-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212090736.11464-1-tzimmermann@suse.de>
References: <20240212090736.11464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Level: *
X-Spam-Score: 1.90
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

Test if the firmware framebuffer's parent PCI device, if any, has
been enabled. If not, the firmware framebuffer is most likely not
working. Hence, do not create a device for the firmware framebuffer
on disabled PCI devices.

So far, efifb tracked the status of the PCI parent device internally
and did not bind if it was disabled. This patch implements the
functionality for all PCI-based firmware framebuffers.

v3:
	* make commit message more precise (Sui)
v2:
	* rework sysfb_pci_dev_is_enabled() (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/sysfb.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 4e104f3de4b95..170b7cd0cfcbf 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -70,15 +70,41 @@ void sysfb_disable(void)
 }
 EXPORT_SYMBOL_GPL(sysfb_disable);
 
+#if defined(CONFIG_PCI)
+static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
+{
+	/*
+	 * TODO: Try to integrate this code into the PCI subsystem
+	 */
+	int ret;
+	u16 command;
+
+	ret = pci_read_config_word(pdev, PCI_COMMAND, &command);
+	if (ret != PCIBIOS_SUCCESSFUL)
+		return false;
+	if (!(command & PCI_COMMAND_MEMORY))
+		return false;
+	return true;
+}
+#else
+static __init bool sysfb_pci_dev_is_enabled(struct pci_dev *pdev)
+{
+	return false;
+}
+#endif
+
 static __init struct device *sysfb_parent_dev(const struct screen_info *si)
 {
 	struct pci_dev *pdev;
 
 	pdev = screen_info_pci_dev(si);
-	if (IS_ERR(pdev))
+	if (IS_ERR(pdev)) {
 		return ERR_CAST(pdev);
-	else if (pdev)
+	} else if (pdev) {
+		if (!sysfb_pci_dev_is_enabled(pdev))
+			return ERR_PTR(-ENODEV);
 		return &pdev->dev;
+	}
 
 	return NULL;
 }
@@ -99,6 +125,8 @@ static __init int sysfb_init(void)
 	sysfb_apply_efi_quirks();
 
 	parent = sysfb_parent_dev(si);
+	if (IS_ERR(parent))
+		goto unlock_mutex;
 
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
-- 
2.43.0

