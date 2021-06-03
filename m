Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C9539A322
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 16:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFCE6F488;
	Thu,  3 Jun 2021 14:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AC56F488;
 Thu,  3 Jun 2021 14:27:43 +0000 (UTC)
IronPort-SDR: b1/osmsYoeG4a04NWF3jBsWEXaGvqGz/8zM7U1yQWx0NbICPN9iALPeYGvmtCA+YT3Ix7236E3
 QD3lPaTp8L8w==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="184430036"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="184430036"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 07:27:42 -0700
IronPort-SDR: YxgxSwY3anv8UkL3PdgrwSLdfzIXCV0Ek8HGMtGLFpW18bsSv8kZznadoLCEqXJ2RpKXdCEX64
 K2olv/D+rqfA==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="417398092"
Received: from vkubarev-mobl1.ccr.corp.intel.com (HELO [10.249.254.167])
 ([10.249.254.167])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 07:27:39 -0700
Subject: Re: [Intel-gfx] [PATCH 4/5] drm/i915/ttm: Use TTM for system memory
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210602170716.280491-1-thomas.hellstrom@linux.intel.com>
 <20210602170716.280491-5-thomas.hellstrom@linux.intel.com>
 <CAM0jSHPfNhw3e9y4eD5X+Bk-i1nkZqb1Tw194mhOFNGbHZD8xw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <da197ad6-f408-004b-dd7b-9348ca602f0d@linux.intel.com>
Date: Thu, 3 Jun 2021 16:27:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHPfNhw3e9y4eD5X+Bk-i1nkZqb1Tw194mhOFNGbHZD8xw@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/3/21 11:48 AM, Matthew Auld wrote:
> On Wed, 2 Jun 2021 at 18:08, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> For discrete, use TTM for both cached and WC system memory. That means
>> we currently rely on the TTM memory accounting / shrinker. For cached
>> system memory we should consider remaining shmem-backed, which can be
>> implemented from our ttm_tt_populate calback. We can then also reuse our
>> own very elaborate shrinker for that memory.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 22 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_drv.h            |  3 ---
>>   drivers/gpu/drm/i915/intel_memory_region.c |  7 ++++++-
>>   drivers/gpu/drm/i915/intel_memory_region.h |  8 ++++++++
>>   4 files changed, 36 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 8e1c01168c6d..42e89bf43708 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -755,3 +755,25 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>>          /* i915 wants -ENXIO when out of memory region space. */
>>          return (ret == -ENOSPC) ? -ENXIO : ret;
>>   }
>> +
>> +static const struct intel_memory_region_ops ttm_system_region_ops = {
>> +       .init_object = __i915_gem_ttm_object_init,
>> +};
>> +
>> +struct intel_memory_region *
>> +i915_gem_ttm_system_setup(struct drm_i915_private *i915,
>> +                         u16 type, u16 instance)
>> +{
>> +       struct intel_memory_region *mr;
>> +
>> +       mr = intel_memory_region_create(i915, 0,
>> +                                       totalram_pages() << PAGE_SHIFT,
>> +                                       PAGE_SIZE, 0,
>> +                                       type, instance,
>> +                                       &ttm_system_region_ops);
>> +       if (IS_ERR_OR_NULL(mr))
> region_create can't return NULL.
OK, will fix.

