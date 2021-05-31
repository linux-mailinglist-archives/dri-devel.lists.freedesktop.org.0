Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E90B7395DAB
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 15:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9156E4AA;
	Mon, 31 May 2021 13:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB806E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 13:48:13 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FtxNV6pjnz67Rs;
 Mon, 31 May 2021 21:44:26 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 21:48:06 +0800
Received: from [10.174.179.129] (10.174.179.129) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 31 May 2021 21:48:05 +0800
Subject: Re: [PATCH V2] drm: bridge: cdns-mhdp8546: Fix PM reference leak in
 cdns_mhdp_probe()
To: Robert Foss <robert.foss@linaro.org>
References: <20210517081601.1563193-1-yukuai3@huawei.com>
 <20210529095554.3150362-1-yukuai3@huawei.com>
 <CAG3jFyt53-MhwgGGcmMVSap3xCE_cQOmN26Rj3TvHtWFeVLZWg@mail.gmail.com>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <36cef11c-6b33-57ff-f1b1-32c074efa8ac@huawei.com>
Date: Mon, 31 May 2021 21:48:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyt53-MhwgGGcmMVSap3xCE_cQOmN26Rj3TvHtWFeVLZWg@mail.gmail.com>
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

On 2021/05/31 18:54, Robert Foss wrote:
> Hey Yu,
> 
> I'm not finding your this patch with the correct tags. I'd expect the subject:
> [PATCH v2] drm: bridge: cdns-mhdp8546: Fix PM reference leak in
> cdns_mhdp_probe()
> 
> Can you please resubmit using this title, just to be sure I merge the
> right version of this code.
> 
Hi,

I just resubmit v2 patch.

Thanks
Yu Kuai
> On Sat, 29 May 2021 at 11:46, Yu Kuai <yukuai3@huawei.com> wrote:
>>
>> pm_runtime_get_sync will increment pm usage counter even it failed.
>> Forgetting to putting operation will result in reference leak here.
>> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
>> counter balanced.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>> ---
>> changes in V2:
>>   - change error message.
>>
>>   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> index 0cd8f40fb690..eab959a59214 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
>> @@ -2478,9 +2478,9 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
>>          clk_prepare_enable(clk);
>>
>>          pm_runtime_enable(dev);
>> -       ret = pm_runtime_get_sync(dev);
>> +       ret = pm_runtime_resume_and_get(dev);
>>          if (ret < 0) {
>> -               dev_err(dev, "pm_runtime_get_sync failed\n");
>> +               dev_err(dev, "pm_runtime_resume_and_get failed\n");
>>                  pm_runtime_disable(dev);
>>                  goto clk_disable;
>>          }
>> --
>> 2.25.4
>>
> .
> 
