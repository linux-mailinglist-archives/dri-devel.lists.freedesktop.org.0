Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CAEA1CFBD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 04:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BFA10E16A;
	Mon, 27 Jan 2025 03:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A4310E16A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 03:27:19 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YhDKL4xjKz1l0Bj;
 Mon, 27 Jan 2025 11:23:50 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id ABCDE140120;
 Mon, 27 Jan 2025 11:27:15 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 27 Jan 2025 11:27:14 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 drm-dp 0/4] Add HPD, getting EDID,
 colorbar features in DP function
Date: Mon, 27 Jan 2025 11:20:20 +0800
Message-ID: <20250127032024.1542219-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500013.china.huawei.com (7.221.188.12)
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

To support DP HPD, edid printing, and colorbar display features based on
the Hisislcon DP devices. 

Baihan Li (4):
  drm/hisilicon/hibmc: Add dp phy cfg to adjust serdes rate, voltage and
    pre-emphasis
  drm/hisilicon/hibmc: Getting connector info and edid by using aux
    channel
  drm/hisilicon/hibmc: Add debugfs interface to enable colorbar feature
    and get link status
  drm/hisilicon/hibmc: Enable this hot plug detect of irq feature

 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  16 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  11 +-
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |   2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 102 ++++++++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  48 ++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  93 ++++++--
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.c   |  72 ++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.h   |  38 ++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |   5 +
 .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 214 ++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 103 ++++++++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  89 ++++++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  21 ++
 14 files changed, 756 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_phy.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c

-- 
2.33.0

