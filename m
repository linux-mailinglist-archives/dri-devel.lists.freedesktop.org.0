Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D07176DF41
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 06:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D847A10E592;
	Thu,  3 Aug 2023 04:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF39210E592
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 04:04:39 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RGZtz2BSNzVjj9;
 Thu,  3 Aug 2023 12:02:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 12:04:36 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <robh@kernel.org>,
 <tomeu.vizoso@collabora.com>, <steven.price@arm.com>,
 <alyssa.rosenzweig@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next v2 1/2] drm/panfrost: Do not check for 0 return after
 calling platform_get_irq_byname()
Date: Thu, 3 Aug 2023 12:03:59 +0800
Message-ID: <20230803040401.3067484-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803040401.3067484-1-ruanjinjie@huawei.com>
References: <20230803040401.3067484-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
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
Cc: ruanjinjie@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is not possible for platform_get_irq_byname() to return 0.
Use the return value from platform_get_irq_byname().

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_job.c | 4 ++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index d28b99732dde..2faa344d89ee 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -390,8 +390,8 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
 	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
 
 	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
-	if (irq <= 0)
-		return -ENODEV;
+	if (irq < 0)
+		return irq;
 
 	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index dbc597ab46fb..3322b3024937 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -794,8 +794,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	spin_lock_init(&js->job_lock);
 
 	js->irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "job");
-	if (js->irq <= 0)
-		return -ENODEV;
+	if (js->irq < 0)
+		return js->irq;
 
 	ret = devm_request_threaded_irq(pfdev->dev, js->irq,
 					panfrost_job_irq_handler,
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index c0123d09f699..d54d4e7b2195 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -755,8 +755,8 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
 	int err, irq;
 
 	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
-	if (irq <= 0)
-		return -ENODEV;
+	if (irq < 0)
+		return irq;
 
 	err = devm_request_threaded_irq(pfdev->dev, irq,
 					panfrost_mmu_irq_handler,
-- 
2.34.1

