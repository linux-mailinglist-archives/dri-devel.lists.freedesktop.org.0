Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8285845C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 18:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B77010E57C;
	Fri, 16 Feb 2024 17:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IeFJQx3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310F110E57C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 17:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708105440; x=1739641440;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vp2sP+hVGRaYxsIsbYmPQbJHb9mX+CXXwxtXpLpfDOI=;
 b=IeFJQx3k4mZwtf5ZxE+jx4MGNNRDlvchwt39T43CoNMaHONgFQZFHfMj
 hwy28p22ttFfgoqg9Y1PGQ9zdUKST2gK0U1Ez9Y9yzdysk2wr2ILetlIb
 abRukF0RCEkxOM1GsMYsrpJ4LXtETEgG/V0Egjmh8cgUF5SymOgQcopEm
 6mM7Y/gh22sZGh1/mL7wTGlbnSou6H2XnQxoYbtiGH2fyjSK+8e34zWHr
 og50RrmunrfbATQqHh6ALDdB+HFtxMAhMexXICWY2K6zk6q6kQ/sqXyn2
 sfaPC0T3GSeBH6Sj3FfU6hacwAinaOqKrEfQCeDL3WJ5tNTpGM9KkKq1U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="6052120"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="6052120"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 09:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4253874"
Received: from pclear1x-mobl.ger.corp.intel.com (HELO [10.213.230.254])
 ([10.213.230.254])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 09:43:57 -0800
Message-ID: <cfe1870f-16ff-45b4-8966-6bb536d3cae7@linux.intel.com>
Date: Fri, 16 Feb 2024 17:43:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Always record job cycle and timestamp information
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Lionel Landwerlin <lionel.g.landwerlin@linux.intel.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240214121435.3813983-1-adrian.larumbe@collabora.com>
 <ba987da3-b4aa-410c-95ae-434e94793d85@arm.com>
 <CAKMK7uH=QKSyMgsOYCHMwE7iv6jQZRwUMcKq=HiXsBXBCv5BCQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAKMK7uH=QKSyMgsOYCHMwE7iv6jQZRwUMcKq=HiXsBXBCv5BCQ@mail.gmail.com>
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


On 16/02/2024 16:57, Daniel Vetter wrote:
> On Wed, Feb 14, 2024 at 01:52:05PM +0000, Steven Price wrote:
>> Hi Adrián,
>>
>> On 14/02/2024 12:14, Adrián Larumbe wrote:
>>> A driver user expressed interest in being able to access engine usage stats
>>> through fdinfo when debugfs is not built into their kernel. In the current
>>> implementation, this wasn't possible, because it was assumed even for
>>> inflight jobs enabling the cycle counter and timestamp registers would
>>> incur in additional power consumption, so both were kept disabled until
>>> toggled through debugfs.
>>>
>>> A second read of the TRM made me think otherwise, but this is something
>>> that would be best clarified by someone from ARM's side.
>>
>> I'm afraid I can't give a definitive answer. This will probably vary
>> depending on implementation. The command register enables/disables
>> "propagation" of the cycle/timestamp values. This propagation will cost
>> some power (gates are getting toggled) but whether that power is
>> completely in the noise of the GPU as a whole I can't say.
>>
>> The out-of-tree kbase driver only enables the counters for jobs
>> explicitly marked (BASE_JD_REQ_PERMON) or due to an explicit connection
>> from a profiler.
>>
>> I'd be happier moving the debugfs file to sysfs rather than assuming
>> that the power consumption is small enough for all platforms.
>>
>> Ideally we'd have some sort of kernel interface for a profiler to inform
>> the kernel what it is interested in, but I can't immediately see how to
>> make that useful across different drivers. kbase's profiling support is
>> great with our profiling tools, but there's a very strong connection
>> between the two.
> 
> Yeah I'm not sure whether a magic (worse probably per-driver massively
> different) file in sysfs is needed to enable gpu perf monitoring stats in
> fdinfo.
> 
> I get that we do have a bit a gap because the linux perf pmu stuff is
> global, and you want per-process, and there's kinda no per-process support
> for perf stats for devices. But that's probably the direction we want to
> go, not so much fdinfo. At least for hardware performance counters and
> things like that.
> 
> Iirc the i915 pmu support had some integration for per-process support,
> you might want to chat with Tvrtko for kernel side and Lionel for more
> userspace side. At least if I'm not making a complete mess and my memory
> is vaguely related to reality. Adding them both.

Yeah there are two separate things, i915 PMU and i915 Perf/OA.

If my memory serves me right I indeed did have a per-process support for 
i915 PMU implemented as an RFC (or at least a branch somewhere) some 
years back. IIRC it only exposed the per engine GPU utilisation and did 
not find it very useful versus the complexity. (I think it at least 
required maintaining a map of drm clients per task.)

Our more useful profiling is using a custom Perf/OA interface 
(Observation Architecture) which is possibly similar to kbase mentioned 
above. Why it is a custom interface is explained in a large comment on 
top of i915_perf.c. Not sure if all of them still hold but on the 
overall perf does not sound like the right fit for detailed GPU profiling.

Also PMU drivers are very challenging to get the implementation right, 
since locking model and atomicity requirements are quite demanding.

 From my point of view, at least it is my initial thinking, if custom 
per driver solutions are strongly not desired, it could be interesting 
to look into whether there is enough commonality, in at least concepts, 
to see if a new DRM level common but extensible API would be doable. 
Even then it may be tricky to "extract" enough common code to justify it.

Regards,

Tvrtko

> 
> Cheers, Sima
> 
> 
>>
>> Steve
>>
>>> Adrián Larumbe (1):
>>>    drm/panfrost: Always record job cycle and timestamp information
>>>
>>>   drivers/gpu/drm/panfrost/Makefile           |  2 --
>>>   drivers/gpu/drm/panfrost/panfrost_debugfs.c | 21 ------------------
>>>   drivers/gpu/drm/panfrost/panfrost_debugfs.h | 14 ------------
>>>   drivers/gpu/drm/panfrost/panfrost_device.h  |  1 -
>>>   drivers/gpu/drm/panfrost/panfrost_drv.c     |  5 -----
>>>   drivers/gpu/drm/panfrost/panfrost_job.c     | 24 ++++++++-------------
>>>   drivers/gpu/drm/panfrost/panfrost_job.h     |  1 -
>>>   7 files changed, 9 insertions(+), 59 deletions(-)
>>>   delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
>>>   delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
>>>
>>>
>>> base-commit: 6b1f93ea345947c94bf3a7a6e668a2acfd310918
>>
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
