Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ABAA4D752
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 10:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D1110E2CC;
	Tue,  4 Mar 2025 09:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KTEqbPzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2DE10E2CC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 09:05:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-439ac3216dcso36397605e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 01:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741079109; x=1741683909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4xb9+GQnQ3x1ktQ8IEjtazHwzMTgQ6i/8bTVn9usn+I=;
 b=KTEqbPzL6JnB4pUYkzRfowgGKGBN0ekXKKPhMlum+nnP06WS+OTq3yloYbRGibZ+kg
 wZDbwYEyFtaxxN+VbPZ+TSjWlBmMCLW8FGzh03y3ua2B/q+vp53m4ZHznprHf77SBJaa
 H1vVxLUIqdnH/tgGZl2b4wBm6yBE+Yex1ZekAdRSfVpvIzgq+j9RdvkgJZzbXH7wD4RP
 PIXNTSoigSnMuyT2Zu7UqMzp30dY+LxE8tbhT1sWETp5qL1/HzyxeX/PFU458goJOtBR
 7WOhzrbzC7YobN1X0p1DhCGhwMB32gzQkqmPxHzhVns/1UZixTQ/u1uKmTYGdoxpdbbI
 im+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741079109; x=1741683909;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4xb9+GQnQ3x1ktQ8IEjtazHwzMTgQ6i/8bTVn9usn+I=;
 b=FpLYgoezBSoRU2L//YRFwbD72Ju/ky8uXhydUPiT0S7exkCzHWhIXtV79zezPL/LIa
 nv/sa7/mzGDpTn4y5OGPQifs0mwXmfP0xWX5WXsFZR4s/Z27vujsjNi1VOt7utxy/pnD
 obUJ2fSo2ypiuQRPvmzr/487WmFHJIuIuVKImE4PWhXD/NHjcmOKvIej5E2/4nO5e02d
 MeCL3WZY4mqJ9pqsNljc6+clzM9GWZU7ekHf6bRu8sjdPxmwzFDB7wyeu7bugWaOqO/J
 pSsOJ3nTbSYRhQRFA6ETXRWI1P55TQegqeIn8RsQklXuPxYi/c4/zXlqF7RdAryMKfql
 iXFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXosteAAZVyG5SJdU2r+LGAVyydJ1GKmHgKlpT/0ueYdcULr38on8A2LBOGe8Xci05XFk1ybkslbqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4jUp24dLxGXVwfaxsmULNsYT/KXUWA8BP0SNG9klaWadsUBbs
 lkluv0nMnLKZW8phVnA6lrRGw/ToLno3/q6j5sW2YrRN7R7vhw2l
X-Gm-Gg: ASbGnct7LGMDCiHYXFXjPzFCv0LiiyrP0FR7OLUnWpcj0MjhAYJKOdKjMXv1rc+tKhx
 UtYjQesGDg/Lwydwi+Oovxd5STZ8BaVSGYJnfQT1bHWe5uJHSeXQMQWI5GDL0pEMKZqTIuEVAUZ
 zrUlM3crSmnhOLXFiSyurURWFdpUg7cPVMZV/SU4WERdTFIPgeZ7YF0j4+Cv6pTwHqdRngEnRza
 yj0hv0yLp5r4zVADNxhUfcJwjIIUAeyPGs0MGw+ymqfEE47ydDI8IucMk6xx5LjsARfz9k8fDlv
 GkpPEAryWZmZ3y0OfbRw7T6Y+D13wXsK+5n5mC/FLTNwZzL2XOkGBKsCjeJIhVxe3NnsfSIyvg=
 =
X-Google-Smtp-Source: AGHT+IFLFkBo9xLZBI+Mw0maqjnI5Dp5cRHrb9tzUsxec4lWUzI8CqW0o8hXWCxH5HkIYF+DMkSQMg==
X-Received: by 2002:a05:600c:a48:b0:439:a1c7:7b2d with SMTP id
 5b1f17b1804b1-43ba66da31fmr127853845e9.4.1741079108566; 
 Tue, 04 Mar 2025 01:05:08 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4844514sm17070694f8f.76.2025.03.04.01.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 01:05:08 -0800 (PST)
Message-ID: <688b5665-496d-470d-9835-0c6eadfa5569@gmail.com>
Date: Tue, 4 Mar 2025 10:05:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/sched: Adjust outdated docu for run_job()
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, phasta@kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250220112813.87992-2-phasta@kernel.org>
 <20250220112813.87992-4-phasta@kernel.org>
 <12c53d41-21c4-443d-a572-fd22c3cc56ad@igalia.com>
 <1457e985f88e02cd04b2152d2468a65b7a513e63.camel@mailbox.org>
 <cfef8bd7-f335-4796-9d4f-93197bb3fc2d@igalia.com>
 <Z7yFpZMCFINhEht7@cassiopeiae> <Z7ydaE4JmNcvzjJw@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <Z7ydaE4JmNcvzjJw@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Am 24.02.25 um 17:25 schrieb Matthew Brost:
> On Mon, Feb 24, 2025 at 03:43:49PM +0100, Danilo Krummrich wrote:
>> On Mon, Feb 24, 2025 at 10:29:26AM -0300, Maíra Canal wrote:
>>> On 20/02/25 12:28, Philipp Stanner wrote:
>>>> On Thu, 2025-02-20 at 10:28 -0300, Maíra Canal wrote:
>>>>> Would it be possible to add a comment that `run_job()` must check if
>>>>> `s_fence->finished.error` is different than 0? If you increase the
>>>>> karma
>>>>> of a job and don't check for `s_fence->finished.error`, you might run
>>>>> a
>>>>> cancelled job.
>>>> s_fence->finished is only signaled and its error set once the hardware
>>>> fence got signaled; or when the entity is killed.
>>> If you have a timeout, increase the karma of that job with
>>> `drm_sched_increase_karma()` and call `drm_sched_resubmit_jobs()`, the
>>> latter will flag an error in the dma fence. If you don't check for it in
>>> `run_job()`, you will run the guilty job again.
>> Considering that drm_sched_resubmit_jobs() is deprecated I don't think we need
>> to add this hint to the documentation; the drivers that are still using the API
>> hopefully got it right.
>>
>>> I'm still talking about `drm_sched_resubmit_jobs()`, because I'm
>>> currently fixing an issue in V3D with the GPU reset and we still use
>>> `drm_sched_resubmit_jobs()`. I read the documentation of `run_job()` and
>>> `timeout_job()` and the information I commented here (which was crucial
>>> to fix the bug) wasn't available there.
>> Well, hopefully... :-)
>>
>>> `drm_sched_resubmit_jobs()` was deprecated in 2022, but Xe introduced a
>>> new use in 2023
>> Yeah, that's a bit odd, since Xe relies on a firmware scheduler and uses a 1:1
>> scheduler - entity setup. I'm a bit surprised Xe does use this function.
>>
> To clarify Xe's usage. We use this function to resubmit jobs after
> device reset for queues which had nothing to do with the device reset.
> In practice, a device should never occur as we have per-queue resets in
> our harwdare. If a per-queue reset occurs, we ban the queue rather than
> doing a resubmit.

That's still invalid usage. Re-submitting jobs by the scheduler is a completely broken concept in general.

What you can do is to re-create the queue content after device reset inside your driver, but *never* use drm_sched_resubmit_jobs() for that.

>
> Matt  
>
>>> for example. The commit that deprecated it just
>>> mentions AMD's case, but do we know if the function works as expected
>>> for the other users?
>> I read the comment [1] you're referring to differently. It says that
>> "Re-submitting jobs was a concept AMD came up as cheap way to implement recovery
>> after a job timeout".
>>
>> It further explains that "there are many problem with the dma_fence
>> implementation and requirements. Either the implementation is risking deadlocks
>> with core memory management or violating documented implementation details of
>> the dma_fence object", which doesn't give any hint to me that the conceptual
>> issues are limited to amdgpu.
>>
>>> For V3D, it does. Also, we need to make it clear which
>>> are the dma fence requirements that the functions violates.
>> This I fully agree with, unfortunately the comment does not explain what's the
>> issue at all.
>>
>> While I do think I have a vague idea of what's the potential issue with this
>> approach, I think it would be way better to get Christian, as the expert for DMA
>> fence rules to comment on this.
>>
>> @Christian: Can you please shed some light on this?
>>
>>> If we shouldn't use `drm_sched_resubmit_jobs()`, would it be possible to
>>> provide a common interface for job resubmission?
>> I wonder why this question did not come up when drm_sched_resubmit_jobs() was
>> deprecated two years ago, did it?

Exactly that's the point why drm_sched_resubmit_jobs() was deprecated.

It is not possible to provide a common interface to re-submit jobs (with switching of hardware dma_fences) without breaking dma_fence rules.

The idea behind the scheduler is that you pack your submission state into a job object which as soon as it is picked up is converted into a hardware dma_fence for execution. This hardware dma_fence is then the object which represents execution of the submission on the hardware.

So on re-submission you either use the same dma_fence multiple times which results in a *horrible* kref_init() on an already initialized reference (It's a wonder that this doesn't crashes all the time in amdgpu). Or you do things like starting to allocate memory while the memory management potentially waits for the reset to complete.

What we could do is to provide a helper for the device drivers in the form of an iterator which gives you all the hardware fences the scheduler is waiting for, but in general device drivers should have this information by themselves.

>>
>> Anyway, let's shed some light on the difficulties with drm_sched_resubmit_jobs()
>> and then we can figure out how we can do better.
>>
>> I think it would also be interesting to know how amdgpu handles job from
>> unrelated entities being discarded by not re-submitting them when a job from
>> another entitiy hangs the HW ring.

Quite simple this case never happens in the first place.

When you have individual queues for each process (e.g. like Xe and upcomming amdgpu HW generation) you should always be able to reset the device without loosing everything.

Otherwise things like userspace queues also doesn't work at all because then neither the kernel nor the DRM scheduler is involved in the submission any more.

Regards,
Christian.

>>
>> [1] https://patchwork.freedesktop.org/patch/msgid/20221109095010.141189-5-christian.koenig@amd.com

