Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2AB91ABAA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1138F10EAFA;
	Thu, 27 Jun 2024 15:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxbBvzl3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010D910E6AA;
 Thu, 27 Jun 2024 15:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719502912; x=1751038912;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Nmd7FkZIhtLJsssIxeQmbD6I3oFZU7Req2xs3HTaKVo=;
 b=LxbBvzl3IvOux3Z9bw9v8tatAaoOviwn4Fu7YsUXhaVu0hs0/BhvhJq9
 HmlEtFCNHaZcmD98bVcEHpoRkMP+por09XoaoQjIKeqyPgEYKZTz27AYg
 dTqSkbatRK/QcBuX8yCX0niOplguba48+5y9rYwTd9HaX5xJryyJWXZDz
 GyZpZrCFjPpKZfVHpSSnpU3HbNnhzoT0X3CJO4u0VYd0KHbGPiXPtYHMs
 hvMAlgGz5ddUo1GlJvNRhRd0FsC31PoteIy/BfeZRJTDqLUjy/ruv1l47
 R3Hnhs8oqgTQB4xxftVrLruKzlm9gFok7QMfkhFABTooT5ZclpxZkZM1l w==;
X-CSE-ConnectionGUID: m4pG4tpKRm6dAamaf5TLKg==
X-CSE-MsgGUID: l6uFhZvPRLC/8Xu8eR7GjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="28037342"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="28037342"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 08:41:52 -0700
X-CSE-ConnectionGUID: vLjwkHlsS6mgk/Ns8BZzFA==
X-CSE-MsgGUID: EguhkqD8QyyqZxIyvJFvFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="49585632"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 08:41:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm: Add helpers for x16 fixed point values
In-Reply-To: <ZnLIe+YFkDpMcXF7@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240614173911.3743172-1-imre.deak@intel.com>
 <20240614173911.3743172-2-imre.deak@intel.com> <87cyodfdku.fsf@intel.com>
 <ZnLIe+YFkDpMcXF7@ideak-desk.fi.intel.com>
Date: Thu, 27 Jun 2024 18:41:46 +0300
Message-ID: <875xtucs05.fsf@intel.com>
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

On Wed, 19 Jun 2024, Imre Deak <imre.deak@intel.com> wrote:
> On Wed, Jun 19, 2024 at 01:10:09PM +0300, Jani Nikula wrote:
>> On Fri, 14 Jun 2024, Imre Deak <imre.deak@intel.com> wrote:
>> > Add helpers to convert between x16 fixed point and integer/fraction
>> > values. Also add the format/argument macros required to printk x16
>> > fixed point variables.
>> >
>> > These are needed by later patches dumping the Display Stream Compression
>> > configuration in DRM core and in the i915 driver to replace the
>> > corresponding bpp_x16 helpers defined locally in the driver.
>> >
>> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>> > ---
>> >  drivers/gpu/drm/display/drm_dp_helper.c |  5 +++--
>> >  include/drm/drm_fixed.h                 | 23 +++++++++++++++++++++++
>> >  2 files changed, 26 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> > index 79a615667aab1..806f9c9764995 100644
>> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> > @@ -35,6 +35,7 @@
>> >  #include <drm/display/drm_dp_helper.h>
>> >  #include <drm/display/drm_dp_mst_helper.h>
>> >  #include <drm/drm_edid.h>
>> > +#include <drm/drm_fixed.h>
>> >  #include <drm/drm_print.h>
>> >  #include <drm/drm_vblank.h>
>> >  #include <drm/drm_panel.h>
>> > @@ -4151,9 +4152,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
>> >  	int symbol_cycles;
>> >  
>> >  	if (lane_count == 0 || hactive == 0 || bpp_x16 == 0) {
>> > -		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 %d.%04d\n",
>> > +		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 " DRM_X16_FMT "\n",
>> >  			      lane_count, hactive,
>> > -			      bpp_x16 >> 4, (bpp_x16 & 0xf) * 625);
>> > +			      DRM_X16_ARGS(bpp_x16));
>> >  		return 0;
>> >  	}
>> >  
>> > diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
>> > index 81572d32db0c2..0fe2a7f50d54e 100644
>> > --- a/include/drm/drm_fixed.h
>> > +++ b/include/drm/drm_fixed.h
>> > @@ -214,4 +214,27 @@ static inline s64 drm_fixp_exp(s64 x)
>> >  	return sum;
>> >  }
>> >  
>> > +static inline int drm_x16_from_int(int val_int)
>> > +{
>> > +	return val_int << 4;
>> > +}
>> > +
>> > +static inline int drm_x16_to_int(int val_x16)
>> > +{
>> > +	return val_x16 >> 4;
>> > +}
>> > +
>> > +static inline int drm_x16_to_int_roundup(int val_x16)
>> > +{
>> > +	return (val_x16 + 0xf) >> 4;
>> > +}
>> > +
>> > +static inline int drm_x16_to_frac(int val_x16)
>> > +{
>> > +	return val_x16 & 0xf;
>> > +}
>> 
>> Sad trombone about the completely different naming scheme compared to
>> the rest of the file.
>> 
>> Not saying the existing naming is great, but neither is this. And
>> there's no way to unify except by renaming *both* afterwards.
>> 
>> We could devise a scheme now that could be used for the existing stuff
>> later, without renaming the new stuff.
>
> Based on [1]'s short variant, we could have:
>
> dfixed*(fixed20_12 v)  -> drm_uq12*(drm_uq20_12_t v)
> drm_fixp*(s64 v)       -> drm_q32*(s64 v)
> drm_x16*(int v)        -> drm_q4*(int v)

I like it. If you're brave, add them with a generic prefix instead of
drm_ from the start, say fp_q4. ;)

BR,
Jani.

>
> Or instead of uq12/q32/q4 using ufp12/fp32/fp4.
>
> [1] https://en.wikipedia.org/wiki/Q_(number_format)
>
>> *shrug*
>> 
>> BR,
>> Jani.
>> 
>> 
>> 
>> > +
>> > +#define DRM_X16_FMT		"%d.%04d"
>> > +#define DRM_X16_ARGS(val_x16)	drm_x16_to_int(val_x16), (drm_x16_to_frac(val_x16) * 625)
>> > +
>> >  #endif
>> 
>> -- 
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
