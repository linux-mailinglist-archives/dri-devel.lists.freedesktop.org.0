Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0C69D1A0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 17:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF0D10E288;
	Mon, 20 Feb 2023 16:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC3610E1D1;
 Mon, 20 Feb 2023 16:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676911477; x=1708447477;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2BybXlDR1oIhD9VuvYO2SppC/3FQoWU11/cV5tnhm0g=;
 b=NdUXrkbeG2T1PikKkXcQ8FPs/CMy87N14TcRAGDlT4NJdx6ZRNeYSqYm
 YsEmNjKxkxIZmYuqMtZMm/xuHPRikwIOM5VKkV65YAajU11WFy49Nucwj
 91kUB2Jadvwge3H73kFI4U6YQVef6rDb1J47w7RiMjGmfRrshgoICoMc1
 R17Y208WZsODcKyb8cnCoHuK++opydF7myzGQ6OvvR8gAtVLVU2wCfGnz
 VkATtMOXX0wZiiBuCNmnziFOO311SgvVSGeUkdt41hkuRQtyN2H5kkbyF
 6XNCM4xncmPuvScsRJdpp+bW9EnTWVcrscmyHRmci3McLAkNVhcW2V0xO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="316160236"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="316160236"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 08:44:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="740108231"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; d="scan'208";a="740108231"
Received: from mochoamo-mobl.ger.corp.intel.com (HELO [10.213.211.126])
 ([10.213.211.126])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2023 08:44:34 -0800
Message-ID: <43aff648-df2d-4fa2-356c-b74f5e3a92e7@linux.intel.com>
Date: Mon, 20 Feb 2023 16:44:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [RFC v2 0/5] Waitboost drm syncobj waits
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGto9VMNLJnAs+n5H6MNoVASNasYEu3WhYYkhn5sERg4Fw@mail.gmail.com>
 <Y+5zyeSncSbsXHWG@intel.com>
 <7e059e8c-41c3-b56c-26c8-c0e2230616b1@linux.intel.com>
 <CAF6AEGuN2dv+Lsk3R43oPRA9c8ZoMjzCCKR+L41wNT8Sc3TgsQ@mail.gmail.com>
 <c0663648-5567-2d7a-43b1-dfa043109051@linux.intel.com>
 <CAF6AEGsGqjbL_tA8x_xwygBccKMP2DTbSy-B5_dEakpQVep8vg@mail.gmail.com>
 <Y+/ndNIu/kYGiVh5@intel.com>
 <6832ba1a-c6b0-4631-3b4e-bfcd31d8b59c@linux.intel.com>
 <CAF6AEGsEq7Pyc6PMenPjufLDzw5VFtLPjZwOXim71DN5J5TcJw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGsEq7Pyc6PMenPjufLDzw5VFtLPjZwOXim71DN5J5TcJw@mail.gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/02/2023 15:52, Rob Clark wrote:
> On Mon, Feb 20, 2023 at 3:33 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 17/02/2023 20:45, Rodrigo Vivi wrote:

[snip]

>> Yeah I agree. And as not all media use cases are the same, as are not
>> all compute contexts someone somewhere will need to run a series of
>> workloads for power and performance numbers. Ideally that someone would
>> be the entity for which it makes sense to look at all use cases, from
>> server room to client, 3d, media and compute for both. If we could get
>> the capability to run this in some automated fashion, akin to CI, we
>> would even have a chance to keep making good decisions in the future.
>>
>> Or we do some one off testing for this instance, but we still need a
>> range of workloads and parts to do it properly..
>>
>>>> I also think the "arms race" scenario isn't really as much of a
>>>> problem as you think.  There aren't _that_ many things using the GPU
>>>> at the same time (compared to # of things using CPU).   And a lot of
>>>> mobile games throttle framerate to avoid draining your battery too
>>>> quickly (after all, if your battery is dead you can't keep buying loot
>>>> boxes or whatever).
>>>
>>> Very good point.
>>
>> On this one I still disagree from the point of view that it does not
>> make it good uapi if we allow everyone to select themselves for priority
>> handling (one flavour or the other).
> 
> There is plenty of precedent for userspace giving hints to the kernel
> about scheduling and freq mgmt.  Like schedutil uclamp stuff.
> Although I think that is all based on cgroups.

I knew about SCHED_DEADLINE and that it requires CAP_SYS_NICE, but I did 
not know about uclamp. Quick experiment with uclampset suggests it 
indeed does not require elevated privilege. If that is indeed so, it is 
good enough for me as a precedent.

It appears to work using sched_setscheduler so maybe could define 
something similar in i915/xe, per context or per client, not sure.

Maybe it would start as a primitive implementation but the uapi would 
not preclude making it smart(er) afterwards. Or passing along to GuC to 
do it's thing with it.

> In the fence/syncobj case, I think we need per-wait hints.. because
> for a single process the driver will be doing both housekeeping waits
> and potentially urgent waits.  There may also be some room for some
> cgroup or similar knobs to control things like what max priority an
> app can ask for, and whether or how aggressively the kernel responds
> to the "deadline" hints.  So as far as "arms race", I don't think I'd

Per wait hints are okay I guess even with "I am important" in their name 
if sched_setscheduler allows raising uclamp.min just like that. In which 
case cgroup limits to mimick cpu uclamp also make sense.

> change anything about my "fence deadline" proposal.. but that it might
> just be one piece of the overall puzzle.

That SCHED_DEADLINE requires CAP_SYS_NICE does not worry you?

Regards,

Tvrtko
