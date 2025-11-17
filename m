Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A59C63098
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AE110E32C;
	Mon, 17 Nov 2025 09:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8CqRncH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CCE10E314;
 Mon, 17 Nov 2025 09:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763370318; x=1794906318;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=peg6NBb3JX9ALfvMindANn44vJpbxeSf6FcxOLoqY3A=;
 b=H8CqRncHWFLmEiECafb3yFZPTpizcRo7sPGXJQWKAVnIARIDcDdaOPP/
 gsf35/f8gpbMiCbx5DCzmQMXOC3aqhaTTWwN+6T2I1pgk6+fq0XIdrZUz
 PzhcBUr2wSwMMZnp5dxcb+kH2u+4QRTNZMhdbsLzQEyiIaHn244QmAQY2
 U0/5eIafTBzD7IXoalRtp1l+sGkMvZ7kLrOLkWsAfdmP51kt6YxtIqdHZ
 BHwc9Whl7LBNsOdr1EBonGUR9Bg4d/fYL/Bpt5ZMAA5gpAZsSG7OSWcER
 sxho/7DmBLOvmTKMWwmE3WkXMMvu1EPssNfczt0XumYOwxX76UlPwROKs w==;
X-CSE-ConnectionGUID: 5i4IimViTvq7APRNp4vL7w==
X-CSE-MsgGUID: zMLq4281RRSP8/NiKu6FvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="64568026"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="64568026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:05:18 -0800
X-CSE-ConnectionGUID: wNZg7wdiS8+pVA1l+3Y15w==
X-CSE-MsgGUID: lUAFnS43S66c12eFpGw2jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="190187827"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.42])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:05:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>, Simona Vetter
 <simona@ffwll.ch>, xaver.hugl@kde.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, "open
 list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>,
 Harry Wentland <Harry.Wentland@amd.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/amd: Move adaptive backlight modulation property to
 drm core
In-Reply-To: <e934ece8-d70d-44fd-abe6-fcecae8abc85@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251112222646.495189-1-mario.limonciello@amd.com>
 <83aa8a816cf301085a3e3638238f8fba11053dc2@intel.com>
 <449ee5ba065e1ceee8f7a04038442cff24772df9@intel.com>
 <e934ece8-d70d-44fd-abe6-fcecae8abc85@amd.com>
Date: Mon, 17 Nov 2025 11:05:10 +0200
Message-ID: <81da4bd8bcf6110145964f0c314dae1ea3046d10@intel.com>
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

On Fri, 14 Nov 2025, Mario Limonciello <mario.limonciello@amd.com> wrote:
> +Xaver
>
> On 11/14/2025 2:39 AM, Jani Nikula wrote:
> <snip>
>
>>>
>>> So this is basically Content Adaptive Brightness Control, but with the
>>> technology ("backlight" and "modulation") unnecessarily encoded in the
>>> ABI.
>>>
>>> You could have the same knob for adjusting CABC implemented in an OLED
>>> panel, controlled via DPCD.
>>>
>>>> + *
>>>> + *	sysfs
>>>> + *		The ABM property is exposed to userspace via sysfs interface
>>>> + *		located at 'amdgpu/panel_power_savings' under the DRM device.
>>>
>>> Err what? Seriously suggesting that to the common ABI? We shouldn't have
>>> sysfs involved at all, let alone vendor specific sysfs.
>>>
>>>> + *	off
>>>> + *		Adaptive backlight modulation is disabled.
>>>> + *	min
>>>> + *		Adaptive backlight modulation is enabled at minimum intensity.
>>>> + *	bias min
>>>> + *		Adaptive backlight modulation is enabled at a more intense
>>>> + *		level than 'min'.
>>>> + *	bias max
>>>> + *		Adaptive backlight modulation is enabled at a more intense
>>>> + *		level than 'bias min'.
>>>> + *	max
>>>> + *		Adaptive backlight modulation is enabled at maximum intensity.
>>>
>>> So values 0-4 but with names. I don't know what "bias" means here, and I
>>> probably shouldn't even have to know. It's an implementation detail
>>> leaking to the ABI.
>>>
>>> In the past I've encountered CABC with different modes based on the use
>>> case, e.g. "video" or "game", but I don't know how those would map to
>>> the intensities.
>>>
>>> I'm concerned the ABI serves AMD hardware, no one else, and everyone
>>> else coming after this is forced to shoehorn their implementation into
>>> this.
>> 
>> Apparently Harry had the same concerns [1].
>> 
> So let me explain how we got here.  At the display next hackfest last 
> year (2024) we talked about how to get compositors to indicate they want 
> technologies like this to get out the way.  A patch series was made that 
> would allow compositor to say "Require color accuracy" or "Require low 
> latency" are required.
>
> https://lore.kernel.org/amd-gfx/20240703051722.328-1-mario.limonciello@amd.com/
>
> This got reverted because userspace didn't have an implementation ready 
> to go at the time.  One was created and so I rebased/resent the series 
> earlier this year.
>
> https://lore.kernel.org/amd-gfx/20250621152657.1048807-1-superm1@kernel.org/
>
> Xaver had some change of heart and wanted to talk about it at the next 
> hackfest.
>
> https://lore.kernel.org/amd-gfx/CAFZQkGxUwodf5bW0qQkXoPoz0CFFA1asJfUxFftMGgs5-VK2Hw@mail.gmail.com/
>
> So we talked about it again at the hackfest this year and the decision 
> was not everyone can an octagon into a peg hole, so we're better off 
> re-introducing vendor properties for this.  So series was respun per 
> that discussion.
>
> https://lore.kernel.org/amd-gfx/20250718192045.2091650-1-superm1@kernel.org/
>
> Userspace implementation was done and so we merged this for 6.19.
>
> https://lore.kernel.org/amd-gfx/CAFZQkGwLWcyS0SqCHoiGsJd5J_u4aBJ0HMV5Bx3NknLdLkr8Uw@mail.gmail.com/
>
> Then Simona suggested we need to make some changes where the propertye 
> should be in generic documentation etc:
>
> https://lore.kernel.org/amd-gfx/aQUz-mbM_WlXn_uZ@phenom.ffwll.local/
>
> So that's where we are now with this patch.  I can clean it up per the 
> feedback so far - but I think we need to be in agreement that this 
> property is actually the way forward or we should revert the property in 
> amdgpu instead of this moving approach and keep discussing.

IMO we should either

- admit we can't do a generic property for this *and* keep the vendor
  specific property details hidden in drivers, or

- figure out a generic property and add that in drm core

But I'm pretty much against adding an AMD vendor specific property in
drm core.


BR,
Jani.


-- 
Jani Nikula, Intel
