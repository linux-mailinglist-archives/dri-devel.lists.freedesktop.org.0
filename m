Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B434CA836
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 15:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF16C10EC65;
	Wed,  2 Mar 2022 14:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2256510EC65
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 14:33:26 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id t14so1791689pgr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 06:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0sIENRZvxILtmvpY4H4oNP3TaQLHomMUS/EjkRlWEo8=;
 b=aol4B1k/NR7H0lhb2aPaSbwdRJNl8jNg/g1vcAmDhpcSyKE5QDIZdZh23rsQ0TsqQ9
 6QA2mj9pDf5q9eBB3AIeV15e7A1Q9339UPENfA1OhY/9boxvk7/3Ws6hoDWj8YZP2AIs
 ExjfRNI0wT2SOp2NF8rYdSFz22Ue152DWH1hI74x6XlcU2gLCekbvbz/1e9hUDJLE1lT
 6lz/sl6vu6QX7pIAEOgq2KlZZcOeqnUA4bAoVP285SsvVdCVikPmtLgHMuSwoS2z50BF
 z0yiUzyVAFJ3WeNKmrG2AwCctJX5Fa9MDgcGRbNbLGnRWmZkkOwzO2qYFNu+OqJDVqf4
 JvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0sIENRZvxILtmvpY4H4oNP3TaQLHomMUS/EjkRlWEo8=;
 b=V5EyCRviT7HIiy8thl60Vsl6NTFmcW6Rc+mg6WWR7Fs9nnIEE5QjwYX9sjnr5cjphR
 7WBVuzcW7AsNaYw9ghSoLRh6DhcssNFV5bW7LVF17MLj+L1irQewD8QoAxhshRA9AZmW
 18iV3IEcfEDnnYRXHd3Y5ILhLPS8crQfkMG3b6m7HPHH8s/XBgfVdTrMG2ns2iScEmmS
 jAiR76+uCQAu9dcwPMKJ0K7/bwb4Z621HsYhfZk2026A6ywjYgWyJNCTRc/VfOlHty4F
 SK7qRdWYf/WeYCVDuauMkzTlllxTXM4ezpkm+HpDT8NfkYHO71z8ODXVF/nlTYdt3wQs
 6LgA==
X-Gm-Message-State: AOAM532kOliXkOsF//1QGhKNGgvExMg9qmbekSto9JsOY9XThH4px9fY
 CiLfBLxgceytFQ7udbMRrw==
X-Google-Smtp-Source: ABdhPJwVAq9h3Tk5Iy7LJyj1GVFFUQ3PCW83XnkZ7TGnhHFTRH2di3DlYnTToAw6ChjCdsF2+6vqBw==
X-Received: by 2002:a65:6803:0:b0:378:9366:3849 with SMTP id
 l3-20020a656803000000b0037893663849mr13663277pgt.484.1646231605645; 
 Wed, 02 Mar 2022 06:33:25 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac0:23::815:bfc])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm5275176pjb.14.2022.03.02.06.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 06:33:25 -0800 (PST)
From: Zheyu Ma <zheyuma97@gmail.com>
To: deller@gmx.de,
	sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Subject: [PATCH] video: fbdev: sm712fb: Fix crash in smtcfb_write()
Date: Wed,  2 Mar 2022 22:33:11 +0800
Message-Id: <20220302143311.2109322-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the sm712fb driver writes three bytes to the framebuffer, the
driver will crash:

    BUG: unable to handle page fault for address: ffffc90001ffffff
    RIP: 0010:smtcfb_write+0x454/0x5b0
    Call Trace:
     vfs_write+0x291/0xd60
     ? do_sys_openat2+0x27d/0x350
     ? __fget_light+0x54/0x340
     ksys_write+0xce/0x190
     do_syscall_64+0x43/0x90
     entry_SYSCALL_64_after_hwframe+0x44/0xae

Fix it by removing the open-coded endianness fixup-code.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 drivers/video/fbdev/sm712fb.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index 0dbc6bf8268a..e355089ac7d6 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1130,7 +1130,7 @@ static ssize_t smtcfb_write(struct fb_info *info, const char __user *buf,
 		count = total_size - p;
 	}
 
-	buffer = kmalloc((count > PAGE_SIZE) ? PAGE_SIZE : count, GFP_KERNEL);
+	buffer = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buffer)
 		return -ENOMEM;
 
@@ -1148,24 +1148,11 @@ static ssize_t smtcfb_write(struct fb_info *info, const char __user *buf,
 			break;
 		}
 
-		for (i = c >> 2; i--;) {
-			fb_writel(big_swap(*src), dst++);
+		for (i = (c + 3) >> 2; i--;) {
+			fb_writel(big_swap(*src), dst);
+			dst++;
 			src++;
 		}
-		if (c & 3) {
-			u8 *src8 = (u8 *)src;
-			u8 __iomem *dst8 = (u8 __iomem *)dst;
-
-			for (i = c & 3; i--;) {
-				if (i & 1) {
-					fb_writeb(*src8++, ++dst8);
-				} else {
-					fb_writeb(*src8++, --dst8);
-					dst8 += 2;
-				}
-			}
-			dst = (u32 __iomem *)dst8;
-		}
 
 		*ppos += c;
 		buf += c;
-- 
2.25.1

