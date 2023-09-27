Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863327AFC6A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 09:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720AA10E471;
	Wed, 27 Sep 2023 07:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6171710E46E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 07:47:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E6C01F899;
 Wed, 27 Sep 2023 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695800846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMGAppkbpU6AOjIUHzHmiI1PKhKctgWqSXZgj+cIjHw=;
 b=2YR2TxvY+AkquIHysYNlHEQF7icTPpCpdoyPEkaCpFLjKO5RqUzSbIA4JV0emxe/kDNmrs
 aWcGR3cmG/UZRXsRb1yQHDYd2iN77FrynqDF6ioLcvmnioHq8uXwp4x6nzJE4HlJhpgWJ7
 TcfjRnfnsYemwNa3L/0gLtUYmSv1YU0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695800846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMGAppkbpU6AOjIUHzHmiI1PKhKctgWqSXZgj+cIjHw=;
 b=kQj2soV5myVqfXRSO6v9xYK4q1A0c5QW5Rs3YyX8Dj1BTkM/9eurNDnCarEwZm+cIyPWpn
 gfywbGFYthBPooAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE24013A74;
 Wed, 27 Sep 2023 07:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eFV+MQ3eE2XvUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 07:47:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, sam@ravnborg.org, arnd@arndb.de,
 daniel@ffwll.ch
Subject: [PATCH 05/46] fbdev/arkfb: Initialize fb_ops to fbdev I/O-memory
 helpers
Date: Wed, 27 Sep 2023 09:26:38 +0200
Message-ID: <20230927074722.6197-6-tzimmermann@suse.de>
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
 drivers/video/fbdev/arkfb.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index e24653109dea8..012680f24964b 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1381,6 +1381,7 @@ config FB_ARK
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 60a96fdb5dd8e..dca9c0325b3f0 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -924,6 +924,7 @@ static const struct fb_ops arkfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= arkfb_open,
 	.fb_release	= arkfb_release,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var	= arkfb_check_var,
 	.fb_set_par	= arkfb_set_par,
 	.fb_setcolreg	= arkfb_setcolreg,
@@ -932,6 +933,7 @@ static const struct fb_ops arkfb_ops = {
 	.fb_fillrect	= arkfb_fillrect,
 	.fb_copyarea	= cfb_copyarea,
 	.fb_imageblit	= arkfb_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 	.fb_get_caps    = svga_get_caps,
 };
 
-- 
2.42.0

