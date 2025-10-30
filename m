Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF7C221F4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 21:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7665F10EA13;
	Thu, 30 Oct 2025 20:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aXQChTiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826AC10EA13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 20:07:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so15696215e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 13:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761854846; x=1762459646; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IK5/MD5jQaHlgmEIIClreHp/khBkythuO8kivjpFv+4=;
 b=aXQChTiU04UHzPSnnxvsi+Og2O2y6wYY9fNDu3AFEHZ33F9oCXj46SU/llp4Yqpk+A
 qD0+K066x3byjzSVABAhzlV9eKaM2RL9nZEnH/Zh9T5PhpQPGOxRoZGwWs30Mqm3u4w2
 16vUXNcBFS+zpw/Y1FQxMhsLCQ942HTvpm+wzQ8I3QIAw+MQ3gOis9FsOxPLA7bVGYR/
 DQwiD9JxFeybdy/cMua5dSM17+aXBw8Ud4E9QVdommSNH6HyyDsN2EPWghBuaToashnK
 xSOUw2ZuwE4b2BGCYth2woILaNUHdq7dtz4ZxFPyM7vEIF+MMzHB3mtM7RBO2rzcV39f
 7Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761854846; x=1762459646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IK5/MD5jQaHlgmEIIClreHp/khBkythuO8kivjpFv+4=;
 b=HK6k8SdVlyvmv+Uf169Ik69jKNHbbN4Bru6WqyaJhd8c+xev6VzFMF9sLhv8vPhLuM
 GKgS2aYHsDXXQIx471cUTvUXAdNLvX5cRayDSTtzd7nDhhRW6pdBClmfA7NG6HHhZ4JD
 jQRQit8btXOTdaQwgD0VfjzyOECqe3J4Eer/TzRSxB2ocvTFsQ3ZQtngiT57gci7T/Cx
 01LHfHhA0JEBObxj4pxcFeCNDFng0WdMbUeoQevePGtnQwQ5xY3b8DM5ukbfl2dm6Qpy
 izrTCUP9H4lTolD7y1OGs8VXx2YQpmyPuZX4MNzXh6a/C7YgXMgvN1vSwQ0X7ZmzK8RQ
 4h8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCURkkYbbXi5nKMUTBxT8iLVqYSzHlb8wYKfmaFqKR/KxPFrybbYF+Xmrg4CszhUWBXG8pPkCdgvEMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylx0ewfIkJ8/RdF9hWqu0NZ7liYtItYrfv/oJXCYte+TEUc1ev
 S/yYuJ1SDIMYtPSxVvW0GvKl5yDEsuMTOSke/8YoySJp/iABM/ZbVbIr
X-Gm-Gg: ASbGnctjZZJww+uTu+0WA/WsqbVACXCQmOaRUcCq3hY5enwwUhmkIcBQno5ribl+/p3
 KBQhxn12dQVNzQKb+T+r1eP2g1HizE120TwQE1rRPUZB+yO6QMMdDN81IjRMYE54K45cxcKHHQH
 y7Kk9qAa0mNoTrN/6CpvdnUGLFHZaFuzASXvcY7JG93bIViLdbuAfDTL/4wmFwAfNwIsVusKUO+
 oxLs8Z9cv8sDAnUt2WeUgDqrm+b2AhxWWcffOuCRhMgtzsP45yERzcW07xyEP5XazJmFTEPDRbs
 y6W7yH4g3bo0m7a8GD82dFzVkojZu5swdo3IgsuI7usBHtsTocYlYLBKOKHuWKWSv08/q0kJ4SE
 SWQx3XQq8/dd5SngeoKAPfw+6AoNI4FmtSwNgdW+fShvCY30xFVXv4ZBRR5Ir+6xOMX7krM+dIl
 00YVhoHg7Gzlv5iFqU+C2bD7IXnUzFpVv+jY7KhlCGEDZ/hAnR0Q+Aiqn6u7A=
X-Google-Smtp-Source: AGHT+IEKK73PbMSHf6dhhfOw/8d7gi7F8JIqgvvWZVKIGfNyOVCe87Tf3SMiH0lxF2XB6hun78s0fA==
X-Received: by 2002:a05:600c:1c93:b0:46e:37d5:dbed with SMTP id
 5b1f17b1804b1-4773010414fmr11136175e9.12.1761854845631; 
 Thu, 30 Oct 2025 13:07:25 -0700 (PDT)
Received: from dell (229.red-88-1-12.dynamicip.rima-tde.net. [88.1.12.229])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952da645sm32485309f8f.30.2025.10.30.13.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 13:07:25 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH v2] fbdev/vesafb: Use dev_* fn's instead printk.
Date: Thu, 30 Oct 2025 21:07:23 +0100
Message-ID: <20251030200723.2788931-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251028185021.2758401-1-rampxxxx@gmail.com>
References: <20251028185021.2758401-1-rampxxxx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Family dev_* fn's will show device name, giving extra info to logs.
- Delete the prefix `vesafb:` from msg strings, not needed now.

[    0.981825] vesa-framebuffer vesa-framebuffer.0: scrolling: redraw

Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
v1 -> v2:
      * Fix checkpatch.pl messages, thanks Helge Deller.
      * v1 https://lore.kernel.org/lkml/20251028185021.2758401-1-rampxxxx@gmail.com/

 drivers/video/fbdev/vesafb.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index a81df8865143..f135033c22fb 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -314,8 +314,8 @@ static int vesafb_probe(struct platform_device *dev)
 #endif
 
 	if (!request_mem_region(vesafb_fix.smem_start, size_total, "vesafb")) {
-		printk(KERN_WARNING
-		       "vesafb: cannot reserve video memory at 0x%lx\n",
+		dev_warn(&dev->dev,
+		       "cannot reserve video memory at 0x%lx\n",
 			vesafb_fix.smem_start);
 		/* We cannot make this fatal. Sometimes this comes from magic
 		   spaces our resource handlers simply don't know about */
@@ -333,12 +333,12 @@ static int vesafb_probe(struct platform_device *dev)
 	par->base = si->lfb_base;
 	par->size = size_total;
 
-	printk(KERN_INFO "vesafb: mode is %dx%dx%d, linelength=%d, pages=%d\n",
+	dev_info(&dev->dev, "mode is %dx%dx%d, linelength=%d, pages=%d\n",
 	       vesafb_defined.xres, vesafb_defined.yres, vesafb_defined.bits_per_pixel,
 	       vesafb_fix.line_length, si->pages);
 
 	if (si->vesapm_seg) {
-		printk(KERN_INFO "vesafb: protected mode interface info at %04x:%04x\n",
+		dev_info(&dev->dev, "protected mode interface info at %04x:%04x\n",
 		       si->vesapm_seg, si->vesapm_off);
 	}
 
@@ -352,9 +352,10 @@ static int vesafb_probe(struct platform_device *dev)
 		pmi_base  = (unsigned short *)phys_to_virt(pmi_phys);
 		pmi_start = (void*)((char*)pmi_base + pmi_base[1]);
 		pmi_pal   = (void*)((char*)pmi_base + pmi_base[2]);
-		printk(KERN_INFO "vesafb: pmi: set display start = %p, set palette = %p\n",pmi_start,pmi_pal);
+		dev_info(&dev->dev, "pmi: set display start = %p, set palette = %p\n",
+			 pmi_start, pmi_pal);
 		if (pmi_base[3]) {
-			printk(KERN_INFO "vesafb: pmi: ports = ");
+			dev_info(&dev->dev, "pmi: ports = ");
 			for (i = pmi_base[3]/2; pmi_base[i] != 0xffff; i++)
 				printk("%x ", pmi_base[i]);
 			printk("\n");
@@ -365,14 +366,14 @@ static int vesafb_probe(struct platform_device *dev)
 				 * Rules are: we have to set up a descriptor for the requested
 				 * memory area and pass it in the ES register to the BIOS function.
 				 */
-				printk(KERN_INFO "vesafb: can't handle memory requests, pmi disabled\n");
+				dev_info(&dev->dev, "can't handle memory requests, pmi disabled\n");
 				ypan = pmi_setpal = 0;
 			}
 		}
 	}
 
 	if (vesafb_defined.bits_per_pixel == 8 && !pmi_setpal && !vga_compat) {
-		printk(KERN_WARNING "vesafb: hardware palette is unchangeable,\n"
+		dev_warn(&dev->dev, "hardware palette is unchangeable,\n"
 		                    "        colors may be incorrect\n");
 		vesafb_fix.visual = FB_VISUAL_STATIC_PSEUDOCOLOR;
 	}
@@ -380,10 +381,10 @@ static int vesafb_probe(struct platform_device *dev)
 	vesafb_defined.xres_virtual = vesafb_defined.xres;
 	vesafb_defined.yres_virtual = vesafb_fix.smem_len / vesafb_fix.line_length;
 	if (ypan && vesafb_defined.yres_virtual > vesafb_defined.yres) {
-		printk(KERN_INFO "vesafb: scrolling: %s using protected mode interface, yres_virtual=%d\n",
+		dev_info(&dev->dev, "scrolling: %s using protected mode interface, yres_virtual=%d\n",
 		       (ypan > 1) ? "ywrap" : "ypan",vesafb_defined.yres_virtual);
 	} else {
-		printk(KERN_INFO "vesafb: scrolling: redraw\n");
+		dev_info(&dev->dev, "scrolling: redraw\n");
 		vesafb_defined.yres_virtual = vesafb_defined.yres;
 		ypan = 0;
 	}
@@ -410,7 +411,7 @@ static int vesafb_probe(struct platform_device *dev)
 		vesafb_defined.bits_per_pixel;
 	}
 
-	printk(KERN_INFO "vesafb: %s: "
+	dev_info(&dev->dev, "%s: "
 	       "size=%d:%d:%d:%d, shift=%d:%d:%d:%d\n",
 	       (vesafb_defined.bits_per_pixel > 8) ?
 	       "Truecolor" : (vga_compat || pmi_setpal) ?
@@ -453,14 +454,14 @@ static int vesafb_probe(struct platform_device *dev)
 	}
 
 	if (!info->screen_base) {
-		printk(KERN_ERR
-		       "vesafb: abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
+		dev_err(&dev->dev,
+		       "abort, cannot ioremap video memory 0x%x @ 0x%lx\n",
 			vesafb_fix.smem_len, vesafb_fix.smem_start);
 		err = -EIO;
 		goto err_release_region;
 	}
 
-	printk(KERN_INFO "vesafb: framebuffer at 0x%lx, mapped to 0x%p, "
+	dev_info(&dev->dev, "framebuffer at 0x%lx, mapped to 0x%p, "
 	       "using %dk, total %dk\n",
 	       vesafb_fix.smem_start, info->screen_base,
 	       size_remap/1024, size_total/1024);
-- 
2.50.1

