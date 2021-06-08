Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7864339F06C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5D36EB1A;
	Tue,  8 Jun 2021 08:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074D66EB1A;
 Tue,  8 Jun 2021 08:08:35 +0000 (UTC)
IronPort-SDR: qvNzR9zzPnGtBiSwn64ssfKx+qqpOhVU2vIJ/xjt1Ordrp1ztRHipWJ+kbX376CoVRuvJN7ewk
 sH4uaD6lxsqQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204610721"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="204610721"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:08:34 -0700
IronPort-SDR: 3Mtm9x3YDeZpZOczo72pCSGz6I4Ib/FM6r5jvla9nmqXv64b87sY9cECG/jGUfiFGN1bS+xszr
 fXeWvg5TyMvQ==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="485125341"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO [10.215.170.251])
 ([10.215.170.251])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 01:08:32 -0700
Subject: Re: [PATCH 4/6] drm/i915/ttm: pass along the I915_BO_ALLOC_CONTIGUOUS
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210607182210.99036-1-matthew.auld@intel.com>
 <20210607182210.99036-5-matthew.auld@intel.com>
 <044baf68ef8e6fe11941fdb43a9ad404f46c6d3a.camel@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <55432d48-fd10-4deb-5cb9-8c3d03089cef@intel.com>
Date: Tue, 8 Jun 2021 09:08:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <044baf68ef8e6fe11941fdb43a9ad404f46c6d3a.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2021 08:26, Thomas Hellström wrote:
> Hi,
> 
> On Mon, 2021-06-07 at 19:22 +0100, Matthew Auld wrote:
>> Currently we just ignore the I915_BO_ALLOC_CONTIGUOUS flag, which is
>> fine since everything is already contiguous with the ttm range
>> manager.
>> However in the next patch we want to switch over to the ttm buddy
>> manager, where allocations are by default not contiguous.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 73d52df8f2be..0b0fce445e9b 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -86,10 +86,18 @@ i915_ttm_select_tt_caching(const struct
>> drm_i915_gem_object *obj)
>>   
>>   static void
>>   i915_ttm_place_from_region(const struct intel_memory_region *mr,
>> -                          struct ttm_place *place)
>> +                          struct ttm_place *place,
>> +                          unsigned int flags)
>>   {
>>          memset(place, 0, sizeof(*place));
>>          place->mem_type = intel_region_to_ttm_type(mr);
>> +
>> +       switch(mr->type) {
>> +       case INTEL_MEMORY_LOCAL:
>> +               if (flags & I915_BO_ALLOC_CONTIGUOUS)
>> +                       place->flags = TTM_PL_FLAG_CONTIGUOUS;
>> +               break;
>> +       }
> 
> Do we need to restrict this to INTEL_MEMORY_LOCAL? While it doesn't
> currently make much sense for other memory regions, no point in not
> forwarding for all?

Yeah, don't see why not.

> 
> /Thomas
> 
> 
