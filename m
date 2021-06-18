Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BFA3ACB3D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 14:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1566EA01;
	Fri, 18 Jun 2021 12:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16A96EA01;
 Fri, 18 Jun 2021 12:41:09 +0000 (UTC)
IronPort-SDR: VSbJvB8IZlIwGeAKzY1jZNsz+AOJJq7hM9wub2c5zF94TX9r5DwkkxmMEDqYOKyb/Br5k3uDJf
 8jHP8T5/i3ew==
X-IronPort-AV: E=McAfee;i="6200,9189,10018"; a="228074011"
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="228074011"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 05:41:09 -0700
IronPort-SDR: LdxoiOB5mG1nuUjVsKJzLntlYwFWG898j2YBaio6t92PqnSmlQVIoP3S+x+/zT48luJ+cgbMeZ
 hA1+IoEzvnwg==
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="479811139"
Received: from jhogberg-mobl1.ger.corp.intel.com (HELO [10.249.254.60])
 ([10.249.254.60])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2021 05:41:08 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/ttm: Fix incorrect assumptions about
 ttm_bo_validate() semantics
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210618083117.158081-1-thomas.hellstrom@linux.intel.com>
 <CAM0jSHMLmWGfVQEZu9R__SGsAAjfPMSOHxgyXf8veYVxOOa8Mw@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <e489a32f-198b-2860-8d22-b88a9f51eb2c@linux.intel.com>
Date: Fri, 18 Jun 2021 14:41:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHMLmWGfVQEZu9R__SGsAAjfPMSOHxgyXf8veYVxOOa8Mw@mail.gmail.com>
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/18/21 12:53 PM, Matthew Auld wrote:
> On Fri, 18 Jun 2021 at 09:31, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> We have assumed that if the current placement was not the requested
>> placement, but instead one of the busy placements, a TTM move would have
>> been triggered. That is not the case.
>>
>> So when we initially place LMEM objects in "Limbo", (that is system
>> placement without any pages allocated), to be able to defer clearing
>> objects until first get_pages(), the first get_pages() would happily keep
>> objects in system memory if that is one of the allowed placements. And
>> since we don't yet support i915 GEM system memory from TTM, everything
>> breaks apart.
>>
>> So make sure we try the requested placement first, if no eviction is
>> needed. If that fails, retry with all allowed placements also allowing
>> evictions. Also make sure we handle TTM failure codes correctly.
>>
>> Also temporarily (until we support i915 GEM system on TTM), restrict
>> allowed placements to the requested placement to avoid things falling
>> apart should LMEM be full.
>>
>> Fixes: 38f28c0695c0 ("drm/i915/ttm: Calculate the object placement at get_pages time)
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 61 +++++++++++++++++++++++--
>>   1 file changed, 58 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index df46535cca47..4bb0440f693c 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -64,6 +64,30 @@ static struct ttm_placement i915_sys_placement = {
>>          .busy_placement = &sys_placement_flags,
>>   };
>>
>> +static int i915_ttm_err_to_gem(int err)
>> +{
>> +       /* Fastpath */
>> +       if (likely(!err))
>> +               return 0;
>> +
>> +       switch (err) {
>> +       case -EBUSY:
>> +               /*
>> +                * TTM likes to convert -EDEADLK to -EBUSY, and wants us to
>> +                * restart the operation, since we don't record the contending
>> +                * lock. We use -EAGAIN to restart.
>> +                */
>> +               return -EAGAIN;
>> +       case -ENOSPC:
>> +               /* Memory type / region is full, and we can't evict. */
>> +               return -ENXIO;
> ttm system will return -ENOMEM right?
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Hmm, Yes, I suppose so. Will that need some mangling before handing over 
to GEM?

Thanks for reviewing!

Thomas


