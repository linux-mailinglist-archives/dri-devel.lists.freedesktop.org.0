Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25D6A4052C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 03:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22CA10EB5B;
	Sat, 22 Feb 2025 02:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841F810E012
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 02:58:22 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Z0BSN3yjpzHr9G;
 Sat, 22 Feb 2025 10:55:16 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 7C826140336;
 Sat, 22 Feb 2025 10:58:19 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 22 Feb 2025 10:58:18 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 drm-dp 0/8] Add HPD, getting EDID,
 colorbar features in DP function
Date: Sat, 22 Feb 2025 10:50:53 +0800
Message-ID: <20250222025102.1519798-1-shiyongbang@huawei.com>
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
v2 -> v3:
  - restructuring the header p_reg.h, suggested by Dmitry Baryshkov.
  - add commit log about dp serdes, suggested by Dmitry Baryshkov.
  - return value in hibmc_dp_serdes_init(), suggested by Dmitry Baryshkov.
  - add static const in the array of serdes_tx_cfg[], suggested by Dmitry Baryshkov.
  - change drm_warn to drm_dbg_dp, suggested by Dmitry Baryshkov.
  - add explanations about dp serdes macros, suggested by Dmitry Baryshkov.
  - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
  - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
  - split the patch into two parts, suggested by Dmitry Baryshkov.
  - Capitalized EDID and AUX, suggested by Dmitry Baryshkov.
  - rewrite the commit log, suggested by Dmitry Baryshkov.
  - move colorbar debugfs entry to this patch, suggested by Dmitry Baryshkov.
  - change binary format to integer format, suggested by Dmitry Baryshkov.
  - remove mdelay(100) hpd function in ISR, suggested by Dmitry Baryshkov.
  - remove enble_display in ISR, suggested by Dmitry Baryshkov.
  - change drm_kms_helper_connector_hotplug_event() to
    drm_connector_helper_hpd_irq_event(), suggested by Dmitry Baryshkov.
  - move macros to dp_reg.h, suggested by Dmitry Baryshkov.
  - remove struct irqs, suggested by Dmitry Baryshkov.
  - split this patch into two parts, suggested by Dmitry Baryshkov.
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

Baihan Li (8):
  drm/hisilicon/hibmc: Restructuring the header dp_reg.h
  drm/hisilicon/hibmc: Add dp phy cfg to adjust serdes rate, voltage and
    pre-emphasis
  drm/hisilicon/hibmc: Add dp serdes cfg in dp process
  drm/hisilicon/hibmc: Refactor the member of drm_aux in struct hibmc_dp
  drm/hisilicon/hibmc: Getting connector info and edid by using aux
    channel
  drm/hisilicon/hibmc: Add colorbar-cfg feature and its debugfs file
  drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
  drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD

 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  16 ++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |   7 +-
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |   2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  78 ++++++++++++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  37 +++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  55 +++++++---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   | 103 +++++++++++-------
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    |  72 ++++++++++++
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    |  40 +++++++
 .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 100 +++++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |  95 +++++++++++++++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  85 +++++++++++----
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  12 ++
 14 files changed, 617 insertions(+), 88 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c

-- 
2.33.0

