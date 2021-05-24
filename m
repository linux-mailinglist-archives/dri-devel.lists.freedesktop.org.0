Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B789C38E649
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 14:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A886E249;
	Mon, 24 May 2021 12:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAC36E249
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 12:08:37 +0000 (UTC)
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FpbWs4H1Rz1BPTj;
 Mon, 24 May 2021 20:05:45 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 20:08:35 +0800
Received: from [127.0.0.1] (10.40.188.144) by dggeme759-chm.china.huawei.com
 (10.3.19.105) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 20:08:35 +0800
Subject: Re: [PATCH v2] drm/exynos: Use pm_runtime_resume_and_get() to replace
 open coding
To: Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, Tian Tao
 <tiantao6@hisilicon.com>
References: <1621587966-62687-1-git-send-email-tiantao6@hisilicon.com>
 <CGME20210521153142epcas1p3d80ee0b402cdbf767007e8bf05b33e2d@epcas1p3.samsung.com>
 <YKfSVdw16TPLlEKX@phenom.ffwll.local>
 <6570cce1-c36c-a91c-1590-542e4d2712af@samsung.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <c01eaf24-58c9-98cb-355e-33284172ac0b@huawei.com>
Date: Mon, 24 May 2021 20:08:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6570cce1-c36c-a91c-1590-542e4d2712af@samsung.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
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
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski@canonical.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2021/5/24 20:05, Inki Dae 写道:
>
> 21. 5. 22. 오전 12:31에 Daniel Vetter 이(가) 쓴 글:
>> On Fri, May 21, 2021 at 05:06:06PM +0800, Tian Tao wrote:
>>> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
>>> pm_runtime_put_noidle.
>> It would be good to explain why: Apparently get_sync increments the
>> refcount even if it fails, which ususally leads to leaks.
> Tian Tao, could you update the description?
done:-)
>
> Thanks,
> Inki Dae
>
>> With that or similar added to the commit message:
>>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>> ---
>>>
>>> v2: drop unnecessary change about if condition.
>>> ---
>>>   drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
>>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>> index 3821ea7..32672bf 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>> @@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>>>   	if (mic->enabled)
>>>   		goto unlock;
>>>   
>>> -	ret = pm_runtime_get_sync(mic->dev);
>>> -	if (ret < 0) {
>>> -		pm_runtime_put_noidle(mic->dev);
>>> +	ret = pm_runtime_resume_and_get(mic->dev);
>>> +	if (ret < 0)
>>>   		goto unlock;
>>> -	}
>>>   
>>>   	mic_set_path(mic, 1);
>>>   
>>> -- 
>>> 2.7.4
>>>
> .
>

