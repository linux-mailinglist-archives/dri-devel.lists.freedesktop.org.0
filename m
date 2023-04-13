Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FAC6E0771
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 09:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B867D10EA40;
	Thu, 13 Apr 2023 07:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45D10EA3B;
 Thu, 13 Apr 2023 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681370116; x=1712906116;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=jypqQHoHc1mLtlBqinklOeRtPPtMmrLDMLbma0WWA0Q=;
 b=a8Rn7/EjHo+jKcNs5F5UyspD3qKi24o4+RpzlR6ZRqYNAJrI5tvDa8Vs
 bLsqAcLZmxgoH/a8gLag8RMOQvtgmyvy5AVKI3dItgn8fM9mQ18PfKkdm
 Syqr74jNgRDIJWCGcxQwOT8IEF9lSAbgIGZ97YY+Oo+jkG9oDkzwfu3BD
 wyiOL6tpcUfnW1ixHlzBIT9dXESf/e1y6S2MJJ/NdI02EDKBdRc38ZGn0
 7mx1X03Caf8HHr/mIIgqy14pRQx6pyNLz20jbhLR6LpidgEKGFUzJK9P0
 YOhwauW93qHDcf3GtIkBoHZjh3wJv+/vjNLLKp4vmUcRIJJBwxQb8aEUZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332813206"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="332813206"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 00:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="666698005"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="666698005"
Received: from svadali-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.55.23])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 00:15:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Cong Liu <liucong2@kylinos.cn>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Matthew
 Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Gwan-gyeong Mun
 <gwan-gyeong.mun@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix memory leaks in i915 selftests
In-Reply-To: <71ba4962-14fd-887f-1d40-31089dd1cf50@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230413031349.9026-1-liucong2@kylinos.cn>
 <71ba4962-14fd-887f-1d40-31089dd1cf50@intel.com>
Date: Thu, 13 Apr 2023 10:15:07 +0300
Message-ID: <874jpkckxw.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Apr 2023, Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> On 13.04.2023 05:13, Cong Liu wrote:

A commit message is still needed.

>> Fixes: c3bfba9a2225 ("drm/i915: Check for integer truncation on scatterlist creation")
>>

No blank line here.

BR,
Jani.

>> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
>> ---
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>
> Regards
> Andrzej
>>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> index 5361ce70d3f2..154801f1c468 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> @@ -69,8 +69,10 @@ static int fake_get_pages(struct drm_i915_gem_object *obj)
>>   
>>   	rem = round_up(obj->base.size, BIT(31)) >> 31;
>>   	/* restricted by sg_alloc_table */
>> -	if (overflows_type(rem, unsigned int))
>> +	if (overflows_type(rem, unsigned int)) {
>> +		kfree(pages);
>>   		return -E2BIG;
>> +	}
>>   
>>   	if (sg_alloc_table(pages, rem, GFP)) {
>>   		kfree(pages);
>

-- 
Jani Nikula, Intel Open Source Graphics Center
