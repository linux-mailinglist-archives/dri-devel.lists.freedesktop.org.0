Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5B49F129
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 03:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D8010EEC1;
	Fri, 28 Jan 2022 02:41:22 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6226710EEBC;
 Fri, 28 Jan 2022 02:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643337680; x=1674873680;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Hr7XO8EAhlBCJ7u67fqV65Z0wDsSRY89hPG+4SI18hg=;
 b=AdWIFFq2fhNq29ufiI9eItZu9WO7x8m8GJqZllhFfoKvIFPHceuzs2dM
 U6l+tdoLvOnREIXBYP6Z2AX6hupffbobGJ6ROMLRL3wulX4oicG2pD/o5
 8Ij4NSTyC/mqdHyQljzghDx/tuZRW3HgICWwP4K/+oeGsF/afFXDjchFg
 gRg3ZK6XKa98bpirCEx+M6tj3U625mKp70LXz+zshy2I+hswtDq70SlN4
 j7MWVKU9voLIrRRKeoRju2H6HHU6Y7sb1U4PXRTyu0sMo045r5Qngt1rG
 7GXIlgL5Grmzodx97ls+4kI0ZXxnvVzarJOquMdd1u+3+Vwe1M6sOg9vg A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="244627629"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="244627629"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 18:41:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; d="scan'208";a="521504537"
Received: from sswallic-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.251.15.132])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2022 18:41:19 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/uapi: Add query for
 hwconfig table
In-Reply-To: <d01902bb-354d-828d-8ba6-a03c1664a5e9@intel.com>
References: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
 <20220119203541.2410082-3-John.C.Harrison@Intel.com>
 <87k0eksn0w.fsf@jljusten-skl>
 <d01902bb-354d-828d-8ba6-a03c1664a5e9@intel.com>
Date: Thu, 27 Jan 2022 18:41:19 -0800
Message-ID: <87h79oshtc.fsf@jljusten-skl>
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
Cc: Kenneth Graunke <kenneth.w.graunke@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

John Harrison <john.c.harrison@intel.com> writes:

> On 1/27/2022 16:48, Jordan Justen wrote:
>> John.C.Harrison@Intel.com writes:
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
>> This "consolidate" goal is not what I was told for the purpose of this.
>> I don't think these paragraphs are the true.
> The intention is to remove multiple hardcoded tables spread across a 
> bunch of different drivers and replace them with a single table 
> retrieved from the hardware itself. That sounds like consolidation to me.

That is not what I was told. That is apparently what someone is trying
to sell here.

Mesa would prefer to "hardcode" info rather than depend on the closed
source guc software.

>>
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
>> You said on 03 Nov 2021 that you would remove the parts of this commit
>> message that document the format. Why? Because i915 will not make any
>> guarantees as to the format of what is returned. Thus, i915 should not
>> comment on the format.
> And you replied that you would prefer to keep it.

No, I did not.

You said, "Sure. Can remove comments." to which, I replied, "Obviously
not what should be done, but apparently all i915 is willing to do."

So, i915 should document and stand behind this blob's format. But, if
they are not willing to, they shouldn't half-heartedly put some text in
a commit message.

>>
>> Can you Cc me on future postings of this patch?
>>
>>> The attribute ids are defined in a hardware spec.
>> As this spec is not published, it's hard to verify or refute this claim.
>>
>> Think this is a more accurate commit message for this patch:
>>
>>      In this interface i915 is returning a currently undocumented blob of
>>      data which it receives from the closed source guc software. The
>>      format of this blob *might* be defined in a hardware spec in the
>>      future.
>>
>> I'm sure you will prefer to replace "might" with "is planned to". I
>> think "might" is more accurate, but I suppose the other would be
>> acceptable.
>>
>> -Jordan
> Getting brand new spec documents published is not a fast process.

Heh.

Have you learned anything new about the status of it in the past 3
months?

> That doesn't mean it isn't going to happen.

It also doesn't mean it is going to happen either. Maybe you want to add
some text wherein Intel guarantees that it will be released in a spec by
some date?

> Also, just because a document is currently confidential and private
> doesn't mean that it doesn't exist.

Should we add "This is documented in a private spec, so it really does
exist!"?

-Jordan
