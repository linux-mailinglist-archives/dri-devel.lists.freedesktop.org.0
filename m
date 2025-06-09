Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86508AD2172
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FF410E3F7;
	Mon,  9 Jun 2025 14:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2308B10E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:56:17 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bGFLZ5ks4z1d1Ny;
 Mon,  9 Jun 2025 22:54:14 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id D501A180B43;
 Mon,  9 Jun 2025 22:56:14 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:56:14 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Jun 2025 22:56:13 +0800
Message-ID: <28d7d9c2-8498-41a7-ab37-821d574fbb2a@huawei.com>
Date: Mon, 9 Jun 2025 22:56:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 05/10] drm/hisilicon/hibmc: fix rare monitors
 cannot display problem
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <liangjian010@huawei.com>,
 <chenjianmin@huawei.com>, <lidongming5@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-6-shiyongbang@huawei.com>
 <j23q7vjp2s2gfautba7hcbvd5vrrycr5akl3m24eu4nlvy65s7@5uytzwucogxw>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <j23q7vjp2s2gfautba7hcbvd5vrrycr5akl3m24eu4nlvy65s7@5uytzwucogxw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
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


> On Fri, May 30, 2025 at 05:54:27PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> DP Link training successful at 8.1Gbps with some monitors' max link rate
>> are 2.7Gbps. So change the default 8.1Gbps link rate to the rate that reads
>> from devices' capabilities.
> I've hard time understanding this message.

Sorry for misunderstanding. The problem is that dp link training success at 8.1Gbps, however,

the sink 's maximum supported rate is less than 8.1G.


>> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
> No, the tag is incorrect. Mentioned commit is not related.

Ok.


>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++-
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++++++++------
>>   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 -------
>>   4 files changed, 27 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> index 676059d4c1e6..8191233aa965 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>> @@ -57,15 +57,3 @@ int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
>>   
>>   	return 0;
>>   }
>> -
>> -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
>> -{
>> -	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
>> -
>> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
>> -	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
>> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
>> -	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
> Where did these two writes go?

It's the same as the cfg in hibmc_dp_serdes_set_tx_cfg(), and this function will be called certainly.


>> -
>> -	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
>> -}
>> -- 
>> 2.33.0
>>
