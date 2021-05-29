Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A551394B53
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 11:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538BC8813A;
	Sat, 29 May 2021 09:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA776E10D
 for <dri-devel@lists.freedesktop.org>; Sat, 29 May 2021 09:33:16 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FsbPb5jSXzWnhQ;
 Sat, 29 May 2021 17:10:43 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 17:15:21 +0800
Received: from [10.174.179.129] (10.174.179.129) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 29 May 2021 17:15:20 +0800
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix PM reference leak in
 cdns_mhdp_probe()
To: Robert Foss <robert.foss@linaro.org>, Johan Hovold <johan@kernel.org>
References: <20210517081601.1563193-1-yukuai3@huawei.com>
 <CAG3jFyvjD+Gf5C+sWA8Qi9Hp-tJHeCjqbWX5Fds3m41nCLreyA@mail.gmail.com>
 <YKNv5fsVaTrslJZw@hovoldconsulting.com>
 <CAG3jFyu9x0NERFQ78GAX_6TUimB_PmBXkcVJZ9i+HXbK=N0dmQ@mail.gmail.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <da560b11-4ee0-c534-6dd0-4e080a1e10f3@huawei.com>
Date: Sat, 29 May 2021 17:15:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyu9x0NERFQ78GAX_6TUimB_PmBXkcVJZ9i+HXbK=N0dmQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.129]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema762-chm.china.huawei.com (10.1.198.204)
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 yi.zhang@huawei.com, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ping ...

On 2021/05/18 20:58, Robert Foss wrote:
> On Tue, 18 May 2021 at 09:42, Johan Hovold <johan@kernel.org> wrote:
>>
>> On Mon, May 17, 2021 at 11:27:38AM +0200, Robert Foss wrote:
>>> Hey Yu,
>>>
>>> On Mon, 17 May 2021 at 10:08, Yu Kuai <yukuai3@huawei.com> wrote:
>>>>
>>>> pm_runtime_get_sync will increment pm usage counter even it failed.
>>>> Forgetting to putting operation will result in reference leak here.
>>>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>>>> counter balanced.
>>>>
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>>>> ---
>>>>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> index 0cd8f40fb690..305489d48c16 100644
>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>>>> @@ -2478,7 +2478,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>>>>          clk_prepare_enable(clk);
>>>>
>>>>          pm_runtime_enable(dev);
>>>> -       ret = pm_runtime_get_sync(dev);
>>>> +       ret = pm_runtime_resume_and_get(dev);
>>>>          if (ret < 0) {
>>>>                  dev_err(dev, "pm_runtime_get_sync failed\n");
> 
> This error message is a bit confusing now, could you update it.
> 
>>>>                  pm_runtime_disable(dev);
>>>
>>> The code is correct as it is. If pm_runtime_get_sync() fails and
>>> increments[1] the pm.usage_count variable, that isn't a problem since
>>> pm_runtime_disable() disables pm, and resets pm.usage_count variable
>>> to zero[2].
>>
>> No it doesn't; pm_runtime_disable() does not reset the counter and you
>> still need to decrement the usage count when pm_runtime_get_sync()
>> fails.
> 
> Thanks for chiming in Johan, you're absolutely right and I must have
> misread something.
> 
> With the above fix, feel free to add my r-b.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> .
> 
