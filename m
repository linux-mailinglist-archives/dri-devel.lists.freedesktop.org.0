Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A487F9FF98B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 13:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44EBF10E241;
	Thu,  2 Jan 2025 12:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31AC10E241
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 12:53:48 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YP6576Yndz1kxcK;
 Thu,  2 Jan 2025 20:50:51 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 997521A0188;
 Thu,  2 Jan 2025 20:53:45 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 2 Jan 2025 20:53:44 +0800
Message-ID: <0e862c4f-a383-4381-8883-3e28d4e254e7@huawei.com>
Date: Thu, 2 Jan 2025 20:53:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 drm-dp 0/5] Add dp module in hibmc driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20241213060229.1191037-1-shiyongbang@huawei.com>
 <046b010c-d40b-42c8-b701-4570b7a536eb@huawei.com>
 <muieolurswxzxevlqgnsftev5mlztopsqze3jhdf32lz4h2hhm@zxfnenjknwav>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <muieolurswxzxevlqgnsftev5mlztopsqze3jhdf32lz4h2hhm@zxfnenjknwav>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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

> On Thu, Dec 19, 2024 at 10:52:32AM +0800, Yongbang Shi wrote:
>> Does everyone have a question with the patch?
> -:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'reg_value' - possible side-effects?
> #225: FILE: drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h:23:
> +#define dp_field_modify(reg_value, mask, val)				\
> +	do {								\
> +		(reg_value) &= ~(mask);					\
> +		(reg_value) |= FIELD_PREP(mask, val);			\
> +	} while (0)							\
> +
>
> -:225: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'mask' - possible side-effects?
> #225: FILE: drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h:23:
> +#define dp_field_modify(reg_value, mask, val)				\
> +	do {								\
> +		(reg_value) &= ~(mask);					\
> +		(reg_value) |= FIELD_PREP(mask, val);			\
> +	} while (0)							\
> +

Hi Dmitry,
Thanks for your reminding. For this point, we have to use two variables(mask, reg_value) twice here.
I tried to another way that static inline functions, but there are build errors. So the only way is like this.
After reviewed all references, we have a review session about it, and we think it's acceptable and relatively safe.
  (like we won't use varible with post/pre-increment operator)
If you have a better way to realize this, plz tell me. Appreciate!


> -:277: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'
>
> total: 0 errors, 2 warnings, 2 checks, 239 lines checked
> 1c3faaf4e729 drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
> -:70: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> #70:
> new file mode 100644
>
> -:435: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'
>
> total: 0 errors, 2 warnings, 0 checks, 399 lines checked
> 70bf7b765c82 drm/hisilicon/hibmc: add dp hw moduel in hibmc driver
> -:28: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> #28:
> new file mode 100644
>
> -:371: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'
>
> total: 0 errors, 2 warnings, 0 checks, 327 lines checked
> 24d6be2577d8 drm/hisilicon/hibmc: refactored struct hibmc_drm_private
> -:188: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'
>
> total: 0 errors, 1 warnings, 0 checks, 151 lines checked
> 9a74395d14e2 (HEAD -> drm-misc-next) drm/hisilicon/hibmc: add dp module in hibmc
> -:30: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
> #30:
> new file mode 100644
>
> -:219: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: baihan li <libaihan@huawei.com>' != 'Signed-off-by: Baihan Li <libaihan@huawei.com>'

We already have maintainers for our hibmc-drm module, so there is no need add maintainers in each new file.

Thanks ,
Baihan Li


>>
>>> From: baihan li <libaihan@huawei.com>
>>>
>>> Realizing the basic display function of DP cable for DP connector
>>> displaying. Add DP module in hibmc drm driver, which is for Hisilicon
>>> Hibmc SoC which used for Out-of-band management. Blow is the general
>>> hardware connection, both the Hibmc and the host CPU are on the same
>>> mother board.
>>>
>>> +----------+       +----------+      +----- ----+      +----------------+
>>> |          | PCIe  |  Hibmc   |      |          |      |                |
>>> |host CPU( |<----->| display  |<---->| dp kapi  |<---->| dp aux moduel  |
>>> |arm64,x86)|       |subsystem |      |  moduel  |<---->| dp link moduel |
>>> +----------+       +----------+      +----------+      +----------------+
>>>
>>> ---
>>> ChangeLog:
>>> v7 -> v8:
>>>     - adding DP_AUX_NATIVE_WRITE case in switch statement in hibmc_dp_aux_parse_xfer().
>>>     - adding pci_set_master() in hibmc_pci_probe().
>>>     v7:https://lore.kernel.org/all/20241209144840.1933265-1-shiyongbang@huawei.com/
>>> v6 -> v7:
>>>     - deleteing unset fields in struct hibmc_link_cap, suggested by Dmitry Baryshkov.
>>>     - using macro instead of constants in hibmc_dp_link_training_configure(), suggested by Dmitry Baryshkov.
>>>     - lowercasing hex, suggested by Dmitry Baryshkov.
>>>     v6:https://lore.kernel.org/all/20241202131322.1847078-1-shiyongbang@huawei.com/
>>> v5 -> v6:
>>>     - adding do{} while(0) in macro defination function, suggested by Dmitry Baryshkov.
>>>     - using drm_dbg_dp() to print debug info instead of drm_info(), suggested by Dmitry Baryshkov.
>>>     - adding code comments in hibmc_dp_set_sst(), suggested by Dmitry Baryshkov.
>>>     - adding hpd and get_edid comments in the beginning of patch, suggested by Dmitry Baryshkov.
>>>     v5:https://lore.kernel.org/all/20241118142805.3326443-1-shiyongbang@huawei.com/
>>> v4 -> v5:
>>>     - fixing build errors reported by kernel test robot <lkp@intel.com>
>>>       Closes: https://lore.kernel.org/oe-kbuild-all/202411131438.RZWYrWTE-lkp@intel.com/
>>>     v4:https://lore.kernel.org/all/20241112132348.2631150-1-shiyongbang@huawei.com/
>>> v3 -> v4:
>>>     - retun error codes in  result incorrect branch, suggested by Dmitry Baryshkov.
>>>     - replacing all ret= with returns, suggested by Dmitry Baryshkov.
>>>     - moving the comment below the judgment statement, suggested by Dmitry Baryshkov.
>>>     - moving definations to the source file and clearing headers, suggested by Dmitry Baryshkov.
>>>     - reanaming dp_prefix to hibmc_dp_prefix, suggested by Dmitry Baryshkov.
>>>     - changing hibmc_dp_reg_write_field to static inline and lock, suggested by Dmitry Baryshkov.
>>>     - moving some structs to later patch, suggested by Dmitry Baryshkov.
>>>     - optimizing hibmc_dp_link_get_adjust_train() to delete for loop, suggested by Dmitry Baryshkov.
>>>     - changing ELNRNG to EIO error code, suggested by Dmitry Baryshkov.
>>>     - deleting meaningless macro, suggested by Dmitry Baryshkov.
>>>     - fixing build errors reported by kernel test robot <lkp@intel.com>
>>>       Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/
>>>     - changed the type of train_set to array, suggested by Dmitry Baryshkov.
>>>     - using actual link rate instead of magic num, suggested by Dmitry Baryshkov.
>>>     - deleting hibmc_dp_hw_uninit(), suggested by Dmitry Baryshkov.
>>>     - separating hibmc_vdac and hibmc_dp changes into separate patche, suggested by Dmitry Baryshkov.
>>>     - static int hibmc_dp_prepare(), suggested by Dmitry Baryshkov.
>>>     v3:https://lore.kernel.org/all/20241101105028.2177274-1-shiyongbang@huawei.com/
>>> v2 -> v3:
>>>     - put the macro definations in latter patch where they are actually used, suggested by Dmitry Baryshkov.
>>>     - rename some macro definations to make them sensible, suggested by Dmitry Baryshkov.
>>>     - using FIELD_PREP and FIELD_GET, suggested by Dmitry Baryshkov.
>>>     - using DP_DPCD_REV_foo, suggested by Dmitry Baryshkov.
>>>     - using switchcase in dp_link_reduce_lane, suggested by Dmitry Baryshkov.
>>>     - deleting dp_link_pattern2dpcd function and using macros directly, suggested by Dmitry Baryshkov.
>>>     - deleting EFAULT error codes, suggested by Dmitry Baryshkov.
>>>     - fix build errors reported by kernel test robot <lkp@intel.com>
>>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
>>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410250931.UDQ9s66H-lkp@intel.com/
>>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410251136.1m7BlR68-lkp@intel.com/
>>>     v2:https://lore.kernel.org/all/20241022124148.1952761-1-shiyongbang@huawei.com/
>>> v1 -> v2:
>>>     - using drm_dp_aux frame implement dp aux read and write functions, suggested by Jani Nikula.
>>>     - using drm dp header files' dp macros instead, suggested by Andy Yan.
>>>     - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
>>>     - changed some defines and functions to former patch, suggested by Dmitry Baryshkov.
>>>     - sorting the headers including in dp_hw.h and hibmc_drm_drv.c files, suggested by Dmitry Baryshkov.
>>>     - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
>>>     - modifying drm_simple_encoder_init function, suggested by Dmitry Baryshkov.
>>>     - refactoring struct hibmc_connector, suggested by Dmitry Baryshkov.
>>>     - withdrawing the modification in hibmc_kms_init, suggested by Dmitry Baryshkov.
>>>     - fix build errors reported by kernel test robot <lkp@intel.com>
>>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
>>>       Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/
>>>     v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
>>> ---
>>>
>>> baihan li (5):
>>>     drm/hisilicon/hibmc: add dp aux in hibmc drivers
>>>     drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
>>>     drm/hisilicon/hibmc: add dp hw moduel in hibmc driver
>>>     drm/hisilicon/hibmc: refactored struct hibmc_drm_private
>>>     drm/hisilicon/hibmc: add dp module in hibmc
>>>
>>>    drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c   | 164 +++++++++
>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  63 ++++
>>>    .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  19 +
>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 220 ++++++++++++
>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  28 ++
>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 332 ++++++++++++++++++
>>>    drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  76 ++++
>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 118 +++++++
>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  14 +
>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  19 +-
>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  41 ++-
>>>    .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  |  20 +-
>>>    13 files changed, 1078 insertions(+), 39 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
>>>    create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
>>>
