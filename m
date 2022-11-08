Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AEC620BC2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 10:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BAB10E25E;
	Tue,  8 Nov 2022 09:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A4B10E25E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 09:08:17 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N62LY5k5FzHvhG;
 Tue,  8 Nov 2022 17:07:49 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 17:08:13 +0800
Message-ID: <94ef43a4-6529-4df9-acfd-367989a549fd@huawei.com>
Date: Tue, 8 Nov 2022 17:08:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/bridge: megachips: Fix error handling in
 i2c_register_driver()
To: Andrzej Hajda <andrzej.hajda@intel.com>, <peter.senna@gmail.com>,
 <martin.donnelly@ge.com>, <martyn.welch@collabora.co.uk>,
 <neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <architt@codeaurora.org>, <dri-devel@lists.freedesktop.org>
References: <20221108082956.35802-1-yuancan@huawei.com>
 <aa5ffd76-d95a-8aea-ddc9-eaf8e95a73ce@intel.com>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <aa5ffd76-d95a-8aea-ddc9-eaf8e95a73ce@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2022/11/8 16:50, Andrzej Hajda 写道:
>
>
> On 08.11.2022 09:29, Yuan Can wrote:
>> A problem about insmod megachips-stdpxxxx-ge-b850v3-fw.ko failed is
>> triggered with the following log given:
>>
>> [ 4497.981497] Error: Driver 'stdp4028-ge-b850v3-fw' is already 
>> registered, aborting...
>> insmod: ERROR: could not insert module 
>> megachips-stdpxxxx-ge-b850v3-fw.ko: Device or resource busy
>>
>> The reason is that stdpxxxx_ge_b850v3_init() returns i2c_add_driver()
>> directly without checking its return value, if i2c_add_driver() failed,
>> it returns without calling i2c_del_driver() on the previous i2c driver,
>> resulting the megachips-stdpxxxx-ge-b850v3-fw can never be installed
>> later.
>> A simple call graph is shown as below:
>>
>>   stdpxxxx_ge_b850v3_init()
>>     i2c_add_driver(&stdp4028_ge_b850v3_fw_driver)
>>     i2c_add_driver(&stdp2690_ge_b850v3_fw_driver)
>>       i2c_register_driver()
>>         driver_register()
>>           bus_add_driver()
>>             priv = kzalloc(...) # OOM happened
>>     # return without delete stdp4028_ge_b850v3_fw_driver
>>
>> Fix by calling i2c_del_driver() on stdp4028_ge_b850v3_fw_driver when
>> i2c_add_driver() returns error.
>>
>> Fixes: fcfa0ddc18ed ("drm/bridge: Drivers for 
>> megachips-stdpxxxx-ge-b850v3-fw (LVDS-DP++)")
>> Signed-off-by: Yuan Can <yuancan@huawei.com>
>> ---
>>   drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c 
>> b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
>> index 97359f807bfc..0d037eeefcf3 100644
>> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
>> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
>> @@ -440,7 +440,13 @@ static int __init stdpxxxx_ge_b850v3_init(void)
>>       if (ret)
>>           return ret;
>>   -    return i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
>> +    ret = i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
>> +    if (ret) {
>> +        i2c_del_driver(&stdp4028_ge_b850v3_fw_driver);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>
> Could be:
> ret = i2c_add_driver(&stdp2690_ge_b850v3_fw_driver);
> if (ret)
>     i2c_del_driver(&stdp4028_ge_b850v3_fw_driver);
> return ret;
>
> Up to you. Anyway:
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Thanks for your suggestion, I will change to this style with your 
Reviewed-by in the v2 patch.

-- 
Best regards,
Yuan Can

