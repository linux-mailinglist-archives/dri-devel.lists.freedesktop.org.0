Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0F18CAD04
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 13:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D419B10E156;
	Tue, 21 May 2024 11:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pjtt6TSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85EF10E07D;
 Tue, 21 May 2024 11:04:14 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-354cd8da8b9so871698f8f.0; 
 Tue, 21 May 2024 04:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716289453; x=1716894253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KSXIhpVryOt7s4zHDJSLS8LgF9+/tvqxquQt58i9klo=;
 b=Pjtt6TSDP27oRZWscMV/MN6JD9gEydegqL+lEKq16PvS+vg9vjMGiDWqCMJUuGmSHR
 Jqs7ebhF9s/7TzVB9RReL2nIK9efdiQuXaWn6KfRBJqpiFN2pcbet7weTc7LlS5oOXNP
 DTwxQyl+2BZNaZ2AzodZX5DtYkihNoq3deFHL/0gnvY3iyXurhlSiAUu+s7fo+qKkixi
 A21ZIQgB05mTEgHD7bHDC1Uqd9mGu2Xf6apNpRvDnQ7Jce2rFkCME1mAdvCTLWXf7nFC
 aWQMmS6wzJHJPMWXX9YIgB0s/ZTQKS+B0PAtZXEOzK3LjR6gH76gpSsEZ95Ew/1DVeYw
 clpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716289453; x=1716894253;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSXIhpVryOt7s4zHDJSLS8LgF9+/tvqxquQt58i9klo=;
 b=T5yvcNuMor75drsI8T3/usNi53kdY3+oLrM3Zi2+VgI9X8Jocz8Ym47XG5hO05l5ZU
 Ji8YSMYT0e1RfMjY51453+CUfnCQfhjf+m2EWXjCHqM3AFN6xxCqQUNbgQ2EwqogRwBb
 6vjkVRhqJnOpkyXx6eH7jXnkMdHVYkHN85ZWkBT38p0CCPYvzpnMs0jcZyhsAN5SJwIR
 Fs7mjRQgM5C9U6t4OGUQSpKt9S+ocS9gDI1iM36Ngl2D3yHYhZUCT/fshZncJ4yDdCkg
 GXAyRCc5QbFdyBBsKopN/wWNG59KnDx1V7TRHR2qUh1LIrdigpIjF7zsv1i9F/cuTTL+
 U+cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe8YjhracVIr/xuKE3ICBQRBko0Rn4aNRhINjBcvGvoqqbGBF3YnkGpiWpkMi5K2uKPKsyyKKC6udCnDNpp2kmJzmjRFkgrn/QZhZAax3kcrn3eJBdHWk/t3/4NCkYe+jt1gLAkZLD9HeJ9B3FkA==
X-Gm-Message-State: AOJu0YzrxSk3+4aX4iIIEzR2op923CwwV+noWuopFOJJ7OUTJXjFNfWu
 QPeyMfkTWJa/wtBsC4pOjL70t+VvMyjU/R5RzpYO/xQOiFemtuRf
X-Google-Smtp-Source: AGHT+IEl//NivIIcUS3kBHqz17NWQPQUFeUg+fzch19f3EUMPQ/DZUm1QYVnnrX9Wyjb4wvmUZL9Fw==
X-Received: by 2002:adf:ee8d:0:b0:354:d052:e485 with SMTP id
 ffacd0b85a97d-354d052f128mr898918f8f.63.1716289452677; 
 Tue, 21 May 2024 04:04:12 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354c7df311esm4932168f8f.3.2024.05.21.04.04.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 04:04:12 -0700 (PDT)
Message-ID: <d1cea1c8-bef0-48fb-887a-88d0eee9ad6d@gmail.com>
Date: Tue, 21 May 2024 13:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tim Van Patten <timvp@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
 alexander.deucher@amd.com, prathyushi.nangia@amd.com,
 Tim Van Patten <timvp@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.com>, Le Ma <le.ma@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Shaoyun.liu" <Shaoyun.liu@amd.com>,
 Shiwu Zhang <shiwu.zhang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
 <9dd1cfd1-fe13-4434-a7cc-e14113dcaf53@amd.com>
 <CADnq5_NGLrrFmFHFX2bC7naByJGofEiYQyWvRP6CO4BDFo52TQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CADnq5_NGLrrFmFHFX2bC7naByJGofEiYQyWvRP6CO4BDFo52TQ@mail.gmail.com>
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

Am 17.05.24 um 17:46 schrieb Alex Deucher:
> On Fri, May 17, 2024 at 2:35 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 16.05.24 um 19:57 schrieb Tim Van Patten:
>>> From: Tim Van Patten <timvp@google.com>
>>>
>>> The following commit updated gmc->noretry from 0 to 1 for GC HW IP
>>> 9.3.0:
>>>
>>>       commit 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=1")
>>>
>>> This causes the device to hang when a page fault occurs, until the
>>> device is rebooted. Instead, revert back to gmc->noretry=0 so the device
>>> is still responsive.
>> Wait a second. Why does the device hang on a page fault? That shouldn't
>> happen independent of noretry.
>>
>> So that strongly sounds like this is just hiding a bug elsewhere.
> Fair enough, but this is also the only gfx9 APU which defaults to
> noretry=1, all of the rest are dGPUs.  I'd argue it should align with
> the other GFX9 APUs or they should all enable noretry=1.

Completely agree.

It's just that while the hardware should theoretically be able to handle 
recoverable page faults it's just that this features is never tested on 
APUs because our hw engineering assumes that they don't have to support 
the use case. That's also the reason why we physically don't have the 
second IH ring on APUs.

I strongly suggest that instead of doing that for each hw generations 
individually to just disallow enabling retry on APUs.

Alternatively we could start testing it on hw and sw side and try to fix 
all the bugs.

Regards,
Christian.

>
> Alex
>
>> Regards,
>> Christian.
>>
>>> Fixes: 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=1")
>>> Signed-off-by: Tim Van Patten <timvp@google.com>
>>> ---
>>>
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>> index be4629cdac049..bff54a20835f1 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>> @@ -876,7 +876,6 @@ void amdgpu_gmc_noretry_set(struct amdgpu_device *adev)
>>>        struct amdgpu_gmc *gmc = &adev->gmc;
>>>        uint32_t gc_ver = amdgpu_ip_version(adev, GC_HWIP, 0);
>>>        bool noretry_default = (gc_ver == IP_VERSION(9, 0, 1) ||
>>> -                             gc_ver == IP_VERSION(9, 3, 0) ||
>>>                                gc_ver == IP_VERSION(9, 4, 0) ||
>>>                                gc_ver == IP_VERSION(9, 4, 1) ||
>>>                                gc_ver == IP_VERSION(9, 4, 2) ||

