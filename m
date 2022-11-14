Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB0627D5A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2566C10E08B;
	Mon, 14 Nov 2022 12:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842FB10E08B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 12:07:56 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N9nzz1CdszJnhs;
 Mon, 14 Nov 2022 20:04:47 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 20:07:53 +0800
Message-ID: <d02a8e65-8081-01d0-2bee-4d9473963417@huawei.com>
Date: Mon, 14 Nov 2022 20:07:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/panel/raspberrypi-touchscreen: Fix error handling in
 rpi_touchscreen_init()
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20221114081956.37853-1-yuancan@huawei.com>
 <CAPY8ntBWKaAWmKB2hHirvwzgMZoBP2ONb_WKJz44XTxUJ2k_sw@mail.gmail.com>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <CAPY8ntBWKaAWmKB2hHirvwzgMZoBP2ONb_WKJz44XTxUJ2k_sw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
Cc: architt@codeaurora.org, f.fainelli@gmail.com, emma@anholt.net,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


在 2022/11/14 19:55, Dave Stevenson 写道:
> Hi Yuan
>
> On Mon, 14 Nov 2022 at 08:21, Yuan Can <yuancan@huawei.com> wrote:
>> A problem about modprobe panel-raspberrypi-touchscreen is triggered with
>> the following log given:
>>
>>   [  542.980748] Error: Driver 'rpi-ts-dsi' is already registered, aborting...
>>
>> And with this log printed, the panel_raspberrypi_touchscreen is listed by
>> lsmod, rmmod on it can trigger the WARN of "Unexpected driver unregister".
>>
>> The reason is that the return value of mipi_dsi_driver_register() and
>> i2c_add_driver() is not checked in rpi_touchscreen_init(), if
>> i2c_add_driver() failed, the rpi_touchscreen_dsi_driver is never
>> unregistered, and next time when install this module, the
>> mipi_dsi_driver_register() is failed but rpi_touchscreen_init() returns 0,
>> leading to the panel_raspberrypi_touchscreen listed by lsmod.
>>
>> Call graph of modprobe panel-raspberrypi-touchscreen at the first time:
>>   rpi_touchscreen_init()
>>     mipi_dsi_driver_register() # register rpi_touchscreen_dsi_driver
>>     i2c_add_driver()
>>       driver_register()
>>         bus_add_driver()
>>           priv = kzalloc(...) # OOM happened
>>   # return without unregister rpi_touchscreen_dsi_driver
>>
>> Call graph of retrying modprobe panel-raspberrypi-touchscreen:
>>   rpi_touchscreen_init()
>>     mipi_dsi_driver_register() # Error message printed, register failed!
>>     i2c_add_driver() # succeed and return
>>
>> Fix by checking the return value of both functions and unregister
>> rpi_touchscreen_dsi_driver if i2c_add_driver() failed.
>>
>> Fixes: 2f733d6194bd ("drm/panel: Add support for the Raspberry Pi 7" Touchscreen.")
>> Signed-off-by: Yuan Can <yuancan@huawei.com>
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> I would strongly recommend that you look at switching to the tc358762
> bridge, panel-simple, and the rpi-panel-attiny-regulator regulator
> driver, rather than this driver.
>
> The raspberrypi-touchscreen driver has no suitable hooks for the
> edt-ft5x06 touch driver to register for regulator control. If the
> display sleeps then the power is killed to the touch controller but
> the touch driver has no knowledge of this. This issue should have been
> solved with rpi-panel-attiny / tc358762 / panel-simple.
Thanks for the suggestion!

-- 
Best regards,
Yuan Can

