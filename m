Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D63781A01A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 14:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BDB10E579;
	Wed, 20 Dec 2023 13:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C3310E579
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 13:46:48 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A8071F82F;
 Wed, 20 Dec 2023 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlqvDzxi9RaS9JrG1j9iggRDj95BygjPLrZBLF6ysNg=;
 b=wlID0kPjIW+0JVqDtwo0zaandRXtHMe41iFpajXpAQmYfV/LG18YUZC058yw8CNi4g2q/P
 LX4HaCmTEQaRdpPIUjQD8Wxjakb9n8zuaIqqosOEmhUIWSxCo5zsRmnSOmoo+UM1XIiNBu
 +Ywmb2fn0izpus3aOYPBc5m8Inzfk48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlqvDzxi9RaS9JrG1j9iggRDj95BygjPLrZBLF6ysNg=;
 b=5Ls8WrRRTFZIy7p109mjW8669l0DgzWHIVufQjo8cEkMyLDPKBNxfXVfpmLwud6UpmkebL
 Nc5uaquIvqYGJeAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1703080007; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlqvDzxi9RaS9JrG1j9iggRDj95BygjPLrZBLF6ysNg=;
 b=wlID0kPjIW+0JVqDtwo0zaandRXtHMe41iFpajXpAQmYfV/LG18YUZC058yw8CNi4g2q/P
 LX4HaCmTEQaRdpPIUjQD8Wxjakb9n8zuaIqqosOEmhUIWSxCo5zsRmnSOmoo+UM1XIiNBu
 +Ywmb2fn0izpus3aOYPBc5m8Inzfk48=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1703080007;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlqvDzxi9RaS9JrG1j9iggRDj95BygjPLrZBLF6ysNg=;
 b=5Ls8WrRRTFZIy7p109mjW8669l0DgzWHIVufQjo8cEkMyLDPKBNxfXVfpmLwud6UpmkebL
 Nc5uaquIvqYGJeAA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 23E1913BA8;
 Wed, 20 Dec 2023 13:46:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id QKWQB0fwgmWZJwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Dec 2023 13:46:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Subject: [PATCH 1/4] video/sticore: Store ROM device in STI struct
Date: Wed, 20 Dec 2023 14:22:54 +0100
Message-ID: <20231220134639.8190-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220134639.8190-1-tzimmermann@suse.de>
References: <20231220134639.8190-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-parisc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store the ROM's parent device in each STI struct, so we can associate
the STI framebuffer with a device.

The new field will eventually replace the fbdev subsystem's info field,
which the function fb_is_primary_device() currently requires to detect
the firmware's output. By using the device instead of the framebuffer
info, a later patch can generalize the helper for use in non-fbdev code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/sticore.c | 5 +++++
 include/video/sticore.h | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/video/sticore.c b/drivers/video/sticore.c
index c3765ad6eedf..7115b325817f 100644
--- a/drivers/video/sticore.c
+++ b/drivers/video/sticore.c
@@ -1041,6 +1041,9 @@ static int __init sticore_pa_init(struct parisc_device *dev)
 
 	print_pa_hwpath(dev, sti->pa_path);
 	sticore_check_for_default_sti(sti, sti->pa_path);
+
+	sti->dev = &dev->dev;
+
 	return 0;
 }
 
@@ -1084,6 +1087,8 @@ static int sticore_pci_init(struct pci_dev *pd, const struct pci_device_id *ent)
 		pr_warn("Unable to handle STI device '%s'\n", pci_name(pd));
 		return -ENODEV;
 	}
+
+	sti->dev = &pd->dev;
 #endif /* CONFIG_PCI */
 
 	return 0;
diff --git a/include/video/sticore.h b/include/video/sticore.h
index 012b5b46ad7d..9d993e22805d 100644
--- a/include/video/sticore.h
+++ b/include/video/sticore.h
@@ -2,6 +2,7 @@
 #ifndef STICORE_H
 #define STICORE_H
 
+struct device;
 struct fb_info;
 
 /* generic STI structures & functions */
@@ -370,6 +371,9 @@ struct sti_struct {
 	/* pointer to the fb_info where this STI device is used */
 	struct fb_info *info;
 
+	/* pointer to the parent device */
+	struct device *dev;
+
 	/* pointer to all internal data */
 	struct sti_all_data *sti_data;
 
-- 
2.43.0

