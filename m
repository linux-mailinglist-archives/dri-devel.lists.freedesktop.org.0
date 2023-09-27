Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FA7B038E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF1B10E4F0;
	Wed, 27 Sep 2023 12:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA1010E4EA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695816714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lD2w65y8a1IhUMorMDHummPyA84z3wVdBDMYYVDvgQI=;
 b=cjrvhoWcK6+crew/jgL4RCVQRk41ATpVF9saf4zDcc5WS/Hiw9IdiTBZI3vgGAR4NREOnt
 VNySnhMaPiI+VXpROVI3gnEmDBLteWX1dNdaWDVXdj3Sim1n6k+iNYE4i8j9Kh1kHnATiI
 DpPjS3SDNLsDCu5L8dxWhMVT6/R+5+U=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-ImaG2CClNnK3VUclujpjjw-1; Wed, 27 Sep 2023 08:11:53 -0400
X-MC-Unique: ImaG2CClNnK3VUclujpjjw-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b710c5677eso170525301fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 05:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695816712; x=1696421512;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lD2w65y8a1IhUMorMDHummPyA84z3wVdBDMYYVDvgQI=;
 b=FFGRgUMy489xVEKiJD6uGleqMBYV09OpTTCQsXq5Bh9+azbZvU8b5pGmnFZDW7l+zp
 FYdYaz8cVx8vePjycNAeJ9rVTXcVGVL/MPZwsAvkWNlXWycf5e/06uqm/epsTJo2IZRd
 LGjBpgmkv5JjBwEbof3/tk9/9iLvosbbVe9gGGlC/Xqsfkh2MS/ufJRjLhC9aMW19JcT
 1zGX1G0/dPLNoaAgelgqi/8D8srTVnNSvJRJmjds3PWdZT7aanypWRaB6KYuCq4wZ89S
 Gtiwg/T+zSoW2IfAwbXjpGLByjmCg7fLOiPFV4khDzsm2u36uSDrznp2WMmVViR+vLzL
 jMrw==
X-Gm-Message-State: AOJu0Yylm6Epu2LC9k4MPGcfna42jV291OyGHqotAAssAOCIXefMeR3J
 58WMr4eyUbXZnH7ITqeGo6ApGyESrLRlMLbxYvQ2FMbxc9s0lUoIPaer5VKsw1pJ7ayD8dfiJZk
 KUOZIZ/BBo0DWp/OsC3MH5dCrRvRJ
X-Received: by 2002:a2e:3817:0:b0:2bf:fab9:db28 with SMTP id
 f23-20020a2e3817000000b002bffab9db28mr1704692lja.6.1695816711816; 
 Wed, 27 Sep 2023 05:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnUtFohc3YJq9xqmyUq+/FjlkzSgGP3tDzn756qh1dQnFLt8GtyBqsVYozWuKzv9gP9O/HjA==
X-Received: by 2002:a2e:3817:0:b0:2bf:fab9:db28 with SMTP id
 f23-20020a2e3817000000b002bffab9db28mr1704652lja.6.1695816710920; 
 Wed, 27 Sep 2023 05:11:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a170906584d00b00992b8d56f3asm9187593ejs.105.2023.09.27.05.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 05:11:50 -0700 (PDT)
Message-ID: <5c6e1348-ec38-62b1-a056-1b7a724d99eb@redhat.com>
Date: Wed, 27 Sep 2023 14:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next 1/3] drm/sched: implement dynamic job flow
 control
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230924224555.15595-1-dakr@redhat.com>
 <20230925145513.49abcc52@collabora.com>
 <c6ec9ab4-d63b-0a72-4abf-682b94739877@amd.com>
 <20230926091129.2d7d7472@collabora.com>
 <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <390db8af-1510-580b-133c-dacf5adc56d1@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: matthew.brost@intel.com, Sarah Walker <sarah.walker@imgtec.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 Donald Robson <Donald.Robson@imgtec.com>, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/27/23 13:54, Christian König wrote:
> Am 26.09.23 um 09:11 schrieb Boris Brezillon:
>> On Mon, 25 Sep 2023 19:55:21 +0200
>> Christian König <christian.koenig@amd.com> wrote:
>>
>>> Am 25.09.23 um 14:55 schrieb Boris Brezillon:
>>>> +The imagination team, who's probably interested too.
>>>>
>>>> On Mon, 25 Sep 2023 00:43:06 +0200
>>>> Danilo Krummrich <dakr@redhat.com> wrote:
>>>>> Currently, job flow control is implemented simply by limiting the amount
>>>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>>>> submission limit that corresponds to a certain amount of jobs.
>>>>>
>>>>> This implies that for each job drivers need to account for the maximum
>>>>> job size possible in order to not overflow the ring buffer.
>>>>>
>>>>> However, there are drivers, such as Nouveau, where the job size has a
>>>>> rather large range. For such drivers it can easily happen that job
>>>>> submissions not even filling the ring by 1% can block subsequent
>>>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>>>
>>>>> In order to overcome this issue, allow for tracking the actual job size
>>>>> instead of the amount job jobs. Therefore, add a field to track a job's
>>>>> submission units, which represents the amount of units a job contributes
>>>>> to the scheduler's submission limit.
>>>> As mentioned earlier, this might allow some simplifications in the
>>>> PowerVR driver where we do flow-control using a dma_fence returned
>>>> through ->prepare_job(). The only thing that'd be missing is a way to
>>>> dynamically query the size of a job (a new hook?), instead of having the
>>>> size fixed at creation time, because PVR jobs embed native fence waits,
>>>> and the number of native fences will decrease if some of these fences
>>>> are signalled before ->run_job() is called, thus reducing the job size.
>>> Exactly that is a little bit questionable since it allows for the device
>>> to postpone jobs infinitely.
>>>
>>> It would be good if the scheduler is able to validate if it's ever able
>>> to run the job when it is pushed into the entity.
>> Yes, we do that already. We check that the immutable part of the job
>> (everything that's not a native fence wait) fits in the ringbuf.
> 
> Yeah, but thinking more about it there might be really bad side effects. We shouldn't use a callback nor job credits because it might badly influence fairness between entities.
> 
> In other words when one entity submits always large jobs and another one always small ones then the scheduler would prefer the one which submits the smaller ones because they are easier to fit into the ring buffer.

That's true. Admittedly I mostly had DRM_SCHED_POLICY_SINGLE_ENTITY​ in mind
where obviously we just have a single entity.

> 
> What we can do is the follow:
> 1. The scheduler has some initial credits it can use to push jobs.
> 2. Each scheduler fence (and *not* the job) has a credits field of how much it will use.
> 3. After letting a a job run the credits of it's fence are subtracted from the available credits of the scheduler.
> 4. The scheduler can keep running jobs as long as it has a positive credit count.
> 5. When the credit count becomes negative it goes to sleep until a scheduler fence signals and the count becomes positive again.

Wouldn't it be possible that we overflow the ring with that or at least end up in
a busy wait in run_job()? What if the remaining credit count is greater than 0 but
smaller than the number of credits the next picked job requires?

> 
> This way jobs are handled equally, you can still push jobs up to at least halve your ring buffer size and you should be able to handle your PowerVR case by calculating the credits you actually used in your run_job() callback.
> 
> As far as I can see that approach should work, shouldn't it?
> 
> Regards,
> Christian.
> 

