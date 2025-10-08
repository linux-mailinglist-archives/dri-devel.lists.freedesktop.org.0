Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040BFBC6B9D
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 00:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDFB10E8EE;
	Wed,  8 Oct 2025 22:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KBR3T3Tl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5886210E8EE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 22:00:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so217570f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759960819; x=1760565619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5GU1Xl1K6+Pk8hlhPh8Orqtx3Ns4/PlbjU1PHpUk8BI=;
 b=KBR3T3Tl9JIbMb6VLILtMh6+fTmQSghS0zK8Hn/vR+QaooTPUrYx1+TaKmHvNfpMuP
 AV6qLS/UnUx2Wbf6sFf224pxyq8CbBJZQ7ci56PLQP2t8wQ+WSVh7OQFngUf8RvNl4mQ
 R8AZo03XbaGrCbYFzMcl/kEEVoPSyaPT0K0eCZqfEnt5rJ4RUxdNch3Emonn2xUYcLHE
 kRQJa6VuiFF78nuasSLCculsamDa1rs4YDK4+nPT9F0dmHF3kTp9KFqLWdZYerS9eRtY
 MBKfEb04MmT/lEa3qEkJnHFx3HBGYUoAEkswmkTgh2rf+6ml55wN6uHS6Y9y92B1DQK3
 t6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960819; x=1760565619;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5GU1Xl1K6+Pk8hlhPh8Orqtx3Ns4/PlbjU1PHpUk8BI=;
 b=ARKQ92y+NBOlIrZ8HyifSK848VZ2AvS9R7tz7DqIQGwwAVaEvFY8hySqXf6nnMA1p1
 iqdqyL0anoPJ6SfNAOSjA5pWEvM0aaMziZgWqXCKUO5pF9AF1FUH8gtOAZkUKMwFVek1
 xfteef7VSS8zQRZJstYlYFbGRh97xyKh/gXoCQvyXnA98SE0yBxCNce+YDiHXWe88Uwy
 Qdj9P0eKAiI0TT9kCCVPASk+Ri2cK3qW4OJokJ4KoYJ8sWR3YyzxjoW54NFhH+ibEK9x
 2Fx8kAANZpTbZuk3qbd0NpptF6SL4uC1/wUN3hVLl+tSTZKJTL4Dohbt5bqj52o+NKEE
 eGCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8hxdx6oB5ydqjNE/N0Ij3lg+rCSxcrDB4MIzAq1g49XM83QFYr0Zv3owPha5bNcFrqy0FGuabXaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxThQOGpEs4+9Unn35n97IqtAUk58yexg8pBNa9VshS4X4QiCgE
 Xa+9MqZdS6Ny0FgprZigjbwp0meAQ/c8P5ZqEf40SqFa/av8/9UAqcz9
X-Gm-Gg: ASbGnctUVnCEX5NSwCEuA4tqqZj5aW0lbySq5NgAE3SDXvY1JlqrMBd7ho9KBqOTw7d
 6HQflFCSnbOAgSvNomBJ5hbXYtyWQSC/PpRlg7ebqnxMglUymrnK6gxuqUwe+MSDIpzZ60kID91
 CCuAFHuQVskKPKYhYZco5SDio04TG4GuO51Z6erKS9192D/zx8z7RsbRCH5RRxZh58ZEcx8HUUn
 p5jo9xL9+7hYQ0NVgpeIieSNC4V08QQmHrNtYzvIj9NHlTpf5rpbAyAvFnLMq06fBrCNrPVPSe1
 1VsKqBMi7fp8DT4m7dxgl6Sx/qoljjKZMUn+h22hSgVa4K6zP+49BFihtdKls4DwbiYaGx8ki0O
 ZsYrvyGF3/vpNk5YALNcIYvdOgdHCpWjFN9CTz3R/sXGjzERcmVKujJg=
X-Google-Smtp-Source: AGHT+IGM/GqujYDl21bAoN2Inkzb/Y4dx34wMexePnZgIwLqQp6UnyIsYIhpOwJWA7nmUp+t5SFi0g==
X-Received: by 2002:a05:6000:2388:b0:425:8255:fedf with SMTP id
 ffacd0b85a97d-4266726c31fmr3138290f8f.23.1759960818430; 
 Wed, 08 Oct 2025 15:00:18 -0700 (PDT)
Received: from [192.168.1.12] ([41.37.1.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9762sm32013820f8f.38.2025.10.08.15.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 15:00:18 -0700 (PDT)
Message-ID: <ca29530d-f890-47b5-b254-20c4ef301f7d@gmail.com>
Date: Thu, 9 Oct 2025 01:00:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm/amd/display: Initialize return value in
 dm_cache_state()
To: Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Yilin Chen <Yilin.Chen@amd.com>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20251007224549.87548-1-eslam.medhat1993@gmail.com>
 <6f24d0cb-ce14-4e56-990b-00ad579bc282@amd.com>
Content-Language: en-US
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
In-Reply-To: <6f24d0cb-ce14-4e56-990b-00ad579bc282@amd.com>
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


On 10/8/25 05:15, Mario Limonciello wrote:
>
>
> On 10/7/2025 5:45 PM, Eslam Khafagy wrote:
>> Initialize the return variable "r" to 0 in dm_cache_state() to fix
>> a potential use of uninitialized variable warning.
>>
>> The return value for this function might not be a PTR_ERR, in casse if
>> condition fails. In that case we ensure predictable reutrn.
>
> Can you walk me through your thought process?  I looked at all 
> possible returns for drm_atomic_helper_suspend() and they all return 
> ERR_PTR() or a state.
>
> So I don't see how the IS_ERR() clause could have a problem.
Hello ,

Thank you for the response. Initially i was working on warnings via 
coverity scan.
Initially my thinking was just by following the sequence of 
dm_cache_state you can see that there was a potential issue if
drm_atomic_helper_suspend returned a non valid pointer that is not PTR_ERR.

But having a second look after your response, indeed it shouldn't be the 
case. so please feel free to drop this patch.

>>
>> Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 8e1622bf7a42..6b4f3eb9ce48 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -3115,7 +3115,7 @@ static void hpd_rx_irq_work_suspend(struct 
>> amdgpu_display_manager *dm)
>>     static int dm_cache_state(struct amdgpu_device *adev)
>>   {
>> -    int r;
>> +    int r = 0;
>>         adev->dm.cached_state = 
>> drm_atomic_helper_suspend(adev_to_drm(adev));
>>       if (IS_ERR(adev->dm.cached_state)) {
>
