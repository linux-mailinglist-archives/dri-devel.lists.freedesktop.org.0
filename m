Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94AC9160EE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 10:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D7610E5E2;
	Tue, 25 Jun 2024 08:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aQpBGUoM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2pH7pSEe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aQpBGUoM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2pH7pSEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B7F10E5E2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 08:18:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C426B1F83D;
 Tue, 25 Jun 2024 08:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719303502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TBpJq1qKJcbJToCBUWdB6XboAre4cTNuGCODZlLjUh8=;
 b=aQpBGUoM770fnYDiQrEDM0QLcN+IXIsjUXCy57GZJ905KBHru0elcOQP0Yh23NjXcnxrKV
 mt6DN+bxSG096KeFkIcXKwe7IVy7TETcLkZIhySO52tQCOqIlWglsrgxMMJ1eOwLNwoUZa
 4c2mfkc0OzrMvMaUfajlO1zZkLPUcE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719303502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TBpJq1qKJcbJToCBUWdB6XboAre4cTNuGCODZlLjUh8=;
 b=2pH7pSEe3anxOLfKpi/SsaEfPWPWcmC0LC8XafmqOqPdFtXb0HZgJ/W0v9iFkMPItD9Z7u
 FEcqqtiu648Ch3CQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aQpBGUoM;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2pH7pSEe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719303502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TBpJq1qKJcbJToCBUWdB6XboAre4cTNuGCODZlLjUh8=;
 b=aQpBGUoM770fnYDiQrEDM0QLcN+IXIsjUXCy57GZJ905KBHru0elcOQP0Yh23NjXcnxrKV
 mt6DN+bxSG096KeFkIcXKwe7IVy7TETcLkZIhySO52tQCOqIlWglsrgxMMJ1eOwLNwoUZa
 4c2mfkc0OzrMvMaUfajlO1zZkLPUcE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719303502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TBpJq1qKJcbJToCBUWdB6XboAre4cTNuGCODZlLjUh8=;
 b=2pH7pSEe3anxOLfKpi/SsaEfPWPWcmC0LC8XafmqOqPdFtXb0HZgJ/W0v9iFkMPItD9Z7u
 FEcqqtiu648Ch3CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D9E313A9A;
 Tue, 25 Jun 2024 08:18:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id dmZeHU59emZTMAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jun 2024 08:18:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	maraeo@gmail.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Sui Jingfeng <suijingfeng@loongson.cn>, stable@vger.kernel.org
Subject: [PATCH] firmware: sysfb: Fix reference count of sysfb parent device
Date: Tue, 25 Jun 2024 10:17:43 +0200
Message-ID: <20240625081818.15696-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmx.de,intel.com,linaro.org,arndb.de,loongson.cn,vger.kernel.org];
 DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,suse.de:email,suse.de:dkim,intel.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCPT_COUNT_SEVEN(0.00)[10];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C426B1F83D
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

Retrieving the system framebuffer's parent device in sysfb_init()
increments the parent device's reference count. Hence release the
reference before leaving the init function.

Adding the sysfb platform device acquires and additional reference
for the parent. This keeps the parent device around while the system
framebuffer is in use.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 9eac534db001 ("firmware/sysfb: Set firmware-framebuffer parent device")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: <stable@vger.kernel.org> # v6.9+
---
 drivers/firmware/sysfb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 880ffcb50088..dd274563deeb 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -101,8 +101,10 @@ static __init struct device *sysfb_parent_dev(const struct screen_info *si)
 	if (IS_ERR(pdev)) {
 		return ERR_CAST(pdev);
 	} else if (pdev) {
-		if (!sysfb_pci_dev_is_enabled(pdev))
+		if (!sysfb_pci_dev_is_enabled(pdev)) {
+			pci_dev_put(pdev);
 			return ERR_PTR(-ENODEV);
+		}
 		return &pdev->dev;
 	}
 
@@ -137,7 +139,7 @@ static __init int sysfb_init(void)
 	if (compatible) {
 		pd = sysfb_create_simplefb(si, &mode, parent);
 		if (!IS_ERR(pd))
-			goto unlock_mutex;
+			goto put_device;
 	}
 
 	/* if the FB is incompatible, create a legacy framebuffer device */
@@ -155,7 +157,7 @@ static __init int sysfb_init(void)
 	pd = platform_device_alloc(name, 0);
 	if (!pd) {
 		ret = -ENOMEM;
-		goto unlock_mutex;
+		goto put_device;
 	}
 
 	pd->dev.parent = parent;
@@ -170,9 +172,12 @@ static __init int sysfb_init(void)
 	if (ret)
 		goto err;
 
-	goto unlock_mutex;
+
+	goto put_device;
 err:
 	platform_device_put(pd);
+put_device:
+	put_device(parent);
 unlock_mutex:
 	mutex_unlock(&disable_lock);
 	return ret;
-- 
2.45.2

