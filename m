Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B92AD3924
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6D10E54A;
	Tue, 10 Jun 2025 13:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1F410E54A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:28:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bGqK51sSKz2Cf4M;
 Tue, 10 Jun 2025 21:24:57 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 26918140155;
 Tue, 10 Jun 2025 21:28:48 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:28:47 +0800
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 10 Jun 2025 21:28:47 +0800
Message-ID: <37b5bf6a-d3d1-48b3-9052-0bdcf0803fe3@huawei.com>
Date: Tue, 10 Jun 2025 21:28:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s irq
 name variable is local
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
 <20250530095432.1206966-4-shiyongbang@huawei.com>
 <oof3yrny3x5vglnjvcsz6brpn2a4l2nkmpepnykojqquytfj56@vz5sk7coojhw>
 <c59b893c-dca4-4c7f-a57e-99e60401ebc0@huawei.com>
 <a88f479b-e022-4ed7-8286-5d546423bfcf@oss.qualcomm.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <a88f479b-e022-4ed7-8286-5d546423bfcf@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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


> On 09/06/2025 17:50, Yongbang Shi wrote:
>>
>>> On Fri, May 30, 2025 at 05:54:25PM +0800, Yongbang Shi wrote:
>>>> From: Baihan Li <libaihan@huawei.com>
>>>>
>>>> The local variable of irq name is passed to 
>>>> devm_request_threaded_irq(),
>>>> which will make request_irq failed. Using the global irq name instead
>>>> of it to fix.
>>> This doesn't explain, why does it fail and which IRQ name is actually
>>> expected.
>>
>> The local variable is passed in request_irq (), and there will be use 
>> after free problem.
>
> This needs to be explained (in details) in the commit message.

Okay.

>
>>
>>
>>>> Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and 
>>>> requesting for HPD")
>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>> ---
>>>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
>>>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/ 
>>>> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> index 768b97f9e74a..4cdcc34070ee 100644
>>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>>> @@ -32,7 +32,7 @@
>>>>   DEFINE_DRM_GEM_FOPS(hibmc_fops);
>>>> -static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { 
>>>> "vblank", "hpd" };
>>>> +static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "hibmc- 
>>>> vblank", "hibmc-hpd" };
>>> Please point to the corresponding IRQ names as currently implemented in
>>> the upstream kernel.
>>
>> Ok.
>
> I was thinking in terms of IRQ lookup. You can ignore this comment (it 
> makes me wonder, how did you understand it, if you responded with Ok).
>
I thought you were suggesting naming the irq referring to the previous name.


>>
>>
>>>>   static irqreturn_t hibmc_interrupt(int irq, void *arg)
>>>>   {
>
>
