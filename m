Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7F7E71FA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 20:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CB710E22E;
	Thu,  9 Nov 2023 19:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5385610E22E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 19:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699556979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZS+ED1OtV7jojhpooYSza/QLYPRRicMYxwVIrlFhEc=;
 b=dKfxRx51Y0PZHsqOvnFLZzuYB1btwwDa1m3+ufil4jM07ibs64Vp6Qj/LDnMX2tUPpqUS2
 9h0ou1+HK5fICwyOYRDXvGIAj5kIaTufJJ7EXFdI/GKmpBISD1QWzufPwD9txi4dTVSbhY
 jP2Wg2Jrx8WwEm9pS7J6mX+SNIWluJI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-3wPU_AUIOmyl6LrhtzV98w-1; Thu, 09 Nov 2023 14:09:34 -0500
X-MC-Unique: 3wPU_AUIOmyl6LrhtzV98w-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2c51d0f97e3so12492061fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 11:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699556973; x=1700161773;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ZS+ED1OtV7jojhpooYSza/QLYPRRicMYxwVIrlFhEc=;
 b=kat0i/+vqlcAhFtg+Bkkpr5JuDzRIk9c7o6O3rFEAF9xc1fBtdSJLZagPoVAbkc6Ke
 kpCTWB0jv6SONKq5QYj8dhJskKqB4tcw6dEJQBfPWYPuX7o8CP4+E7F45uNd1VIAnqeX
 /OJp1epQNofmraZRoYPX7urWMk/+4dPPTAvvdQDKiaOQyK9Gzya0Ym8Q33y/A8HUfpUu
 NyCygN6lYsjiRk+Ot2MhEdTBp+MBrW6tmwtKGjDQ/j3WaTFSnNK2zRh1GI3eiEveyMtg
 YEhvQbi0CGYQ7gcwbfawzUXx6E+LOFjFSExgO67JbuonL5fIt3T67kThYJC4ZPBX2HzL
 zHpg==
X-Gm-Message-State: AOJu0Yx1ua7UJzz3nZYe2rfbCEIGGIrGZ3kjdAEv6xlBLZ2qlfkKtDCC
 5397FmH1UW8bPmqiSQtm8wVUM3YlyP2immtdxZwAxIhHKtAGHczItmQwUKM8gI5g+CWU6pZiGtH
 dL8bpgVuJ9digcCFaNnamLhwZVFQK
X-Received: by 2002:a05:651c:198c:b0:2c7:f55:eb61 with SMTP id
 bx12-20020a05651c198c00b002c70f55eb61mr5890367ljb.6.1699556972731; 
 Thu, 09 Nov 2023 11:09:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJB7bAWkQ9HmCg37l+NjNNrOqdgAwf1ZCoNz0tmnIi7/Y87j6+eGNa72dXpiUB31g87oqFFg==
X-Received: by 2002:a05:651c:198c:b0:2c7:f55:eb61 with SMTP id
 bx12-20020a05651c198c00b002c70f55eb61mr5890340ljb.6.1699556972326; 
 Thu, 09 Nov 2023 11:09:32 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 v29-20020adfa1dd000000b0032dab20e773sm298621wrv.69.2023.11.09.11.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 11:09:31 -0800 (PST)
Message-ID: <96200931-fb3f-40a2-8c0d-5a3609c11207@redhat.com>
Date: Thu, 9 Nov 2023 20:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: fix potential page fault in
 drm_sched_job_init()
To: Luben Tuikov <ltuikov89@gmail.com>, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
References: <20231108022716.15250-1-dakr@redhat.com>
 <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
 <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>
 <4c64c9f2-78b4-4309-8cca-5dbd0e5b445e@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <4c64c9f2-78b4-4309-8cca-5dbd0e5b445e@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/23 05:23, Luben Tuikov wrote:
> On 2023-11-08 19:09, Danilo Krummrich wrote:
>> On 11/8/23 06:46, Luben Tuikov wrote:
>>> Hi,
>>>
>>> Could you please use my gmail address, the one one I'm responding from--I don't want
>>> to miss any DRM scheduler patches. BTW, the luben.tuikov@amd.com email should bounce
>>> as undeliverable.
>>>
>>> On 2023-11-07 21:26, Danilo Krummrich wrote:
>>>> Commit 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable
>>>> number of run-queues") introduces drm_err() in drm_sched_job_init(), in
>>>> order to indicate that the given entity has no runq, however at this
>>>> time job->sched is not yet set, likely to be NULL initialized, and hence
>>>> shouldn't be used.
>>>>
>>>> Replace the corresponding drm_err() call with pr_err() to avoid a
>>>> potential page fault.
>>>>
>>>> While at it, extend the documentation of drm_sched_job_init() to
>>>> indicate that job->sched is not a valid pointer until
>>>> drm_sched_job_arm() has been called.
>>>>
>>>> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 27843e37d9b7..dd28389f0ddd 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -680,6 +680,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>>     * This function returns -ENOENT in this case (which probably should be -EIO as
>>>>     * a more meanigful return value).
>>>>     *
>>>> + * Note that job->sched is not a valid pointer until drm_sched_job_arm() has
>>>> + * been called.
>>>> + *
>>>
>>> Good catch!
>>>
>>> Did you actually get this to page-fault and have a kernel log?
>>
>> No, I just found it because I was about to make the same mistake.
>>
>>>
>>> I'm asking because we see it correctly set in this kernel log coming from AMD,
>>
>> I think that's because amdgpu just sets job->sched to *some* scheduler instance after
>> job allocation [1].
>>
>> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c#L108
>>
>>>
>>> [   11.886024] amdgpu 0000:0a:00.0: [drm] *ERROR* drm_sched_job_init: entity has no rq!
>>>
>>> in this email,
>>> https://lore.kernel.org/r/CADnq5_PS64jYS_Y3kGW27m-kuWP+FQFiaVcOaZiB=JLSgPnXBQ@mail.gmail.com
>>>
>>>>     * Returns 0 for success, negative error code otherwise.
>>>>     */
>>>>    int drm_sched_job_init(struct drm_sched_job *job,
>>>> @@ -691,7 +694,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>    		 * or worse--a blank screen--leave a trail in the
>>>>    		 * logs, so this can be debugged easier.
>>>>    		 */
>>>> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>>>> +		pr_err("%s: entity has no rq!\n", __func__);
>>>
>>> Is it feasible to do something like the following?
>>>
>>> 		dev_err(job->sched ? job->sched->dev : NULL, "%s: entity has no rq!\n", __func__);
>>
>> I don't think that's a good idea. Although I'd assume that every driver zero-initializes its job
>> structures, I can't see a rule enforcing that. Hence, job->sched can be a random value until
>> drm_sched_job_arm() is called.
> 
> Okay. However, when using pr_err() we're losing "[drm] *ERROR* " prefix and we scan for that
> in the logs to quickly find the cause of the error.
> 
> Perhaps we can define pr_fmt() and also include "*ERROR*" so that we can get the desired result
> as the attached patch shows?

Sure, I'd add the pr_fmt() in a separate patch though.

