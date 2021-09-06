Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6334401B2B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 14:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD6189624;
	Mon,  6 Sep 2021 12:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F19895E2;
 Mon,  6 Sep 2021 12:26:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="283665411"
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="283665411"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 05:26:26 -0700
X-IronPort-AV: E=Sophos;i="5.85,272,1624345200"; d="scan'208";a="691651785"
Received: from ljdobbs-mobl1.ger.corp.intel.com (HELO [10.213.197.10])
 ([10.213.197.10])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2021 05:26:25 -0700
Subject: Re: [Intel-gfx] [PATCH v7 3/8] i915/gvt: use
 DEFINE_DYNAMIC_DEBUG_CATEGORIES to create "gvt:core:" etc categories
To: jim.cromie@gmail.com
Cc: Jason Baron <jbaron@akamai.com>, Greg KH <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gvt-dev@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
 <20210831202133.2165222-4-jim.cromie@gmail.com>
 <9fe5e962-e65e-6844-269a-058cce944a89@linux.intel.com>
 <CAJfuBxz+cZyyDSBrDR0+Rf7K9fqpmeAfcWb1x2MkwD0P9LuDcQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <2bfbd75c-8f7f-e756-05c3-13dff41264e4@linux.intel.com>
Date: Mon, 6 Sep 2021 13:26:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJfuBxz+cZyyDSBrDR0+Rf7K9fqpmeAfcWb1x2MkwD0P9LuDcQ@mail.gmail.com>
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


On 03/09/2021 20:22, jim.cromie@gmail.com wrote:
> On Fri, Sep 3, 2021 at 5:07 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 31/08/2021 21:21, Jim Cromie wrote:
>>> The gvt component of this driver has ~120 pr_debugs, in 9 categories
>>> quite similar to those in DRM.  Following the interface model of
>>> drm.debug, add a parameter to map bits to these categorizations.
>>>
>>> DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
>>>        "dyndbg bitmap desc",
>>>        { "gvt:cmd: ",  "command processing" },
>>>        { "gvt:core: ", "core help" },
>>>        { "gvt:dpy: ",  "display help" },
>>>        { "gvt:el: ",   "help" },
>>>        { "gvt:irq: ",  "help" },
>>>        { "gvt:mm: ",   "help" },
>>>        { "gvt:mmio: ", "help" },
>>>        { "gvt:render: ", "help" },
>>>        { "gvt:sched: " "help" });
>>>
> 
> BTW, Ive dropped the help field, its already handled, dont need to clutter.
> 
> 
>>> The actual patch has a few details different, cmd_help() macro emits
>>> the initialization construct.
>>>
>>> if CONFIG_DRM_USE_DYNAMIC_DEBUG, then -DDYNAMIC_DEBUG_MODULE is added
>>> cflags, by gvt/Makefile.
>>>
>>> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>>> ---
>>> v5:
>>> . static decl of vector of bit->class descriptors - Emil.V
>>> . relocate gvt-makefile chunk from elsewhere
>>> v7:
>>> . move ccflags addition up to i915/Makefile from i915/gvt
>>> ---
>>>    drivers/gpu/drm/i915/Makefile      |  4 ++++
>>>    drivers/gpu/drm/i915/i915_params.c | 35 ++++++++++++++++++++++++++++++
>>
>> Can this work if put under gvt/ or at least intel_gvt.h|c?
>>
> 
> I thought it belonged here more, at least according to the name of the
> config.var

Hmm bear with me please - the categories this patch creates are intended 
to be used explicitly from the GVT "sub-module", or they somehow even 
get automatically used with no further intervention to callers required?

> CONFIG_DRM_USE_DYNAMIC_DEBUG.
> 
> I suppose its not a great name, its narrow purpose is to swap
> drm-debug api to use dyndbg.   drm-evrything already "uses"
> dyndbg if CONFIG_DYNAMIC_DEBUG=y, those gvt/pr_debugs in particular.
> 
> Theres also CONFIG_DYNAMIC_DEBUG_CORE=y,
> which drm basically ignores currently.
> 
> So with the name CONFIG_DRM_USE_DYNAMIC_DEBUG
> it seemed proper to arrange for that  to be true on DD-CORE=y builds,
> by adding -DDYNAMIC_DEBUG_MODULE
> 
> Does that make some sense ?
> How to best resolve the frictions ?
> new CONFIG names ?
> 
>>>    2 files changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>> index 4f22cac1c49b..5a4e371a3ec2 100644
>>> --- a/drivers/gpu/drm/i915/Makefile
>>> +++ b/drivers/gpu/drm/i915/Makefile
>>> @@ -30,6 +30,10 @@ CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
>>>
>>>    subdir-ccflags-y += -I$(srctree)/$(src)
>>>
>>> +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
>>> +ccflags-y += -DDYNAMIC_DEBUG_MODULE
>>> +#endif
>>
>> Ignores whether CONFIG_DRM_I915_GVT is enabled or not?
>>
> 
> not intentionally.
> I think theres 2 things youre noting:
> 
> 1 - make frag into gvt/Makefile
> I had it there earlier, not sure why I moved it up.
> maybe some confusion on proper scope of the flag.
> 
> 
> 2 - move new declaration code in i915-param.c inside the gvt ifdef
> 
> Im good with that.
> I'll probably copy the ifdef wrapper down rather than move the decl up.
> ie:
> 
> #if __and(IS_ENABLED(CONFIG_DRM_I915_GVT),
>    IS_ENABLED(CONFIG_DRM_USE_DYNAMIC_DEBUG))
> 
> unsigned long __gvt_debug;
> EXPORT_SYMBOL(__gvt_debug);
> 
> 
>>> +
>>>    # Please keep these build lists sorted!
>>>
>>>    # core driver code
>>> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
>>> index e07f4cfea63a..e645e149485e 100644
>>> --- a/drivers/gpu/drm/i915/i915_params.c
>>> +++ b/drivers/gpu/drm/i915/i915_params.c
>>> @@ -265,3 +265,38 @@ void i915_params_free(struct i915_params *params)
>>>        I915_PARAMS_FOR_EACH(FREE);
>>>    #undef FREE
>>>    }
>>> +
>>> +#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
>>> +/* todo: needs DYNAMIC_DEBUG_MODULE in some cases */
>>> +
>>> +unsigned long __gvt_debug;
>>> +EXPORT_SYMBOL(__gvt_debug);
>>> +
>>> +#define _help(key)   "\t    \"" key "\"\t: help for " key "\n"
>>> +
>>> +#define I915_GVT_CATEGORIES(name) \
>>> +     " Enable debug output via /sys/module/i915/parameters/" #name   \
>>> +     ", where each bit enables a debug category.\n"                  \
>>> +     _help("gvt:cmd:")                                               \
>>> +     _help("gvt:core:")                                              \
>>> +     _help("gvt:dpy:")                                               \
>>> +     _help("gvt:el:")                                                \
>>> +     _help("gvt:irq:")                                               \
>>> +     _help("gvt:mm:")                                                \
>>> +     _help("gvt:mmio:")                                              \
>>> +     _help("gvt:render:")                                            \
>>> +     _help("gvt:sched:")
>>> +
>>> +DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
>>> +                             I915_GVT_CATEGORIES(debug_gvt),
>>> +                             _DD_cat_("gvt:cmd:"),
>>> +                             _DD_cat_("gvt:core:"),
>>> +                             _DD_cat_("gvt:dpy:"),
>>> +                             _DD_cat_("gvt:el:"),
>>> +                             _DD_cat_("gvt:irq:"),
>>> +                             _DD_cat_("gvt:mm:"),
>>> +                             _DD_cat_("gvt:mmio:"),
>>> +                             _DD_cat_("gvt:render:"),
>>> +                             _DD_cat_("gvt:sched:"));
>>> +
>>> +#endif
>>
>> So just the foundation - no actual use sites I mean? How would these be
>> used from the code?
>>
> 
> there are 120 pr_debug "users" :-)
> 
> no users per se, but anyone using drm.debug
> /sys/module/drm/parameters/debug
> might use this too.
> its a bit easier than composing queries for >/proc/dyamic_debug/control

Same as my previous question, perhaps I am not up to speed with this 
yet.. Even if pr_debug is used inside GVT - are the categories and 
debug_gvt global as of this patch (or series)?

Regards,

Tvrtko
