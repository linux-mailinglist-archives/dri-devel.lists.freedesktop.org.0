Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F26FA4F476
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 03:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B10C10E03F;
	Wed,  5 Mar 2025 02:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ajd0xNt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 05 Mar 2025 02:11:07 UTC
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F36710E03F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 02:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1741140665; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=pRK4bd+Uu1FKHV8nOIix+G9vPECpr4JTmDRvSH2QUF0=;
 b=ajd0xNt8SibiX2Mi5BHH/iNnZAx8GaEIC0vHcxC/QW9tqThTf4SxPaBisDlyy9cefbPmhuw1zrdw7idC7+V9AKM4Gmhx67E80Nd/AKT1FnBDO/vAgYMO9BrWnBrcYXRChdNdVgHHdsD8yH76PMQjFqIyFPneXsN1zNO7I0clEhI=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WQjmW2l_1741140347 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 05 Mar 2025 10:05:58 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: fnkl.kernel@gmail.com
Cc: j@jannau.net, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm: adp: Remove unnecessary print function dev_err()
Date: Wed,  5 Mar 2025 10:05:46 +0800
Message-Id: <20250305020546.96564-1-jiapeng.chong@linux.alibaba.com>
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

The print function dev_err() is redundant because platform_get_irq_byname()
already prints an error.

./drivers/gpu/drm/adp/adp_drv.c:470:2-9: line 470 is redundant because platform_get_irq() already prints an error.
./drivers/gpu/drm/adp/adp_drv.c:476:2-9: line 476 is redundant because platform_get_irq() already prints an error.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19211
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/adp/adp_drv.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 0a39abdc9238..0eeb9e5fab26 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -466,16 +466,12 @@ static int adp_parse_of(struct platform_device *pdev, struct adp_drv_private *ad
 	}
 
 	adp->be_irq = platform_get_irq_byname(pdev, "be");
-	if (adp->be_irq < 0) {
-		dev_err(dev, "failed to find be irq");
+	if (adp->be_irq < 0)
 		return adp->be_irq;
-	}
 
 	adp->fe_irq = platform_get_irq_byname(pdev, "fe");
-	if (adp->fe_irq < 0) {
-		dev_err(dev, "failed to find fe irq");
+	if (adp->fe_irq < 0)
 		return adp->fe_irq;
-	}
 
 	return 0;
 }
-- 
2.32.0.3.g01195cf9f

