Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5675325A3
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 10:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C31D10EA28;
	Tue, 24 May 2022 08:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122F610EA28;
 Tue, 24 May 2022 08:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653382303; x=1684918303;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wmmyF71CwWYG/EOmCKqiLr6B29J0gdV+VJlQm176Dto=;
 b=CPoS0cDsWM+0sLPf5xBeKoi7LJ+6PaXreg5ka8UZuWj6Gb3xiiN87UaF
 cUQfC+R/MaLsKhUQ5z6qJEogX7iqmbF3ghP+IwAJJAAistb1rC36O7kRI
 7F1ngmRr2RxzT2+knAVMFSSp86XSZ47GGzxXO124tIfb7JjZ5QojY9ZkU
 ajBkRs3w1j2xsZ98Yd/l0ktsYxFnFffLb9D8jvGaklw/zwqZPKMiasky7
 agJJzo3pipkarUfHG4lV4uVEp8r5IeIC6Y41h2AwWw+hxIl3JLfc8iw0+
 BNqL2iP/7459V6A4MlSUZz/uFb5mDnmnNs0TkAvEfPvwkN9z5gghIlDgX w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="261080022"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="261080022"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 01:51:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="676269836"
Received: from cennis-mobl.ger.corp.intel.com (HELO [10.213.213.170])
 ([10.213.213.170])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 01:51:40 -0700
Message-ID: <1870635b-c8d0-c7e4-1e0f-78207a60cfaf@linux.intel.com>
Date: Tue, 24 May 2022 09:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/6] drm/i915/xehp: Drop GETPARAM lookups of
 I915_PARAM_[SUB]SLICE_MASK
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20220517032005.2694737-1-matthew.d.roper@intel.com>
 <20220517032005.2694737-3-matthew.d.roper@intel.com>
 <4123b22d-5018-bb08-4ae0-99140225dc1a@linux.intel.com>
 <Yof9PwfBVpWnMqIn@mdroper-desk1.amr.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Yof9PwfBVpWnMqIn@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Jordan Justen <jordan.l.justen@intel.com>, intel-gfx@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/05/2022 21:42, Matt Roper wrote:
> On Fri, May 20, 2022 at 10:15:32AM +0100, Tvrtko Ursulin wrote:
>>
>> On 17/05/2022 04:20, Matt Roper wrote:
>>> Slice/subslice/EU information should be obtained via the topology
>>> queries provided by the I915_QUERY interface; let's turn off support for
>>> the old GETPARAM lookups on Xe_HP and beyond where we can't return
>>> meaningful values.
>>>
>>> The slice mask lookup is meaningless since Xe_HP doesn't support
>>> traditional slices (and we make no attempt to return the various new
>>> units like gslices, cslices, mslices, etc.) here.
>>>
>>> The subslice mask lookup is even more problematic; given the distinct
>>> masks for geometry vs compute purposes, the combined mask returned here
>>> is likely not what userspace would want to act upon anyway.  The value
>>> is also limited to 32-bits by the nature of the GETPARAM ioctl which is
>>> sufficient for the initial Xe_HP platforms, but is unable to convey the
>>> larger masks that will be needed on other upcoming platforms.  Finally,
>>> the value returned here becomes even less meaningful when used on
>>> multi-tile platforms where each tile will have its own masks.
>>>
>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_getparam.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
>>> index c12a0adefda5..ac9767c56619 100644
>>> --- a/drivers/gpu/drm/i915/i915_getparam.c
>>> +++ b/drivers/gpu/drm/i915/i915_getparam.c
>>> @@ -148,11 +148,19 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>>>    		value = intel_engines_has_context_isolation(i915);
>>>    		break;
>>>    	case I915_PARAM_SLICE_MASK:
>>> +		/* Not supported from Xe_HP onward; use topology queries */
>>> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>>> +			return -EINVAL;
>>> +
>>>    		value = sseu->slice_mask;
>>>    		if (!value)
>>>    			return -ENODEV;
>>>    		break;
>>>    	case I915_PARAM_SUBSLICE_MASK:
>>> +		/* Not supported from Xe_HP onward; use topology queries */
>>> +		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
>>> +			return -EINVAL;
>>> +
>>>    		/* Only copy bits from the first slice */
>>>    		memcpy(&value, sseu->subslice_mask,
>>>    		       min(sseu->ss_stride, (u8)sizeof(value)));
>>
>> Just in case lets run this by Jordan and Lionel since it affects DG2. Anyone
>> else on the userspace side who might be affected?
> 
> When I grep'd Mesa, I found two uses of I915_PARAM_SLICE_MASK and
> I915_PARAM_SUBSLICE_MASK:
> 
>   * oa_metrics_kernel_support:  The topology query is used on gen10+ so
>     the getparam code is only called on gen9 and below
> 
>   * getparam_topology:  Invoked via intel_get_device_info_from_fd().  The
>     topology query is attempted first.  Only if that fails _and_ we're on
>     a pre-gen10 platform does it fall back to GETPARAM.
> 
> I also checked https://github.com/intel/compute-runtime and only see
> these being issued in one place:
> 
>   * HwInfoConfig::configureHwInfoDrm:  Only used if drm->queryTopology()
>     returns a failure first.
> 
> 
> I think those are the only relevant userspace for SSEU topology, so as
> far as I can tell nobody is still relying on the legacy getparams by the
> time we get to Xe_HP hardware.

Sounds good to me - I also had a look at the media and compute drivers 
and couldn't find any use. However I still think it is best if UMD teams 
would ack this patch.

Regards,

Tvrtko
