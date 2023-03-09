Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32706B29CE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26EF10E8B0;
	Thu,  9 Mar 2023 16:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09EA10E1A8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6DA9522163;
 Thu,  9 Mar 2023 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHsw9G40HD12yWMfW+3kaONrrrxFvi6OorhBwRazvNw=;
 b=B6Nvx8dkSj/OuX3zLARuzm8vSuXgcocSuJ64uOslQxtq5UrlzuVeuxSn1ErjZi3/1k1HPx
 Hl2QEF0xiXJvD044nqLxt6sXP6l5YM4rCR07kznwZ2T91F55Sfz77toaePc2oEQ5yLb0i9
 J7yB4F0craiC8zEvcQP4oJzcfH/Q06A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHsw9G40HD12yWMfW+3kaONrrrxFvi6OorhBwRazvNw=;
 b=U6ZELyDp1F44OU7kM0Bc/rgo3cqI2drgIFZ4W2eywOt8CWDyHqIbljR/CH9s4oXdcfv6TA
 PpioaS121e3OYbAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 079B513A73;
 Thu,  9 Mar 2023 16:02:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gHXcABkDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 072/101] fbdev/sisfb: Constify mode string
Date: Thu,  9 Mar 2023 17:01:32 +0100
Message-Id: <20230309160201.5163-73-tzimmermann@suse.de>
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

Constify the intenal video-mode string that is passed around among
functions. The caller owns the memory and callees do not modify its
content. This change will later allow to constify the option string.
No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sis/sis_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index cfba776afcea..c16493d3ac4f 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -73,7 +73,7 @@ static int	sisfb_blank(int blank,
 static void sisfb_handle_command(struct sis_video_info *ivideo,
 				 struct sisfb_cmd *sisfb_command);
 
-static void	sisfb_search_mode(char *name, bool quiet);
+static void	sisfb_search_mode(const char *name, bool quiet);
 static int	sisfb_validate_mode(struct sis_video_info *ivideo, int modeindex, u32 vbflags);
 static u8	sisfb_search_refresh_rate(struct sis_video_info *ivideo, unsigned int rate,
 				int index);
@@ -180,12 +180,12 @@ static void sisfb_search_vesamode(unsigned int vesamode, bool quiet)
 		printk(KERN_ERR "sisfb: Invalid VESA mode 0x%x'\n", vesamode);
 }
 
-static void sisfb_search_mode(char *name, bool quiet)
+static void sisfb_search_mode(const char *name, bool quiet)
 {
 	unsigned int j = 0, xres = 0, yres = 0, depth = 0, rate = 0;
 	int i = 0;
 	char strbuf[16], strbuf1[20];
-	char *nameptr = name;
+	const char *nameptr = name;
 
 	/* We don't know the hardware specs yet and there is no ivideo */
 
-- 
2.39.2

