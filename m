Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229BEAC8C0C
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 12:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAA710E7FC;
	Fri, 30 May 2025 10:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252C110E0A9
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:22:51 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4b7zLb1fYhz1fy91;
 Fri, 30 May 2025 18:02:31 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id D0E85140113;
 Fri, 30 May 2025 18:03:35 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:35 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:34 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 00/10] Fix hibmc driver bugs
Date: Fri, 30 May 2025 17:54:22 +0800
Message-ID: <20250530095432.1206966-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
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

There are some bugfix for hibmc-drm driver.

Baihan Li (10):
  drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init
    failed
  drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD
    irq
  drm/hisilicon/hibmc: fix irq_request()'s irq name variable is local
  drm/hisilicon/hibmc: fix the hibmc loaded failed bug
  drm/hisilicon/hibmc: fix rare monitors cannot display problem
  drm/hisilicon/hibmc: add dp mode valid check
  drm/hisilicon/hibmc: add dp encoder modeset
  drm/hisilicon/hibmc: fix DP no showing after HPD with VGA connected
  drm/hisilicon/hibmc: fix HPD no showing with VGA para of GRUB
  drm/hisilicon/hibmc: fix no showing problem with loading hibmc
    manually

 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |   4 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  22 ++--
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |   8 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  |  33 +++--
 .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    |  12 --
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 115 ++++++++++++++++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  14 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   1 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |   5 +
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  37 +++++-
 10 files changed, 198 insertions(+), 53 deletions(-)

-- 
2.33.0

