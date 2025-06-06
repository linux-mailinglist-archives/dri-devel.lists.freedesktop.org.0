Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED61ACFE2A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 10:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB9910E379;
	Fri,  6 Jun 2025 08:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F235210E379
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 08:22:48 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bDDlW5Wzgz1R86h;
 Fri,  6 Jun 2025 16:20:23 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 1DAD71A0191;
 Fri,  6 Jun 2025 16:22:43 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Jun 2025 16:22:39 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Jun 2025 16:22:38 +0800
Message-ID: <b6b30bdd-7562-4435-a267-2bdafb0dc359@huawei.com>
Date: Fri, 6 Jun 2025 16:20:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 04/10] drm/hisilicon/hibmc: fix the hibmc loaded
 failed bug
To: oushixiong <oushixiong1025@163.com>, <xinliang.liu@linaro.org>,
 <tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-5-shiyongbang@huawei.com>
 <b0587eda-df65-4abc-b2af-c5dcb717c8b6@163.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <b0587eda-df65-4abc-b2af-c5dcb717c8b6@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
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

>
>> From: Baihan Li<libaihan@huawei.com>
>>
>> When hibmc loaded failed, the driver use hibmc_unload to free the
>> resource, but the mutexes in mode.config are not init, which will
>> access an NULL pointer.
>>
>> Fixes: b3df5e65cc03 ("drm/hibmc: Drop drm_vblank_cleanup")
>> Reported-by:oushixiong1025@163.com
>> Signed-off-by: Baihan Li<libaihan@huawei.com>
>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> index 4cdcc34070ee..ac552c339671 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> @@ -319,13 +319,13 @@ static int hibmc_load(struct drm_device *dev)
>>   
>>   	ret = hibmc_hw_init(priv);
>>   	if (ret)
>> -		goto err;
>> +		return ret;
>>   
>>   	ret = drmm_vram_helper_init(dev, pci_resource_start(pdev, 0),
>>   				    pci_resource_len(pdev, 0));
>>   	if (ret) {
>>   		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
>> -		goto err;
>> +		return ret;
>
> The mutexes in mode.config are initialized when calling hibmc_kms_init(),
> if calling hibmc_kms_init() failed it also need to return.
>
> You may want to look at the following patch:
> LKML: oushixiong1025@163 ...: [PATCH] drm/hisilicon: Fix a NULL 
> pointer access when hibmc_load failed 
> <https://lkml.org/lkml/2025/5/20/331>
>
> Reported-by: Shixiong Ou <oushixiong@kylinos.cn>
>
> Thanks and Regards,
> Shixiong Ou.
>

Hi Shixiong,
Thanks for your advice!
Actually, even if the calling of drmm_mode_config_init() failed, these mutexes are still initialized,
and it's the same for hibmc_kms_init() failed, so we don't need to change its return.

Thanks,
Baihan Li

>>   	}
>>   
>>   	ret = hibmc_kms_init(priv);
