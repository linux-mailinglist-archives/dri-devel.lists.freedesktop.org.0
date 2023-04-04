Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0E36D5DD4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099BC10E644;
	Tue,  4 Apr 2023 10:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F6C10E644;
 Tue,  4 Apr 2023 10:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680605142; x=1712141142;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=a8FzqUte2d3iMypuC0esIUEUtqkr1TmMjZgWQcMRbZM=;
 b=CrSdAmlYz/s+v3+C7RG41BQ7C6RIAx7I/higrHfxWVS8J+OMn4ahAWNX
 4IHwGJD8jhsdoPMHl828AtISa2PpLXoKgdsrGG5flXVcOb1grhu74GYhF
 HPgkRSKjNzA4OKYJ1IOGD6B7yh6CAbEKglmj1RFEleGqkcoYAtaP9PEbv
 hYXg2ftckY4qIVJIDIV5vEIbh6O1bnUEsfmBKynStkn3NV0gZgyiaNeKo
 NzstKxalI96Bt9n/2T6I/5Drb28A9uwFoGNcfdMisN6rSWeUmFsSB3rds
 XsWybjVTgom/FcPjcq6vErS+KxOhiqR5x5j2XfS/HXQiOFEWtx7iAWQcm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="369963757"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="369963757"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="636476814"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; d="scan'208";a="636476814"
Received: from pcanders-mobl1.ger.corp.intel.com (HELO [10.213.217.134])
 ([10.213.217.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:45:41 -0700
Message-ID: <fa0360e4-b845-92ee-3c6d-a593cc4135b5@linux.intel.com>
Date: Tue, 4 Apr 2023 11:45:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 0/4] uapi, drm: Add and implement RLIMIT_GPUPRIO
Content-Language: en-US
To: Joshua Ashton <joshua@froggi.es>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20230403194058.25958-1-joshua@froggi.es>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230403194058.25958-1-joshua@froggi.es>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 03/04/2023 20:40, Joshua Ashton wrote:
> Hello all!
> 
> I would like to propose a new API for allowing processes to control
> the priority of GPU queues similar to RLIMIT_NICE/RLIMIT_RTPRIO.
> 
> The main reason for this is for compositors such as Gamescope and
> SteamVR vrcompositor to be able to create realtime async compute
> queues on AMD without the need of CAP_SYS_NICE.
> 
> The current situation is bad for a few reasons, one being that in order
> to setcap the executable, typically one must run as root which involves
> a pretty high privelage escalation in order to achieve one
> small feat, a realtime async compute queue queue for VR or a compositor.
> The executable cannot be setcap'ed inside a
> container nor can the setcap'ed executable be run in a container with
> NO_NEW_PRIVS.
> 
> I go into more detail in the description in
> `uapi: Add RLIMIT_GPUPRIO`.
> 
> My initial proposal here is to add a new RLIMIT, `RLIMIT_GPUPRIO`,
> which seems to make most initial sense to me to solve the problem.
> 
> I am definitely not set that this is the best formulation however
> or if this should be linked to DRM (in terms of it's scheduler
> priority enum/definitions) in any way and and would really like other
> people's opinions across the stack on this.
> 
> Once initial concern is that potentially this RLIMIT could out-live
> the lifespan of DRM. It sounds crazy saying it right now, something
> that definitely popped into my mind when touching `resource.h`. :-)
> 
> Anyway, please let me know what you think!
> Definitely open to any feedback and advice you may have. :D

Interesting! I tried to solved the similar problem two times in the past already.

First time I was proposing to tie nice to DRM scheduling priority [1] - if the latter has been left at default - drawing the analogy with the nice+ionice handling. That was rejected and I was nudged towards the cgroups route.

So with that second attempt I implemented a hierarchical opaque drm.priority cgroup controller [2]. I think it would allow you to solve your use case too by placing your compositor in a cgroup with an elevated priority level.

Implementation wise in my proposal it was left to individual drivers to "meld" the opaque cgroup drm.priority with the driver specific priority concept.

That too wasn't too popular with the feedback (AFAIR) that the priority is a too subsystem specific concept.

Finally I was left with a weight based drm cgroup controller, exactly following the controls of the CPU and IO ones, but with much looser runtime guarantees. [3]

I don't think this last one works for your use case, at least not at the current state for drm scheduling capability, where the implementation is a "bit" too reactive for realtime.

Depending on how the discussion around your rlimit proposal goes, perhaps one alternative could be to go the cgroup route and add an attribute like drm.realtime. That perhaps sounds abstract and generic enough to be passable. Built as a simplification of [2] it wouldn't be too complicated.

On the actual proposal of RLIMIT_GPUPRIO...

The name would be problematic since we have generic hw accelerators (not just GPUs) under the DRM subsystem. Perhaps RLIMIT_DRMPRIO would be better but I think you will need to copy some more mailing lists and people on that one. Because I can imagine one or two more fundamental questions this opens up, as you have eluded in your cover letter as well.

Regards,

Tvrtko

[1] https://lore.kernel.org/dri-devel/20220407152806.3387898-1-tvrtko.ursulin@linux.intel.com/T/
[2] https://lore.kernel.org/lkml/20221019173254.3361334-4-tvrtko.ursulin@linux.intel.com/T/#u
[3] https://lore.kernel.org/lkml/20230314141904.1210824-1-tvrtko.ursulin@linux.intel.com/
