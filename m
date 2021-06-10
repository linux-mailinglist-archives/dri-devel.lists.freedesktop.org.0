Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729793A2533
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 09:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4206E5A2;
	Thu, 10 Jun 2021 07:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 991 seconds by postgrey-1.36 at gabe;
 Thu, 10 Jun 2021 06:57:34 UTC
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id BEE546E5A2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 06:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=y+e2b
 PmexqtbrmKw2MH4HI+pB5lEaw8BySK7BAtauXA=; b=E/drF/s30r49VUTPCp8i4
 4dpIEzzv6Rege3jBXcY0yKs1giE/kICHaEUoUvap/7QO1KQZS4TAn3JsTGrJ0fhL
 Qz9hhgzsew5UpjSYD2S0UI7vWjtBnAtQplZWjxYosURp/ijkr2XpNIMOkKgfydlK
 NImjFjMI+fqIfItFYGw0hQ=
Received: from localhost.localdomain (unknown [218.17.89.92])
 by smtp12 (Coremail) with SMTP id EMCowACXs0_Hs8FgENRawQ--.34426S2;
 Thu, 10 Jun 2021 14:40:08 +0800 (CST)
From: =?UTF-8?q?=C2=A0Zhongjun=20Tan?= <hbut_tan@163.com>
To: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jonathanh@nvidia.com
Subject: [PATCH] drm/tegra:Remove superfluous error messages around
 platform_get_irq()
Date: Thu, 10 Jun 2021 14:39:55 +0800
Message-Id: <20210610063955.1064-1-hbut_tan@163.com>
X-Mailer: git-send-email 2.30.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowACXs0_Hs8FgENRawQ--.34426S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrykKFy7tryDZw1furWDtwb_yoWfuFX_Ca
 4UZrn7Wr4S9r1qvFyDZry3Za42yFn09r48Z3ZrKa4Sy343J3WUG3yUWF18ur4UXw1UGas7
 X3W8Wr4avrsxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeC1vDUUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: xkex3sxwdqqiywtou0bp/xtbBqBetxl75dLHjvgAAsr
X-Mailman-Approved-At: Thu, 10 Jun 2021 07:19:00 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tan Zhongjun <tanzhongjun@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tan Zhongjun <tanzhongjun@yulong.com>

The platform_get_irq() prints error message telling that interrupt is
missing,hence there is no need to duplicated that message in the
drivers.

Signed-off-by: Tan Zhongjun <tanzhongjun@yulong.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 7d7cc90b6fc9..1f96e416fa08 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -467,10 +467,8 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 		return PTR_ERR(dpaux->regs);
 
 	dpaux->irq = platform_get_irq(pdev, 0);
-	if (dpaux->irq < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ\n");
+	if (dpaux->irq < 0)
 		return -ENXIO;
-	}
 
 	if (!pdev->dev.pm_domain) {
 		dpaux->rst = devm_reset_control_get(&pdev->dev, "dpaux");
-- 
2.17.1


