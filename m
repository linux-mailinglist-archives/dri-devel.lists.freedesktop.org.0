Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80CFAEB169
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 10:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E2010E330;
	Fri, 27 Jun 2025 08:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF2B10E32A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 08:34:52 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4bT82W2xR3z29dl6;
 Fri, 27 Jun 2025 16:33:07 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
 by mail.maildlp.com (Postfix) with ESMTPS id E02911A0188;
 Fri, 27 Jun 2025 16:34:47 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Jun 2025 16:34:47 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Jun 2025 16:34:46 +0800
Message-ID: <a828323b-6981-4aea-bdfa-bb89dc113e1a@huawei.com>
Date: Fri, 27 Jun 2025 16:34:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 drm-dp 00/10] Fix hibmc driver bugs
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <20250620093104.2016196-1-shiyongbang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
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

Gracious ping for this bugfix series, it's been posted a week!

> From: Baihan Li <libaihan@huawei.com>
>
> There are some bugfix for hibmc-drm driver.
> ---
> ChangeLog:
> v1 -> v2:
>    - use the hibmc_ddc_del() in hibmc_connector_destroy(), suggested by Dmitry Baryshkov.
>    - fix the tag, suggested by Dmitry Baryshkov.
>    - don't use the flag, and use more checks in detect_ctx(), suggested by Dmitry Baryshkov.
>    - delete if (dev->registered), suggested by Dmitry Baryshkov.
>    - add explanations in commit, suggested by Dmitry Baryshkov.
>    - delete if (!dp->is_connected) in hibmc_dp_mode_valid(), suggested by Dmitry Baryshkov.
>    - don't tie VGA and DP status, suggested by Dmitry Baryshkov.
>    - use crtc clone to let 2 connectors can display simultaneous
>    - separate the patch, suggested by Dmitry Baryshkov.
> ---
>
> Baihan Li (10):
>    drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init
>      failed
>    drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD
>      irq
>    drm/hisilicon/hibmc: fix irq_request()'s irq name variable is local
>    drm/hisilicon/hibmc: fix the hibmc loaded failed bug
>    drm/hisilicon/hibmc: fix rare monitors cannot display problem
>    drm/hisilicon/hibmc: add dp mode valid check
>    drm/hisilicon/hibmc: fix dp and vga cannot show together
>    drm/hisilicon/hibmc: fix no showing when no connectors connected
>    drm/hisilicon/hibmc: fix no showing problem with loading hibmc
>      manually
>    drm/hisilicon/hibmc: adapting modification for the former commit
>
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 +-
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 48 +++++++++----
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  8 +++
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 ++++++---
>   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 ----
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 70 +++++++++++++++++--
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 22 +++---
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  1 +
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  5 ++
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 12 ++--
>   10 files changed, 163 insertions(+), 52 deletions(-)
>
