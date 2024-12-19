Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7729F72FE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 03:52:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B9510EC67;
	Thu, 19 Dec 2024 02:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CEF10EC67
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 02:52:38 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YDFPW3w5Fz11MTV;
 Thu, 19 Dec 2024 10:49:19 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 5CB3614011B;
 Thu, 19 Dec 2024 10:52:35 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 19 Dec 2024 10:52:33 +0800
Message-ID: <046b010c-d40b-42c8-b701-4570b7a536eb@huawei.com>
Date: Thu, 19 Dec 2024 10:52:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 drm-dp 0/5] Add dp module in hibmc driver
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20241213060229.1191037-1-shiyongbang@huawei.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <20241213060229.1191037-1-shiyongbang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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

Does everyone have a question with the patch?


> From: baihan li <libaihan@huawei.com>
>
> Realizing the basic display function of DP cable for DP connector
> displaying. Add DP module in hibmc drm driver, which is for Hisilicon
> Hibmc SoC which used for Out-of-band management. Blow is the general
> hardware connection, both the Hibmc and the host CPU are on the same
> mother board.
>
> +----------+       +----------+      +----- ----+      +----------------+
> |          | PCIe  |  Hibmc   |      |          |      |                |
> |host CPU( |<----->| display  |<---->| dp kapi  |<---->| dp aux moduel  |
> |arm64,x86)|       |subsystem |      |  moduel  |<---->| dp link moduel |
> +----------+       +----------+      +----------+      +----------------+
>
> ---
> ChangeLog:
> v7 -> v8:
>    - adding DP_AUX_NATIVE_WRITE case in switch statement in hibmc_dp_aux_parse_xfer().
>    - adding pci_set_master() in hibmc_pci_probe().
>    v7:https://lore.kernel.org/all/20241209144840.1933265-1-shiyongbang@huawei.com/
> v6 -> v7:
>    - deleteing unset fields in struct hibmc_link_cap, suggested by Dmitry Baryshkov.
>    - using macro instead of constants in hibmc_dp_link_training_configure(), suggested by Dmitry Baryshkov.
>    - lowercasing hex, suggested by Dmitry Baryshkov.
>    v6:https://lore.kernel.org/all/20241202131322.1847078-1-shiyongbang@huawei.com/
> v5 -> v6:
>    - adding do{} while(0) in macro defination function, suggested by Dmitry Baryshkov.
>    - using drm_dbg_dp() to print debug info instead of drm_info(), suggested by Dmitry Baryshkov.
>    - adding code comments in hibmc_dp_set_sst(), suggested by Dmitry Baryshkov.
>    - adding hpd and get_edid comments in the beginning of patch, suggested by Dmitry Baryshkov.
>    v5:https://lore.kernel.org/all/20241118142805.3326443-1-shiyongbang@huawei.com/
> v4 -> v5:
>    - fixing build errors reported by kernel test robot <lkp@intel.com>
>      Closes: https://lore.kernel.org/oe-kbuild-all/202411131438.RZWYrWTE-lkp@intel.com/
>    v4:https://lore.kernel.org/all/20241112132348.2631150-1-shiyongbang@huawei.com/
> v3 -> v4:
>    - retun error codes in  result incorrect branch, suggested by Dmitry Baryshkov.
>    - replacing all ret= with returns, suggested by Dmitry Baryshkov.
>    - moving the comment below the judgment statement, suggested by Dmitry Baryshkov.
>    - moving definations to the source file and clearing headers, suggested by Dmitry Baryshkov.
>    - reanaming dp_prefix to hibmc_dp_prefix, suggested by Dmitry Baryshkov.
>    - changing hibmc_dp_reg_write_field to static inline and lock, suggested by Dmitry Baryshkov.
>    - moving some structs to later patch, suggested by Dmitry Baryshkov.
>    - optimizing hibmc_dp_link_get_adjust_train() to delete for loop, suggested by Dmitry Baryshkov.
>    - changing ELNRNG to EIO error code, suggested by Dmitry Baryshkov.
>    - deleting meaningless macro, suggested by Dmitry Baryshkov.
>    - fixing build errors reported by kernel test robot <lkp@intel.com>
>      Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/
>    - changed the type of train_set to array, suggested by Dmitry Baryshkov.
>    - using actual link rate instead of magic num, suggested by Dmitry Baryshkov.
>    - deleting hibmc_dp_hw_uninit(), suggested by Dmitry Baryshkov.
>    - separating hibmc_vdac and hibmc_dp changes into separate patche, suggested by Dmitry Baryshkov.
>    - static int hibmc_dp_prepare(), suggested by Dmitry Baryshkov.
>    v3:https://lore.kernel.org/all/20241101105028.2177274-1-shiyongbang@huawei.com/
> v2 -> v3:
>    - put the macro definations in latter patch where they are actually used, suggested by Dmitry Baryshkov.
>    - rename some macro definations to make them sensible, suggested by Dmitry Baryshkov.
>    - using FIELD_PREP and FIELD_GET, suggested by Dmitry Baryshkov.
>    - using DP_DPCD_REV_foo, suggested by Dmitry Baryshkov.
>    - using switchcase in dp_link_reduce_lane, suggested by Dmitry Baryshkov.
>    - deleting dp_link_pattern2dpcd function and using macros directly, suggested by Dmitry Baryshkov.
>    - deleting EFAULT error codes, suggested by Dmitry Baryshkov.
>    - fix build errors reported by kernel test robot <lkp@intel.com>
>      Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
>      Closes: https://lore.kernel.org/oe-kbuild-all/202410250931.UDQ9s66H-lkp@intel.com/
>      Closes: https://lore.kernel.org/oe-kbuild-all/202410251136.1m7BlR68-lkp@intel.com/
>    v2:https://lore.kernel.org/all/20241022124148.1952761-1-shiyongbang@huawei.com/
> v1 -> v2:
>    - using drm_dp_aux frame implement dp aux read and write functions, suggested by Jani Nikula.
>    - using drm dp header files' dp macros instead, suggested by Andy Yan.
>    - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
>    - changed some defines and functions to former patch, suggested by Dmitry Baryshkov.
>    - sorting the headers including in dp_hw.h and hibmc_drm_drv.c files, suggested by Dmitry Baryshkov.
>    - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
>    - modifying drm_simple_encoder_init function, suggested by Dmitry Baryshkov.
>    - refactoring struct hibmc_connector, suggested by Dmitry Baryshkov.
>    - withdrawing the modification in hibmc_kms_init, suggested by Dmitry Baryshkov.
>    - fix build errors reported by kernel test robot <lkp@intel.com>
>      Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
>      Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/
>    v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>
> baihan li (5):
>    drm/hisilicon/hibmc: add dp aux in hibmc drivers
>    drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
>    drm/hisilicon/hibmc: add dp hw moduel in hibmc driver
>    drm/hisilicon/hibmc: refactored struct hibmc_drm_private
>    drm/hisilicon/hibmc: add dp module in hibmc
>
>   drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   | 164 +++++++++
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  63 ++++
>   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  19 +
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 220 ++++++++++++
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  28 ++
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 332 ++++++++++++++++++
>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  76 ++++
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 118 +++++++
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  14 +
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  19 +-
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  41 ++-
>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  20 +-
>   13 files changed, 1078 insertions(+), 39 deletions(-)
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>
