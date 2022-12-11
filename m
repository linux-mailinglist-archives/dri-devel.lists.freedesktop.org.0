Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B309649492
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 14:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E94610E130;
	Sun, 11 Dec 2022 13:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C1B10E130
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 13:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1670766913; bh=xq+tOsyd0WnEBYZsDftkiZ/K0hXxhKqmak3ozClnAhA=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=Lw7qSXIeqY0zeGmSKrp3dOZ2ty0Y08YgUu/NU5OcVnZmRzmnrbv3QgL2NPJrD69rM
 zqjp4YLX3kM8FyRwyTwpBfS+vT/ECHRIHWCBGJhzXIk0YPdsMGeM0+icZpxRXX6Lnw
 dDZZujg51h0XESzbuOdd96640l5W2EFTrqla60nI=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 11 Dec 2022 14:55:13 +0100 (CET)
X-EA-Auth: 1vJpOd6xvyZUc0g7UMKSJAb/DUIrntROzP0Ci/lss0NuJBvm6qAzgGmuTPxapEaAUk3yo/Bjo0fCa7hkbNJRkqgJMiaiOOVj
Date: Sun, 11 Dec 2022 19:25:08 +0530
From: Deepak R Varma <drv@mailo.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sprd: remove redundant error logging
Message-ID: <Y5XhPJ39ipMCcctq@qemulion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>, drv@mailo.com,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A call to platform_get_irq() already prints an error on failure within
its own implementation. So printing another error based on its return
value in the caller is redundant and should be removed. The clean up
also makes if condition block braces unnecessary. Remove that as well.

Issue identified using platform_get_irq.cocci coccicheck script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 88f4259680f1..db0bcea1d9f4 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -803,10 +803,8 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
 	}

 	ctx->irq = platform_get_irq(pdev, 0);
-	if (ctx->irq < 0) {
-		dev_err(dev, "failed to get dpu irq\n");
+	if (ctx->irq < 0)
 		return ctx->irq;
-	}

 	/* disable and clear interrupts before register dpu IRQ. */
 	writel(0x00, ctx->base + REG_DPU_INT_EN);
--
2.34.1



