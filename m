Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD5371238B
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 11:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA8D10E1BF;
	Fri, 26 May 2023 09:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E0E10E1BD;
 Fri, 26 May 2023 09:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685093244; x=1716629244;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jHcCh+fBmY6y1fe/LaQpp+BF1fauVowgXBtCO+UU9y4=;
 b=mVagUdiZw+R8T5ggr3BWtyg9wAiMMm16SCstgRH0OeOGdvhBrQailii/
 X9FUZvgWBR9QkMIWk8uTQBh93gB8MxWTpYPHmC+xDaT8qaMNNBJhiOPHq
 saPPVQgH+IFmY8BfDAEXRCRCdVIsone4Kd+k1EWHJVRkO/QPxQ8UjAlO+
 jfShiR8AQbj/8Gw4OIzIRw+cBTlSyjEczasQre3o3llIkrQl/gVC5+gS5
 UbgiGAi8EmkX3Lj4vubjvKfa/PmDjojhqz4ZT30MJIY3plWVfhQ21Z7DU
 K3fvDHBY0mCR++DTC3A0s/wWQfAd6RnTh6LeT7vhqkt9fCOYYMh4rsAH5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="440516523"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="440516523"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 02:27:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="817469267"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; d="scan'208";a="817469267"
Received: from rdota-mobl.ger.corp.intel.com (HELO localhost) ([10.252.44.87])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:27:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tom Rix <trix@redhat.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, lucas.demarchi@intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915: simplify switch to if-elseif
In-Reply-To: <874jo3kwl6.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230523125116.1669057-1-trix@redhat.com>
 <874jo3kwl6.fsf@intel.com>
Date: Fri, 26 May 2023 12:27:16 +0300
Message-ID: <87y1lbigsr.fsf@intel.com>
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
Cc: Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 23 May 2023, Tom Rix <trix@redhat.com> wrote:
>> clang with W=1 reports
>> drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unannotated
>>   fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>>                 case I915_FORMAT_MOD_X_TILED:
>>                 ^
>>
>> Only one case and the default does anything in this switch, so it should
>> be changed to an if-elseif.
>
> Thanks for the patch.
>
> If I wanted to fix this quickly, I'd just add the break in there.

I've just applied [1] doing this.

I'm still open to the cleanup suggested below, if you're up for it.


BR,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org

>
> If I wanted to fix this properly, I'd add a function
> modifier_supports_async_flips() or something, and replace the switch
> with:
>
> 	if (!modifier_supports_async_flips(i915, new_plane_state->hw.fb->modifier)) {
> 		drm_dbg_kms(&i915->drm, "[PLANE:%d:%s] Modifier does not support async flips\n",
> 			plane->base.base.id, plane->base.name);
> 		return -EINVAL;
> 	}
>
> But I wouldn't just replace the switch with if-elseif. It doesn't help
> with the overall feeling that intel_async_flip_check_hw() is too long.
>
> BR,
> Jani.
>
>
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 14 +++++---------
>>  1 file changed, 5 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index 0490c6412ab5..1f852e49fc20 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -5994,8 +5994,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>>  		 * Need to verify this for all gen9 platforms to enable
>>  		 * this selectively if required.
>>  		 */
>> -		switch (new_plane_state->hw.fb->modifier) {
>> -		case DRM_FORMAT_MOD_LINEAR:
>> +		if (new_plane_state->hw.fb->modifier == DRM_FORMAT_MOD_LINEAR) {
>>  			/*
>>  			 * FIXME: Async on Linear buffer is supported on ICL as
>>  			 * but with additional alignment and fbc restrictions
>> @@ -6008,13 +6007,10 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>>  					    plane->base.base.id, plane->base.name);
>>  				return -EINVAL;
>>  			}
>> -
>> -		case I915_FORMAT_MOD_X_TILED:
>> -		case I915_FORMAT_MOD_Y_TILED:
>> -		case I915_FORMAT_MOD_Yf_TILED:
>> -		case I915_FORMAT_MOD_4_TILED:
>> -			break;
>> -		default:
>> +		} else if (!(new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_X_TILED ||
>> +			     new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_Y_TILED ||
>> +			     new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
>> +			     new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_4_TILED)) {
>>  			drm_dbg_kms(&i915->drm,
>>  				    "[PLANE:%d:%s] Modifier does not support async flips\n",
>>  				    plane->base.base.id, plane->base.name);

-- 
Jani Nikula, Intel Open Source Graphics Center
