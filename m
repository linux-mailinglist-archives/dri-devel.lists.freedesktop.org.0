Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9455472E08D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3903010E380;
	Tue, 13 Jun 2023 11:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C0A10E36B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 619461FDA7;
 Tue, 13 Jun 2023 11:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+Pej+DjtuslhRkqSbqykfmY3R1IGvKyLMb1wCzPsnA=;
 b=DPCy6m3/VoljsI4nL85OtZJkvAEjkY7VIh384polvAzdZI0R/H09cLfHmiysnYAztjsd7Q
 7Nu15mdsj95TGchL3ik5Il/vUYWQT83VTNjDA3Yy1BTOKxdO15IPDGwBSBwjyIo13XxjSC
 5vCy8hCHueof/0WuJ0szfScdyOn/rpw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654605;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+Pej+DjtuslhRkqSbqykfmY3R1IGvKyLMb1wCzPsnA=;
 b=9z2qqSYJdYO4whOJ9l9oFrTLJwBXOJqfq4+4rtK6NiiIkNufrM06d5VbAmrFmjZ3tEjz5q
 JcuK6R3S2IrIDnAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15F0E13483;
 Tue, 13 Jun 2023 11:10:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cOCCBI1OiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 28/38] fbdev/sh7760fb: Use hardware device with dev_()
 output during probe
Date: Tue, 13 Jun 2023 13:07:03 +0200
Message-ID: <20230613110953.24176-29-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613110953.24176-1-tzimmermann@suse.de>
References: <20230613110953.24176-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call output helpers in the probe function with the hardware device.
The virtual fbdev device has not been initialized at that point. Also
prepares fbdev for making struct fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/sh7760fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/sh7760fb.c b/drivers/video/fbdev/sh7760fb.c
index 74543a1e30314..8566bcd664076 100644
--- a/drivers/video/fbdev/sh7760fb.c
+++ b/drivers/video/fbdev/sh7760fb.c
@@ -450,7 +450,7 @@ static int sh7760fb_probe(struct platform_device *pdev)
 
 	par->pd = pdev->dev.platform_data;
 	if (!par->pd) {
-		dev_dbg(info->dev, "no display setup data!\n");
+		dev_dbg(&pdev->dev, "no display setup data!\n");
 		ret = -ENODEV;
 		goto out_fb;
 	}
@@ -519,13 +519,13 @@ static int sh7760fb_probe(struct platform_device *pdev)
 
 	ret = fb_alloc_cmap(&info->cmap, 256, 0);
 	if (ret) {
-		dev_dbg(info->dev, "Unable to allocate cmap memory\n");
+		dev_dbg(&pdev->dev, "Unable to allocate cmap memory\n");
 		goto out_mem;
 	}
 
 	ret = register_framebuffer(info);
 	if (ret < 0) {
-		dev_dbg(info->dev, "cannot register fb!\n");
+		dev_dbg(&pdev->dev, "cannot register fb!\n");
 		goto out_cmap;
 	}
 	platform_set_drvdata(pdev, info);
-- 
2.41.0

