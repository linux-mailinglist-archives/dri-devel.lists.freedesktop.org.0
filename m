Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F8702A62
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 12:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0911C10E193;
	Mon, 15 May 2023 10:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4BE10E193;
 Mon, 15 May 2023 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684146044; x=1715682044;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jsLc8i68xEC9JMqzwbvTBigsxEb2nUEaRjTTHYZ3cy0=;
 b=OlTeg6NOz6biuTT1rCjtloPt3IRPniihblU5UIG5swTkPrG9oWWuEOBR
 vYR7aHylZM47ybnYeUYntJSZN9LkGASUE7yohKcPPkNBsepxxWIA6Vr4+
 1AIeVWsjNuiX7LVGo7LLDMlIeB3q8AiN5nnw90h96oQC/v7o+/JXE5aBq
 NvHgv6p2xe9I+z6l5Sgcz8goWREAe34bS36tOu1mrZFwzoQqDZ49qSQAp
 yHVwLKfV1uV4TuGCD7j5OSiyudvdKFUggU0iD5U8hu/ynPSvaPFl101qW
 ZAdtcthiJFwH4uLlSbzzViG4Z93gtERaBACmDagIQWQNDnalR/NvI3u3X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351198108"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="351198108"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:20:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="812888756"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="812888756"
Received: from zolayode-mobl.ger.corp.intel.com (HELO [10.213.214.133])
 ([10.213.214.133])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:20:41 -0700
Message-ID: <6ebba088-68e3-3f6e-4ccc-f29ab5d66fa9@linux.intel.com>
Date: Mon, 15 May 2023 11:20:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 4/4] drm/i915: Allow user to set cache at BO creation
Content-Language: en-US
To: Jordan Justen <jordan.l.justen@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, fei.yang@intel.com
References: <20230509165942.2155-1-fei.yang@intel.com>
 <20230509165942.2155-5-fei.yang@intel.com>
 <ZFwXOPV9eY0mCSyz@ashyti-mobl2.lan>
 <168392127300.1245490.15218496130423132985@jljusten-skl>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <168392127300.1245490.15218496130423132985@jljusten-skl>
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
Cc: Arkadiusz Hiler <arek@hiler.eu>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/05/2023 20:54, Jordan Justen wrote:
> On 2023-05-10 15:14:16, Andi Shyti wrote:
>> Hi,
>>
>> On Tue, May 09, 2023 at 09:59:42AM -0700, fei.yang@intel.com wrote:
>>> From: Fei Yang <fei.yang@intel.com>
>>>
>>> To comply with the design that buffer objects shall have immutable
>>> cache setting through out their life cycle, {set, get}_caching ioctl's
>>> are no longer supported from MTL onward. With that change caching
>>> policy can only be set at object creation time. The current code
>>> applies a default (platform dependent) cache setting for all objects.
>>> However this is not optimal for performance tuning. The patch extends
>>> the existing gem_create uAPI to let user set PAT index for the object
>>> at creation time.
>>> The new extension is platform independent, so UMD's can switch to using
>>> this extension for older platforms as well, while {set, get}_caching are
>>> still supported on these legacy paltforms for compatibility reason.
>>>
>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> just for a matter of completeness, this is new uapi is tested
>> through the "create-ext-set-pat" test case from the "gem_create"
>> igt test[1]. Can any of the igt maintainers give it a look,
>> comment and ack?
>>
>> The mesa merge request is here [2]. As there is a merge request
>> in progress, would anyone from mesa be so kind to give an ack to
>> this patch, as well?
>>
>> With the mesa ack in place this patch should be ready to go and
>> I'm looking forward to having it in.
> 
> I tested my MR [2] in our CI. There was some bad news, but I don't
> think it needs to block these patches.
> 
> The good news was that I found that OpenGL testing with our iris
> driver appeared to have ok results when using this interface.
> 
> But, our Vulkan Anvil driver was not stable with the current patches
> in the Mesa MR. We will need to debug this further before using the
> interface on Vulkan.
> 
> I don't suspect that this is an issue with the kernel interface, so
> you can add:
> 
> Tested-by: Jordan Justen <jordan.l.justen@intel.com>

I had a browse through the Mesa merge request and it looks all r-b-ed to 
me. To confirm - it will get merged when we merge the i915 half?

Could you also give an a-b for the i915 patch please?

Regards,

Tvrtko
