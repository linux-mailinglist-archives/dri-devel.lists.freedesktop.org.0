Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED307D9B41
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E4410E03E;
	Fri, 27 Oct 2023 14:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6821810E9C1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 14:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698416609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+jD9KdPqRoHlupMP/7iJ5h7Nb3hQw2jJJc2dYSt1fo=;
 b=YVSjabriemBgRc08hg6UA9UfoK2CNlHt0Fdutw+0ieDQgDPhRnNW5569W5ZbALUiWwTHPS
 RsEEtiNW8/QzggtgDJWPa4k9ssomW/+BSwmoAtjVF8XVGLbNhP90bIkUg2qySIIZe/Mkkb
 lzEZZPOQuBRkphKhQnE8/FCOqLwSkQs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-ojY2J9pPMtO2eXggX-0Eug-1; Fri, 27 Oct 2023 10:23:27 -0400
X-MC-Unique: ojY2J9pPMtO2eXggX-0Eug-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5079c865541so2438682e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 07:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698416606; x=1699021406;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W+jD9KdPqRoHlupMP/7iJ5h7Nb3hQw2jJJc2dYSt1fo=;
 b=iphS+AmOjTYvuhlsyu52tPWSfy/U2CZNdtAdGGsD2hKs4E/RxqMhKeM8IkJrvXh6D+
 Re53fWjAHN2qjWGuzsveUEWY+sjUOcrTJyGXmiPW0kWW0enTo8kp1lvz99sdZ3j4mN60
 zb88EFaUkpqHTXIa5vasnUpWCYJsyWSzR7CdpnFANWqTtgnrIF1m2VGLgF9uqZA0+kdO
 XiUo5mLALEf+E/QJDs24W1hmcDyVr2HZYs18ITfU82JYB4k6+f3bXw/pqaIovSOelL5g
 jkmYaSRd3dfEID4hIiIdDVDpKoIt+wZboR/Ve0rrM4rr4gOx8XRzWax3Ke8avM5FS0wi
 H5Dg==
X-Gm-Message-State: AOJu0YzSfAXskDnvCecaN0VoB3dx5sdOOEXpziB736fqKu1eVZgr5mib
 OZIPIsTQlLJUVWcUtyZxyY7BtoHrWRPopa57i/fdK5B02jyFAhPqB68gGh300m90POlyUpluM3A
 cryRvSQE00A2SOhVptSPyj3vhUMuy
X-Received: by 2002:a05:6512:31d2:b0:507:9a08:4046 with SMTP id
 j18-20020a05651231d200b005079a084046mr2513869lfe.55.1698416606354; 
 Fri, 27 Oct 2023 07:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcuzlBluWRMP0qd/U1Ab7S0Wp3s6/aFDb3j5iBXFXyMIGAoBnUH3eQi6hggX8E19JeSCEFcQ==
X-Received: by 2002:a05:6512:31d2:b0:507:9a08:4046 with SMTP id
 j18-20020a05651231d200b005079a084046mr2513853lfe.55.1698416606020; 
 Fri, 27 Oct 2023 07:23:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a5d50cb000000b003231ca246b6sm1850724wrt.95.2023.10.27.07.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 07:23:25 -0700 (PDT)
Message-ID: <8e117f9f-a01c-4242-8781-b2ed4969513b@redhat.com>
Date: Fri, 27 Oct 2023 16:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <20231027102516.0e4b00ef@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20231027102516.0e4b00ef@collabora.com>
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net, luben.tuikov@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/23 10:25, Boris Brezillon wrote:
> Hi Danilo,
> 
> On Thu, 26 Oct 2023 18:13:00 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
>> Currently, job flow control is implemented simply by limiting the number
>> of jobs in flight. Therefore, a scheduler is initialized with a credit
>> limit that corresponds to the number of jobs which can be sent to the
>> hardware.
>>
>> This implies that for each job, drivers need to account for the maximum
>> job size possible in order to not overflow the ring buffer.
>>
>> However, there are drivers, such as Nouveau, where the job size has a
>> rather large range. For such drivers it can easily happen that job
>> submissions not even filling the ring by 1% can block subsequent
>> submissions, which, in the worst case, can lead to the ring run dry.
>>
>> In order to overcome this issue, allow for tracking the actual job size
>> instead of the number of jobs. Therefore, add a field to track a job's
>> credit count, which represents the number of credits a job contributes
>> to the scheduler's credit limit.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>> Changes in V2:
>> ==============
>>    - fixed up influence on scheduling fairness due to consideration of a job's
>>      size
>>      - If we reach a ready entity in drm_sched_select_entity() but can't actually
>>        queue a job from it due to size limitations, just give up and go to sleep
>>        until woken up due to a pending job finishing, rather than continue to try
>>        other entities.
>>    - added a callback to dynamically update a job's credits (Boris)
> 
> This callback seems controversial. I'd suggest dropping it, so the
> patch can be merged.

I don't think we should drop it just for the sake of moving forward. If there are objections
we'll discuss them. I've seen good reasons why the drivers you are working on require this,
while, following the discussion, I have *not* seen any reasons to drop it. It helps simplifying
driver code and doesn't introduce any complexity or overhead to existing drivers.

> 
> Regards,
> 
> Boris
> 
>>    - renamed 'units' to 'credits'
>>    - fixed commit message and comments as requested by Luben
>>
>> Changes in V3:
>> ==============
>>    - rebased onto V7 of the "DRM scheduler changes for Xe" series by Matt
>>    - move up drm_sched_can_queue() instead of adding a forward declaration
>>      (Boris)
>>    - add a drm_sched_available_credits() helper (Boris)
>>    - adjust control flow in drm_sched_rq_select_entity_fifo() to Luben's proposal
>>    - re-phrase a few comments and fix a typo (Luben)
>>    - change naming of all structures credit fields and function parameters to the
>>      following scheme
>>      - drm_sched_job::credits
>>      - drm_gpu_scheduler::credit_limit
>>      - drm_gpu_scheduler::credit_count
>>      - drm_sched_init(..., u32 credit_limit, ...)
>>      - drm_sched_job_init(..., u32 credits, ...)
>>    - add proper documentation for the scheduler's job-flow control mechanism
> 

