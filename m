Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205706AC65F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D6010E39A;
	Mon,  6 Mar 2023 16:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9872210E378
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:00:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3E68A1FDEB;
 Mon,  6 Mar 2023 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rlw6Y9HytpkB3h8X3sYp9Q/5dj2jl9fyg6laIqBFHmA=;
 b=UA0AU+8JNLwhTqGrlpZIn9kcDz7Pgg2tC5sBRfYuOum/1ZRLNPGUgOobCxgPjF/b49X92m
 X6VesbrhU3/K1VgbkEemX3jDIq9pyokGPfsW+8+AmMpIowBtz9z2WUGydPYIgwFjEXX6hx
 QryOCn3keLR0ITMjl5mQKPsguZo2B4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rlw6Y9HytpkB3h8X3sYp9Q/5dj2jl9fyg6laIqBFHmA=;
 b=b8tJbPSYaNtJ/8Uk5mCRRx6gPRMZLLKvfcW2ZfPdtD11XP/hPD5110toEAPpfNQjnjhchb
 JJZWioCGPKdTbxDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E36AC13513;
 Mon,  6 Mar 2023 16:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EKPFNiAOBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:00:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 24/99] fbdev/gbefb: Duplicate video-mode option string
Date: Mon,  6 Mar 2023 16:59:01 +0100
Message-Id: <20230306160016.4459-25-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
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
copy's memory with devm_kstrdup(), as the driver parses the option string
once per probed device. Linux will automatically free the memory upon
releasing the device.

Done in preparation of switching the driver to struct option_iter and
constifying the option string.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/gbefb.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 000b4aa44241..5330aa6029ca 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1083,7 +1083,7 @@ ATTRIBUTE_GROUPS(gbefb);
  * Initialization
  */
 
-static int gbefb_setup(char *options)
+static int gbefb_setup(char *options, struct device *dev)
 {
 	char *this_opt;
 
@@ -1108,8 +1108,9 @@ static int gbefb_setup(char *options)
 				gbe_mem_size = CONFIG_FB_GBE_MEM * 1024 * 1024;
 			if (gbe_mem_size < TILE_SIZE)
 				gbe_mem_size = TILE_SIZE;
-		} else
-			mode_option = this_opt;
+		} else {
+			mode_option = devm_kstrdup(dev, this_opt, GFP_KERNEL);
+		}
 	}
 	return 0;
 }
@@ -1132,7 +1133,7 @@ static int gbefb_probe(struct platform_device *p_dev)
 		ret = -ENODEV;
 		goto out_release_framebuffer;
 	}
-	gbefb_setup(options);
+	gbefb_setup(options, &p_dev->dev);
 #endif
 
 	if (!request_mem_region(GBE_BASE, sizeof(struct sgi_gbe), "GBE")) {
-- 
2.39.2

