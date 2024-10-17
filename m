Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4259A1890
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 04:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF6810E775;
	Thu, 17 Oct 2024 02:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="NUpPkwXG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3B210E775
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 02:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1729131869; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=sTQKUY9bYv2FQcppEn7rMkZGCklExQGuiP2W4/xe0z8=;
 b=NUpPkwXGsajCoeXqVRBAWPFR9XPmqD3kielJ4Y2RWrPnK3LNf14kx2pohB+tmUF4yL7AIq2Lv5P8INFnSu9sPfZi+lKsTUcIKSqNov3Zo3kyOtRnlfV1oMFM2SkXJUkDJDzdrYX+B2287xL3Hil/QrkOEi4Eb2BhJcSIdg0csBA=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WHJ8Nm9_1729131863 cluster:ay36) by smtp.aliyun-inc.com;
 Thu, 17 Oct 2024 10:24:28 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: stefan@agner.ch
Cc: alison.wang@nxp.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/fsl-dcu: Remove unnecessary print function dev_err()
Date: Thu, 17 Oct 2024 10:24:22 +0800
Message-Id: <20241017022422.23557-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
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

The print function dev_err() is redundant because
platform_get_irq_byname() already prints an error.

./drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c:278:2-9: line 278 is redundant because platform_get_irq() already prints an error.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11384
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 2b3f15f0dc56..60a7b9dbf95c 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -273,11 +273,8 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	fsl_dev->irq = platform_get_irq(pdev, 0);
-	if (fsl_dev->irq < 0) {
-		dev_err(dev, "failed to get irq\n");
+	if (platform_get_irq(pdev, 0) < 0)
 		return fsl_dev->irq;
-	}
 
 	fsl_dev->regmap = devm_regmap_init_mmio(dev, base,
 			&fsl_dcu_regmap_config);
-- 
2.32.0.3.g01195cf9f

