Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB05EEAE6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 03:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3553010E859;
	Thu, 29 Sep 2022 01:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3205E10E859
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 01:26:39 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MdFxS00KlzpSts;
 Thu, 29 Sep 2022 09:23:39 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 09:26:36 +0800
Message-ID: <51da1dfd-d5be-85d0-2971-61d140b50d91@huawei.com>
Date: Thu, 29 Sep 2022 09:26:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 10/10] drm/panel: simple: Use dev_err_probe() to simplify
 code
To: Doug Anderson <dianders@chromium.org>
References: <20220924015616.34293-1-yuancan@huawei.com>
 <20220924015616.34293-11-yuancan@huawei.com>
 <CAD=FV=XjwaWwGTLJW0jNOPJHttpEpHDxg5DaJo-U5eMvGSo8_A@mail.gmail.com>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <CAD=FV=XjwaWwGTLJW0jNOPJHttpEpHDxg5DaJo-U5eMvGSo8_A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500024.china.huawei.com (7.185.36.10)
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
Cc: David Airlie <airlied@linux.ie>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2022/9/29 7:03, Doug Anderson 写道:
> Hi,
>
> On Fri, Sep 23, 2022 at 6:59 PM Yuan Can <yuancan@huawei.com> wrote:
>> In the probe path, dev_err() can be replaced with dev_err_probe()
>> which will check if error code is -EPROBE_DEFER and prints the
>> error name. It also sets the defer probe reason which can be
>> checked later through debugfs.
>>
>> Signed-off-by: Yuan Can <yuancan@huawei.com>
>> ---
>>   drivers/gpu/drm/panel/panel-simple.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
>> index 0cb3be26e2e6..1607824dc2b3 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -575,12 +575,9 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>>
>>          panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
>>                                                       GPIOD_OUT_LOW);
>> -       if (IS_ERR(panel->enable_gpio)) {
>> -               err = PTR_ERR(panel->enable_gpio);
>> -               if (err != -EPROBE_DEFER)
>> -                       dev_err(dev, "failed to request GPIO: %d\n", err);
>> -               return err;
>> -       }
>> +       if (IS_ERR(panel->enable_gpio))
>> +               return dev_err_probe(dev, PTR_ERR(panel->enable_gpio),
>> +                                    "failed to request GPIO\n");
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'd be happy to land this patch and the panel-edp one into drm-misc
> just because I've touched those panel drivers in the past. I'd tend to
> leave the other panel drivers to others unless you really get stuck.
>
> For now I'll sit tight because I think you can make a 2nd fix to the
> panel-edp one and put them into the same patch.

Thanks for the notice, I will fix the case in panel_edp_probe in the v2 
patch and

send it ASAP.

-- 
Best regards,
Yuan Can

