Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADD58D5DE5
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 11:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82D210E19D;
	Fri, 31 May 2024 09:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gt/Otg4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE12E10E19D;
 Fri, 31 May 2024 09:12:18 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-35dcff36522so821552f8f.1; 
 Fri, 31 May 2024 02:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717146737; x=1717751537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CAisdGkVjiY+zTim1HeKneK2aR6c95AqSfk99w//tUg=;
 b=gt/Otg4Xo4WHpoYj3HrCtiDOUSG/SZbEdTE3MPvMub7UbKLV53ieIFY0OOkt1uflnZ
 t7VlkZvC+bSvW1I2gnmzXcMT1eceVmWpuLPIJCg463LsGHepquK4XFDotmjvR7ZaN7P1
 S1rXBeEXxWZIP9Ihl4DCO+clPBwuu+LNUx8f4cPoYEetYfl8P8NBAldylZazVW9sVsLP
 gK3Kj0HttDdppMkhcY16xxBN/pWm9UhOu32Heij0wySM9RtTmaDQ8uBDgz3YJt2LBZb4
 uNmWpepbModXFXnkZ75Jy9UCQ+TDxM9JfVrUcSWk/IrGzyh109JTRJ5x+reBwGDSxhtA
 pK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717146737; x=1717751537;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CAisdGkVjiY+zTim1HeKneK2aR6c95AqSfk99w//tUg=;
 b=Er5Q0jT0lAG1MD+kntcKAmLY05qYRWJmFiZUtmldTNc2qfC/qiEnB7aV/QC/BXBp7B
 mHQr17VSGMEGU4QFQ+ziN2XtrlHPw+XhijAED0Fnj/vbFscFByHSdNZsYxz7lsmC2ukf
 8BSZ+cqOnF7gSo6DuZblNH1M7kTLsCeugxT45XWi3EWcN/tbni1a/WGGT0y4aBKtRsh/
 5IYyYAlm3m7XdScBwUYxnQiDzdlF8oyYTFOCBJt+bjU383yQ6CH0768jLc8S7sHUTEte
 sl7aTXZtVik6M4odWpKHMPyYPiSpJPs9h7x6iSHW6cnZvINZRfL2IXVqIwNy/m7sIsy9
 LbwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxrdivqqvPrg0m0stCvFKWlTRwkGp0abZ3Wyk4oKSw4O3PHXew1ko+ObZ9RaMfri8qUPKKrGF3RvsqKn89ul59DFyn1Fy9q9oV0v++R1Hl
X-Gm-Message-State: AOJu0YwjLVqmPhx4SCtdhJS/lNT9dHyfgO6oDbYrbMZJYQxVhO+nwt9v
 krwoZLMjLktSFLjvhZ93HuFB3ctqSpSmZZ4fwXaALB4nwbsYnJpW
X-Google-Smtp-Source: AGHT+IHdUyzpVaYaryp6byJTrVZ1E5WKPaIPQ/7VJ3BCYNfe3MOMtHWasSEEBSV8ZpB1CiMpjGNNSQ==
X-Received: by 2002:adf:f3c6:0:b0:354:f2a7:97d6 with SMTP id
 ffacd0b85a97d-35e0f285b04mr912447f8f.30.1717146736866; 
 Fri, 31 May 2024 02:12:16 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04e845bsm1384959f8f.65.2024.05.31.02.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:12:16 -0700 (PDT)
Message-ID: <bd1d46ca-044b-468b-9458-4e9e43472930@gmail.com>
Date: Fri, 31 May 2024 11:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/2] Discussion around eviction improvements
To: Alex Deucher <alexdeucher@gmail.com>, Tvrtko Ursulin <tursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
References: <20240516121822.19036-1-tursulin@igalia.com>
 <CADnq5_PhZ5bqEJKQ+bPQAeXihMfZrFVqLN-+nd69+zZooBT6BA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_PhZ5bqEJKQ+bPQAeXihMfZrFVqLN-+nd69+zZooBT6BA@mail.gmail.com>
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

Am 16.05.24 um 21:21 schrieb Alex Deucher:
> On Thu, May 16, 2024 at 8:18 AM Tvrtko Ursulin <tursulin@igalia.com> wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Reduced re-spin of my previous series after Christian corrected a few
>> misconceptions that I had. So lets see if what remains makes sense or is still
>> misguided.
>>
>> To summarise, the series address the following two issues:
>>
>>   * Migration rate limiting does not work, at least not for the common case
>>     where userspace configures VRAM+GTT. It thinks it can stop migration attempts
>>     by playing with bo->allowed_domains vs bo->preferred domains but, both from
>>     the code, and from empirical experiments, I see that not working at all. When
>>     both masks are identical fiddling with them achieves nothing. Even when they
>>     are not identical allowed has a fallback GTT placement which means that when
>>     over the migration budget ttm_bo_validate with bo->allowed_domains can cause
>>     migration from GTT to VRAM.
>>
>>   * Driver thinks it will be re-validating evicted buffers on the next submission
>>     but it does not for the very common case of VRAM+GTT because it only checks
>>     if current placement is *none* of the preferred placements.
> For APUs at least, we should never migrate because GTT and VRAM are
> both system memory so are effectively equal performance-wise.  Maybe
> this regressed when Christian reworked ttm to better handle migrating
> buffers back to VRAM after suspend on dGPUs?

Yeah, that's quite likely. I'm already looking into this.

Regards,
Christian.

>
> Alex
>
>> These two patches appear to have a positive result for a memory intensive game
>> like Assassin's Creed Valhalla. On an APU like Steam Deck the game has a working
>> set around 5 GiB, while the VRAM is configured to 1 GiB. Correctly respecting
>> the migration budget appears to keep buffer blits at bay and improves the
>> minimum frame rate, ie. makes things smoother.
>>
>>  From the game's built-in benchmark, average of three runs each:
>>
>>                                                  FPS
>>                  migrated KiB    min     avg     max     min-1%  min-0.1%
>>    because          20784781     10.00  37.00   89.67    22.00    12.33
>>    patched           4227688     13.67  37.00   81.33    23.33    15.00
>>
>> Disclaimers that I have is that more runs would be needed to be more confident
>> about the results. And more games. And APU versus discrete.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>>
>> Tvrtko Ursulin (2):
>>    drm/amdgpu: Re-validate evicted buffers
>>    drm/amdgpu: Actually respect buffer migration budget
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 112 +++++++++++++++++++------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  21 ++++-
>>   2 files changed, 103 insertions(+), 30 deletions(-)
>>
>> --
>> 2.44.0
>>

