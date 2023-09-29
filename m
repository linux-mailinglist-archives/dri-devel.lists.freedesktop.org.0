Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D186A7B3100
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 13:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A0310E453;
	Fri, 29 Sep 2023 11:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D6410E6F6;
 Fri, 29 Sep 2023 11:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695985432; x=1727521432;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=64bD51VYxNRUHY49cDILKREu4yUDb8uw2aPlmWutxYQ=;
 b=HU6Bl09EMk6kLvVMRIjPBzgf/vPGUQkLcD9zWuSByJUlJWQCF4VDrbnM
 NA1TDJr5HiNQg26Vax8if736/8xSoa+wXfshitPHDBlS9qdE4b8l9/kSQ
 GnMfakw5dVkurU0hPxQX1HkNxcWn01aoaYvxkqd4W0ZgaMCoHellLjpAY
 mzPkTQ2Y9nIQ9N4njltlgnjCRgXl99aLwGlyWf8U2H73HoVXhlKDuCsH3
 deSN7rU8WhSXdFm1bLoy1119jvNPuEiPBti9I4AfQf1Da51ULR4fiSaH9
 etILa5EwHx+8GQXKol4OZsw8QRyK6/9jwDf/4W7LwzjGj8DHnniCqofwV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="381163819"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="381163819"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:03:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; 
   d="scan'208";a="825038"
Received: from osalyk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.53.237])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:03:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 00/19] drm/i915: prepare for xe driver display integration
In-Reply-To: <ZQMefDTkBf35yRly@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1694514689.git.jani.nikula@intel.com>
 <ZQMefDTkBf35yRly@intel.com>
Date: Fri, 29 Sep 2023 14:03:47 +0300
Message-ID: <87o7hli6lo.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Sep 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Tue, Sep 12, 2023 at 02:06:27PM +0300, Jani Nikula wrote:
>> The upcoming drm/xe driver [1][2] will reuse the drm/i915 display code,
>> initially by compiling the relevant compilation units separately as part
>> of the xe driver. This series prepares for that in i915 side.
>> 
>> The first patch defines I915 during the i915 driver build, to allow
>> conditional compilation based on the driver the code is being built for.
>> 
>> The rest of the patches add stubs for functions in files that aren't
>> used in xe. The idea is that this is the least intrusive way of skipping
>> that code in xe, and is quite similar to the common kconfig stubs.
>> 
>> While this is arguably unused code for the time being, or only used in
>> an out-of-tree driver yet to be upstreamed, the upstreaming has to start
>> somewhere.
>
> I see other benefits on adding this right now through drm-intel-next:
>
> 1. Separate the good&ready patches from the other patches that are in
>    drm-xe-next, that would require more work.
> 2. Minimize the non-xe patches in the xe pull-request. Cleaner and with
>    reduced risk of conflicts.
>
>> 
>> 
>> BR,
>> Jani.
>> 
>> 
>> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/tree/drm-xe-next
>> [2] https://patchwork.freedesktop.org/series/112188/
>> 
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>
> Yeap, let's for sure get input from other maintainers, but meanwhile I'd
> like to state that I have once more reviewed these patches and that
> you can put my rv-b tag in all of them when we get the proper acks.

Thanks. Pushed to drm-intel-next with Dave's IRC ack.

BR,
Jani.


>
>> 
>> Jani Nikula (19):
>>   drm/i915: define I915 during i915 driver build
>>   drm/i915/display: add I915 conditional build to intel_lvds.h
>>   drm/i915/display: add I915 conditional build to hsw_ips.h
>>   drm/i915/display: add I915 conditional build to i9xx_plane.h
>>   drm/i915/display: add I915 conditional build to intel_lpe_audio.h
>>   drm/i915/display: add I915 conditional build to intel_pch_refclk.h
>>   drm/i915/display: add I915 conditional build to intel_pch_display.h
>>   drm/i915/display: add I915 conditional build to intel_sprite.h
>>   drm/i915/display: add I915 conditional build to intel_overlay.h
>>   drm/i915/display: add I915 conditional build to g4x_dp.h
>>   drm/i915/display: add I915 conditional build to intel_dpio_phy.h
>>   drm/i915/display: add I915 conditional build to intel_crt.h
>>   drm/i915/display: add I915 conditional build to vlv_dsi.h
>>   drm/i915/display: add I915 conditional build to i9xx_wm.h
>>   drm/i915/display: add I915 conditional build to g4x_hdmi.h
>>   drm/i915/display: add I915 conditional build to intel_dvo.h
>>   drm/i915/display: add I915 conditional build to intel_sdvo.h
>>   drm/i915/display: add I915 conditional build to intel_tv.h
>>   drm/i915/display: add I915 conditional build to vlv_dsi_pll.h
>> 
>>  drivers/gpu/drm/i915/Makefile                 |  4 +
>>  drivers/gpu/drm/i915/display/g4x_dp.h         | 26 +++++
>>  drivers/gpu/drm/i915/display/g4x_hdmi.h       | 12 +++
>>  drivers/gpu/drm/i915/display/hsw_ips.h        | 35 +++++++
>>  drivers/gpu/drm/i915/display/i9xx_plane.h     | 23 +++++
>>  drivers/gpu/drm/i915/display/i9xx_wm.h        | 17 ++++
>>  drivers/gpu/drm/i915/display/intel_crt.h      | 14 +++
>>  drivers/gpu/drm/i915/display/intel_dpio_phy.h | 96 +++++++++++++++++++
>>  drivers/gpu/drm/i915/display/intel_dvo.h      |  6 ++
>>  .../gpu/drm/i915/display/intel_lpe_audio.h    | 18 ++++
>>  drivers/gpu/drm/i915/display/intel_lvds.h     | 19 ++++
>>  drivers/gpu/drm/i915/display/intel_overlay.h  | 35 +++++++
>>  .../gpu/drm/i915/display/intel_pch_display.h  | 53 ++++++++++
>>  .../gpu/drm/i915/display/intel_pch_refclk.h   | 23 +++++
>>  drivers/gpu/drm/i915/display/intel_sdvo.h     | 13 +++
>>  drivers/gpu/drm/i915/display/intel_sprite.h   |  8 ++
>>  drivers/gpu/drm/i915/display/intel_tv.h       |  6 ++
>>  drivers/gpu/drm/i915/display/vlv_dsi.h        | 13 +++
>>  drivers/gpu/drm/i915/display/vlv_dsi_pll.h    |  9 ++
>>  19 files changed, 430 insertions(+)
>> 
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel
