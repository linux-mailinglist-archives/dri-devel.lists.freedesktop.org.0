Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C26A7478
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 20:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECF210E090;
	Wed,  1 Mar 2023 19:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AF310E090
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 19:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1677700090; bh=G8Do2SeddR9IDejdzfXb3mJ2yINZAw/nhNCrxZzNMRY=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=gV519zEmvj4C4oNOXlhBA9+i64aevboY1rgNNx4PKLxoEWW6JgKJP23itMrurDJfu
 Px3lCOp2lbebQetpUtp7f787ciPnF1tGcHMUxzwDk3J7DptzLHsxeo4WvkQw0I4Dlb
 AO/qcQ0oantrR6J9L7YSOsn1DyVmzDhUcQeT/W5M=
Received: by b221-1.in.mailobj.net [192.168.90.21] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Wed,  1 Mar 2023 20:48:10 +0100 (CET)
X-EA-Auth: hASAmwc8c6mMvRs+drNOd7GE2MX2lpbv4ZZC16GwJGIyF7aeVvkjA9YVkK/0oDZC1lfNol3EpAbLXaI5MtKzcX/mGBkLHTrw
Date: Thu, 2 Mar 2023 01:18:06 +0530
From: Deepak R Varma <drv@mailo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] drm/tegra: sor: Remove redundant error logging
Message-ID: <Y/+r9jOO0s8sG4pX@ubun2204.myguest.virtualbox.org>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Deepak R Varma <drv@mailo.com>, Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A call to platform_get_irq() already prints an error on failure within
its own implementation. So printing another error based on its return
value in the caller is redundant and should be removed. The clean up
also makes if condition block braces unnecessary. Remove that as well.

Issue identified using platform_get_irq.cocci coccicheck script.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Note:
   Resending the patch for review and feedback. Originally sent on Dec 12 2022.

 drivers/gpu/drm/tegra/sor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 8af632740673..ceaebd33408d 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3799,10 +3799,8 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	}
 
 	err = platform_get_irq(pdev, 0);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ: %d\n", err);
+	if (err < 0)
 		goto remove;
-	}
 
 	sor->irq = err;
 
-- 
2.34.1



