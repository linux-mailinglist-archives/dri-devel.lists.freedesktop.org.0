Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4974850F57
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 10:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D4910EB50;
	Mon, 12 Feb 2024 09:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rObM6w3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K1/dPtkE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rObM6w3q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K1/dPtkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9E210EB4E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 09:07:43 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B65F31F7B9;
 Mon, 12 Feb 2024 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707728861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzfJPbuCSE3CPf/KPTSR1M28eU5dvUFdAj7lj/2rk+Q=;
 b=rObM6w3qn1L88+v+jS8Sh7IuaSOIXsiB+wWS/AjwvYYwZ2WKHoWKUwG38aGdaM77Tt3wpP
 Q+OFDfXABcjl1+ZPLoxpJjU8Wuznlq9n3MNDaUtrJFJfiurJEy0aknJcys+QN7SB1nWV1U
 TOlzyTm4ZYqfHsmy7GGaoYWWv/T1SZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707728861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzfJPbuCSE3CPf/KPTSR1M28eU5dvUFdAj7lj/2rk+Q=;
 b=K1/dPtkEGUzElNQmhAV1pOp/7CUP67U7qDC+Mqow9soUC0KGJheZqFbHKOAZx+hQWE6qed
 SRyMa7OiVfmzV1Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707728861; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzfJPbuCSE3CPf/KPTSR1M28eU5dvUFdAj7lj/2rk+Q=;
 b=rObM6w3qn1L88+v+jS8Sh7IuaSOIXsiB+wWS/AjwvYYwZ2WKHoWKUwG38aGdaM77Tt3wpP
 Q+OFDfXABcjl1+ZPLoxpJjU8Wuznlq9n3MNDaUtrJFJfiurJEy0aknJcys+QN7SB1nWV1U
 TOlzyTm4ZYqfHsmy7GGaoYWWv/T1SZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707728861;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RzfJPbuCSE3CPf/KPTSR1M28eU5dvUFdAj7lj/2rk+Q=;
 b=K1/dPtkEGUzElNQmhAV1pOp/7CUP67U7qDC+Mqow9soUC0KGJheZqFbHKOAZx+hQWE6qed
 SRyMa7OiVfmzV1Cg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 70DA913A39;
 Mon, 12 Feb 2024 09:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id CFQ0Gt3fyWXecwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 09:07:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sui.jingfeng@linux.dev, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
Date: Mon, 12 Feb 2024 10:06:10 +0100
Message-ID: <20240212090736.11464-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212090736.11464-1-tzimmermann@suse.de>
References: <20240212090736.11464-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rObM6w3q;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="K1/dPtkE"
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[8]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[redhat.com,linux.dev,gmx.de,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: B65F31F7B9
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

Add screen_info_get_pci_dev() to find the PCI device of an instance
of screen_info. Does nothing on systems without PCI bus.

v3:
	* search PCI device with pci_get_base_class() (Sui)
v2:
	* remove ret from screen_info_pci_dev() (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/Makefile          |  1 +
 drivers/video/screen_info_pci.c | 48 +++++++++++++++++++++++++++++++++
 include/linux/screen_info.h     | 10 +++++++
 3 files changed, 59 insertions(+)
 create mode 100644 drivers/video/screen_info_pci.c

diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index 117cbdbb58c2c..ffbac4387c670 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_VIDEO)               += cmdline.o nomodeset.o
 obj-$(CONFIG_HDMI)                += hdmi.o
 
 screen_info-y			  := screen_info_generic.o
+screen_info-$(CONFIG_PCI)         += screen_info_pci.o
 
 obj-$(CONFIG_VT)		  += console/
 obj-$(CONFIG_FB_STI)		  += console/
diff --git a/drivers/video/screen_info_pci.c b/drivers/video/screen_info_pci.c
new file mode 100644
index 0000000000000..d8985a54ce717
--- /dev/null
+++ b/drivers/video/screen_info_pci.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/pci.h>
+#include <linux/screen_info.h>
+
+static struct pci_dev *__screen_info_pci_dev(struct resource *res)
+{
+	struct pci_dev *pdev = NULL;
+	const struct resource *r = NULL;
+
+	if (!(res->flags & IORESOURCE_MEM))
+		return NULL;
+
+	while (!r && (pdev = pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
+		r = pci_find_resource(pdev, res);
+	}
+
+	return pdev;
+}
+
+/**
+ * screen_info_pci_dev() - Return PCI parent device that contains screen_info's framebuffer
+ * @si: the screen_info
+ *
+ * Returns:
+ * The screen_info's parent device or NULL on success, or a pointer-encoded
+ * errno value otherwise. The value NULL is not an error. It signals that no
+ * PCI device has been found.
+ */
+struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
+{
+	struct resource res[SCREEN_INFO_MAX_RESOURCES];
+	ssize_t i, numres;
+
+	numres = screen_info_resources(si, res, ARRAY_SIZE(res));
+	if (numres < 0)
+		return ERR_PTR(numres);
+
+	for (i = 0; i < numres; ++i) {
+		struct pci_dev *pdev = __screen_info_pci_dev(&res[i]);
+
+		if (pdev)
+			return pdev;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(screen_info_pci_dev);
diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
index e7a02c5609d12..0eae08e3c6f90 100644
--- a/include/linux/screen_info.h
+++ b/include/linux/screen_info.h
@@ -9,6 +9,7 @@
  */
 #define SCREEN_INFO_MAX_RESOURCES	3
 
+struct pci_dev;
 struct resource;
 
 static inline bool __screen_info_has_lfb(unsigned int type)
@@ -104,6 +105,15 @@ static inline unsigned int screen_info_video_type(const struct screen_info *si)
 
 ssize_t screen_info_resources(const struct screen_info *si, struct resource *r, size_t num);
 
+#if defined(CONFIG_PCI)
+struct pci_dev *screen_info_pci_dev(const struct screen_info *si);
+#else
+static inline struct pci_dev *screen_info_pci_dev(const struct screen_info *si)
+{
+	return NULL;
+}
+#endif
+
 extern struct screen_info screen_info;
 
 #endif /* _SCREEN_INFO_H */
-- 
2.43.0

