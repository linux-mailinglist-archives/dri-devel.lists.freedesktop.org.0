Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D875D638780
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D874A10E714;
	Fri, 25 Nov 2022 10:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3DC10E713
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 10:27:01 +0000 (UTC)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NJWCT2MYyzbnhY;
 Fri, 25 Nov 2022 18:23:01 +0800 (CST)
Received: from huawei.com (10.175.103.91) by kwepemi500024.china.huawei.com
 (7.221.188.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 25 Nov
 2022 18:26:57 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <jonathanh@nvidia.com>, <daniel@ffwll.ch>, <thierry.reding@gmail.com>,
 <airlied@gmail.com>, <mperttunen@nvidia.com>
Subject: [PATCH] drm/tegra: Add check for dma_alloc_coherent()
Date: Fri, 25 Nov 2022 18:25:04 +0800
Message-ID: <20221125102504.3063623-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500024.china.huawei.com (7.221.188.100)
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
Cc: linux-tegra@vger.kernel.org, liwei391@huawei.com, zengheng4@huawei.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the dma_alloc_coherent() may return NULL,
the pointer returned needs to be checked to avoid
null-poineter dereference.

Fixes: 46f226c93d35 ("drm/tegra: Add NVDEC driver")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 276fe0472730..4f667fb502d8 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -216,6 +216,8 @@ static int nvdec_load_firmware(struct nvdec *nvdec)
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
 	}
+	if (IS_ERR_OR_NULL(virt))
+		return -ENOMEM;
 
 	nvdec->falcon.firmware.virt = virt;
 	nvdec->falcon.firmware.iova = iova;
-- 
2.25.1

