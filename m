Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4396F17DC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BFA10ED1C;
	Fri, 28 Apr 2023 12:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFA410ED0F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 12:25:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1E3B21F60;
 Fri, 28 Apr 2023 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682684699; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0UUISuEWNBB7Ivz59ObDk7Z8YDWtZKFLLWdx8JUBWw8=;
 b=xRrH0djXV1GdzF9P0rN+vmoxV6mpuRO1368DNSv8OKtyokoN5HpodGeRkqT5H539VVToXc
 AqGqGOs0F1HTcEz4ynEOEKUT6297CUdCMHA6XqlZxnviZaa7kNsULohbaDognhG7P1Yd+7
 CtZOtdeaeKRagclJcHdksy63vKaDTzo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682684699;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0UUISuEWNBB7Ivz59ObDk7Z8YDWtZKFLLWdx8JUBWw8=;
 b=a3YPlTICjqfygTukMiu1KcW7y2Lj6W2eaBSGtQo3jFou3AlQoeDsX2KKf2jhRPmRVrO36f
 Io3kuFFutoqyLdBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A7791390E;
 Fri, 28 Apr 2023 12:24:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KAq4JBu7S2RgeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Apr 2023 12:24:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: [PATCH v2 15/19] fbdev: Use screen_buffer in fb_sys_{read,write}()
Date: Fri, 28 Apr 2023 14:24:48 +0200
Message-Id: <20230428122452.4856-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428122452.4856-1-tzimmermann@suse.de>
References: <20230428122452.4856-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use info->screen_buffer when reading and writing framebuffers in
system memory. It's the correct pointer for this address space.

The struct fb_info has a union to store the framebuffer memory. This can
either be info->screen_base if the framebuffer is stored in I/O memory,
or info->screen_buffer if the framebuffer is stored in system memory.

Since the fb_sys_{read,write}() functions operate on the latter address
space, it is wrong to use .screen_base and .screen_buffer must be used
instead. This also gets rid of all the casting needed due to not using
the correct data type.

v2:
	* add detailed commit message (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/core/fb_sys_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
index cefb77b9546d..6589123f4127 100644
--- a/drivers/video/fbdev/core/fb_sys_fops.c
+++ b/drivers/video/fbdev/core/fb_sys_fops.c
@@ -39,7 +39,7 @@ ssize_t fb_sys_read(struct fb_info *info, char __user *buf, size_t count,
 	if (count + p > total_size)
 		count = total_size - p;
 
-	src = (void __force *)(info->screen_base + p);
+	src = info->screen_buffer + p;
 
 	if (info->fbops->fb_sync)
 		info->fbops->fb_sync(info);
@@ -87,7 +87,7 @@ ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 		count = total_size - p;
 	}
 
-	dst = (void __force *) (info->screen_base + p);
+	dst = info->screen_buffer + p;
 
 	if (info->fbops->fb_sync)
 		info->fbops->fb_sync(info);
-- 
2.40.0

