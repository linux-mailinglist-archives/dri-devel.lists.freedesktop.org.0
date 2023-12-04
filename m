Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF47802E91
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D0710E19B;
	Mon,  4 Dec 2023 09:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF3210E195
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 09:28:16 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 215631FE62;
 Mon,  4 Dec 2023 09:28:15 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E3B1913B47;
 Mon,  4 Dec 2023 09:28:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id uP5JNq6bbWWwLgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Dec 2023 09:28:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	pjones@redhat.com
Subject: [PATCH v2 4/4] fbdev/vesafb: Use screen_info pointer from device
Date: Mon,  4 Dec 2023 10:27:22 +0100
Message-ID: <20231204092812.2612-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204092812.2612-1-tzimmermann@suse.de>
References: <20231204092812.2612-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 215631FE62
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the screen_info instance from the device instead of dereferencing
the global screen_info state. Decouples the driver from per-architecture
code. Duplicated the screen_info data, so that vesafb can modify it at
will.

v2:
	* comment on devm_kmemdup() usage (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/vesafb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index ea89accbec385..8ab64ae4cad3e 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -243,7 +243,7 @@ static int vesafb_setup(char *options)
 
 static int vesafb_probe(struct platform_device *dev)
 {
-	struct screen_info *si = &screen_info;
+	struct screen_info *si;
 	struct fb_info *info;
 	struct vesafb_par *par;
 	int i, err;
@@ -252,6 +252,18 @@ static int vesafb_probe(struct platform_device *dev)
 	unsigned int size_total;
 	char *option = NULL;
 
+	/*
+	 * If we fail probing the device, the kernel might try a different
+	 * driver. We get a copy of the attached screen_info, so that we can
+	 * modify its values without affecting later drivers.
+	 */
+	si = dev_get_platdata(&dev->dev);
+	if (!si)
+		return -ENODEV;
+	si = devm_kmemdup(&dev->dev, si, sizeof(*si), GFP_KERNEL);
+	if (!si)
+		return -ENOMEM;
+
 	/* ignore error return of fb_get_options */
 	fb_get_options("vesafb", &option);
 	vesafb_setup(option);
-- 
2.43.0

