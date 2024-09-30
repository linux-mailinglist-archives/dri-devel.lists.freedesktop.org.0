Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A2098B577
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 09:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B13710E5FE;
	Tue,  1 Oct 2024 07:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1098 seconds by postgrey-1.36 at gabe;
 Mon, 30 Sep 2024 10:30:33 UTC
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F372410E2DD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 10:30:33 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XHH0t6kFqzFqxh;
 Mon, 30 Sep 2024 18:11:42 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id D8FBB180AE8;
 Mon, 30 Sep 2024 18:12:09 +0800 (CST)
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 30 Sep 2024 18:12:08 +0800
From: shiyongbang <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 0/4] Add dp module in hibmc driver
Date: Mon, 30 Sep 2024 18:06:06 +0800
Message-ID: <20240930100610.782363-1-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd500013.china.huawei.com (7.221.188.12)
X-Mailman-Approved-At: Tue, 01 Oct 2024 07:26:13 +0000
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

From: baihan li <libaihan@huawei.com>

    Realizing the basic display function of DP cable for DP connector
    displaying. Add DP module in hibmc drm driver, which is for Hisilicon
    Hibmc SoC which used for Out-of-band management. Blow is the general
    hardware connection, both the Hibmc and the host CPU are on the same
    mother board.

    +----------+       +----------+      +----- ----+      +----------------+
    |          | PCIe  |  Hibmc   |      |          |      |                |
    |host CPU( |<----->| display  |<---->| dp kapi  |<---->| dp aux moduel  |
    |arm64,x86)|       |subsystem |      |  moduel  |<---->| dp link moduel |
    +----------+       +----------+      +----------+      +----------------+

baihan li (4):
  drm/hisilicon/hibmc: add dp aux in hibmc drivers
  drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
  drm/hisilicon/hibmc: add dp kapi moduel in hibmc drivers
  drm/hisilicon/hibmc: add dp module in hibmc

 drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   | 227 ++++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h   |  80 ++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  88 ++++
 .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  20 +
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c  | 258 ++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h  |  48 +++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 390 ++++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h  |  24 ++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  76 ++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 195 +++++++++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  17 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   5 +
 13 files changed, 1429 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c

-- 
2.33.0

