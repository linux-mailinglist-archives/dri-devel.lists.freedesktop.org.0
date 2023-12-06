Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A01F807142
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 14:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B7510E728;
	Wed,  6 Dec 2023 13:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99ABE10E722
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 13:51:58 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C8D21FD11;
 Wed,  6 Dec 2023 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701870717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPAqGWJPTkUEbNdycRnvjHfrmf791D8Z57JHNYLG2/w=;
 b=P6aKd4VKfom77PiUC8i4RvI3P9irr2XvTLUBuvE+z2B4OnZBA8xYl2MJ0nXZG6sYmf481d
 leKOZlbq7C+T3nqsZ8so2LUKNiqpqclYchLSNGBwczwDb23MBkCWRlzNn4b1cvZHRvVh94
 pH3SXcSf3gRY6KJhEn0cREKDKVngKpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701870717;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPAqGWJPTkUEbNdycRnvjHfrmf791D8Z57JHNYLG2/w=;
 b=AwCtuVm5OZwxibhRD+X3pTUl5zXlAmaTi5r2fklF2tia+h2cMBwBVQcu74BPiDZhdJ8EB7
 XDyrG/DuN4BSw+Dg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0581813B6E;
 Wed,  6 Dec 2023 13:51:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 0MWoOXx8cGWVBgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Dec 2023 13:51:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, pjones@redhat.com,
 sui.jingfeng@linux.dev
Subject: [PATCH v3 4/4] fbdev/vesafb: Use screen_info pointer from device
Date: Wed,  6 Dec 2023 14:50:29 +0100
Message-ID: <20231206135153.2599-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206135153.2599-1-tzimmermann@suse.de>
References: <20231206135153.2599-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.72
X-Spamd-Result: default: False [-1.72 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,linux.dev];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-2.42)[97.36%]
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
index ea89accbec38..8ab64ae4cad3 100644
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

