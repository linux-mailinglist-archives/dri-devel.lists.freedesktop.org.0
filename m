Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9CC82193D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 10:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9004910E127;
	Tue,  2 Jan 2024 09:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A188710E0C7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 09:56:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 480CF21E37;
 Tue,  2 Jan 2024 09:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704189366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbzpPtLAMktnE5twfnd1kLQPIsuU0r4dHhIYNkq2hfA=;
 b=eIirU6QVFxi+NkuaIT++MqfqwWbTcCkmQK/86ufQdDwwZ9xS8u/epWHKdzQjxWY75GrLdL
 HtwJrV49eoYIfPsxEZmqVtV0Epeu9wVdqTc8yUn2XB1QHty+HPqayN1YqRvOiAg006vWz0
 j9FlOLJAlTMDiUkV8D/iVdlEPUMv8pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704189366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbzpPtLAMktnE5twfnd1kLQPIsuU0r4dHhIYNkq2hfA=;
 b=IwCn0owqOJnSeiPSxvMTPlRnYlo9vLOybSHMnFlGinOtlvAT0KfO/AQygARRUET5zuB3Ex
 ojl9JxBiT2+mAQDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704189366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbzpPtLAMktnE5twfnd1kLQPIsuU0r4dHhIYNkq2hfA=;
 b=eIirU6QVFxi+NkuaIT++MqfqwWbTcCkmQK/86ufQdDwwZ9xS8u/epWHKdzQjxWY75GrLdL
 HtwJrV49eoYIfPsxEZmqVtV0Epeu9wVdqTc8yUn2XB1QHty+HPqayN1YqRvOiAg006vWz0
 j9FlOLJAlTMDiUkV8D/iVdlEPUMv8pk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704189366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbzpPtLAMktnE5twfnd1kLQPIsuU0r4dHhIYNkq2hfA=;
 b=IwCn0owqOJnSeiPSxvMTPlRnYlo9vLOybSHMnFlGinOtlvAT0KfO/AQygARRUET5zuB3Ex
 ojl9JxBiT2+mAQDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 116A213C96;
 Tue,  2 Jan 2024 09:56:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SHHuArbdk2WBEwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 02 Jan 2024 09:56:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	James.Bottomley@HansenPartnership.com,
	arnd@arndb.de
Subject: [PATCH v2 1/4] video/sticore: Store ROM device in STI struct
Date: Tue,  2 Jan 2024 10:52:33 +0100
Message-ID: <20240102095604.7276-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102095604.7276-1-tzimmermann@suse.de>
References: <20240102095604.7276-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.19
X-Spamd-Bar: +
X-Spam-Flag: NO
X-Spamd-Result: default: False [1.19 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 FREEMAIL_TO(0.00)[gmx.de,HansenPartnership.com,arndb.de];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eIirU6QV;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IwCn0owq
X-Spam-Level: *
X-Rspamd-Queue-Id: 480CF21E37
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
Tested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>
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

