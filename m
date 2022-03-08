Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8DC4D12D6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9231710E43D;
	Tue,  8 Mar 2022 08:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6823110E43D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:51:15 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA5C451C;
 Tue,  8 Mar 2022 09:51:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646729473;
 bh=tx1v41sFjwGQBvE+sIrqGvKblBFOQcSEb0qoE7wv6Xk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Jy5uYLZcwLb3KPsPqVod83/S0uNHXV1yFHxrkizv+pb8dLcTPQ5oNOd8pJzjzjund
 M0qFloP+xTpNuZPF/EVZbZy9fWLLv2IcCf3jZNUaJuhGWpbxmoVTk5iNfbqb2KmQW3
 vy5SBv4M39NYY6ZYg3dSPMIjPZ3oWinmlBT9cQq8=
Message-ID: <dbc365c3-db91-91ca-8ccf-dafd849a3105@ideasonboard.com>
Date: Tue, 8 Mar 2022 10:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/3] drm: omapdrm: Fix excessive GEM buffers DMM/CMA usage
Content-Language: en-US
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, tomba@kernel.org
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <be4e1cd8-a994-303d-9424-14439ce1f7d4@ideasonboard.com>
 <47dbc690-bff2-8839-f01f-9287403a7562@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <47dbc690-bff2-8839-f01f-9287403a7562@gmail.com>
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
Cc: tony@atomide.com, merlijn@wizzup.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2022 18:21, Ivaylo Dimitrov wrote:
> Hi Tomi,
> 
> On 17.02.22 г. 15:03 ч., Tomi Valkeinen wrote:
>> Hi Ivaylo,
>>
>> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
>>> This patch series fixes excessive DMM or CMA usage of GEM buffers 
>>> leading to
>>> various runtime allocation failures. The series enables daily usage 
>>> of devices
>>> without exausting limited resources like CMA or DMM space if GPU 
>>> rendering is
>>> needed.
>>>
>>> The first patch doesn't bring any functional changes, it just moves some
>>> TILER/DMM related code to a separate function, to simplify the review 
>>> of the
>>> next two patches.
>>>
>>> The second patch allows off-CPU rendering to non-scanout buffers. 
>>> Without that
>>> patch, it is basically impossible to use the driver allocated GEM 
>>> buffers on
>>> OMAP3 for anything else but a basic CPU rendered examples as if we 
>>> want GPU
>>> rendering, we must allocate buffers as scanout buffers, which are CMA 
>>> allocated.
>>> CMA soon gets fragmented and we start seeing allocation failures. 
>>> Such failres
>>> in Xorg cannot be handeled gracefully, so the system is basically 
>>> unusable.
>>>
>>> Third patch fixes similar issue on OMAP4/5, where DMM/TILER spaces get
>>> fragmented with time, leading to allocation failures.
>>
>> I think this is just hacking around the problem. The problem is that 
>> omapdrm is being used by some as a generic buffer allocator. Those users 
> 
> Well, the user of omap_bo interface I know is xf86-video-omap. Unless if 
> by users you mean 'kernel users' which I know none.
> 
> I think that if 'we' are to teach xorg omap DDX (or any other user in 
> that regard) to use GPU driver allocator for non-scanout buffers and 
> omapdrm for scanout, it will become a mess. Not impossible though, just 
> way more complicated than the $series. Also, why do omapdrm allow 
> allocation of non-linear buffers and CPU (userspace) access to them, but 
> refuses to export them to kernel drivers? Isn't that the whole point of 
> DMABUF stuff? This is not consistent to me. The series fixes that 
> inconsistency, nothing more.
> 
>> should be changed to use a their own allocator or a generic allocator. 
> 
> SGX driver/userspace has and uses its own allocator, however, I think 
> there is more than that - what about TILER/VRFB? Do you say that SGX 
> userspace shall be smart enough to requests TILER buffers from omapdrm 
> when scanout buffer is requested and use its own allocator when not?

All I'm saying is that omapdrm should not support allocating buffers 
that are not usable by the omapdrm hardware. It doesn't make any sense.

> Actually I was thinking about something like that, and it is achievable 
> now we have:
> 
> https://github.com/maemo-leste/sgx-ddk-um/blob/master/dbm/dbm.c (REed 
> SGX 1.17 ddk gbm backend)
> 
>> And we could then drop the OMAP_BO_SCANOUT flag, as all buffers would 
>> be scanout buffers.
>>
> 
> And what about OMAP_BO_TILED_XX stuff? To me this is even more of a 
> hack, but it is what it is.

Yes, I agree, I don't think those OMAP_BO_TILED_* values should be 
exposed to userspace. But I also agree to the "it is what it is" =).

> Do I get it correctly that you want to get rid of omap_bo_new/_tiled and 
> have only dumb buffers available in omapdrm? TBH this would be great, 
> however I still don't see how a TILER/VRFB buffer would be allocated, 
> given that flags in drm_mode_create_dumb is not used anywhere in the 
> kernel(AFAIK). Unless all scanout buffers are allocated through 
> TILER/VRFB (which is a good idea IMO).

We can't get rid of those as they're userspace API.

>> Or do we have a regression in the driver? My understanding is that 
>> this has never really worked.
>>
> 
> There are couple of patches in omapdrm that change around BO flags and 
> their meaning so I think there is a regression, as the same 
> userspace/DDX on linux 5.9 results in only 2 linear buffers being 
> allocated, but as SGX driver has different version as well, I can't be 
> 100% sure without going through a lengthy assessment of SGX 
> driver/omapdrm code and patches since 5.9. Which I am not going to do as 
> I don't see what the benefit will be.
> 
> Please consider this patch series as a fix to an inconsistency, as it is 
> merely that, it does not really bring any new functionality in terms of 
> what is allocated.

I've considered, and I think I agree. The design of omapdrm + tiler is 
broken in my opinion, but it's there, it has userspace APIs, and it's 
all old code. It's probably not worth the effort to try to clean it up, 
while still somehow keeping the old userspace working.

I've had these patchesin my work branch for a while and I haven't seen 
any issues. I'll keep them there for a bit longer and I'll look at these 
patches a bit more, but I think I'll merge them at some point.

  Tomi
