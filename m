Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C6BF3525
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7BD10E4F8;
	Mon, 20 Oct 2025 20:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="c55G2Q4L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445A510E4F1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 20:06:14 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-938de0df471so407975539f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1760990774; x=1761595574;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nQkO3IuJguHVhXAT8cFCDHDyIOMJuLnuozCyzaC9Aqs=;
 b=c55G2Q4L48Abu0vNiSkiCsD4bN3hd/HJo1OqF7YN3sP96UVsZzTJ80RUGRpUUHeyIX
 vdcRmKuDdabBaM4KkiOTIwK4yKczinTsOsnJ35Mh94HI6mpAIdZFRyGwTCop7GzsVmME
 dxZ73FvRztxwObKxQohjd4JzGin19jxVaF6/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760990774; x=1761595574;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nQkO3IuJguHVhXAT8cFCDHDyIOMJuLnuozCyzaC9Aqs=;
 b=IwcnRj8Dh64Sgot5ckeB10JpDVtvzASAHFOqnLIi8MGBda1iWSiMClXWj1TmHB3YFK
 YXEuIgWH8PizoCtRXHkKyuz6fz63Ov4hOpJpGIJk6i0n37oNVJ1dZ6wrTnUzy2Ny8MJm
 dKLts82BQyoh3zxKtMd+8M+yVjNeMAKY0Ujl+oMrMjC1UnY+QS+5u3kCiEo/YhWAM6w7
 ELdj9F9ii1cfbexV/CWjzQL94GwEdATXTjmVn+ZP2v1iE7d//8QiD8UXSFQlwPDrm4py
 gHaKQseiGgTcicBOcvH/rsamsZMR+yxU97GLWaP1LCONIChSjQ3/MD7nbOeRT4BPu3zm
 lnPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGDsMtDULhX6wCrgJPuMiZDmFjIEk9Aj9IHje19ZpDCXQ+z6gP797LzqY87h8i2TwtV8TdNjGRWII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGzz5+VL2eIlJdtAdAyfPG58FDihTszfRXFkiJZizpf7d76/Ek
 VyyAiAv9u0jpL5yQIEGj4Ey6USuGEjmOsDoDQkxkngXzxvuqEIHCOUIYg3R0UCOOPO8=
X-Gm-Gg: ASbGncuveUTTK/bB8W43N3I/Ianqd9DMKPl/PRgINv+P1WhjZW0+j3MWNJyPFUnKf6L
 lYkDRIBROFDf1CVoHy+HQxfUncT+fGKg9aV8L4grLmnPoLHV9qjpm0Rwm1UuZAOl2/M+a6LcNHx
 ofOx3rxE8pCYKjOMQG8RwIxpuT7ngVpQR4fd//nK59oxjdAE1ec2UW4rHrSyrZ11wAJUpTlJUv5
 Pv4dZcUdk9sTFK19WOD8azXrG8nisO/PlRSP+XA1eCCHZF4Tj8E15mqHYSREFOjrmlNIfl4oHw8
 xsOvd6lUKvIM9LAuRHhBhpNFMepDw+l6k9LPQ2sJo3dWAsJFFqXTWavgRAv8WUdL3VlGBf9lXOR
 prxI7a5f1gDqmVSNgz2SZjFZGsX7Db6zyv/Y+AuZHLKXG5suxgCrTNkDij8uoUGFJ1ltSdjLaMo
 LzNDLAH+D7bBihS7XO8MPJmfQ=
X-Google-Smtp-Source: AGHT+IEtvgICWGX8/WbpnP2nVW91/2+QpAoQcberNM3IS3yjxMJRNE6F6lyTYjc+DI/ShO5QUQj4jA==
X-Received: by 2002:a05:6e02:4506:20b0:430:c8ad:81d3 with SMTP id
 e9e14a558f8ab-430c8ad8410mr170043265ab.30.1760990773634; 
 Mon, 20 Oct 2025 13:06:13 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-430d06f9ff0sm33307335ab.3.2025.10.20.13.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 13:06:12 -0700 (PDT)
Message-ID: <ea12faad-1735-4a49-a70d-d4cac5629042@linuxfoundation.org>
Date: Mon, 20 Oct 2025 14:06:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Greg KH <gregkh@linuxfoundation.org>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251019151247.171558-1-mehdi.benhadjkhelifa@gmail.com>
 <2025101910-dipper-suburb-1755@gregkh>
 <cb0f0a36-0593-4d4c-8450-d086b9c99d87@suse.de>
 <d072dfe7-e0e9-49f6-89ed-25d194035e3b@gmail.com>
 <02e617bec795d2ef371069f2d5fb954dfb31a450@intel.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <02e617bec795d2ef371069f2d5fb954dfb31a450@intel.com>
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

On 10/20/25 03:50, Jani Nikula wrote:
> On Sun, 19 Oct 2025, Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> wrote:
>> On 10/19/25 3:47 PM, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 19.10.25 um 16:34 schrieb Greg KH:
>>>> On Sun, Oct 19, 2025 at 04:12:28PM +0100, Mehdi Ben Hadj Khelifa wrote:
>>>>> Replace kmalloc() with kmalloc_array() to correctly
>>>>> handle array allocations and benefit from built-in overflow checking[1].
>>>>>
>>>>> [1]:https://docs.kernel.org/process/deprecated.html
>>>>>
>>>>> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
>>>>> ---
>>>>>    drivers/gpu/drm/tiny/repaper.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/
>>>>> repaper.c
>>>>> index 4824f863fdba..290132c24ff9 100644
>>>>> --- a/drivers/gpu/drm/tiny/repaper.c
>>>>> +++ b/drivers/gpu/drm/tiny/repaper.c
>>>>> @@ -534,7 +534,7 @@ static int repaper_fb_dirty(struct
>>>>> drm_framebuffer *fb, const struct iosys_map *
>>>>>        DRM_DEBUG("Flushing [FB:%d] st=%ums\n", fb->base.id,
>>>>>              epd->factored_stage_time);
>>>>> -    buf = kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
>>>>> +    buf = kmalloc_array(fb->height / 8, fb->width, GFP_KERNEL);
> 
> Also worth emphasizing that this is wildly wrong for any height that is
> not a multiple of 8.
> 
> And I thought I shot down a similar patch not long ago.
> 
> Is there some tool that suggests doing this? Fix the tool instead
> please.
> 

They are documented in https://docs.kernel.org/process/deprecated.html
Mu understanding is that this document lists deprecates APIs so people
don't keep adding new ones.

I didn't get the impression that we are supposed to go delete them from
the kernel and cause a churn.

thanks,
-- Shuah
