Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8309AFF27
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 11:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9EB10EA67;
	Fri, 25 Oct 2024 09:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqGnQgZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A5710EA5F;
 Fri, 25 Oct 2024 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729850283; x=1761386283;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zpKRQ3vGohJhUHbr/KzlU5mjq19zC6KvGARyh2o6agI=;
 b=OqGnQgZClzVcyPZmYJlOHbtgHUHS+6NKIvIo6AydDonEqadsS11wNuKZ
 ItiM2GB4e5X3Nr7k4rKULFXjgxP6hXam3y8HvmtUqmalnILLTUlMXdPYR
 UEruN84hRr3DDMNS3Em8B34oQSI6fGXKyNGGOlHXXI0nZbniYEq9ngFyh
 DlECaI9vUbcI+ZZSebqvKCfcb4fX1GGlv7a4EDFmmTVLTeWtyg0jmFSgn
 /2Avpr0uCBi2H5Av+pkEpc7M45qfxOlIDAIsrmwwhxQyJFKJzM7+jP7Wa
 KJ4XNn9ns3tQDuxUIY3w/o4+Mdw8ialYw6jTFKfCHLRqxZ0VjedApa+Xt A==;
X-CSE-ConnectionGUID: A3vwFCWoSQW1Lb6wTIwMPA==
X-CSE-MsgGUID: YVoqc1ehTDiFLEWv1gwtBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54917399"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="54917399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:58:02 -0700
X-CSE-ConnectionGUID: 5/UyuiKmTBmV1H1/5icJVQ==
X-CSE-MsgGUID: Qlq7vZLvRImf8/1iE8TIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="85663344"
Received: from zzombora-mobl1.ti.intel.com (HELO localhost) ([10.245.246.193])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:57:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Patrik Jakobsson
 <patrik.r.jakobsson@gmail.com>, Rob Clark <robdclark@gmail.com>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm: Move plane->{fb,old_fb,crtc} to legacy
 sub-structure
In-Reply-To: <Zv58AalhFaMgh7c5@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-2-ville.syrjala@linux.intel.com>
 <Zv58AalhFaMgh7c5@intel.com>
Date: Fri, 25 Oct 2024 12:57:50 +0300
Message-ID: <875xpgqzc1.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Oct 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, Oct 02, 2024 at 09:21:59PM +0300, Ville Syrjala wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>=20
>> Hide the plane->fb/etc. footguns better by stashing them inside
>> a "legacy" sub struct.
>>=20
>> Eventually maybe we could turn 'legacy' into a pointer
>> that only exists on legacy drivers to completely prevent
>> any abuse by atomic drivers...
>
> Hmm. I should probably make it a pointer from the start,
> to avoid having to go through the same churn yet again.

[snip]

>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index dd718c62ac31..a2d91ee4b40c 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -663,31 +663,33 @@ struct drm_plane {
>>  	/** @modifier_count: Size of the array pointed at by @modifier_count. =
*/
>>  	unsigned int modifier_count;
>>=20=20
>> -	/**
>> -	 * @crtc:
>> -	 *
>> -	 * Currently bound CRTC, only meaningful for non-atomic drivers. For
>> -	 * atomic drivers this is forced to be NULL, atomic drivers should
>> -	 * instead check &drm_plane_state.crtc.
>> -	 */
>> -	struct drm_crtc *crtc;
>> -
>> -	/**
>> -	 * @fb:
>> -	 *
>> -	 * Currently bound framebuffer, only meaningful for non-atomic drivers.
>> -	 * For atomic drivers this is forced to be NULL, atomic drivers should
>> -	 * instead check &drm_plane_state.fb.
>> -	 */
>> -	struct drm_framebuffer *fb;
>> -
>> -	/**
>> -	 * @old_fb:
>> -	 *
>> -	 * Temporary tracking of the old fb while a modeset is ongoing. Only
>> -	 * used by non-atomic drivers, forced to be NULL for atomic drivers.
>> -	 */
>> -	struct drm_framebuffer *old_fb;
>> +	struct {

Do you mean something along the lines of:

	struct __plane_legacy_or_something {

>> +		/**
>> +		 * @crtc:
>> +		 *
>> +		 * Currently bound CRTC, only meaningful for non-atomic drivers. For
>> +		 * atomic drivers this is forced to be NULL, atomic drivers should
>> +		 * instead check &drm_plane_state.crtc.
>> +		 */
>> +		struct drm_crtc *crtc;
>> +
>> +		/**
>> +		 * @fb:
>> +		 *
>> +		 * Currently bound framebuffer, only meaningful for non-atomic driver=
s.
>> +		 * For atomic drivers this is forced to be NULL, atomic drivers should
>> +		 * instead check &drm_plane_state.fb.
>> +		 */
>> +		struct drm_framebuffer *fb;
>> +
>> +		/**
>> +		 * @old_fb:
>> +		 *
>> +		 * Temporary tracking of the old fb while a modeset is ongoing. Only
>> +		 * used by non-atomic drivers, forced to be NULL for atomic drivers.
>> +		 */
>> +		struct drm_framebuffer *old_fb;
>> +	} legacy;

and

	} __legacy;

	struct __plane_legacy_or_something *legacy;

and initially unconditionally:

       	p->legacy =3D &p->__legacy;

but later, once atomic drivers have been fixed:

	if (!drm_core_check_feature(dev, DRIVER_COMPUTE_ATOMIC))
		p->legacy =3D &p->__legacy;

It would make the last update really simple.

BR,
Jani.


>>=20=20
>>  	/** @funcs: plane control functions */
>>  	const struct drm_plane_funcs *funcs;
>> --=20
>> 2.45.2

--=20
Jani Nikula, Intel
