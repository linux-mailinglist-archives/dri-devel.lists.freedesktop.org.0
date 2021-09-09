Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4863A405A23
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 17:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3CE6E877;
	Thu,  9 Sep 2021 15:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B156E877
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/WR/WDqoxPZkbqsjtoysj4eKdz0odOJ3LSqaMxTsMRc=; b=M/7pXCFXpajXSpoYz1LOh5ueJ0
 IPUEUrfsnZ9oiqPIOobMPX/KkOoNpK9htwSPa1PuhBD43gY5FpWbZ8ktto87XKDX/8+MeKZ/Djzfd
 sQk43bfry+WzgTlaF2AcSAxnxFeNkEUvA7AXjhgE9kzIMcKBbJuwu/bjNY/bmZnBO1BwYedyLx+dT
 qROvVq1idejGhK+9jyUNXOs+JdGPiqviCGFN83aFRXmhMZFG7h6TCg+nDYR7WAoBtYbC5KXTNHpBa
 yyJnTEcX30zOSDtPD9mu9H17cANyc+jzRamcNBUVFVUxVfBF5Rl+2LYKZBgzrQ2MupVAvQREx119O
 d96ht5rQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51039
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mOLsg-0001lR-Re; Thu, 09 Sep 2021 17:22:26 +0200
Subject: Re: [PATCH v2 7/7] drm/gud: Add module parameter to control
 emulation: xrgb8888
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: peter@stuge.se, linus.walleij@linaro.org
References: <20210907115752.6181-1-noralf@tronnes.org>
 <20210907115752.6181-8-noralf@tronnes.org>
 <3428e1f0-7586-a0e2-6334-b7362cdb75b4@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <86906388-6c6f-a82b-3c66-93f50ed37d99@tronnes.org>
Date: Thu, 9 Sep 2021 17:22:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <3428e1f0-7586-a0e2-6334-b7362cdb75b4@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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



Den 08.09.2021 20.10, skrev Thomas Zimmermann:
> Hi
> 
> Am 07.09.21 um 13:57 schrieb Noralf Trønnes:
>> For devices that don't support XRGB8888 give the user the ability to
>> choose what's most important: Color depth or frames per second.
>>
>> Add an 'xrgb8888' module parameter to override the emulation format.
>>
>> Assume the user wants full control if xrgb8888 is set and don't set
>> DRM_CAP_DUMB_PREFERRED_DEPTH if RGB565 is supported (AFAIK only X.org
>> supports this).
> 
> More of a general statement: wouldn't it make more sense to auto-detect
> this entirely? The GUD protocol could order the list of supported
> formats by preference (maybe it does already). Or you could take the
> type of USB connection into account.
> 

There is preference in that the driver will use xrgb8888 emulation on
the first format returned by the device. Yeah USB speed could be used as
a metric for preferred depth, but I don't know of anyone else than X.org
using it so I'm unsure about the value.

Daniel mentioned that this parameter targets all devices, so it's not a
very good solution.

Maybe I should drop this patch and gather more user experience with the
depth/speed challenge before trying to come up with a solution.

> Additionally, xrgb8888 is really a fall-back for lazy userspace
> programs, but userspace should do better IMHO.
> 

I don't think even the most agile userspace supports monochrome,
greyscale or even RGB332 ;)

Noralf.

> Best regards
> Thomas
> 
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
>>   drivers/gpu/drm/gud/gud_drv.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/gud/gud_drv.c
>> b/drivers/gpu/drm/gud/gud_drv.c
>> index 3f9d4b9a1e3d..60d27ee5ddbd 100644
>> --- a/drivers/gpu/drm/gud/gud_drv.c
>> +++ b/drivers/gpu/drm/gud/gud_drv.c
>> @@ -30,6 +30,10 @@
>>     #include "gud_internal.h"
>>   +static int gud_xrgb8888;
>> +module_param_named(xrgb8888, gud_xrgb8888, int, 0644);
>> +MODULE_PARM_DESC(xrgb8888, "XRGB8888 emulation format:
>> GUD_PIXEL_FORMAT_* value, 0=auto, -1=disable [default=auto]");
>> +
>>   /* Only used internally */
>>   static const struct drm_format_info gud_drm_format_r1 = {
>>       .format = GUD_DRM_FORMAT_R1,
>> @@ -530,12 +534,12 @@ static int gud_probe(struct usb_interface *intf,
>> const struct usb_device_id *id)
>>           case DRM_FORMAT_RGB332:
>>               fallthrough;
>>           case DRM_FORMAT_RGB888:
>> -            if (!xrgb8888_emulation_format)
>> +            if (!gud_xrgb8888 && !xrgb8888_emulation_format)
>>                   xrgb8888_emulation_format = info;
>>               break;
>>           case DRM_FORMAT_RGB565:
>>               rgb565_supported = true;
>> -            if (!xrgb8888_emulation_format)
>> +            if (!gud_xrgb8888 && !xrgb8888_emulation_format)
>>                   xrgb8888_emulation_format = info;
>>               break;
>>           case DRM_FORMAT_XRGB8888:
>> @@ -543,6 +547,9 @@ static int gud_probe(struct usb_interface *intf,
>> const struct usb_device_id *id)
>>               break;
>>           }
>>   +        if (gud_xrgb8888 == formats_dev[i])
>> +            xrgb8888_emulation_format = info;
>> +
>>           fmt_buf_size = drm_format_info_min_pitch(info, 0,
>> drm->mode_config.max_width) *
>>                      drm->mode_config.max_height;
>>           max_buffer_size = max(max_buffer_size, fmt_buf_size);
>> @@ -559,7 +566,7 @@ static int gud_probe(struct usb_interface *intf,
>> const struct usb_device_id *id)
>>       }
>>         /* Prefer speed over color depth */
>> -    if (rgb565_supported)
>> +    if (!gud_xrgb8888 && rgb565_supported)
>>           drm->mode_config.preferred_depth = 16;
>>         if (!xrgb8888_supported && xrgb8888_emulation_format) {
>>
> 
