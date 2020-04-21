Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E221B255B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 13:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799D16E921;
	Tue, 21 Apr 2020 11:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957346E921
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 11:53:07 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03LBr52Q123013;
 Tue, 21 Apr 2020 06:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1587469985;
 bh=Sbn6cEoVIXyj5Imou1KCoTSKVk91SyWvFmC7Xp8vk0M=;
 h=Subject:From:To:CC:References:Date:In-Reply-To;
 b=DVNjEgB+CwBI6YW4DySygB0fEvqnEUqYgzVOo2H4WWJGXRmzY1bY4Xd9UdmtwYCPa
 8umGw7XI83L/HSO/7Q4UITAT3uITqyLaxhPpvmZ+q7AJbCG8SFD5ws44YXyALDXnaq
 68SPfiLTOgX31y/xJUMTPGBuD6HEDCGl4OEwpVxQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03LBr5Qn088412;
 Tue, 21 Apr 2020 06:53:05 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 06:53:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 06:53:04 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03LBr3nh000995;
 Tue, 21 Apr 2020 06:53:03 -0500
Subject: Re: [PATCH 5/5] backlight: led_bl: rewrite led_bl_parse_levels()
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20200417113312.24340-1-tomi.valkeinen@ti.com>
 <20200417113312.24340-5-tomi.valkeinen@ti.com>
 <20200420160154.4xxv37fofx37ow7q@holly.lan>
 <2233a194-bc8e-99ba-d302-edd087a3adfa@ti.com>
 <20200421104812.kgsdgv2r7bu7iqhe@holly.lan>
 <0c7d02aa-db51-1c6f-e126-88472db4345b@ti.com>
Message-ID: <476ec68b-da2b-2f29-bc0a-3d61b4fc3eb6@ti.com>
Date: Tue, 21 Apr 2020 14:53:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0c7d02aa-db51-1c6f-e126-88472db4345b@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2020 14:26, Tomi Valkeinen wrote:

>>> The led-backlight.txt is
>>> a bit lacking (another thing to improve...) but led-backlight mimics
>>> pwm-backlight, and pwm-backlight.txt says
>>>
>>> default-brightness-level: The default brightness level (index into the array
>>> defined by the "brightness-levels" property)
>>
>> I think this implies we should improve the binding documentation!
>>
>> The parenthetic text's main purpose is to make clear which scale should
>> be used when interpreting the default brightness. Just because the scale
>> is 1:1 doesn't render it meaningless.
> 
> If I read pwm_bl.c right, that's not how the code works. If pwm_bl has no 'brightness-levels', then 
> 'default-brightness-level' is ignored. Which matches the binding documentation.
> 
> What you suggest makes sense, though, so I can adjust this patch to make led_bl behave like that.

On the other hand... If we want to use LED's (or PWM's) brightness levels directly, should the 
default brightness be defined in the LED's (or PWM's) DT node?

And only if we create a backlight brightness-levels mapping, we need to add a new property to define 
a default for those levels. Which, I think, the name implies with the "-level".

Well, in any case, there should be no harm in using 'default-brightness-level' also for the 1:1 
mapping without the 'brightness-levels'. So maybe that's the best route.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
