Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE7AD55F8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D6210E662;
	Wed, 11 Jun 2025 12:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D21410E664
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:52:36 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bHQSM0KvHzRk2j;
 Wed, 11 Jun 2025 20:48:19 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 549E11402ED;
 Wed, 11 Jun 2025 20:52:32 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Jun 2025 20:52:32 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 11 Jun 2025 20:52:31 +0800
Message-ID: <426246e9-ccfe-40a7-81b6-a15ac1ee32e9@huawei.com>
Date: Wed, 11 Jun 2025 20:52:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 10/10] drm/hisilicon/hibmc: fix no showing problem
 with loading hibmc manually
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
 <20250530095432.1206966-11-shiyongbang@huawei.com>
 <czs4ingsrnuaqlbn3f7ko65pzhydcuuiglyh5ksrpfcz5zur74@vzgzyjkcae63>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <czs4ingsrnuaqlbn3f7ko65pzhydcuuiglyh5ksrpfcz5zur74@vzgzyjkcae63>
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


> On Fri, May 30, 2025 at 05:54:32PM +0800, Yongbang Shi wrote:
>> From: Baihan Li <libaihan@huawei.com>
>>
>> When using command rmmod and insmod, there is no showing in second time
>> insmoding. Because DP controller won't send HPD signals, if connection
>> doesn't change or controller isn't reset. So add reset before unreset
>> in hibmc_dp_hw_init().
>>
>> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")
> Technically... yes and no. The function was written this way in that
> commit, however HPD signals were not handled until the latter commit.

Alright, can I put 2 commits here?


>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> index 4f93d60b932b..e1b9589ce639 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>> @@ -172,13 +172,15 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>>   	dp_dev->link.cap.lanes = 0x2;
>>   	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>>   
>> -	/* hdcp data */
>> -	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>>   	/* int init */
>>   	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>>   	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
>>   	/* rst */
>> +	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>> +	usleep_range(30, 50);
>>   	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>> +	/* hdcp data */
>> +	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
> There are two independent changes here. Split them into two commits.

Okay!


>>   	/* clock enable */
>>   	writel(HIBMC_DP_CLK_EN, dp_dev->base + HIBMC_DP_DPTX_CLK_CTRL);
>>   
>> -- 
>> 2.33.0
>>
