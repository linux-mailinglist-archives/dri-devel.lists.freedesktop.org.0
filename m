Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA35D7F281D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 09:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24DA10E29F;
	Tue, 21 Nov 2023 08:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BB6A10E00B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 00:01:35 +0000 (UTC)
Received: from skinsburskii. (c-67-170-100-148.hsd1.wa.comcast.net
 [67.170.100.148])
 by linux.microsoft.com (Postfix) with ESMTPSA id AC31C20B74C0;
 Mon, 20 Nov 2023 16:01:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AC31C20B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1700524894;
 bh=sQWhnXGgZQ7YwEyDzOAZTBFetm3LSSh/DiSLoL2dKqE=;
 h=Subject:From:To:Date:From;
 b=Tt415sadYnFe4NBgqwsRCPkCLeRUKOn3XqjaDydH4QAJdXH9xdsUY5SsN/SELu9J4
 s3rMxB+2wEDz89WuprBgypyckXddwep97UmAEafieFG/qyex/Mq1RcjFkdCbvVbV1d
 6oQ972xRFkX8WrRoxLoh8mX1ZAQ7OjLSLq6y/fiQ=
Subject: [PATCH v2] fbdev/fsl-diu-fb: Fix srapse warning due to virt_to_phys()
 prototype change
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: timur@kernel.org, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 20 Nov 2023 16:01:33 -0800
Message-ID: <170052488691.21532.13211751644917367476.stgit@skinsburskii.>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 21 Nov 2023 08:54:58 +0000
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

Explicitly cast __iomem pointer to const void* with __force to fix the
following warning:

   incorrect type in argument 1 (different address spaces)
      expected void const volatile *address
      got char [noderef] __iomem *screen_base

Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311161120.BgyxTBMQ-lkp@intel.com/
---
 drivers/video/fbdev/fsl-diu-fb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index 7fbd9f069ac2..b0fda5bd1964 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -877,7 +877,7 @@ static int map_video_memory(struct fb_info *info)
 	}
 	mutex_lock(&info->mm_lock);
 	info->screen_base = p;
-	info->fix.smem_start = virt_to_phys(info->screen_base);
+	info->fix.smem_start = virt_to_phys((__force const void *)info->screen_base);
 	info->fix.smem_len = smem_len;
 	mutex_unlock(&info->mm_lock);
 	info->screen_size = info->fix.smem_len;


