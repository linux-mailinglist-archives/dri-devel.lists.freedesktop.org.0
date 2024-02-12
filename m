Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCDA850F48
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 10:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6136410E149;
	Mon, 12 Feb 2024 09:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="d98bIpBs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3iFtAgKL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d98bIpBs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3iFtAgKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8049110E149
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 09:07:43 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 161932219B;
 Mon, 12 Feb 2024 09:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707728862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo7XCwsS2SG3zUtBNbmpk4NUm+oALs9KZfbD7hSp1kQ=;
 b=d98bIpBsrsEiFC1X+gOI530Tly+3pQc6yKg3+GEd/QUownWR4J6tPBGCO/Kdd4mWQWP06u
 qIRaz8++SO4IgXXHZWPysSgPPl60zClRgwdlQizmJ1RLKRstvte4Ylf5BuTQCvs8g/oJin
 1IL4fdCDmIe5KSZ9SOCYkba29PQdmzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707728862;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo7XCwsS2SG3zUtBNbmpk4NUm+oALs9KZfbD7hSp1kQ=;
 b=3iFtAgKLxKkzhorGy51wptWMrckQHkd5Pu7mRUpX39K1vRFsSdgPUQIuZ2nDgFJgNJhVG3
 KyJjT/yEMvM0cgCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707728862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo7XCwsS2SG3zUtBNbmpk4NUm+oALs9KZfbD7hSp1kQ=;
 b=d98bIpBsrsEiFC1X+gOI530Tly+3pQc6yKg3+GEd/QUownWR4J6tPBGCO/Kdd4mWQWP06u
 qIRaz8++SO4IgXXHZWPysSgPPl60zClRgwdlQizmJ1RLKRstvte4Ylf5BuTQCvs8g/oJin
 1IL4fdCDmIe5KSZ9SOCYkba29PQdmzY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707728862;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xo7XCwsS2SG3zUtBNbmpk4NUm+oALs9KZfbD7hSp1kQ=;
 b=3iFtAgKLxKkzhorGy51wptWMrckQHkd5Pu7mRUpX39K1vRFsSdgPUQIuZ2nDgFJgNJhVG3
 KyJjT/yEMvM0cgCQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BCDC313212;
 Mon, 12 Feb 2024 09:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id IMzXLN3fyWXecwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 09:07:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sui.jingfeng@linux.dev, pjones@redhat.com,
 deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 3/8] firmware/sysfb: Set firmware-framebuffer parent device
Date: Mon, 12 Feb 2024 10:06:11 +0100
Message-ID: <20240212090736.11464-4-tzimmermann@suse.de>
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

Set the firmware framebuffer's parent device, which usually is the
graphics hardware's physical device. Integrates the framebuffer in
the Linux device hierarchy and lets Linux handle dependencies among
devices. For example, the graphics hardware won't be suspended while
the firmware device is still active.

v4:
	* fix build for CONFIG_SYSFB_SIMPLEFB=n, again
v3:
	* fix build for CONFIG_SYSFB_SIMPLEFB=n (Sui)
	* test result of screen_info_pci_dev() for errors (Sui)
v2:
	* detect parent device in sysfb_parent_dev()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/sysfb.c          | 21 ++++++++++++++++++++-
 drivers/firmware/sysfb_simplefb.c |  5 ++++-
 include/linux/sysfb.h             |  6 ++++--
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 3c197db42c9d9..4e104f3de4b95 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -29,6 +29,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/pci.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/screen_info.h>
@@ -69,9 +70,23 @@ void sysfb_disable(void)
 }
 EXPORT_SYMBOL_GPL(sysfb_disable);
 
+static __init struct device *sysfb_parent_dev(const struct screen_info *si)
+{
+	struct pci_dev *pdev;
+
+	pdev = screen_info_pci_dev(si);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+	else if (pdev)
+		return &pdev->dev;
+
+	return NULL;
+}
+
 static __init int sysfb_init(void)
 {
 	struct screen_info *si = &screen_info;
+	struct device *parent;
 	struct simplefb_platform_data mode;
 	const char *name;
 	bool compatible;
@@ -83,10 +98,12 @@ static __init int sysfb_init(void)
 
 	sysfb_apply_efi_quirks();
 
+	parent = sysfb_parent_dev(si);
+
 	/* try to create a simple-framebuffer device */
 	compatible = sysfb_parse_mode(si, &mode);
 	if (compatible) {
-		pd = sysfb_create_simplefb(si, &mode);
+		pd = sysfb_create_simplefb(si, &mode, parent);
 		if (!IS_ERR(pd))
 			goto unlock_mutex;
 	}
@@ -109,6 +126,8 @@ static __init int sysfb_init(void)
 		goto unlock_mutex;
 	}
 
+	pd->dev.parent = parent;
+
 	sysfb_set_efifb_fwnode(pd);
 
 	ret = platform_device_add_data(pd, si, sizeof(*si));
diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index 74363ed7501f6..75a186bf8f8ec 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -91,7 +91,8 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
 }
 
 __init struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
-						     const struct simplefb_platform_data *mode)
+						     const struct simplefb_platform_data *mode,
+						     struct device *parent)
 {
 	struct platform_device *pd;
 	struct resource res;
@@ -143,6 +144,8 @@ __init struct platform_device *sysfb_create_simplefb(const struct screen_info *s
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
+	pd->dev.parent = parent;
+
 	sysfb_set_efifb_fwnode(pd);
 
 	ret = platform_device_add_resources(pd, &res, 1);
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 19cb803dd5ecd..c9cb657dad08a 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -91,7 +91,8 @@ static inline void sysfb_set_efifb_fwnode(struct platform_device *pd)
 bool sysfb_parse_mode(const struct screen_info *si,
 		      struct simplefb_platform_data *mode);
 struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
-					      const struct simplefb_platform_data *mode);
+					      const struct simplefb_platform_data *mode,
+					      struct device *parent);
 
 #else /* CONFIG_SYSFB_SIMPLE */
 
@@ -102,7 +103,8 @@ static inline bool sysfb_parse_mode(const struct screen_info *si,
 }
 
 static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
-							    const struct simplefb_platform_data *mode)
+							    const struct simplefb_platform_data *mode,
+							    struct device *parent)
 {
 	return ERR_PTR(-EINVAL);
 }
-- 
2.43.0

