Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C946CB3830
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 17:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E035910E0F4;
	Wed, 10 Dec 2025 16:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F40310E0F4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Dec 2025 16:45:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD0C3153B;
 Wed, 10 Dec 2025 08:44:56 -0800 (PST)
Received: from [10.57.45.72] (unknown [10.57.45.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1797F3F73B;
 Wed, 10 Dec 2025 08:45:00 -0800 (PST)
Message-ID: <4da1fc56-f522-450e-8d71-b0cbaf2f4c4b@arm.com>
Date: Wed, 10 Dec 2025 16:44:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/panthor: Add tracepoint for hardware
 utilisation changes
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251210-panthor-tracepoints-v2-0-ace2e29bad0f@collabora.com>
 <20251210-panthor-tracepoints-v2-3-ace2e29bad0f@collabora.com>
 <99ee1d8c-e43a-4d7d-a0d0-37546c09c183@arm.com> <3631152.44csPzL39Z@workhorse>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <3631152.44csPzL39Z@workhorse>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/12/2025 16:27, Nicolas Frattaroli wrote:
> On Wednesday, 10 December 2025 16:57:42 Central European Standard Time Steven Price wrote:
>> On 10/12/2025 14:30, Nicolas Frattaroli wrote:
>>> Mali GPUs have three registers that indicate which parts of the hardware
>>> are powered at any moment. These take the form of bitmaps. In the case
>>> of SHADER_READY for example, a high bit indicates that the shader core
>>> corresponding to that bit index is powered on. These bitmaps aren't
>>> solely contiguous bits, as it's common to have holes in the sequence of
>>> shader core indices, and the actual set of which cores are present is
>>> defined by the "shader present" register.
>>>
>>> When the GPU finishes a power state transition, it fires a
>>> GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
>>> received, the _READY registers will contain new interesting data. During
>>> power transitions, the GPU_IRQ_POWER_CHANGED interrupt will fire, and
>>> the registers will likewise contain potentially changed data.
>>>
>>> This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
>>> which is something related to Mali v14+'s power control logic. The
>>> _READY registers and corresponding interrupts are already available in
>>> v9 and onwards.
>>>
>>> Additionally, the SHADER_PWRFEATURES register may be of interest, which
>>> contains a bit flag indicating whether raytracing functionality is
>>> turned on, as the ray tracing unit's power can separately be toggled.
>>> Reading this register on platforms from before it was added has no
>>> unpleasant side-effects; it's officially specified to read as 0 in this
>>> case.
>>
>> I'm confused by this addition, SHADER_PWRFEATURES is sampled (by the
>> hardware) on power up of a shader core. So the value of the register
>> isn't necessarily representative of the actual hardware state. In normal
>> operation it is controlled by the MCU and so probably has some
>> correlation to ray tracing happening, but I don't think there's any
>> gaurentee there. And on later GPUs this functionality has been moved
>> into the POWER_CONTROL block and I don't think there's anything equivalent.
> 
> I was afraid that would be the case based on the hw docs wording.
> In that case yeah, I'll just drop it for now. My hope was that
> SHADER_PWRFEATURES would contain whatever the current status of the
> hardware is, aside from just being the place to write the desired
> status as well.
> 
>> Also in general I wouldn't rely on the "read as 0" parts - not
>> specifically because I expect HW bugs, but because later GPUs might
>> reuse those register positions for other things.
> 
> That's fun. After I remove the SHADER_PWRFEATURES register, the
> register reads that will be left can only happen if the
> GPU_IRQ_POWER_CHANGED/GPU_IRQ_POWER_CHANGED_ALL interrupt status
> bits are set. Unless Arm has plans to reuse those bit values in
> future GPUs, and someone adds them to Panthor (shadowing the old
> ones), and someone then enables the tracepoint, then these reads
> should never happen on hardware that doesn't have the _READY regs.

Yeah I think that sort of thing should be safe - the GPU shouldn't
produce IRQs for things we haven't unmasked - so we won't see them. If
(/when) in the future those bits get reused then we can deal with that
when Panthor is updated to use the new meaning of the bits. Arguably we
could drop GPU_IRQ_POWER_CHANGED from the bit mask (we're not enabling
it so it should never fire) - which is the one I can see proposed for
reuse ;)

>> So this seems to only work on a small number of GPUs and even then it's
>> relying on a firmware behaviour which isn't gaurenteed.
>>
>> It would be good if we can come up with a tracepoint which is both
>> useful and likely to work over a range of GPUs.
> 
> If I understand correctly, the RTU power status isn't something
> that can be read like SHADER_READY on v14+. In that case, I'll just
> drop the rt_on field entirely, because on v13 it doesn't necessarily
> do what I want it to do, and on v14+, it doesn't exist. It was an
> added "oh this is simple enough" bonus, the main goal is to have the
> tracepoints to track power events.

Yeah I don't believe that status is exposed when the MCU is handling the
power control.

> On that note, I'd love to implement the trace event call on v14+ as
> well, because I'm fairly sure it can re-use the same tracepoint
> definition. I might need to generalize the register and unregister
> functions though, probably by moving them somewhere else, and then
> having them call into a per-hw-version function pointer. With no
> v14+ hardware to test it on, I won't implement that variant for now
> however.
> 
> Should I generalize the tracepoint register/unregister in this way
> right now even without the v14+ implementation? Might make it more
> palatable.

It would be good to ensure that the tracepoint can be generalized - but
it's fine to only implement what you can test and leave it to others to
extend. I just don't want us to end up in a mess where every different
GPU version has a different set of tracepoints.

Thanks,
Steve

> Kind regards,
> Nicolas Frattaroli
>  
>> Thanks,
>> Steve
> 
> 
> 

