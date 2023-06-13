Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC172E098
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 13:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C68610E379;
	Tue, 13 Jun 2023 11:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9084B10E378
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 11:10:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B5C01FD9B;
 Tue, 13 Jun 2023 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686654601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgRWkj4ohO0KZCbdDBuPVV97H141ZbSM13kcN600c2k=;
 b=zbJ6q17gN8z70oqaqKqYOGRakhvg0MbJtIIg+o+DeiVqehX4j9aCFpHcRwxRU7Z7rTKQ5t
 f2HvzzQ9ZUU7AlYT3riteoeQJIFhBNK0hiqqcaAKRYURq+VplkkzBMg+g1sCN1U6pkFzi3
 R00/iqjza3qieg7tUoKlcDTqAiYBjMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686654601;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgRWkj4ohO0KZCbdDBuPVV97H141ZbSM13kcN600c2k=;
 b=pIjnNyxvGQUaS/zeU12bEmPVy9t4gCOAOw0wkygp3pDUeluFfLgW/eBwzhfSOeCSyTtNPF
 rxGmQ9YXgFdbbCCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E667E13A47;
 Tue, 13 Jun 2023 11:10:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UNF+N4hOiGR8CQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 11:10:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
 geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, dan.carpenter@linaro.org, michael.j.ruhl@intel.com
Subject: [PATCH v3 15/38] fbdev/fsl-diu-fb: Output messages with fb_*() helpers
Date: Tue, 13 Jun 2023 13:06:50 +0200
Message-ID: <20230613110953.24176-16-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Timur Tabi <timur@kernel.org>,
 linux-sh@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix cases were output helpers are called with struct fb_info.dev.
Use fb_*() helpers instead. Prepares fbdev for making struct
fb_info.dev optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Timur Tabi <timur@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/fsl-diu-fb.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index 730a07d23fa92..785eb8a06943f 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -872,7 +872,7 @@ static int map_video_memory(struct fb_info *info)
 
 	p = alloc_pages_exact(smem_len, GFP_DMA | __GFP_ZERO);
 	if (!p) {
-		dev_err(info->dev, "unable to allocate fb memory\n");
+		fb_err(info, "unable to allocate fb memory\n");
 		return -ENOMEM;
 	}
 	mutex_lock(&info->mm_lock);
@@ -1145,7 +1145,7 @@ static int fsl_diu_set_par(struct fb_info *info)
 
 		/* Memory allocation for framebuffer */
 		if (map_video_memory(info)) {
-			dev_err(info->dev, "unable to allocate fb memory 1\n");
+			fb_err(info, "unable to allocate fb memory 1\n");
 			return -ENOMEM;
 		}
 	}
@@ -1277,16 +1277,16 @@ static int fsl_diu_ioctl(struct fb_info *info, unsigned int cmd,
 	if (!arg)
 		return -EINVAL;
 
-	dev_dbg(info->dev, "ioctl %08x (dir=%s%s type=%u nr=%u size=%u)\n", cmd,
+	fb_dbg(info, "ioctl %08x (dir=%s%s type=%u nr=%u size=%u)\n", cmd,
 		_IOC_DIR(cmd) & _IOC_READ ? "R" : "",
 		_IOC_DIR(cmd) & _IOC_WRITE ? "W" : "",
 		_IOC_TYPE(cmd), _IOC_NR(cmd), _IOC_SIZE(cmd));
 
 	switch (cmd) {
 	case MFB_SET_PIXFMT_OLD:
-		dev_warn(info->dev,
-			 "MFB_SET_PIXFMT value of 0x%08x is deprecated.\n",
-			 MFB_SET_PIXFMT_OLD);
+		fb_warn(info,
+			"MFB_SET_PIXFMT value of 0x%08x is deprecated.\n",
+			MFB_SET_PIXFMT_OLD);
 		fallthrough;
 	case MFB_SET_PIXFMT:
 		if (copy_from_user(&pix_fmt, buf, sizeof(pix_fmt)))
@@ -1294,9 +1294,9 @@ static int fsl_diu_ioctl(struct fb_info *info, unsigned int cmd,
 		ad->pix_fmt = pix_fmt;
 		break;
 	case MFB_GET_PIXFMT_OLD:
-		dev_warn(info->dev,
-			 "MFB_GET_PIXFMT value of 0x%08x is deprecated.\n",
-			 MFB_GET_PIXFMT_OLD);
+		fb_warn(info,
+			"MFB_GET_PIXFMT value of 0x%08x is deprecated.\n",
+			MFB_GET_PIXFMT_OLD);
 		fallthrough;
 	case MFB_GET_PIXFMT:
 		pix_fmt = ad->pix_fmt;
@@ -1375,7 +1375,7 @@ static int fsl_diu_ioctl(struct fb_info *info, unsigned int cmd,
 	}
 #endif
 	default:
-		dev_err(info->dev, "unknown ioctl command (0x%08X)\n", cmd);
+		fb_err(info, "unknown ioctl command (0x%08X)\n", cmd);
 		return -ENOIOCTLCMD;
 	}
 
@@ -1543,21 +1543,21 @@ static int install_fb(struct fb_info *info)
 	}
 
 	if (fsl_diu_check_var(&info->var, info)) {
-		dev_err(info->dev, "fsl_diu_check_var failed\n");
+		fb_err(info, "fsl_diu_check_var failed\n");
 		unmap_video_memory(info);
 		fb_dealloc_cmap(&info->cmap);
 		return -EINVAL;
 	}
 
 	if (register_framebuffer(info) < 0) {
-		dev_err(info->dev, "register_framebuffer failed\n");
+		fb_err(info, "register_framebuffer failed\n");
 		unmap_video_memory(info);
 		fb_dealloc_cmap(&info->cmap);
 		return -EINVAL;
 	}
 
 	mfbi->registered = 1;
-	dev_info(info->dev, "%s registered successfully\n", mfbi->id);
+	fb_info(info, "%s registered successfully\n", mfbi->id);
 
 	return 0;
 }
-- 
2.41.0

