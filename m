Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF566B2992
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E789410E8A1;
	Thu,  9 Mar 2023 16:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E620310E85E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A35C620184;
 Thu,  9 Mar 2023 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaSo/FjIqDYQ8wz/hJX7q8fOkI//7V7PpDYHGeI1dog=;
 b=Zl37TQUBIFv35lY19n3nS3tLa2FFsxJiXyKu0ntn9OitQvN9qV64et55L5ncF8OcVjf1WG
 +XhohQK5UXH052azkgnzyxd2nz1Qkd2OpTkdSpPgCbdwQm66W2+1CxhiLiFNZG+6j0kYbB
 FCaopvk9eAADime7c/aNy05Dz1WxNs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377733;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EaSo/FjIqDYQ8wz/hJX7q8fOkI//7V7PpDYHGeI1dog=;
 b=5Z9bcjxfst7+0FQNfLF+GH7Fj0qv2kRw4n2NnnA6eoV1qR3tPb9t9COkW0Qxg//N/8Sp1y
 VxZyjZLTaEHrOGCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D4AF1391B;
 Thu,  9 Mar 2023 16:02:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJ7uDQUDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 022/101] fbdev/fsl-diu-fb: Duplicate video-mode option
 string
Date: Thu,  9 Mar 2023 17:00:42 +0100
Message-Id: <20230309160201.5163-23-tzimmermann@suse.de>
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
	* replace static memory with kstrdup()/kfree() (Geert, Timur)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/fsl-diu-fb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index e332017c6af6..033bbf0c40b7 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -307,6 +307,7 @@ static struct fb_videomode fsl_diu_mode_db[] = {
 	},
 };
 
+static char *fb_mode_buf;
 static char *fb_mode;
 static unsigned long default_bpp = 32;
 static enum fsl_diu_monitor_port monitor_port;
@@ -1858,8 +1859,11 @@ static int __init fsl_diu_setup(char *options)
 		} else if (!strncmp(opt, "bpp=", 4)) {
 			if (!kstrtoul(opt + 4, 10, &val))
 				default_bpp = val;
-		} else
-			fb_mode = opt;
+		} else {
+			kfree(fb_mode_buf);
+			fb_mode_buf = kstrdup(opt, GFP_KERNEL); // ignore errors
+			fb_mode = fb_mode_buf;
+		}
 	}
 
 	return 0;
@@ -1978,6 +1982,7 @@ static void __exit fsl_diu_exit(void)
 #if defined(CONFIG_NOT_COHERENT_CACHE)
 	vfree(coherence_data);
 #endif
+	kfree(fb_mode_buf);
 }
 
 module_init(fsl_diu_init);
-- 
2.39.2

