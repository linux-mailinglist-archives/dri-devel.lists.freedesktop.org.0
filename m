Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B4753241D
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 09:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4777D10E902;
	Tue, 24 May 2022 07:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B06210E8E1;
 Tue, 24 May 2022 07:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653377545; x=1684913545;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mXQ188SPTcgfMBG4lemBEvyWQz1zDGbNg0bLIDLsYeA=;
 b=eIhJH9aD9hxD+GWhZzTW3b682aBL7nYINtEMjk9PLmBw2TRAY0hWUt6d
 U3CvSjg3GVN8zVyGU0WyFREvKxDDataWU+rAMbSYAadOt3p/hKVu8BNFs
 jCsMCIQ6mujGPiGg/l6HMbHFBGRYf80EW+U7gRwa+JxinllGoYri+b8Q/
 b3hsDKFeqgR8zeyS5sgzr2FyH2Z+Hxs2+fB25vZN7/5DnMtaASNgGGHyk
 kn8VIogi3ZwEm9L46WMbTAsKpV0osGKVKamLb8Kh5EDmPtcIaOu3h8cZm
 LocfIlk/dLolDqvwu7Rtqg/MZxS5zqtrHOuzJsHEH/wYuDGiVMfaqCdUn Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="336512341"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="336512341"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 00:32:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="676245683"
Received: from cennis-mobl.ger.corp.intel.com (HELO [10.213.213.170])
 ([10.213.213.170])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 00:32:23 -0700
Message-ID: <14ad581a-9002-e2db-027b-79657cc9765a@linux.intel.com>
Date: Tue, 24 May 2022 08:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 0/6] i915: SSEU handling updates
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220520230408.3787166-1-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220520230408.3787166-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/05/2022 00:04, Matt Roper wrote:
> This series reworks i915's internal handling of slice/subslice/EU (SSEU)
> data to represent platforms like Xe_HP in a more natural manner and to
> prepare for future platforms where the masks will need to grow in size.
> One key idea of this series is that although we have a fixed ABI to
> convey SSEU data to userspace (i.e., multiple u8[] arrays with data
> stored at different strides), we don't need to use this cumbersome
> format for the driver's own internal storage.  As long as we can convert
> into the uapi form properly when responding to the I915_QUERY ioctl,
> it's preferable to use an internal storage format that's easier for the
> driver to work with.
> 
> Another key point here is that we're reaching the point where subslice
> (DSS) masks will soon not fit within simple u32/u64 integer values.
> Xe_HP SDV and DG2 platforms today have subslice (DSS) masks that are 32
> bits, which maxes out the current storage of a u32.  With PVC the masks
> are represented by a pair of 32-bit registers, requiring a bump up to at
> least 64-bits of storage internally.  We could switch to u64 for that in
> the short term, but since we already know that upcoming architectures
> intend to provide DSS fuse bits via three or more registers it's best to
> switch to a representation that's more future-proof but still easy to
> work with in the driver code.  To accomodate this, we start storing our
> subslice mask for Xe_HP and beyond in a new typedef that can be
> processed by the linux/bitmap.h operations.
> 
> Finally, since no userspace for Xe_HP or beyond is using the legacy
> I915_GETPARAM ioctl lookups for I915_PARAM_SLICE_MASK and
> I915_PARAM_SUBSLICE_MASK (since they've migrated to the more flexible
> I915_QUERY ioctl that can return more than a simple u32 value), we take
> the opportunity to officially drop support for those GETPARAM lookups on
> modern platforms.  Maintaining support for these GETPARAM lookups don't
> make sense for a number of reasons:
> 
>   * Traditional slices no longer exist, and newer ideas like gslices,
>     cslices, mslices, etc. aren't something userspace needs to query
>     since it can be inferred from other information.
>   * The GETPARAM ioctl doesn't have a way to distinguish between geometry
>     subslice masks and compute subslice masks, which are distinct on
>     Xe_HP and beyond.
>   * The I915_GETPARAM ioctl is limited to returning a 32-bit value, so
>     when subslice masks begin to exceed 32-bits (on PVC), it simply can't
>     return the entire mask.
>   * The GETPARAM ioctl doesn't have a way to give sensible information
>     for multi-tile devices.
> 
> v2:
>   - Switch to union of hsw/xehp formats to keep the representation in a
>     natural format for different types of hardware.
>   - Avoid accessing internals of intel_sseu_ss_mask_t directly outside of
>     intel_sseu.[ch].
>   - Include PVC SSEU which needs the larger SS mask storage enabled by
>     this series.
> 
> v3:
>   - Correct a BIT(s) typo that should have been BIT(ss), causing
>     incorrect handling on gen9 platforms.
> 
> v4:
>   - Eliminate sseu->{ss,eu}_stride fields and just calculate the proper
>     value in the UAPI code that needs them.
>   - Handle unwanted ~u8 sign extension at the callsite instead of inside
>     sseu_set_eus.
>   - Use BITMAP_BITS() macro rather than passing I915_MAX_SS_FUSE_BITS
>     around directly to bitmap operations.
>   - Improved debugfs / dmesg reporting for Xe_HP dumps
>   - Various assertion check improvements.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> 
> 
> Matt Roper (6):
>    drm/i915/xehp: Use separate sseu init function
>    drm/i915/xehp: Drop GETPARAM lookups of I915_PARAM_[SUB]SLICE_MASK
>    drm/i915/sseu: Simplify gen11+ SSEU handling
>    drm/i915/sseu: Don't try to store EU mask internally in UAPI format
>    drm/i915/sseu: Disassociate internal subslice mask representation from
>      uapi
>    drm/i915/pvc: Add SSEU changes

For the series:

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Almost r-b actually, but I do not feel completely comfortable that I 
read everything closely enough to not have missed something. So I prefer 
someone else does a really detailed pass to be sure.

Regards,

Tvrtko

> 
>   drivers/gpu/drm/i915/gem/i915_gem_context.c  |   5 +-
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c    |   4 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c           |  12 +-
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h      |   1 +
>   drivers/gpu/drm/i915/gt/intel_sseu.c         | 450 ++++++++++++-------
>   drivers/gpu/drm/i915/gt/intel_sseu.h         |  94 ++--
>   drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |  30 +-
>   drivers/gpu/drm/i915/gt/intel_workarounds.c  |  24 +-
>   drivers/gpu/drm/i915/i915_drv.h              |   2 +
>   drivers/gpu/drm/i915/i915_getparam.c         |  11 +-
>   drivers/gpu/drm/i915/i915_pci.c              |   3 +-
>   drivers/gpu/drm/i915/i915_query.c            |  26 +-
>   drivers/gpu/drm/i915/intel_device_info.h     |   1 +
>   13 files changed, 398 insertions(+), 265 deletions(-)
> 
