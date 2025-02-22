Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381BFA4076A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 11:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984A010E248;
	Sat, 22 Feb 2025 10:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CDC10E248
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 10:32:40 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Z0NXZ4KKRz21nyk;
 Sat, 22 Feb 2025 18:29:34 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 70FDE140155;
 Sat, 22 Feb 2025 18:32:37 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 22 Feb 2025 18:32:36 +0800
Message-ID: <c9d59963-2ebd-4a6f-bdff-1616ed8afec0@huawei.com>
Date: Sat, 22 Feb 2025 18:32:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 drm-dp 3/8] drm/hisilicon/hibmc: Add dp serdes cfg in
 dp process
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <shiyongbang@huawei.com>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-4-shiyongbang@huawei.com>
 <d77bfuqor2rsd5tg4abywkckiqwy7j5xr43p73to2ofwpirws3@4m4g7hkvji2a>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <d77bfuqor2rsd5tg4abywkckiqwy7j5xr43p73to2ofwpirws3@4m4g7hkvji2a>
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

> On Sat, Feb 22, 2025 at 10:50:56AM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> Add dp serdes cfg in link training process, and related adapting
>> and modificating. Change some init values about training,
>> because we want completely to negotiation process, so we start with
>> the maximum rate and the electrical characteristic level is 0.
>>
>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>> ---
>> ChangeLog:
>> v2 -> v3:
>>    - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
>>    - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
>> v1 -> v2:
>>    - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
>> ---
>>   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 ++-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 ++++++++++++++++---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  1 +
>>   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    |  6 ++++
>>   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  8 ++---
>>   6 files changed, 43 insertions(+), 11 deletions(-)
>>
> Mostly LGTM.
>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
>> index 812d0794543c..e0537cc9af41 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
>> @@ -4,12 +4,15 @@
>>   #ifndef DP_SERDES_H
>>   #define DP_SERDES_H
>>   
>> +#include "dp_comm.h"
> No, please include it directly, where required. This simplifies possible
> inter-header dependencies.

Okay.


>> +
>>   #define HIBMC_DP_HOST_OFFSET		0x10000
>>   #define HIBMC_DP_LANE0_RATE_OFFSET	0x4
>>   #define HIBMC_DP_LANE1_RATE_OFFSET	0xc
>>   #define HIBMC_DP_LANE_STATUS_OFFSET	0x10
>>   #define HIBMC_DP_PMA_LANE0_OFFSET	0x18
>>   #define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
>> +#define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c
>>   #define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
>>   
>>   /* dp serdes TX-Deempth Configuration */
>> @@ -24,6 +27,9 @@
>>   #define DP_SERDES_VOL2_PRE1		0x4500
>>   #define DP_SERDES_VOL3_PRE0		0x600
>>   #define DP_SERDES_BW_8_1		0x3
>> +#define DP_SERDES_BW_5_4		0x2
>> +#define DP_SERDES_BW_2_7		0x1
>> +#define DP_SERDES_BW_1_62		0x0
>>   
>>   #define DP_SERDES_DONE			0x3
>>   
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> index e6de6d5edf6b..67d39e258cac 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> @@ -28,9 +28,7 @@
>>   #include "hibmc_drm_drv.h"
>>   #include "hibmc_drm_regs.h"
>>   
>> -#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
>> -#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8a00
>> -#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7ffff
>> +#include "dp/dp_serdes.h"
>>   
>>   DEFINE_DRM_GEM_FOPS(hibmc_fops);
>>   
>> @@ -122,8 +120,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>>   	}
>>   
>>   	/* if DP existed, init DP */
>> -	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
>> -	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
>> +	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
>> +	if (ret) {
> Why?

Becuase this is a serdes deempth configuration which is changed if we start cfg serdes.
The HIBMC_DP_HOST_SERDES_CTRL_VAL is default value, but we may change it. We can just
check if it is not zero. If it's not zero, it has dp block and we can init it.


>>   		ret = hibmc_dp_init(priv);
>>   		if (ret)
>>   			drm_err(dev, "failed to init dp: %d\n", ret);
>> -- 
>> 2.33.0
>>
