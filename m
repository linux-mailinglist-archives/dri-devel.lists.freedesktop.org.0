Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A4C7EC0A1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 11:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6988510E52B;
	Wed, 15 Nov 2023 10:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737AC10E521
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 10:30:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1EB0B2291E;
 Wed, 15 Nov 2023 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700044201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53kyuPK5Ubdhq4+OeXbVQJD3fRZgvNrPmiZUnJ8XA1Y=;
 b=PR1FmgIDhYlZxuBoKKjyOC/vc4U54yyEHIr7GfyZyVBFJjfjVrnEUUdSK/SPHShCiLl0RS
 OOqo/V/nyr8y3tejBaSXGliP0fte6tbtAEAstqg56Hdr+6ql8z7Jg4BEJBV96D3fmwgeJw
 VhDa0x4AQ0isoSVCgCyggcrg2gDImdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700044201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53kyuPK5Ubdhq4+OeXbVQJD3fRZgvNrPmiZUnJ8XA1Y=;
 b=jSRW5dmOYDjkKlTuOanbjaWzy/N+9/S046OCDlWplcbKCQmv5Ed2KXu6eEgd/YmpeDh0OJ
 7HGSntYCb/8smiAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F1D4313ACD;
 Wed, 15 Nov 2023 10:30:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yPwjOqidVGV+UAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 10:30:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 27/32] fbdev: Rename FB_SYS_FOPS token to FB_SYSMEM_FOPS
Date: Wed, 15 Nov 2023 11:19:32 +0100
Message-ID: <20231115102954.7102-28-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115102954.7102-1-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.10
X-Spamd-Result: default: False [-3.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_MISSING_CHARSET(2.50)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCPT_COUNT_FIVE(0.00)[5];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 R_RATELIMIT(0.00)[to_ip_from(RLhj387a44qpajt9e5qpoeukef)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]
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

Rename the token to harmonize naming among various helpers. For
example, I/O-memory helpers use FB_IOMEM_FOPS.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig       | 4 ++--
 drivers/video/fbdev/core/Kconfig  | 6 +++---
 drivers/video/fbdev/core/Makefile | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 07eccd05390f2..63600497dc330 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1464,7 +1464,7 @@ config FB_VT8500
 	select FB_SYS_FILLRECT if (!FB_WMT_GE_ROPS)
 	select FB_SYS_COPYAREA if (!FB_WMT_GE_ROPS)
 	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
+	select FB_SYSMEM_FOPS
 	select FB_MODE_HELPERS
 	select VIDEOMODE_HELPERS
 	help
@@ -1477,7 +1477,7 @@ config FB_WM8505
 	select FB_SYS_FILLRECT if (!FB_WMT_GE_ROPS)
 	select FB_SYS_COPYAREA if (!FB_WMT_GE_ROPS)
 	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
+	select FB_SYSMEM_FOPS
 	select FB_MODE_HELPERS
 	select VIDEOMODE_HELPERS
 	help
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 7a3ed13bed708..faab5d50cac3c 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -129,7 +129,7 @@ config FB_LITTLE_ENDIAN
 
 endchoice
 
-config FB_SYS_FOPS
+config FB_SYSMEM_FOPS
 	tristate
 	depends on FB_CORE
 
@@ -142,8 +142,8 @@ config FB_DMAMEM_HELPERS
 	depends on FB_CORE
 	select FB_SYS_COPYAREA
 	select FB_SYS_FILLRECT
-	select FB_SYS_FOPS
 	select FB_SYS_IMAGEBLIT
+	select FB_SYSMEM_FOPS
 
 config FB_IOMEM_FOPS
 	tristate
@@ -168,8 +168,8 @@ config FB_SYSMEM_HELPERS
 	depends on FB_CORE
 	select FB_SYS_COPYAREA
 	select FB_SYS_FILLRECT
-	select FB_SYS_FOPS
 	select FB_SYS_IMAGEBLIT
+	select FB_SYSMEM_FOPS
 
 config FB_SYSMEM_HELPERS_DEFERRED
 	bool
diff --git a/drivers/video/fbdev/core/Makefile b/drivers/video/fbdev/core/Makefile
index c1d657601b2be..d159747590869 100644
--- a/drivers/video/fbdev/core/Makefile
+++ b/drivers/video/fbdev/core/Makefile
@@ -32,6 +32,6 @@ obj-$(CONFIG_FB_IOMEM_FOPS)    += fb_io_fops.o
 obj-$(CONFIG_FB_SYS_FILLRECT)  += sysfillrect.o
 obj-$(CONFIG_FB_SYS_COPYAREA)  += syscopyarea.o
 obj-$(CONFIG_FB_SYS_IMAGEBLIT) += sysimgblt.o
-obj-$(CONFIG_FB_SYS_FOPS)      += fb_sys_fops.o
+obj-$(CONFIG_FB_SYSMEM_FOPS)   += fb_sys_fops.o
 obj-$(CONFIG_FB_SVGALIB)       += svgalib.o
 obj-$(CONFIG_FB_DDC)           += fb_ddc.o
-- 
2.42.0

