Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8C63AADDC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 09:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408BC6E895;
	Thu, 17 Jun 2021 07:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018346E895
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 07:41:39 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j2so8850555lfg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=fYf5ZF1BivmbA+H/mMHYb8IQHZ4wIMIy4XgmzfPb8ic=;
 b=eIxAMxyQ6yZW1b1aFbm9UnEpDTdoarNG7JiOO46jQV+iSxU3HwfbyTezCYA0ZFe9Vf
 uZv2xxzLsaCrIzzkrWE3108LT4c/w4Mq4PUVmN1ljUwq5tihiCObE4fRTMr+1K+DBcGv
 E4a22sZw1G3Me5qX6JXWgDMS3X6kEcT/fa9q9j0yAS8boYkFpYqSUTidE9qK/pRwZSg7
 VuFwx0LeEKt8lc9HdDQWwh78JTOCK7Zr2D8TDFLsji1dJU1D8oItcpF8/PqTtG4kt4mq
 4QUU61ruddUuigCFL5r8KNuVB0aFfCJ558tM9xvnkdLb96ziSJijYRzudFrPZy0P15SP
 S7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fYf5ZF1BivmbA+H/mMHYb8IQHZ4wIMIy4XgmzfPb8ic=;
 b=Q8vsbVfJDgn9ZdyCQyJgCDRyc1hH0rymNEkAtBA+yL/afdFfBC/Wvp19EtQfTPI3WB
 v42zkE2BkbabcubgdHIaaBzo48aMTF0SLaYk6SAAtVYzDVth2v/CWRkq6RFwdZusf7Z8
 77b/p+CWgWxEn6GRTV2sg0FV0L5egvrxcfxtcBOys7MIsMoIUJXhmfNxSn6OjkwumyjF
 T8oPs/6XeOl7EIBWAnJ/Vigl6HQPFjzNRq1Poj4xg1pBW6vl9QMGeSXg4m4C32lCyMfq
 xtOoyKO0gom99Hs4IR6YYH/gm+XeFvj1W3UcOupDsHoxLieoU4IP7cwy9qa0sG1tMVqY
 bQRQ==
X-Gm-Message-State: AOAM531XPOW6OJu1fDzAHQqJQ1/KPpaaDvODCll1x+52mUdyjnjd7hxM
 xvnGM2j23GCIrC+b3EIr6xo=
X-Google-Smtp-Source: ABdhPJyS4TgD4XEGPEG46Dz5kmfOZw1IivEzK9Ew/HaHUNFW9Ti31eSxLkpRyXq8jZ3BWTDWLnTI+g==
X-Received: by 2002:a19:381d:: with SMTP id f29mr3055471lfa.550.1623915698315; 
 Thu, 17 Jun 2021 00:41:38 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9a20:5ac9:ee4d:c186?
 ([2a02:908:1252:fb60:9a20:5ac9:ee4d:c186])
 by smtp.gmail.com with ESMTPSA id k2sm488761lfb.214.2021.06.17.00.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 00:41:37 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix error handling in ttm_bo_handle_move_mem()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YMmadPwv8C+Ut1+o@mwanda>
 <03d0b798-d1ab-5b6f-2c27-8140d923d445@gmail.com>
 <20210616083758.GC1901@kadam>
 <520a9d1f-8841-8d5e-595d-23783de8333d@gmail.com>
 <20210616093604.GD1901@kadam>
 <7354cd94-06bf-ec36-4539-c3570c1775ae@gmail.com>
 <20210616191951.GE1901@kadam>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6d848546-a94b-9285-7956-7e7282ee524f@gmail.com>
Date: Thu, 17 Jun 2021 09:41:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616191951.GE1901@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: thomas.hellstrom@linux.intel.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 16.06.21 um 21:19 schrieb Dan Carpenter:
> On Wed, Jun 16, 2021 at 01:00:38PM +0200, Christian König wrote:
>>
>> Am 16.06.21 um 11:36 schrieb Dan Carpenter:
>>> On Wed, Jun 16, 2021 at 10:47:14AM +0200, Christian König wrote:
>>>> Am 16.06.21 um 10:37 schrieb Dan Carpenter:
>>>>> On Wed, Jun 16, 2021 at 08:46:33AM +0200, Christian König wrote:
>>>>>> Sending the first message didn't worked, so let's try again.
>>>>>>
>>>>>> Am 16.06.21 um 08:30 schrieb Dan Carpenter:
>>>>>>> There are three bugs here:
>>>>>>> 1) We need to call unpopulate() if ttm_tt_populate() succeeds.
>>>>>>> 2) The "new_man = ttm_manager_type(bdev, bo->mem.mem_type);" assignment
>>>>>>>        was wrong and it was really assigning "new_mem = old_mem;".  There
>>>>>>>        is no need for this assignment anyway as we already have the value
>>>>>>>        for "new_mem".
>>>>>>> 3) The (!new_man->use_tt) condition is reversed.
>>>>>>>
>>>>>>> Fixes: ba4e7d973dd0 ("drm: Add the TTM GPU memory manager subsystem.")
>>>>>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>>>>> ---
>>>>>>> This is from reading the code and I can't swear that I have understood
>>>>>>> it correctly.  My nouveau driver is currently unusable and this patch
>>>>>>> has not helped.  But hopefully if I fix enough bugs eventually it will
>>>>>>> start to work.
>>>>>> Well NAK, the code previously looked quite well and you are breaking it now.
>>>>>>
>>>>>> What's the problem with nouveau?
>>>>>>
>>>>> The new Firefox seems to excersize nouveau more than the old one so
>>>>> when I start 10 firefox windows it just hangs the graphics.
>>>>>
>>>>> I've added debug code and it seems like the problem is that
>>>>> nv50_mem_new() is failing.
>>>> Sounds like it is running out of memory to me.
>>>>
>>>> Do you have a dmesg?
>>>>
>>> At first there was a very straight forward use after free bug which I
>>> fixed.
>>> https://lore.kernel.org/nouveau/YMinJwpIei9n1Pn1@mwanda/T/#u
>>>
>>> But now the use after free is gone the only thing in dmesg is:
>>> "[TTM] Buffer eviction failed".  And I have some firmware missing.
>>>
>>> [  205.489763] rfkill: input handler disabled
>>> [  205.678292] nouveau 0000:01:00.0: Direct firmware load for nouveau/nva8_fuc084 failed with error -2
>>> [  205.678300] nouveau 0000:01:00.0: Direct firmware load for nouveau/nva8_fuc084d failed with error -2
>>> [  205.678302] nouveau 0000:01:00.0: msvld: unable to load firmware data
>>> [  205.678304] nouveau 0000:01:00.0: msvld: init failed, -19
>>> [  296.150632] [TTM] Buffer eviction failed
>>> [  417.084265] [TTM] Buffer eviction failed
>>> [  447.295961] [TTM] Buffer eviction failed
>>> [  510.800231] [TTM] Buffer eviction failed
>>> [  556.101384] [TTM] Buffer eviction failed
>>> [  616.495790] [TTM] Buffer eviction failed
>>> [  692.014007] [TTM] Buffer eviction failed
>>>
>>> The eviction failed message only shows up a minute after the hang so it
>>> seems more like a symptom than a root cause.
>> Yeah, look at the timing. What happens is that the buffer eviction timed out
>> because the hardware is locked up.
>>
>> No idea what that could be. It might not even be kernel related at all.
> I don't think it's hardware related...  Using an old version of firefox
> "fixes" the problem.  I downloaded the firmware so that's not the issue.
> Here's the dmesg load info with the new firmware.

Oh, I was not suggesting a hardware problem.

The most likely cause is a software issue in userspace, e.g. wrong order 
of doing thing, doing things to fast without waiting etc...

There are tons of things how userspace can crash GPU hardware you can't 
prevent in the kernel. Especially sending an endless loop is well known 
as Turing's halting problems and not even theoretically solvable.

I suggest to start digging in userspace instead.

Christian.

>
> [    1.412458] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
> [    1.412527] AMD-Vi: AMD IOMMUv2 functionality not available on this system
> [    1.412710] nouveau 0000:01:00.0: vgaarb: deactivate vga console
> [    1.417213] Console: switching to colour dummy device 80x25
> [    1.417272] nouveau 0000:01:00.0: NVIDIA GT218 (0a8280b1)
> [    1.531565] nouveau 0000:01:00.0: bios: nvkm_bios_new: version 70.18.6f.00.05
> [    1.531916] nouveau 0000:01:00.0: fb: nvkm_ram_ctor: 1024 MiB DDR3
> [    2.248212] tsc: Refined TSC clocksource calibration: 3392.144 MHz
> [    2.248218] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x30e5517d4e4, max_idle_ns: 440795261668 ns
> [    2.252203] clocksource: Switched to clocksource tsc
> [    2.848138] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
> [    2.848142] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> [    2.848145] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> [    2.848147] nouveau 0000:01:00.0: DRM: DCB version 4.0
> [    2.848149] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000302 00020030
> [    2.848151] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000300 00000000
> [    2.848154] nouveau 0000:01:00.0: DRM: DCB outp 02: 02011362 00020010
> [    2.848155] nouveau 0000:01:00.0: DRM: DCB outp 03: 01022310 00000000
> [    2.848157] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
> [    2.848159] nouveau 0000:01:00.0: DRM: DCB conn 01: 00002161
> [    2.848161] nouveau 0000:01:00.0: DRM: DCB conn 02: 00000200
> [    2.850214] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> [    2.908409] nouveau 0000:01:00.0: DRM: allocated 1600x900 fb: 0x70000, bo 00000000091fb080
> [    2.908518] fbcon: nouveaudrmfb (fb0) is primary device
> [    2.955528] Console: switching to colour frame buffer device 200x56
> [    2.957780] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
> [    2.957926] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
> [    2.959816] loop: module loaded
>
> regards,
> dan carpenter

