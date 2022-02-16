Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE04B85D3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 11:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D976B10E779;
	Wed, 16 Feb 2022 10:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FC610E764;
 Wed, 16 Feb 2022 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645007620; x=1676543620;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0EU2xKs5/be5ABCYsSQiiugsjJ0zBzNPzGsy9hvHN5k=;
 b=Cc8Z5UN55VUUq7oE82M5IqRwvArKd1jEfOkglIIv2uXr6NAnf6+Kt+8D
 q+GRBnKmeh7Cot8f7J7jfMc5DOmSk9mJxxGYdGTT2Zca/PaTbKEbzNPYZ
 +o6v0lN+Jusfjvbo4cI5hyBYJie3n2ij1V4NvLOzRjUS/KrbV8bkKtTpA
 Xw+pQl7YWzx+ZhkNIml78cOM7RLgb1wkl9bDSlZ0BYDqbv2PMqVUb7mFr
 Hi+k8gQGOGkOcxMvm9lXr8Bem7hlp4WPnALnq0HLrTjP6P6Sc4BUoO2n0
 bUb7rZ8wBuwzPvyv70vPpVQ86q+UjDeQXSd+aX1Ak4Wux6ZNzz7obVtpg Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="234115085"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="234115085"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 02:33:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="502968616"
Received: from rbilei-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.13.113])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 02:33:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Ville =?utf-8?B?U3ly?=
 =?utf-8?B?asOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: fix unsigned integer to signed assignment
In-Reply-To: <9a7b0e48-b00f-be11-7fc7-bc26719cbc1e@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220216083849.91239-1-jiapeng.chong@linux.alibaba.com>
 <87h78z5gmp.fsf@intel.com> <YgzBpX2SKCh4cb19@intel.com>
 <9a7b0e48-b00f-be11-7fc7-bc26719cbc1e@linux.intel.com>
Date: Wed, 16 Feb 2022 12:33:30 +0200
Message-ID: <87leyb3xtx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 rodrigo.vivi@intel.com, christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Feb 2022, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 16/02/2022 09:19, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Wed, Feb 16, 2022 at 11:02:06AM +0200, Jani Nikula wrote:
>>> On Wed, 16 Feb 2022, Jiapeng Chong <jiapeng.chong@linux.alibaba.com> wr=
ote:
>>>> Eliminate the follow smatch warning:
>>>>
>>>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4640
>>>> guc_create_virtual() warn: assigning (-2) to unsigned variable
>>>> 've->base.instance'.
>>>>
>>>> drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4641
>>>> guc_create_virtual() warn: assigning (-2) to unsigned variable
>>>> 've->base.uabi_instance'.
>>>>
>>>> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
>>>> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
>>>
>>> The report seems to be valid, but I don't think this is the fix.
>>>
>>> Where do we even check for invalid instance/uabi_instance in code?
>>=20
>> The whole thing seems rather poorly documented as there's a matching
>> uabi struct with __u16's and the negative values are defined right
>> there in the uapi header as well.
>
> Negative ones are exception values to be used in conjunction with the vir=
tual engine uapi (see "DOC: Virtual Engine uAPI" and also comment next to I=
915_CONTEXT_PARAM_ENGINES).
>
> AFAIK assigning negative int to unsigned int is defined and fine.
>
> Compiler does warn on comparisons which is why we have:
>
> ./gem/i915_gem_busy.c:  if (id =3D=3D (u16)I915_ENGINE_CLASS_INVALID)
> ./gem/i915_gem_busy.c:  if (id =3D=3D (u16)I915_ENGINE_CLASS_INVALID)
> ./gem/i915_gem_context.c:               if (ci.engine_class =3D=3D (u16)I=
915_ENGINE_CLASS_INVALID &&
> ./gem/i915_gem_context.c:                   ci.engine_instance =3D=3D (u1=
6)I915_ENGINE_CLASS_INVALID_NONE)
>
> So I think no action needed here.

We never check instance or uabi_instance members against
I915_ENGINE_CLASS_INVALID_VIRTUAL anywhere.

BR,
Jani.

>
> Regards,
>
> Tvrtko
>=20=20=20
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>>> ---
>>>>   drivers/gpu/drm/i915/gt/intel_engine_types.h | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gp=
u/drm/i915/gt/intel_engine_types.h
>>>> index 36365bdbe1ee..dc7cc06c68e7 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>>>> @@ -328,10 +328,10 @@ struct intel_engine_cs {
>>>>   	intel_engine_mask_t logical_mask;
>>>>=20=20=20
>>>>   	u8 class;
>>>> -	u8 instance;
>>>> +	s8 instance;
>>>>=20=20=20
>>>>   	u16 uabi_class;
>>>> -	u16 uabi_instance;
>>>> +	s16 uabi_instance;
>>>>=20=20=20
>>>>   	u32 uabi_capabilities;
>>>>   	u32 context_size;
>>>
>>> --=20
>>> Jani Nikula, Intel Open Source Graphics Center
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
