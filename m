Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A73613108
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 08:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C44F10E136;
	Mon, 31 Oct 2022 07:05:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F20310E136
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 07:05:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id q9so27200127ejd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 00:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MK+jHrm2hYBv9wkKb/abfad11zivk5bW9tGF3VlFq3U=;
 b=BF79z0RZ0XhmibTMUspbagzzogRc4h6z8LD4vJ4Ix2hxDMQCGaMocNIY91+V8P1A0B
 qPp2sDSgJU23nVb3fzmGOi4eJg+Zt3Q/ktUU80yNkhWG7n841CoJtro3Ko47SmLkfWA9
 rhIdd6MfM7YIdUx2XwwUQqEr01cXmlLLlXqLi3NrLHWA9cTPzBAwwOmuasgceETeFVeL
 OHA1yNxeoIYM6vIEU2DaOZQQ6UVAJesF9sLaECKlwbs/N3yy8XvbMk3mI8+ehkDPPGjC
 LEkO9E1rAoOGafBldh9CVTNZalEwxr/kwTnoRF7Ngu3XCefcaNiJ4dVXIXnJuaNm0UuP
 AmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MK+jHrm2hYBv9wkKb/abfad11zivk5bW9tGF3VlFq3U=;
 b=TEg6hfa5AYXRLTdC3QMRUcjomx2/OfnKm1+TxUBJyT44KzB2skSgz36Sb97yAztUNr
 3XbbXfnIJXULnMWq8oIcwNeiF1g3SxZ6rZo5xcUvkzjurL5g4nCVEaF9XRbDLtpmc1aD
 0HbLKdPPu2d1Bsi5bSoHVekLJyLSk9nVaZ04nqvswY5cPK9uy17z7xTu+WdPoz8S679T
 7n7CQ1FVlrcnLBs6gxYgL/YujjXjQCuyiDOzrnDEqUnM/+pXPqhlwixfpp+I0t4dLmn/
 dyRIV5xI1Os8HSp1mmB5hm5mNqlH7N7EGpbJHmUPafS9UbQ8HhKBq+KafMa4spw8SOib
 on/Q==
X-Gm-Message-State: ACrzQf2mhLYibhGNAtL53EWDPDO9JYpIcraZI3NwIxHQ1G0QkJJD8W+P
 6QXyuZ4rMuGQxb0rCOXX3ds=
X-Google-Smtp-Source: AMsMyM55cWpX9uDMf1Dtg2wvjWJa+matOOOcle0zhukTPrtjubcellBbE3vWh1bUoXR0HqNmFaOC5w==
X-Received: by 2002:a17:907:25c5:b0:782:978d:c3da with SMTP id
 ae5-20020a17090725c500b00782978dc3damr11009394ejc.623.1667199912488; 
 Mon, 31 Oct 2022 00:05:12 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id
 gg6-20020a170906e28600b007ad2da5668csm2651759ejb.112.2022.10.31.00.05.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Oct 2022 00:05:11 -0700 (PDT)
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
To: "H. Nikolaus Schaller" <hns@goldelico.com>, tony@atomide.com
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <4B3F8E50-3472-4AED-9A77-3E265DF8C928@goldelico.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <0000784a-ae89-1081-0ec7-fc77d3381545@gmail.com>
Date: Mon, 31 Oct 2022 09:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4B3F8E50-3472-4AED-9A77-3E265DF8C928@goldelico.com>
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
Cc: tomba@kernel.org, airlied@linux.ie, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI Nikolaus,

On 31.10.22 г. 0:08 ч., H. Nikolaus Schaller wrote:
> Hi Ivaylo,
> 
> it took a while until I found time to test newer kernels (mainline + Letux additions)
> on the OMAP5 Pyra but unfortunately I did not get screen display for v6.1. Even worse,
> the console was flooded by

Could you elaborate on that - do you have anything on the display 
(during boot or dunno). Do you have simplefb enabled, so boot log to be 
visible on the display? Is that wayland you are trying to run? Do you 
have PVR driver enabled? Did you try to boot vanilla kernel?

> 
> [   39.419846] WARNING: CPU: 0 PID: 3673 at drivers/bus/omap_l3_noc.c:139 l3_interrupt_handler+0x23c/0x330
> [   39.429914] 44000000.l3-noc:L3 Custom Error: MASTER MPU TARGET GPMC (Idle): Data Access in Supervisor mode during Functional access
> ...
> 

I have no idea what that error is supposed to mean. @Tony?

> making the system unuseable.
> 
> After doing some manual bisect by installing different kernel versions on the boot SD card,
> I was able to identify that it crept in between v5.18 and v5.19-rc1. A git bisect on this
> range (adding Letux patches on top of each bisect base) did reveal this patch as the first bad one.
> 
> After reverting it seems as if I can use any v5.19 .. v6.1-rc2 kernel without issues.
> 
> Now I wonder why this patch breaks my system?
> 

A wild guess - omap5 has some cache issues (as is visible from 
7cb0d6c17b96b8bf3c25de2dfde4fdeb9191f4c3), which lead to the above. 
Before the patch *all* access to the BO backing memory was done through 
TILER/DMM, mitigating the issue. After the patch, whoever tries to 
render to non-scanout buffer is doing it directly to the memory, causing 
the issue.

Another possibility - someone assumes that memory is always linear, 
which is true when it is accessed through DMM, but it is not after the 
patch. Do you have my "drm: pvrsgx: dmabuf import - Do not assume 
scatterlist memory is contiguous" patch in your PVR driver? Maybe there 
is another driver that lacks similar patch.

Regards,
Ivo

> BR and thanks,
> Nikolaus
> 
> 
>> Am 19.01.2022 um 11:23 schrieb Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>:
>>
>> On devices with DMM, all allocations are done through either DMM or TILER.
>> DMM/TILER being a limited resource means that such allocations will start
>> to fail before actual free memory is exhausted. What is even worse is that
>> with time DMM/TILER space gets fragmented to the point that even if we have
>> enough free DMM/TILER space and free memory, allocation fails because there
>> is no big enough free block in DMM/TILER space.
>>
>> Such failures can be easily observed with OMAP xorg DDX, for example -
>> starting few GUI applications (so buffers for their windows are allocated)
>> and then rotating landscape<->portrait while closing and opening new
>> windows soon results in allocation failures.
>>
>> Fix that by mapping buffers through DMM/TILER only when really needed,
>> like, for scanout buffers.
>>
>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>> ---
>> drivers/gpu/drm/omapdrm/omap_gem.c | 12 ++++++++----
>> 1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
>> index 41c1a6d..cf57179 100644
>> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
>> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
>> @@ -821,10 +821,12 @@ int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
>> 			if (ret)
>> 				goto fail;
>>
>> -			if (priv->has_dmm) {
>> -				ret = omap_gem_pin_tiler(obj);
>> -				if (ret)
>> -					goto fail;
>> +			if (omap_obj->flags & OMAP_BO_SCANOUT) {
>> +				if (priv->has_dmm) {
>> +					ret = omap_gem_pin_tiler(obj);
>> +					if (ret)
>> +						goto fail;
>> +				}
>> 			}
>> 		} else {
>> 			refcount_inc(&omap_obj->pin_cnt);
>> @@ -861,6 +863,8 @@ static void omap_gem_unpin_locked(struct drm_gem_object *obj)
>> 			kfree(omap_obj->sgt);
>> 			omap_obj->sgt = NULL;
>> 		}
>> +		if (!(omap_obj->flags & OMAP_BO_SCANOUT))
>> +			return;
>> 		if (priv->has_dmm) {
>> 			ret = tiler_unpin(omap_obj->block);
>> 			if (ret) {
>> -- 
>> 1.9.1
>>
> 
