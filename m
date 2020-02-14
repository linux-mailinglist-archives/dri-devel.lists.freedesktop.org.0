Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD3D15E121
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 17:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C332C6FAD3;
	Fri, 14 Feb 2020 16:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26DF6FAD3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:17:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B396B246E1;
 Fri, 14 Feb 2020 16:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697054;
 bh=8Tg0HQeU8QFKYHVtVIxc5GOOIl8RtN1hrGNhC1kUx4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hu3sFqQjzfKKLPuvdQg8zPPrw/BIDcHCKT+JZ8SOBFb3PCuapE3eafC5IrDaVf4rQ
 3ImWYdnLFu/4rwYR/C8M8yye3Y60cjonW2YMkFSUCTuS7Dtph3FjiL8l/6b4VrO0Vb
 5OcnyyueMWQ4nPe0fP9Xb6LM0giBt1g19QaUus6E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 014/186] pxa168fb: Fix the function used to
 release some memory in an error handling path
Date: Fri, 14 Feb 2020 11:14:23 -0500
Message-Id: <20200214161715.18113-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161715.18113-1-sashal@kernel.org>
References: <20200214161715.18113-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit 3c911fe799d1c338d94b78e7182ad452c37af897 ]

In the probe function, some resources are allocated using 'dma_alloc_wc()',
they should be released with 'dma_free_wc()', not 'dma_free_coherent()'.

We already use 'dma_free_wc()' in the remove function, but not in the
error handling path of the probe function.

Also, remove a useless 'PAGE_ALIGN()'. 'info->fix.smem_len' is already
PAGE_ALIGNed.

Fixes: 638772c7553f ("fb: add support of LCD display controller on pxa168/910 (base layer)")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Lubomir Rintel <lkundrak@v3.sk>
CC: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20190831100024.3248-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/pxa168fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index d059d04c63acd..20195d3dbf088 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -769,8 +769,8 @@ static int pxa168fb_probe(struct platform_device *pdev)
 failed_free_clk:
 	clk_disable_unprepare(fbi->clk);
 failed_free_fbmem:
-	dma_free_coherent(fbi->dev, info->fix.smem_len,
-			info->screen_base, fbi->fb_start_dma);
+	dma_free_wc(fbi->dev, info->fix.smem_len,
+		    info->screen_base, fbi->fb_start_dma);
 failed_free_info:
 	kfree(info);
 
@@ -804,7 +804,7 @@ static int pxa168fb_remove(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 
-	dma_free_wc(fbi->dev, PAGE_ALIGN(info->fix.smem_len),
+	dma_free_wc(fbi->dev, info->fix.smem_len,
 		    info->screen_base, info->fix.smem_start);
 
 	clk_disable_unprepare(fbi->clk);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
