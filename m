Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528CDC34560
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 08:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518F110E1DB;
	Wed,  5 Nov 2025 07:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.b="VzMNRaSZ";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="VzMNRaSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D016510E1DB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 07:48:10 +0000 (UTC)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=FSvxpard0HoYpObyaKRQSED2eQFZNpC67juTQyAXQP4=;
 b=VzMNRaSZAK1+UZeC/FOn/pnT0pHf9SMW9Wr920WcLgu4W2dBHnDVyJEURP30T0VAyN1hsipP+
 0ZhLfYAf49ypWYKSpIeCxSHfMxTmzNsZ4kXFMBtetmbhy3ryNbqahoCG6L5F8hIkFngwx4MTLqi
 rQpHyDDj4GR2CAvGL6BCJe8=
Received: from canpmsgout05.his.huawei.com (unknown [172.19.92.145])
 by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4d1cqw3nFfz1BG7L
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 15:47:56 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=From;
 bh=FSvxpard0HoYpObyaKRQSED2eQFZNpC67juTQyAXQP4=;
 b=VzMNRaSZAK1+UZeC/FOn/pnT0pHf9SMW9Wr920WcLgu4W2dBHnDVyJEURP30T0VAyN1hsipP+
 0ZhLfYAf49ypWYKSpIeCxSHfMxTmzNsZ4kXFMBtetmbhy3ryNbqahoCG6L5F8hIkFngwx4MTLqi
 rQpHyDDj4GR2CAvGL6BCJe8=
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4d1cpD3pwKz12LDq;
 Wed,  5 Nov 2025 15:46:28 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 195401400CD;
 Wed,  5 Nov 2025 15:48:04 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 5 Nov 2025 15:48:03 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 5 Nov 2025 15:48:03 +0800
Message-ID: <43a4d870-bb0e-4fdb-acac-6b564b4ea542@huawei.com>
Date: Wed, 5 Nov 2025 15:48:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 drm-dp 0/4] Fix hibmc driver bugs
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <fengsheng5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20251017095907.2060834-1-shiyongbang@huawei.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <20251017095907.2060834-1-shiyongbang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
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

Gently ping.

Thanks,
Baihan.


> From: Baihan Li <libaihan@huawei.com>
>
> There are some bugfix for hibmc-drm driver.
> ---
> ChangeLog:
> v8 -> v9:
>    - refactor the hibmc_dp_check_hpd_status(), and add some checks
>      in dp_encoder_enable.
> v7 -> v8:
>    - fix build errors reported by kernel test robot <lkp@intel.com>
>      Closes: https://lore.kernel.org/oe-kbuild-all/202509241625.o4mNleVb-lkp@intel.com/
> v6 -> v7:
>    - add the check about branch devices, suggested by Dmitry Baryshkov.
> v5 -> v6:
>    - use HPD status in DP detect_ctx(), suggested by Dmitry Baryshkov.
> v4 -> v5:
>    - Because some of patches are applied, this series only contains the rest of them.
>    - fix the commit and DP detect_ctx(), suggested by Dmitry Baryshkov.
>    - fix bugfix commit ID, suggested by Dmitry Baryshkov.
>    - remove the 08/11 patch, I'll add in next series.
>    - combined 9 and 11 patch together, suggested by Dmitry Baryshkov.
> v3 -> v4:
>    - remove link training process in hibmc_dp_detect(), suggested by Dmitry Baryshkov.
>    - remove if (dev->registered), suggested by Dmitry Baryshkov.
>    - remove non-related changes, suggested by Dmitry Baryshkov.
>    - Remove the clock check, suggested by Dmitry Baryshkov.
>    - ( I'll add them in next series after redesigning this part)
>    - add KVM edid in commit message, suggested by Dmitry Baryshkov.
>    - fix magic values, suggested by Dmitry Baryshkov.
>    - fix the commit subjects, suggested by Dmitry Baryshkov.
> v2 -> v3:
>    - fix hibmc_connector_get_modes() and hibmc_vdac_detect() to realize BMC KVM, suggested by Dmitry Baryshkov.
>    - fix the issue commit ID, suggested by Dmitry Baryshkov.
>    - split into 2 commits, suggested by Dmitry Baryshkov.
>    - add more comments in commit log, suggested by Dmitry Baryshkov.
> ---
>
> Baihan Li (4):
>    drm/hisilicon/hibmc: fix dp probabilistical detect errors after HPD
>      irq
>    drm/hisilicon/hibmc: add dp mode valid check
>    drm/hisilicon/hibmc: fix no showing problem with loading hibmc
>      manually
>    drm/hisilicon/hibmc: Adding reset colorbar cfg in dp init.
>
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 +
>   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  2 +
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 40 +++++++++-
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  8 ++
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  3 +
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 77 ++++++++++++++++++-
>   6 files changed, 128 insertions(+), 6 deletions(-)
>
