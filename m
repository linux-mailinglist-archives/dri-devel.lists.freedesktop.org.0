Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A58233B6925
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 21:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B1B6E52A;
	Mon, 28 Jun 2021 19:32:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06F26E529;
 Mon, 28 Jun 2021 19:32:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="187707535"
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="187707535"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 12:32:22 -0700
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="641027457"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 12:32:21 -0700
Subject: Re: [Intel-gfx] [PATCH v3 2/5] drm/i915/gem: Introduce a selftest for
 the gem object migrate functionality
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210628144626.76126-1-thomas.hellstrom@linux.intel.com>
 <20210628144626.76126-3-thomas.hellstrom@linux.intel.com>
 <1cd06e51484c44a985e4a467007d1752@intel.com>
 <dc6d8ca6ac4d63807582d2a08c75be4dc5086ced.camel@linux.intel.com>
 <661d41530ae0406b89d07286e0cb384e@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <b564e299-88ec-0378-0748-da205beb2f63@linux.intel.com>
Date: Mon, 28 Jun 2021 21:32:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <661d41530ae0406b89d07286e0cb384e@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/28/21 9:27 PM, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Sent: Monday, June 28, 2021 3:15 PM
>> To: Ruhl, Michael J <michael.j.ruhl@intel.com>; intel-
>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Auld, Matthew <matthew.auld@intel.com>
>> Subject: Re: [Intel-gfx] [PATCH v3 2/5] drm/i915/gem: Introduce a selftest for
>> the gem object migrate functionality
>>
>> On Mon, 2021-06-28 at 18:53 +0000, Ruhl, Michael J wrote:
>>>> -----Original Message-----
>>>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf
>>>> Of
>>>> Thomas Hellström
>>>> Sent: Monday, June 28, 2021 10:46 AM
>>>> To: intel-gfx@lists.freedesktop.org;
>>>> dri-devel@lists.freedesktop.org
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Auld,
>>>> Matthew
>>>> <matthew.auld@intel.com>
>>>> Subject: [Intel-gfx] [PATCH v3 2/5] drm/i915/gem: Introduce a
>>>> selftest for the
>>>> gem object migrate functionality
>>>>
>>>> From: Matthew Auld <matthew.auld@intel.com>
>>>>
>>>> A selftest for the gem object migrate functionality. Slightly
>>>> adapted
>>>> from the original by Matthew to the new interface and new fill blit
>>>> code.
>>>>
>>>> Co-developed-by: Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com>
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> ---
>>>> drivers/gpu/drm/i915/gem/i915_gem_object.c    |   1 +
>>>> .../drm/i915/gem/selftests/i915_gem_migrate.c | 237
>>>> ++++++++++++++++++
>>>> .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>>>> 3 files changed, 239 insertions(+)
>>>> create mode 100644
>>>> drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> index 1c18be067b58..ff147fd59874 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>> @@ -649,6 +649,7 @@ static const struct drm_gem_object_funcs
>>>> i915_gem_object_funcs = {
>>>> #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>>> #include "selftests/huge_gem_object.c"
>>>> #include "selftests/huge_pages.c"
>>>> +#include "selftests/i915_gem_migrate.c"
>>>> #include "selftests/i915_gem_object.c"
>>>> #include "selftests/i915_gem_coherency.c"
>>>> #endif
>>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>> new file mode 100644
>>>> index 000000000000..a437b66f64d9
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>>> @@ -0,0 +1,237 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2020-2021 Intel Corporation
>>>> + */
>>>> +
>>>> +#include "gt/intel_migrate.h"
>>>> +
>>>> +static int igt_smem_create_migrate(void *arg)
>>>> +{
>>>> +       struct intel_gt *gt = arg;
>>>> +       struct drm_i915_private *i915 = gt->i915;
>>>> +       struct drm_i915_gem_object *obj;
>>>> +       struct i915_gem_ww_ctx ww;
>>>> +       int err = 0;
>>>> +
>>>> +       /* Switch object backing-store on create */
>>>> +       obj = i915_gem_object_create_lmem(i915, PAGE_SIZE, 0);
>>>> +       if (IS_ERR(obj))
>>>> +               return PTR_ERR(obj);
>>>> +
>>>> +       for_i915_gem_ww(&ww, err, true) {
>>>> +               err = i915_gem_object_lock(obj, &ww);
>>>> +               if (err)
>>>> +                       continue;
>>>> +
>>>> +               if (!i915_gem_object_can_migrate(obj,
>>>> INTEL_REGION_SMEM)) {
>>>> +                       err = -EINVAL;
>>>> +                       continue;
>>>> +               }
>>>> +
>>>> +               err = i915_gem_object_migrate(obj, &ww,
>>>> INTEL_REGION_SMEM);
>>>> +               if (err)
>>>> +                       continue;
>>>> +
>>>> +               err = i915_gem_object_pin_pages(obj);
>>>> +               if (err)
>>>> +                       continue;
>>>> +
>>>> +               if (i915_gem_object_can_migrate(obj,
>>>> INTEL_REGION_LMEM))
>>>> +                       err = -EINVAL;
>>>> +
>>>> +               i915_gem_object_unpin_pages(obj);
>>>> +       }
>>>> +       i915_gem_object_put(obj);
>>>> +
>>>> +       return err;
>>>> +}
>>>> +
>>>> +static int igt_lmem_create_migrate(void *arg)
>>>> +{
>>>> +       struct intel_gt *gt = arg;
>>>> +       struct drm_i915_private *i915 = gt->i915;
>>>> +       struct drm_i915_gem_object *obj;
>>>> +       struct i915_gem_ww_ctx ww;
>>>> +       int err = 0;
>>>> +
>>>> +       /* Switch object backing-store on create */
>>>> +       obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
>>>> +       if (IS_ERR(obj))
>>>> +               return PTR_ERR(obj);
>>>> +
>>>> +       for_i915_gem_ww(&ww, err, true) {
>>>> +               err = i915_gem_object_lock(obj, &ww);
>>>> +               if (err)
>>>> +                       continue;
>>>> +
>>>> +               if (!i915_gem_object_can_migrate(obj,
>>>> INTEL_REGION_LMEM)) {
>>>> +                       err = -EINVAL;
>>>> +                       continue;
>>>> +               }
>>>> +
>>>> +               err = i915_gem_object_migrate(obj, &ww,
>>>> INTEL_REGION_LMEM);
>>>> +               if (err)
>>>> +                       continue;
>>>> +
>>>> +               err = i915_gem_object_pin_pages(obj);
>>>> +               if (err)
>>>> +                       continue;
>>>> +
>>>> +               if (i915_gem_object_can_migrate(obj,
>>>> INTEL_REGION_SMEM))
>>>> +                       err = -EINVAL;
>>>> +
>>>> +               i915_gem_object_unpin_pages(obj);
>>>> +       }
>>>> +       i915_gem_object_put(obj);
>>>> +
>>>> +       return err;
>>>> +}
>>>> +
>>>> +static int lmem_pages_migrate_one(struct i915_gem_ww_ctx *ww,
>>>> +                                 struct drm_i915_gem_object *obj)
>>>> +{
>>>> +       int err;
>>>> +
>>>> +       err = i915_gem_object_lock(obj, ww);
>>>> +       if (err)
>>>> +               return err;
>>>> +
>>>> +       err = i915_gem_object_wait(obj,
>>>> +                                  I915_WAIT_INTERRUPTIBLE |
>>>> +                                  I915_WAIT_PRIORITY |
>>>> +                                  I915_WAIT_ALL,
>>>> +                                  MAX_SCHEDULE_TIMEOUT);
>>>> +       if (err)
>>>> +               return err;
>>>> +
>>>> +       if (i915_gem_object_is_lmem(obj)) {
>>>> +               if (!i915_gem_object_can_migrate(obj,
>>>> INTEL_REGION_SMEM)) {
>>> I don't see any  testing of the parameter num_allowed.
>>>
>>> Is that done somewhere else?
>>>
>>> Mike
>> That's a user-space submitted parameter only, dictating what region the
>> object is allowed in when bound to the GPU. It's not exercised in this
>> selftest.
> Got it.
>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
> M

Thanks!

Thomas


>> Thanks,
>> Thomas
>>
