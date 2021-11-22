Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A734458F75
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 14:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79E36E192;
	Mon, 22 Nov 2021 13:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109998959D;
 Mon, 22 Nov 2021 13:34:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234607855"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="234607855"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 05:34:14 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="508563365"
Received: from aalazizi-mobl1.amr.corp.intel.com (HELO [10.213.249.159])
 ([10.213.249.159])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 05:34:10 -0800
Message-ID: <b5063e9f-5f25-e420-4b54-d88152830ef3@linux.intel.com>
Date: Mon, 22 Nov 2021 13:34:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] drm/i915/dmabuf: fix broken build
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "matthew.william.auld@gmail.com" <matthew.william.auld@gmail.com>
References: <20211021125332.2455288-1-matthew.auld@intel.com>
 <CAM0jSHNig=n9cw0CCNhWHnLn5hLPYFFQR4D9OgZ-QavgyJGJpg@mail.gmail.com>
 <87k0hyj13f.fsf@intel.com>
 <CAM0jSHOCn120_-WZCJHa2+NzPrB_pErHPT3hA2BGarM-ZDw-Cg@mail.gmail.com>
 <87cznqiyzg.fsf@intel.com>
 <CAM0jSHN4oYq=DRnpKiMXjVKUFQ5kttobWpuJLEi6eFzMwjP5-g@mail.gmail.com>
 <3c77071b97add2ae18db01e02914f53654faf795.camel@intel.com>
 <82fb9cbc-915d-11d9-849f-f49e23edd29c@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <82fb9cbc-915d-11d9-849f-f49e23edd29c@intel.com>
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 lkp <lkp@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/10/2021 09:48, Matthew Auld wrote:
> On 28/10/2021 02:43, Vivi, Rodrigo wrote:
>> On Wed, 2021-10-27 at 10:48 +0100, Matthew Auld wrote:
>>> On Wed, 27 Oct 2021 at 10:44, Jani Nikula
>>> <jani.nikula@linux.intel.com> wrote:
>>>>
>>>> On Wed, 27 Oct 2021, Matthew Auld <matthew.william.auld@gmail.com>
>>>> wrote:
>>>>> On Wed, 27 Oct 2021 at 09:58, Jani Nikula
>>>>> <jani.nikula@linux.intel.com> wrote:
>>>>>>
>>>>>> On Wed, 27 Oct 2021, Matthew Auld
>>>>>> <matthew.william.auld@gmail.com> wrote:
>>>>>>> On Thu, 21 Oct 2021 at 13:54, Matthew Auld
>>>>>>> <matthew.auld@intel.com> wrote:
>>>>>>>>
>>>>>>>> wbinvd_on_all_cpus() is only defined on x86 it seems, plus
>>>>>>>> we need to
>>>>>>>> include asm/smp.h here.
>>>>>>>>
>>>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>>>
>>>>>>> Jani, would it make sense to cherry-pick this to -fixes? The
>>>>>>> offending
>>>>>>> commit is in drm-next, and there have been a few reports
>>>>>>> around this.
>>>>>>>
>>>>>>> Fixes: a035154da45d ("drm/i915/dmabuf: add paranoid flush-on-
>>>>>>> acquire")
>>>>>>
>>>>>> If the Fixes: tag is in place, our tooling will cherry-pick it
>>>>>> where it
>>>>>> belongs. (In this case, drm-intel-next-fixes, not drm-intel-
>>>>>> fixes.)
>>>>>
>>>>> Yeah, I forgot to add the fixes tag here unfortunately.
>>>>
>>>> Already merged? What's the commit id to be cherry-picked? Rodrigo
>>>> can do
>>>> it manually.
>>>
>>> Yeah, it was merged to gt-next:
>>>
>>> 777226dac058 ("drm/i915/dmabuf: fix broken build")
>>
>> picked up to drm-intel-next-fixes
> 
> Thanks.

Hmm it looks like we have this in -fixes (and in -gt) while Linus has 
explicitly thrown it out (see 
https://lists.freedesktop.org/archives/dri-devel/2021-November/330928.html). 


End result is that now we have a different Kernel Test Robot warning 
("asm/smp.h is included more than once.").

So we need to fish out "drm/i915/dmabuf: fix broken build" out from 
fixes with a revert or what?

Regards,

Tvrtko

> 
>>
>> thanks,
>> Rodrigo.
>>
>>>
>>>>
>>>> Note to self, we should set up some way to check which maintainer
>>>> is
>>>> responsible for which branches and when.
>>>>
>>>> BR,
>>>> Jani.
>>>>
>>>>>
>>>>>>
>>>>>> Cc: Rodrigo who covers drm-intel-next-fixes atm.
>>>>>>
>>>>>> BR,
>>>>>> Jani.
>>>>>>
>>>>>>
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 7 +++++++
>>>>>>>>   1 file changed, 7 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>>>>>> index 1adcd8e02d29..a45d0ec2c5b6 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>>>>>> @@ -12,6 +12,13 @@
>>>>>>>>   #include "i915_gem_object.h"
>>>>>>>>   #include "i915_scatterlist.h"
>>>>>>>>
>>>>>>>> +#if defined(CONFIG_X86)
>>>>>>>> +#include <asm/smp.h>
>>>>>>>> +#else
>>>>>>>> +#define wbinvd_on_all_cpus() \
>>>>>>>> +       pr_warn(DRIVER_NAME ": Missing cache flush in
>>>>>>>> %s\n", __func__)
>>>>>>>> +#endif
>>>>>>>> +
>>>>>>>>   I915_SELFTEST_DECLARE(static bool
>>>>>>>> force_different_devices;)
>>>>>>>>
>>>>>>>>   static struct drm_i915_gem_object *dma_buf_to_obj(struct
>>>>>>>> dma_buf *buf)
>>>>>>>> -- 
>>>>>>>> 2.26.3
>>>>>>>>
>>>>>>
>>>>>> -- 
>>>>>> Jani Nikula, Intel Open Source Graphics Center
>>>>
>>>> -- 
>>>> Jani Nikula, Intel Open Source Graphics Center
>>
