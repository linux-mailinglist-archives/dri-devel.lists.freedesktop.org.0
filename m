Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F7807141
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E94A10E727;
	Wed,  6 Dec 2023 13:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192EF10E722
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:51:58 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB9871FD0E;
 Wed,  6 Dec 2023 13:51:56 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 752C1133DD;
 Wed,  6 Dec 2023 13:51:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id yCFGG3x8cGWVBgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Dec 2023 13:51:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, pjones@redhat.com,
 sui.jingfeng@linux.dev
Subject: [PATCH v3 2/4] fbdev/efifb: Use screen_info pointer from device
Date: Wed,  6 Dec 2023 14:50:27 +0100
Message-ID: <20231206135153.2599-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206135153.2599-1-tzimmermann@suse.de>
References: <20231206135153.2599-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: AB9871FD0E
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
code. Duplicated the screen_info data, so that efifb can modify it at
will.

v2:
	* comment on devm_kmemdup() usage (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/efifb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 6b3b5cca1d41..10fc14ad5d12 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -359,7 +359,7 @@ static u64 bar_offset;
 
 static int efifb_probe(struct platform_device *dev)
 {
-	struct screen_info *si = &screen_info;
+	struct screen_info *si;
 	struct fb_info *info;
 	struct efifb_par *par;
 	int err, orientation;
@@ -369,6 +369,18 @@ static int efifb_probe(struct platform_device *dev)
 	char *option = NULL;
 	efi_memory_desc_t md;
 
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
 	if (si->orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
 		return -ENODEV;
 
-- 
2.43.0

