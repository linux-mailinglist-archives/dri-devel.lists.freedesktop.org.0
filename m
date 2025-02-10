Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A312A2F072
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 15:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E11410E0AC;
	Mon, 10 Feb 2025 14:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826CD10E0AC
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 14:57:06 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Ys6zS3nvmzRmPt;
 Mon, 10 Feb 2025 22:54:12 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 9744414022D;
 Mon, 10 Feb 2025 22:57:03 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 10 Feb 2025 22:57:02 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 drm-dp 0/4] Add HPD, getting EDID,
 colorbar features in DP function
Date: Mon, 10 Feb 2025 22:49:52 +0800
Message-ID: <20250210144959.100551-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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

---
ChangeLog:
v1 -> v2:
  - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
  - changing all names of dp phy to dp serdes.
  - deleting type conversion, suggested by Dmitry Baryshkov.
  - deleting hibmc_dp_connector_get_modes() and using drm_connector_helper_get_modes(), suggested by Dmitry Baryshkov.
  - add colorbar introduction in commit, suggested by Dmitry Baryshkov.
  - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
  - using debugfs_init() callback, suggested by Dmitry Baryshkov.
  - splittting colorbar and debugfs in different patches, suggested by Dmitry Baryshkov.
  - optimizing the description in commit message, suggested by Dmitry Baryshkov.
  - add mdelay(100) comments, suggested by Dmitry Baryshkov.
  - deleting display enable in hpd event, suggested by Dmitry Baryshkov.
---

 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  16 ++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  11 +-
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |   2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 103 ++++++++++++++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  47 +++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  92 +++++++++----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |   5 +
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    |  74 +++++++++++
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    |  36 +++++
 .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 124 ++++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |  88 ++++++++++---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  86 +++++++++---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  21 +++
 14 files changed, 640 insertions(+), 68 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c

-- 
2.33.0

