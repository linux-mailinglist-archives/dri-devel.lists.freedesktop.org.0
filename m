Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61900784112
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D02C10E346;
	Tue, 22 Aug 2023 12:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C4F10E346
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 12:43:26 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RVTW61HQ8zrSV5;
 Tue, 22 Aug 2023 20:41:54 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 22 Aug 2023 20:43:22 +0800
Message-ID: <fbb6c33a-fd0b-b0d7-4832-450c730b3fad@huawei.com>
Date: Tue, 22 Aug 2023 20:43:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 2/2] drm/tegra: Use PTR_ERR_OR_ZERO() to simplify
 code
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <jonathanh@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
References: <20230822071503.178000-1-ruanjinjie@huawei.com>
 <20230822071503.178000-3-ruanjinjie@huawei.com>
 <37df88bd-a429-c325-c80a-17d7d17f689c@kapsi.fi>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <37df88bd-a429-c325-c80a-17d7d17f689c@kapsi.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
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



On 2023/8/22 20:32, Mikko Perttunen wrote:
> On 8/22/23 10:15, Jinjie Ruan wrote:
>> Return PTR_ERR_OR_ZERO() instead of return 0 or PTR_ERR() to
>> simplify code.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 5 +----
>>   drivers/gpu/drm/tegra/gem.c | 5 +----
>>   2 files changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index ff36171c8fb7..4e29d76da1be 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -354,10 +354,7 @@ static int tegra_gem_create(struct drm_device
>> *drm, void *data,
>>         bo = tegra_bo_create_with_handle(file, drm, args->size,
>> args->flags,
>>                        &args->handle);
>> -    if (IS_ERR(bo))
>> -        return PTR_ERR(bo);
>> -
>> -    return 0;
>> +    return PTR_ERR_OR_ZERO(bo);
>>   }
>>     static int tegra_gem_mmap(struct drm_device *drm, void *data,
>> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
>> index a4023163493d..11ef0f8cb1e1 100644
>> --- a/drivers/gpu/drm/tegra/gem.c
>> +++ b/drivers/gpu/drm/tegra/gem.c
>> @@ -533,10 +533,7 @@ int tegra_bo_dumb_create(struct drm_file *file,
>> struct drm_device *drm,
>>         bo = tegra_bo_create_with_handle(file, drm, args->size, 0,
>>                        &args->handle);
>> -    if (IS_ERR(bo))
>> -        return PTR_ERR(bo);
>> -
>> -    return 0;
>> +    return PTR_ERR_OR_ZERO(bo);
>>   }
>>     static vm_fault_t tegra_bo_fault(struct vm_fault *vmf)
> 
> NAK. See
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20230822&id=b784c77075023e1a71bc06e6b4f711acb99e9c73

Thank you! It is right.

> 
> Mikko
