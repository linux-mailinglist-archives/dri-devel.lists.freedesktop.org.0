Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28B04019AB
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 12:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7980089BA9;
	Mon,  6 Sep 2021 10:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143D289BB3;
 Mon,  6 Sep 2021 10:20:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="305496673"
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="305496673"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 03:20:21 -0700
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="691617047"
Received: from ljdobbs-mobl1.ger.corp.intel.com (HELO [10.213.197.10])
 ([10.213.197.10])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 03:20:19 -0700
Subject: Re: [Intel-gfx] [PATCH v7 5/8] drm_print: add choice to use dynamic
 debug in drm-debug
To: jim.cromie@gmail.com
Cc: Jason Baron <jbaron@akamai.com>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
 <20210831202133.2165222-6-jim.cromie@gmail.com>
 <b3c4b3aa-b873-a2aa-c1ad-5fed80038c6e@linux.intel.com>
 <CAJfuBxw-i-7YUenvBGHA0unBQ8BqmOGRF3nRYNwNPLVaxWpSvQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <1aabb5c0-eef9-a483-2631-25726c9dc268@linux.intel.com>
Date: Mon, 6 Sep 2021 11:20:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJfuBxw-i-7YUenvBGHA0unBQ8BqmOGRF3nRYNwNPLVaxWpSvQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 03/09/2021 22:57, jim.cromie@gmail.com wrote:
> On Fri, Sep 3, 2021 at 5:15 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 31/08/2021 21:21, Jim Cromie wrote:
>>> drm's debug system writes 10 distinct categories of messages to syslog
>>> using a small API[1]: drm_dbg*(10 names), DRM_DEV_DEBUG*(3 names),
>>> DRM_DEBUG*(8 names).  There are thousands of these callsites, each
>>> categorized in this systematized way.
>>>
>>> These callsites can be enabled at runtime by their category, each
>>> controlled by a bit in drm.debug (/sys/modules/drm/parameter/debug).
>>> In the current "basic" implementation, drm_debug_enabled() tests these
>>> bits in __drm_debug each time an API[1] call is executed; while cheap
>>> individually, the costs accumulate with uptime.
>>>
>>> This patch uses dynamic-debug with jump-label to patch enabled calls
>>> onto their respective NOOP slots, avoiding all runtime bit-checks of
>>> __drm_debug by drm_debug_enabled().
>>>
>>> Dynamic debug has no concept of category, but we can emulate one by
>>> replacing enum categories with a set of prefix-strings; "drm:core:",
>>> "drm:kms:" "drm:driver:" etc, and prepend them (at compile time) to
>>> the given formats.
>>>
>>> Then we can use:
>>>     `echo module drm format "^drm:core: " +p > control`
>>>
>>> to enable the whole category with one query.
>>
>> Probably stupid question - enabling stuff at boot time still works as
>> described in Documentation/admin-guide/dynamic-debug-howto.rst?
>>
> 
> yes.  its turned on in earlyinit, and cmdline args are a processed then,
> and when modules are added
> 
> 
>> Second question, which perhaps has been covered in the past so apologies
>> if redundant - what is the advantage of allowing this to be
>> configurable, versus perhaps always enabling it? Like what would be the
>> reasons someone wouldn't just want to have CONFIG_DYNAMIC_DEBUG compiled
>> in? Kernel binary size?
>>
> 
> Im unaware of anything on this topic, but I can opine :-)
> Its been configurable since I saw it and thought "jump-labels are cool!"
> 
> code is small
> [jimc@frodo local-i915m]$ size lib/dynamic_debug.o
>     text    data     bss     dec     hex filename
>    24016    8041      64   32121    7d79 lib/dynamic_debug.o
> 
> Its data tables are big, particularly the __dyndbg section
> builtins:
> dyndbg: 108 debug prints in module mptcp
> dyndbg:   2 debug prints in module i386
> dyndbg:   2 debug prints in module xen
> dyndbg:   2 debug prints in module fixup
> dyndbg:   7 debug prints in module irq
> dyndbg: 3039 prdebugs in 283 modules, 11 KiB in ddebug tables, 166 kiB
> in __dyndbg section
> 
> bash-5.1#
> bash-5.1# for m in i915 amdgpu ; do modprobe $m dyndbg=+_ ; done
> dyndbg: 384 debug prints in module drm
> dyndbg: 211 debug prints in module drm_kms_helper
> dyndbg:   2 debug prints in module ttm
> dyndbg:   8 debug prints in module video
> dyndbg: 1727 debug prints in module i915
> dyndbg: processed 1 queries, with 3852 matches, 0 errs
> dyndbg: 3852 debug prints in module amdgpu
> [drm] amdgpu kernel modesetting enabled.
> amdgpu: CRAT table disabled by module option
> amdgpu: Virtual CRAT table created for CPU
> amdgpu: Topology: Add CPU node
> bash-5.1#
> 
> At 56 bytes / callsite, it adds up.
> And teaching DRM to use it enlarges its use dramatically,
> not just in drm itself, but in many drivers
> 
> amdgpu has 3852 callsite, (vs 3039 in my kernel), so it has ~240kb.
> It has extra (large chunks generated by macros) to trim,
> but i915 has ~1700, and drm has ~380
> 
> I have WIP to reduce the table space, by splitting it into 2 separate ones;
> guts and decorations (module, function, file pointers).
> The decoration recs are redundant, 45% are copies of previous
> (function changes fastest)
> It needs much rework, but it should get 20% overall.
> decorations are 24/56 of footprint.

I'll try to extract the "executive summary" from this, you tell me if I 
got it right.

So using or not using dynamic debug for DRM debug ends up being about 
shifting the cost between kernel binary size (data section grows by each 
pr_debug call site) and runtime conditionals?

Since the table sizes you mention seem significant enough, I think that 
justifies existence of DRM_USE_DYNAMIC_DEBUG. It would probably be a 
good idea to put some commentary on that there. Ideally including some 
rough estimates both including space cost per call site and space cost 
for a typical distro kernel build?

Regards,

Tvrtko
