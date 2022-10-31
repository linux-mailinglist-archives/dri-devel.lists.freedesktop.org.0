Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C724613324
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 10:58:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9588810E181;
	Mon, 31 Oct 2022 09:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A193210E181
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 09:58:21 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id y14so28012897ejd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pBO//+hBRlM60htduQj/FFZSkV2CgCB2Q0ldC9TC1NE=;
 b=YC3Y0ahAxRyQuL7vmZAbcu2UyeWltPUnhdKm9gkv3ERZedVU4aLg61NU9XiNerq5v4
 F3Qlvy1n2WAcmE2bVb++xIyGYkaFyfxu2HmiXIGszgHdcLfT5hi00sDXBnYXTYDL6v63
 TREJcUWu7YAUgYpsq0LOliVEGtEt8wqZK4i451HOLn2B+18Zd+fgkQKVmt0CICj+PSzJ
 TMOzaCS+g8a4skIb9gurRthiqTNoQZ4EZ45QSikDRSJ4jg23YoD25Lxnpb69t/IBwcHW
 12PucZvtauFdOse5yAP4sjRn0gZJjeUIgsfbhO+09bSImuwaNiu0BlXTbaTyziWJiL+J
 8Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pBO//+hBRlM60htduQj/FFZSkV2CgCB2Q0ldC9TC1NE=;
 b=lsqS/WS1FatB+rwgRdUTwbH/++wZ/tohfi/et/pxZhsikgKRNrz8rpGG1/JJgjZfGY
 GIWTb5ZdoUVg4VevF9oxbo3z/iQoex1xvtCzQHFYmU/Cb1xIKs8M87jrBrEHEjDcyHpJ
 IZR55aTtTP3ywNyMKRsTo8DllYzhbt6fQdm/sTrKRY/N6wWaWlFIozszvB77ALlf9JC5
 A+eY93cCMqQRE2E13/sz6wtnXgrMGyk2x8AGkfaMyvEodmewN/2S1XN6NitcPvNrLq1j
 bEM6zXjqdpIz0xY2Guzv9CS0ih1TXaCZDOt57eKbw9oF9sSJEjx4bglxj5z1jlF423QW
 dM5g==
X-Gm-Message-State: ACrzQf0VErzWM4AiRG2Jl2Bvi/p/E1iNhiKg49jaIEmbwlJMOmEspF1v
 29Ol3tuPcUKneMsl2/Bf2gqrLo4XTYS7ug==
X-Google-Smtp-Source: AMsMyM45t4BSfhyHt0xXYSSHzAQ6glYOUnyjRGG5/1vSL01RCByog4Hba2jNLcbOdh0oSovTx331kQ==
X-Received: by 2002:a17:906:846d:b0:7ad:90dd:4b6 with SMTP id
 hx13-20020a170906846d00b007ad90dd04b6mr11753567ejc.492.1667210300045; 
 Mon, 31 Oct 2022 02:58:20 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id
 t16-20020aa7db10000000b00461aebb2fe2sm3034852eds.54.2022.10.31.02.58.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Oct 2022 02:58:19 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <4B3F8E50-3472-4AED-9A77-3E265DF8C928@goldelico.com>
 <0000784a-ae89-1081-0ec7-fc77d3381545@gmail.com>
 <F3F3E8E1-7907-46A4-A670-CAEF6C3DB083@goldelico.com>
 <A2089A8A-69D3-4825-B400-8EB382DC9955@goldelico.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <d4a5afcc-9ee0-208c-82ad-11ccd0e316b5@gmail.com>
Date: Mon, 31 Oct 2022 11:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <A2089A8A-69D3-4825-B400-8EB382DC9955@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: tomba@kernel.org, Tony Lindgren <tony@atomide.com>, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31.10.22 г. 9:57 ч., H. Nikolaus Schaller wrote:
> 
> 
>> Am 31.10.2022 um 08:44 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
>>
>> Hi Ivaylo,
>>
>>> Am 31.10.2022 um 08:05 schrieb Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>:
>>>
>>> HI Nikolaus,
>>>
>>> On 31.10.22 г. 0:08 ч., H. Nikolaus Schaller wrote:
>>>> Hi Ivaylo,
>>>> it took a while until I found time to test newer kernels (mainline + Letux additions)
>>>> on the OMAP5 Pyra but unfortunately I did not get screen display for v6.1. Even worse,
>>>> the console was flooded by
>>>
>>> Could you elaborate on that - do you have anything on the display (during boot or dunno). Do you have simplefb enabled, so boot log to be visible on the display?
>>
>> No bootlog enabled but I have some printk in the panel driver. It is initially enabled, then disabled and enabled again. Then the issues start...
>>
>>> Is that wayland you are trying to run? Do you have PVR driver enabled? Did you try to boot vanilla kernel?
>>
>> I have tested with Debian Stretch with standard Xorg with "omap" driver. PVR is not enabled.
> 
> Have cross-checked: my setup uses the fbdev driver.
> 

omapfb and not omapdrm? or I am missing something.

>> And without your patch everything is fine on all kernels since 4.something.
>>
>> Vanilla kernel can not be booted on that machine - there is not even a device tree...
>>
>>>
>>>> [   39.419846] WARNING: CPU: 0 PID: 3673 at drivers/bus/omap_l3_noc.c:139 l3_interrupt_handler+0x23c/0x330
>>>> [   39.429914] 44000000.l3-noc:L3 Custom Error: MASTER MPU TARGET GPMC (Idle): Data Access in Supervisor mode during Functional access
>>>> ...
>>>
>>> I have no idea what that error is supposed to mean. @Tony?
>>
>> A coincidence is that the display is sometimes showing some artistic patterns. So maybe DMA accesses non-existing memory?
>>
>>>
>>>> making the system unuseable.
>>>> After doing some manual bisect by installing different kernel versions on the boot SD card,
>>>> I was able to identify that it crept in between v5.18 and v5.19-rc1. A git bisect on this
>>>> range (adding Letux patches on top of each bisect base) did reveal this patch as the first bad one.
>>>> After reverting it seems as if I can use any v5.19 .. v6.1-rc2 kernel without issues.
>>>> Now I wonder why this patch breaks my system?
>>>
>>> A wild guess - omap5 has some cache issues (as is visible from 7cb0d6c17b96b8bf3c25de2dfde4fdeb9191f4c3), which lead to the above. Before the patch *all* access to the BO backing memory was done through TILER/DMM, mitigating the issue. After the patch, whoever tries to render to non-scanout buffer is doing it directly to the memory, causing the issue.
>>>
>>> Another possibility - someone assumes that memory is always linear, which is true when it is accessed through DMM, but it is not after the patch. Do you have my "drm: pvrsgx: dmabuf import - Do not assume scatterlist memory is contiguous" patch in your PVR driver? Maybe there is another driver that lacks similar patch.
>>
>> Yes, it is included.
>>
>> Best regards,
>> Nikolaus
>>
>>>
>>> Regards,
>>> Ivo
>>>
>>>> BR and thanks,
>>>> Nikolaus
>>>>> Am 19.01.2022 um 11:23 schrieb Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>:
>>>>>
>>>>> On devices with DMM, all allocations are done through either DMM or TILER.
>>>>> DMM/TILER being a limited resource means that such allocations will start
>>>>> to fail before actual free memory is exhausted. What is even worse is that
>>>>> with time DMM/TILER space gets fragmented to the point that even if we have
>>>>> enough free DMM/TILER space and free memory, allocation fails because there
>>>>> is no big enough free block in DMM/TILER space.
>>>>>
>>>>> Such failures can be easily observed with OMAP xorg DDX, for example -
>>>>> starting few GUI applications (so buffers for their windows are allocated)
>>>>> and then rotating landscape<->portrait while closing and opening new
>>>>> windows soon results in allocation failures.
>>>>>
>>>>> Fix that by mapping buffers through DMM/TILER only when really needed,
>>>>> like, for scanout buffers.
>>>>>
>>>>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>>>>> ---
>>>>> drivers/gpu/drm/omapdrm/omap_gem.c | 12 ++++++++----
>>>>> 1 file changed, 8 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
>>>>> index 41c1a6d..cf57179 100644
>>>>> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
>>>>> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
>>>>> @@ -821,10 +821,12 @@ int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
>>>>> 			if (ret)
>>>>> 				goto fail;
>>>>>
>>>>> -			if (priv->has_dmm) {
>>>>> -				ret = omap_gem_pin_tiler(obj);
>>>>> -				if (ret)
>>>>> -					goto fail;
>>>>> +			if (omap_obj->flags & OMAP_BO_SCANOUT) {
>>>>> +				if (priv->has_dmm) {
>>>>> +					ret = omap_gem_pin_tiler(obj);
>>>>> +					if (ret)
>>>>> +						goto fail;
>>>>> +				}
>>>>> 			}
>>>>> 		} else {
>>>>> 			refcount_inc(&omap_obj->pin_cnt);
>>>>> @@ -861,6 +863,8 @@ static void omap_gem_unpin_locked(struct drm_gem_object *obj)
>>>>> 			kfree(omap_obj->sgt);
>>>>> 			omap_obj->sgt = NULL;
>>>>> 		}
>>>>> +		if (!(omap_obj->flags & OMAP_BO_SCANOUT))
>>>>> +			return;
>>>>> 		if (priv->has_dmm) {
>>>>> 			ret = tiler_unpin(omap_obj->block);
>>>>> 			if (ret) {
>>>>> -- 
>>>>> 1.9.1
>>>>>
>>
> 
