Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36967AFC8B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F4410E47B;
	Wed, 27 Sep 2023 07:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433BC10E479
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 081362189F;
 Wed, 27 Sep 2023 07:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/IAJ+nflY6vv4Hj8yMEqhnvYxgG/i/teJeTcVUgps4=;
 b=0ssOZia3Xz3ePzTXYq6vRGMryjR2ZOwQoYZY/etqsB60qP1EN9MIMOW9OiuzX+fuTww83C
 4Jh2dzb9LN6N/Fr2Y2eBMGonVP+2WCq4EhZtGshM9oQPAfchBbwBRXp+V9zr8EaQCZQAPd
 4t8N9Q+pWuENQ1+naHRg32/zUHoRDD0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800848;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/IAJ+nflY6vv4Hj8yMEqhnvYxgG/i/teJeTcVUgps4=;
 b=Xh3vOdRSXZdH2cgCaDmXtjcjE6q5Xkpqf1QrKXJA4ZM+nP9O7p2FHP0hcp49Qlkvcg6bwB
 R4DiEpEDFRTT8oAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C530913A74;
 Wed, 27 Sep 2023 07:47:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +LlaLw/eE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 13/46] fbdev/dnfb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:46 +0200
Message-ID: <20230927074722.6197-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927074722.6197-1-tzimmermann@suse.de>
References: <20230927074722.6197-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize the instance of struct fb_ops with fbdev initializer
macros for framebuffers in I/O address space. Set the read/write,
draw and mmap callbacks to the correct implementation and avoid
implicit defaults. Also select the necessary I/O helpers in Kconfig.

Fbdev drivers sometimes rely on the callbacks being NULL for a
default implementation to be invoked; hence requiring the I/O
helpers to be built in any case. Setting all callbacks in all
drivers explicitly will allow to make the I/O helpers optional.
This benefits systems that do not use these functions.

No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig | 1 +
 drivers/video/fbdev/dnfb.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 5ad55bf2b18e6..0997c6cc3bcdb 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -217,6 +217,7 @@ config FB_APOLLO
 	default y
 	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 
 config FB_Q40
 	bool
diff --git a/drivers/video/fbdev/dnfb.c b/drivers/video/fbdev/dnfb.c
index 18405c402ec15..c4d24540d9efd 100644
--- a/drivers/video/fbdev/dnfb.c
+++ b/drivers/video/fbdev/dnfb.c
@@ -110,10 +110,12 @@ static void dnfb_copyarea(struct fb_info *info, const struct fb_copyarea *area);
 
 static const struct fb_ops dn_fb_ops = {
 	.owner		= THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_blank	= dnfb_blank,
 	.fb_fillrect	= cfb_fillrect,
 	.fb_copyarea	= dnfb_copyarea,
 	.fb_imageblit	= cfb_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 static const struct fb_var_screeninfo dnfb_var = {
-- 
2.42.0

