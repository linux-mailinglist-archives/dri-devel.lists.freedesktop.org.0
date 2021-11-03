Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9631D444A56
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 22:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD846E846;
	Wed,  3 Nov 2021 21:38:57 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17B66E846;
 Wed,  3 Nov 2021 21:38:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="231849614"
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="231849614"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 14:38:54 -0700
X-IronPort-AV: E=Sophos;i="5.87,207,1631602800"; d="scan'208";a="468253123"
Received: from knallape-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.209.89.98])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 14:38:53 -0700
From: Jordan Justen <jordan.l.justen@intel.com>
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/uapi: Add query for
 hwconfig table
In-Reply-To: <e2aff696-917c-e57d-f4ef-dafd90b669db@intel.com>
References: <20210916184012.2642295-1-John.C.Harrison@Intel.com>
 <20210916184012.2642295-3-John.C.Harrison@Intel.com>
 <877ddr51i5.fsf@jljusten-skl>
 <e2aff696-917c-e57d-f4ef-dafd90b669db@intel.com>
Date: Wed, 03 Nov 2021 14:38:52 -0700
Message-ID: <871r3w5383.fsf@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

John Harrison <john.c.harrison@intel.com> writes:

> On 11/1/2021 08:39, Jordan Justen wrote:
>> <John.C.Harrison@Intel.com> writes:
>>
>>> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>
>>> GuC contains a consolidated table with a bunch of information about the
>>> current device.
>>>
>>> Previously, this information was spread and hardcoded to all the components
>>> including GuC, i915 and various UMDs. The goal here is to consolidate
>>> the data into GuC in a way that all interested components can grab the
>>> very latest and synchronized information using a simple query.
>>>
>>> As per most of the other queries, this one can be called twice.
>>> Once with item.length=0 to determine the exact buffer size, then
>>> allocate the user memory and call it again for to retrieve the
>>> table data. For example:
>>>    struct drm_i915_query_item item = {
>>>      .query_id = DRM_I915_QUERY_HWCONCFIG_TABLE;
>>>    };
>>>    query.items_ptr = (int64_t) &item;
>>>    query.num_items = 1;
>>>
>>>    ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>>
>>>    if (item.length <= 0)
>>>      return -ENOENT;
>>>
>>>    data = malloc(item.length);
>>>    item.data_ptr = (int64_t) &data;
>>>    ioctl(fd, DRM_IOCTL_I915_QUERY, query, sizeof(query));
>>>
>>>    // Parse the data as appropriate...
>>>
>>> The returned array is a simple and flexible KLV (Key/Length/Value)
>>> formatted table. For example, it could be just:
>>>    enum device_attr {
>>>       ATTR_SOME_VALUE = 0,
>>>       ATTR_SOME_MASK  = 1,
>>>    };
>>>
>>>    static const u32 hwconfig[] = {
>>>        ATTR_SOME_VALUE,
>>>        1,             // Value Length in DWords
>>>        8,             // Value
>>>
>>>        ATTR_SOME_MASK,
>>>        3,
>>>        0x00FFFFFFFF, 0xFFFFFFFF, 0xFF000000,
>>>    };
>> Seems simple enough, so why doesn't i915 define the format of the
>> returned hwconfig blob in i915_drm.h?
> Because the definition is nothing to do with i915. This table comes from 
> the hardware spec. It is not defined by the KMD and it is not currently 
> used by the KMD. So there is no reason for the KMD to be creating 
> structures for it in the same way that the KMD does not document, 
> define, struct, etc. every other feature of the hardware that the UMDs 
> might use.

So, i915 wants to wash it's hands completely of the format? There is
obviously a difference between hardware features and a blob coming from
closed source software. (Which i915 just happens to be passing along.)
The hardware is a lot more difficult to change...

It seems like these details should be dropped from the i915 patch commit
message since i915 wants nothing to do with it.

I would think it'd be preferable for i915 to stand behind the basic blob
format as is (even if the keys/values can't be defined), and make a new
query item if the closed source software changes the format.

Of course, it'd be even better if i915 could define some keys/values as
well. (Or if a spec could be released to help document / tie down the
format.)

>>
>> struct drm_i915_hwconfig {
>> 	uint32_t key;
>> 	uint32_t length;
>> 	uint32_t values[];
>> };
>>
>> It sounds like the kernel depends on the closed source guc being loaded
>> to return this information. Is that right? Will i915 also become
>> dependent on some of this data such that it won't be able to initialize
>> without the firmware being loaded?
> At the moment, the KMD does not use the table at all. We merely provide 
> a mechanism for the UMDs to retrieve it from the hardware.
>
> In terms of future direction, that is something you need to take up with 
> the hardware architects.
>

Why do you keep saying hardware, when only software is involved?

>
>>> The attribute ids are defined in a hardware spec.
>> Which spec?
>
> Unfortunately, it is not one that is currently public. We are pushing 
> the relevant people to get it included in the public bspec / HRM. It is 
> a slow process :(.
>

Right. I take it no progress has been made in the 1.5 months since you
posted this, so it'll probably finally be documented 6~12 months after
hardware is available? :)

-Jordan
