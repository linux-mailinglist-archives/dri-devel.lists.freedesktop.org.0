Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63FB6B2A1A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FD710E889;
	Thu,  9 Mar 2023 16:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DCC10E872
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A52DF22166;
 Thu,  9 Mar 2023 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gZ1Tmm3JEgeMqN/NPKY8oH5C/7S9gy9JQ3mKL7gtCM=;
 b=aClCiEjhtEvWWtKnoezDVvFJ/0p8+II1/ANYf4pu5EiDL7XF2rdltVl0y85P+Ha4Dn4ZNH
 zwMyiHi4MWV1eiin5k+j/f+5rLop399Dwzr+Ch3RBWzELK6MsXeMNTcWo3Tk5STdrD/tFI
 04JdiAGAHPMFYJ40iwVJCCMsxvqG+Eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gZ1Tmm3JEgeMqN/NPKY8oH5C/7S9gy9JQ3mKL7gtCM=;
 b=u2IBZGAN1hguKZ934fTSEqBEE8/y5bWBVazblvDiXW5m5qNf9v2Uth46VrOGnZkWdgS5qR
 m/u8q/ceCBwgOIBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 496031391B;
 Thu,  9 Mar 2023 16:02:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OJ4JERoDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 075/101] fbdev/sm712fb: Duplicate video-mode option string
Date: Thu,  9 Mar 2023 17:01:35 +0100
Message-Id: <20230309160201.5163-76-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>
References: <20230309160201.5163-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assume that the driver does not own the option string or its substrings
and hence duplicate the option string for the video mode. Allocate the
copy's memory with kstrdup() and free it in the module's exit function.

Done in preparation of switching the driver to struct option_iter and
constifying the option string.

v2:
	* replace static memory with kstrdup()/kfree() (Geert)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sm712fb.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index b528776c7612..a83f48fce5b1 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -831,6 +831,7 @@ static const struct modeinit vgamode[] = {
 
 static struct screen_info smtc_scr_info;
 
+static char *mode_option_buf;
 static char *mode_option;
 
 /* process command line options, get vga parameter */
@@ -1761,8 +1762,12 @@ static int __init sm712fb_init(void)
 
 	if (fb_get_options("sm712fb", &option))
 		return -ENODEV;
-	if (option && *option)
-		mode_option = option;
+
+	if (option && *option) {
+		mode_option_buf = kstrdup(option, GFP_KERNEL); // ignore errors
+		mode_option = mode_option_buf;
+	}
+
 	sm7xx_vga_setup(mode_option);
 
 	return pci_register_driver(&smtcfb_driver);
@@ -1773,6 +1778,7 @@ module_init(sm712fb_init);
 static void __exit sm712fb_exit(void)
 {
 	pci_unregister_driver(&smtcfb_driver);
+	kfree(mode_option_buf);
 }
 
 module_exit(sm712fb_exit);
-- 
2.39.2

