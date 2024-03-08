Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A868761A0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 11:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF4910F93A;
	Fri,  8 Mar 2024 10:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P7iNCls0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA82010F937;
 Fri,  8 Mar 2024 10:12:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-512e39226efso1970248e87.0; 
 Fri, 08 Mar 2024 02:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709892720; x=1710497520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+9SgGDjTSQoEN/9LevpE3gCXBJ1egZW+GlFcG8/AMFY=;
 b=P7iNCls0G2U1pwHx+pyL1z7vLF4PiGjqJtbXaznOj2l/UlRXP7/iEJ0y8n7C5IN7If
 ubU/nhmG1OwfQR2vhMEK8Sv1yOhXMaETMVPlFP5xEWBppRfsh3CXdZ8+0DU4aVGhNWtH
 X9wcZ4HjTgmCqgU7DX2u6cEHKt6cPIBUxcRNTsayXcJUjU5UnNO3JYGM81wEfTSy3W4G
 P0ZBeeBhXavMxjfhqKSaXFTkW3rGe0FXSBES4nyw815luYcnMYsTyUGROyeYsXiHlWy2
 UeQ+TSpMwyfCOJdy42OZnTHWUrN20XNbU84GavhcVI9nKBX86mXuzX5YjfmIN6lph5qQ
 aC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709892720; x=1710497520;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+9SgGDjTSQoEN/9LevpE3gCXBJ1egZW+GlFcG8/AMFY=;
 b=NcJ/TvJhXc2xFDJ3mUk3F6p1udPFlA+Ymxh73ny/yLTD+ALXL8SwselWtY5jXJxHCI
 ez6rCUtN3QDDDRlaj0N33Acrz2ad4l4qRthgH1wh07S8DdydPjGiKbwxO7WAA75E6NPu
 ikr2aVNo++HPZJrGt5fykb6tDgq7ohI7X+aTjRmlsLHSPNwA9zt3oDjt6YhWJMxTpx3f
 TnbqH0Taz3SZ++khmUNTVE2GVwYBW5HIqOQJuYGihf9HtevWS6cz6/GyBMy9PkeJMTFf
 z3VN39hmsTpPnsO5fraKWwL243Dg/0q5UiSzjSc04vEbFMudtpH5TIUVyaFrBePzF1nD
 zmJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbdAvYpStRoOGPeXAsxzO2Av26CQSshHE2y8FncpgO3tZ+rQD9bvYR2+kKvIJJfXALHa7UE66NX9s97xaxbaLKnRnARtWRUZH9Orme8avq
X-Gm-Message-State: AOJu0YzUr4jHCMa/ebzkNQp6MPCznZTRwpKzM2H8j3RqETNwoJNKV/bR
 tpzeTrDqP7ZlxXTAhB92riEje9FfPo2/p+fUG1GXkkUYoCHUnnX2iy97Zfy1qT0=
X-Google-Smtp-Source: AGHT+IG+KznqAPTfvHh6FLf/kewNkFBSGCBBUpQgAe9jHTYhYvjUwa+3qYC3NEoGkuHulCC0sf1Ksg==
X-Received: by 2002:ac2:4e93:0:b0:513:5e5c:d4ec with SMTP id
 o19-20020ac24e93000000b005135e5cd4ecmr2501888lfr.69.1709892720290; 
 Fri, 08 Mar 2024 02:12:00 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b00412f12f00adsm5456999wmo.10.2024.03.08.02.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 02:11:59 -0800 (PST)
Message-ID: <b1f8dedf-e671-464d-9087-483e46bbd462@gmail.com>
Date: Fri, 8 Mar 2024 11:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amdgpu: add vm fault information to devcoredump
Content-Language: en-US
To: "Khatri, Sunil" <sukhatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Shashank Sharma <shashank.sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mukul Joshi <mukul.joshi@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240307205054.3904657-1-sunil.khatri@amd.com>
 <20240307205054.3904657-3-sunil.khatri@amd.com>
 <ab7c8dde-c914-4e07-a95a-126976917416@amd.com>
 <83c46d51-7d4c-4a2f-b34e-8b6700a5fca7@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <83c46d51-7d4c-4a2f-b34e-8b6700a5fca7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Am 08.03.24 um 10:16 schrieb Khatri, Sunil:
>
> On 3/8/2024 2:39 PM, Christian König wrote:
>> Am 07.03.24 um 21:50 schrieb Sunil Khatri:
>>> Add page fault information to the devcoredump.
>>>
>>> Output of devcoredump:
>>> **** AMDGPU Device Coredump ****
>>> version: 1
>>> kernel: 6.7.0-amd-staging-drm-next
>>> module: amdgpu
>>> time: 29.725011811
>>> process_name: soft_recovery_p PID: 1720
>>>
>>> Ring timed out details
>>> IP Type: 0 Ring Name: gfx_0.0.0
>>>
>>> [gfxhub] Page fault observed
>>> Faulty page starting at address: 0x0000000000000000
>>> Protection fault status register: 0x301031
>>>
>>> VRAM is lost due to GPU reset!
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> index 147100c27c2d..8794a3c21176 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> @@ -203,8 +203,20 @@ amdgpu_devcoredump_read(char *buffer, loff_t 
>>> offset, size_t count,
>>>                  coredump->ring->name);
>>>       }
>>>   +    if (coredump->adev) {
>>> +        struct amdgpu_vm_fault_info *fault_info =
>>> +            &coredump->adev->vm_manager.fault_info;
>>> +
>>> +        drm_printf(&p, "\n[%s] Page fault observed\n",
>>> +               fault_info->vmhub ? "mmhub" : "gfxhub");
>>> +        drm_printf(&p, "Faulty page starting at address: 0x%016llx\n",
>>> +               fault_info->addr);
>>> +        drm_printf(&p, "Protection fault status register: 0x%x\n",
>>> +               fault_info->status);
>>> +    }
>>> +
>>>       if (coredump->reset_vram_lost)
>>> -        drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>>> +        drm_printf(&p, "\nVRAM is lost due to GPU reset!\n");
>>
>> Why this additional new line?
> The intent is the devcoredump have different sections clearly 
> demarcated with an new line else "VRAM is lost due to GPU reset!" 
> seems part of the page fault information.
> [gfxhub] Page fault observed
> Faulty page starting at address: 0x0000000000000000
> Protection fault status register: 0x301031
>
> VRAM is lost due to GPU reset!

In that case I would print the newline independent if VRAM is lost or 
not. Otherwise you get:

Protection fault status register:...

VRAM is lost due to GPU reset!
AMDGPU register dumps:

In one case and:


Protection fault status register:...
AMDGPU register dumps:

In the other case which breaks this sectioning quite a bit.

Regards,
Christian.

>
> Regards
> Sunil
>
>>
>> Apart from that looks really good to me.
>>
>> Regards,
>> Christian.
>>
>>>       if (coredump->adev->reset_info.num_regs) {
>>>           drm_printf(&p, "AMDGPU register dumps:\nOffset:     
>>> Value:\n");
>>

