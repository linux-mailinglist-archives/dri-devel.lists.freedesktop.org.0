Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9EA58B14
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 05:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B1210E03F;
	Mon, 10 Mar 2025 04:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E74F10E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 04:09:19 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZB3FL4mgzz2SSpk;
 Mon, 10 Mar 2025 12:04:54 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 52B041A0188;
 Mon, 10 Mar 2025 12:09:13 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 10 Mar 2025 12:09:11 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 drm-dp 0/9] Add HPD, getting EDID,
 colorbar features in DP function
Date: Mon, 10 Mar 2025 12:01:29 +0800
Message-ID: <20250310040138.2025715-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
v5 -> v6:
  - fix the DP_SERDES_VOL2_PRE0 value after electrical test.
  - move the detect_ctx() to the patch 7/9.
  - add detect_ctx with 200ms delay, suggested by Dmitry Baryshkov.
v4 -> v5:
  - add commit log about hibmc_kms_init(), suggested by Dmitry Baryshkov.
  - fix the format of block comments, suggested by Dmitry Baryshkov.
  - add hibmc_dp_get_serdes_rate_cfg() to correct transferring serdes cfg.
  - separate the vga part commit, suggested by Dmitry Baryshkov.
  - remove pci_disable_msi() in hibmc_unload()
v3 -> v4:
  - fix the serdes cfg in hibmc_dp_serdes_set_tx_cfg(), suggested by Dmitry Baryshkov.
  - move the dp serdes registers to dp_reg.h, suggested by Dmitry Baryshkov.
  - add comments for if-statement of dp_init(), suggested by Dmitry Baryshkov.
  - fix the comment log to imperative sentence, suggested by Dmitry Baryshkov.
  - add comments in hibmc_control_write(), suggested by Dmitry Baryshkov.
  - add link reset of rates and lanes in pre link training process, suggested by Dmitry Baryshkov.
  - add vdac detect and connected/disconnected status to enable HPD process, suggested by Dmitry Baryshkov.
  - remove a drm_client, suggested by Dmitry Baryshkov.
  - fix build errors reported by kernel test robot <lkp@intel.com>
    Closes: https://lore.kernel.org/oe-kbuild-all/202502231304.BCzV4Y8D-lkp@intel.com/
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

Baihan Li (9):
  drm/hisilicon/hibmc: Restructuring the header dp_reg.h
  drm/hisilicon/hibmc: Add dp serdes cfg to adjust serdes rate, voltage
    and pre-emphasis
  drm/hisilicon/hibmc: Add dp serdes cfg in dp process
  drm/hisilicon/hibmc: Refactor the member of drm_aux in struct hibmc_dp
  drm/hisilicon/hibmc: Getting connector info and EDID by using AUX
    channel
  drm/hisilicon/hibmc: Add colorbar-cfg feature and its debugfs file
  drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
  drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD
  drm/hisilicon/hibmc: Add vga connector detect functions

 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   |  16 ++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  10 +-
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |   2 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  91 +++++++++++-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  36 +++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  97 +++++++++----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   | 130 +++++++++++++-----
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    |  71 ++++++++++
 .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 104 ++++++++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |  75 +++++++++-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  87 +++++++++---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  12 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |   3 +
 14 files changed, 635 insertions(+), 102 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c

-- 
2.33.0

