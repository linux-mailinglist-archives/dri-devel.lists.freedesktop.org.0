Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ABF382C3C
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 14:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C454B6E94B;
	Mon, 17 May 2021 12:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A760C6E94B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 12:34:31 +0000 (UTC)
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FkJQz44xFzmVW4;
 Mon, 17 May 2021 20:31:39 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 20:34:21 +0800
Received: from [10.174.179.129] (10.174.179.129) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 17 May 2021 20:34:20 +0800
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix PM reference leak in
 cdns_mhdp_probe()
To: Robert Foss <robert.foss@linaro.org>
References: <20210517081601.1563193-1-yukuai3@huawei.com>
 <CAG3jFyvjD+Gf5C+sWA8Qi9Hp-tJHeCjqbWX5Fds3m41nCLreyA@mail.gmail.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <e96fc474-b4d3-31b2-897e-f2eddc5433dc@huawei.com>
Date: Mon, 17 May 2021 20:34:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyvjD+Gf5C+sWA8Qi9Hp-tJHeCjqbWX5Fds3m41nCLreyA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.129]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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

On 2021/05/17 17:27, Robert Foss wrote:
> Hey Yu,
> 
> On Mon, 17 May 2021 at 10:08, Yu Kuai <yukuai3@huawei.com> wrote:
>>
>> pm_runtime_get_sync will increment pm usage counter even it failed.
>> Forgetting to putting operation will result in reference leak here.
>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>> counter balanced.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>> ---
>>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index 0cd8f40fb690..305489d48c16 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -2478,7 +2478,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>>          clk_prepare_enable(clk);
>>
>>          pm_runtime_enable(dev);
>> -       ret = pm_runtime_get_sync(dev);
>> +       ret = pm_runtime_resume_and_get(dev);
>>          if (ret < 0) {
>>                  dev_err(dev, "pm_runtime_get_sync failed\n");
>>                  pm_runtime_disable(dev);
> 
> The code is correct as it is. If pm_runtime_get_sync() fails and
> increments[1] the pm.usage_count variable, that isn't a problem since
> pm_runtime_disable() disables pm, and resets pm.usage_count variable
> to zero[2].
> 
> [1] https://elixir.bootlin.com/linux/latest/source/include/linux/pm_runtime.h#L384
> [2] https://elixir.bootlin.com/linux/latest/source/drivers/base/power/runtime.c#L1383
> .
> 
Hi,

Thank you very much for your explanation

Yu Kuai
