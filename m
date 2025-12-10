Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FFACB1BBF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 03:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAAA10E606;
	Wed, 10 Dec 2025 02:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="4LVFe9Gx";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="4LVFe9Gx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BA210E606
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 02:44:40 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=kSRtxOByk4IF8J7R6ECFkHoIsVsrQSlUVix1Pfmr2ZM=;
 b=4LVFe9GxsuS3UXHr5kIMlPNfHsB9Hk94E9Yzk0mP2ZjOewEjzjWwYcGKGH+lBI8fWOnaYj/a8
 utZ47Xoyv/1qfOlI4IxbATOzaeH3QFaElf1/0/5scRRMLtRWmWNCX3NmrSkwWhk3NcUFFR7caz4
 ZYLYjWojyoQUw8EtdrSsxOQ=
Received: from canpmsgout10.his.huawei.com (unknown [172.19.92.130])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4dR0Rc243vz1BG9g
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 10:44:28 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=kSRtxOByk4IF8J7R6ECFkHoIsVsrQSlUVix1Pfmr2ZM=;
 b=4LVFe9GxsuS3UXHr5kIMlPNfHsB9Hk94E9Yzk0mP2ZjOewEjzjWwYcGKGH+lBI8fWOnaYj/a8
 utZ47Xoyv/1qfOlI4IxbATOzaeH3QFaElf1/0/5scRRMLtRWmWNCX3NmrSkwWhk3NcUFFR7caz4
 ZYLYjWojyoQUw8EtdrSsxOQ=
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dR0PY12dWz1K98s;
 Wed, 10 Dec 2025 10:42:41 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id BA204140144;
 Wed, 10 Dec 2025 10:44:35 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Dec 2025 10:44:35 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 10 Dec 2025 10:44:34 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <fengsheng5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 drm-dp 4/4] drm/hisilicon/hibmc: Adding reset colorbar cfg
 in dp init.
Date: Wed, 10 Dec 2025 10:37:59 +0800
Message-ID: <20251210023759.3944834-5-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20251210023759.3944834-1-shiyongbang@huawei.com>
References: <20251210023759.3944834-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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

From: Baihan Li <libaihan@huawei.com>

Add colorbar disable operation before reset chontroller, to make sure
colorbar status is clear in the DP init, so if rmmod the driver and the
previous colorbar configuration will not affect the next time insmod the
driver.

Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Tao Tian <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index 8f8ca940b6b2..d5bd3c45649b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -180,6 +180,8 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
 	/* int init */
 	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
 	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
+	/* clr colorbar */
+	writel(0, dp_dev->base + HIBMC_DP_COLOR_BAR_CTRL);
 	/* rst */
 	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
 	usleep_range(30, 50);
-- 
2.33.0

