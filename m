Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA331A74412
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 07:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10C910E087;
	Fri, 28 Mar 2025 06:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0C110E087
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 06:43:47 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZP9qy4WcFzTgrJ;
 Fri, 28 Mar 2025 14:39:58 +0800 (CST)
Received: from kwepemd500013.china.huawei.com (unknown [7.221.188.12])
 by mail.maildlp.com (Postfix) with ESMTPS id 61E771400D1;
 Fri, 28 Mar 2025 14:43:38 +0800 (CST)
Received: from [10.159.166.136] (10.159.166.136) by
 kwepemd500013.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 28 Mar 2025 14:43:37 +0800
Message-ID: <51bae617-cfc7-43f9-968e-5f2a3ad9af40@huawei.com>
Date: Fri, 28 Mar 2025 14:43:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 drm-dp 5/9] drm/hisilicon/hibmc: Getting connector info
 and EDID by using AUX channel
To: Jani Nikula <jani.nikula@linux.intel.com>, <xinliang.liu@linaro.org>,
 <tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <shiyongbang@huawei.com>
References: <20250319032435.1119469-1-shiyongbang@huawei.com>
 <20250319032435.1119469-6-shiyongbang@huawei.com> <87frj8c9ol.fsf@intel.com>
 <ff11c8ac-7eb4-42cb-86d3-ad9924c9374b@huawei.com> <87jz8ea6zq.fsf@intel.com>
 <8ee961ca-0d3c-487d-a672-82714ee56743@huawei.com> <875xjw87dm.fsf@intel.com>
 <a8599ca0-9a50-453e-8986-f8fae5aa9160@huawei.com> <87v7ru6bfk.fsf@intel.com>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <87v7ru6bfk.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.159.166.136]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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


> On Thu, 27 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>> 在 2025/3/26 17:32, Jani Nikula 写道:
>>> On Tue, 25 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>> On Mon, 24 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>> On Wed, 19 Mar 2025, Yongbang Shi <shiyongbang@huawei.com> wrote:
>>>>>>>> From: Baihan Li <libaihan@huawei.com>
>>>>>>>>
>>>>>>>> Add registering drm_aux and use it to get connector edid with drm
>>>>>>>> functions. Add ddc channel in connector initialization to put drm_aux
>>>>>>>> in drm_connector.
>>>>>>>>
>>>>>>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>>>>>>> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
>>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> ---
>>>>>>>> ChangeLog:
>>>>>>>> v6 -> v7:
>>>>>>>>       - add if statement about drm aux in hibmc_dp_connector_get_modes(), suggested by Jani Nikula
>>>>>>> I don't understand this, and I did not suggest such a thing.
>>>>>>>
>>>>>>> BR,
>>>>>>> Jani.
>>>>>>>
>>>>>> Hi Jani,
>>>>>>
>>>>>> Is the modification of v8 correct?
>>>>> I never received that for whatever reason.
>>>> Here's the link: https://lore.kernel.org/all/20250320101455.2538835-1-shiyongbang@huawei.com/
>>> Thanks.
>>>
>>> The EDID handling looks fine.
>>>
>>> AFAICT you leak dp->aux.name though.
>>>
>>>
>>> BR,
>>> Jani.
>> Thanks for for reminding me, actually the dp->aux.name was written because I misunderstood what you meant in V7,
>> and I deleted it in V8.
> This is in the link you posted:
>
> +	dp->aux.name = kasprintf(GFP_KERNEL, "HIBMC DRM dp aux");
>
Hi Jani,

I got it. I think I can change it to devm_kasprintf() in next bug fix patch, is that ok?


>
>> Thanks,
>> Baihan.
>>
>>>
