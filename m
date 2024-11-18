Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B469D0B6B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 10:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFA010E45E;
	Mon, 18 Nov 2024 09:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eahzYKLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B6F10E451;
 Mon, 18 Nov 2024 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731921025; x=1763457025;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SW9nB6WQKK8To+S2ataVoduBQ86PxrsAXAkv1yHIAkA=;
 b=eahzYKLEFmebSATj/Fb0cDQpH+xUQFZguyK4ttQ6DJPNQnOG1uKicvq+
 DdypCh6ULapvtu2kZ/sA18/VtXR2XxkvcjP43csNArCs5+HdURF2MgSD0
 7EXY86A+TVOErxUsHI4KSgwxOPVGtw554slR7l1PIYHvcfvp3aHN1sB/U
 o6DO5RoS+CqsFEtYlUmuP4CnzxSU4RCioNeaUQsoS7n7zFvQg3UvGSkRe
 8fCtSLQwDOBSETUgHqH5KP9+s3IuBxaQiU9wpL5FU+cNiWVvlEfT8Yepv
 IuoKemUvO38D70E2j/gb6tevQl++2VaEYZGKRzT9M08v6gjKInHwvu7/C g==;
X-CSE-ConnectionGUID: tM5189xSTamkRvnhpEFtKw==
X-CSE-MsgGUID: Hy53zEcMQa2ScoUC4tjvDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35638825"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="35638825"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:10:25 -0800
X-CSE-ConnectionGUID: SMI4vgkHTaiSFhSGhOLtQQ==
X-CSE-MsgGUID: cTlZeIlTRQW/UOWnW05mig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89176892"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 01:10:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: imre.deak@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/i915/dp_mst: Fix connector initialization in
 intel_dp_add_mst_connector()
In-Reply-To: <ZzevVE-MM4iFz1T_@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241115164159.1081675-1-imre.deak@intel.com>
 <ZzetKr-rApPqmehO@intel.com> <ZzevVE-MM4iFz1T_@ideak-desk.fi.intel.com>
Date: Mon, 18 Nov 2024 11:10:18 +0200
Message-ID: <87ttc452md.fsf@intel.com>
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

On Fri, 15 Nov 2024, Imre Deak <imre.deak@intel.com> wrote:
> On Fri, Nov 15, 2024 at 03:20:58PM -0500, Rodrigo Vivi wrote:
>> On Fri, Nov 15, 2024 at 06:41:56PM +0200, Imre Deak wrote:
>> > The connector initialization in intel_dp_add_mst_connector() depends on
>> > the device pointer in connector to be valid, at least by connector
>> > debug printing. The device pointer is initialized by drm_connector_init(),
>> > however that function also exposes the connector to in-kernel users,
>> > which can't be done before the connector is fully initialized. For now
>> > make sure the device pointer is valid before it's used, until a
>> > follow-up change moving this to DRM core.
>> > 
>> > This issue was revealed by the commit in the Fixes: line below, before
>> > which the above debug printing checked and handled a NULL device pointer
>> > gracefully in DRM core.
>> > 
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Fixes: 529798bd786a ("drm/i915/mst: convert to struct intel_display")
>> 
>> This is awkward. This patch actually removes callers of base.dev.
>> I don't see how that it could be causing this new null dereference.
>
> It adds
>
> struct intel_display *display = to_intel_display(connector);
>
> which will be NULL since connector->base.dev is NULL and later display
> is dereferenced.

So this happens in detect_dsc_hblank_expansion_quirk()?

The changes were:

-       struct drm_i915_private *i915 = to_i915(connector->base.dev);
+       struct intel_display *display = to_intel_display(connector);

-       drm_dbg_kms(&i915->drm,
+       drm_dbg_kms(display->drm,

And apparently i915 and &i915->drm were both NULL before, but the change
turned it into a NULL pointer dereference.

Why do we have to do this before drm_connector_init()? What if we just
moved it after the connector init? What are the in-kernel users that can
get called in between?

Or if it's absolutely required to do all that before init, then pass the
things to it instead of assuming the connector is ready?


BR,
Jani.


>
>> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12799
>> 
>> But well, trusting more the tests then my eyes, let's move forward.
>> 
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> 
>> > Signed-off-by: Imre Deak <imre.deak@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ++++++++++
>> >  1 file changed, 10 insertions(+)
>> > 
>> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> > index df7edcfe885b6..f058360a26413 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> > @@ -1727,6 +1727,16 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>> >  
>> >  	intel_dp_init_modeset_retry_work(intel_connector);
>> >  
>> > +	/*
>> > +	 * TODO: The following drm_connector specific initialization belongs
>> > +	 * to DRM core, however it happens atm too late in
>> > +	 * drm_connector_init(). That function will also expose the connector
>> > +	 * to in-kernel users, so it can't be called until the connector is
>> > +	 * sufficiently initialized; init the device pointer used by the
>> > +	 * following DSC setup, until a fix moving this to DRM core.
>> > +	 */
>> > +	intel_connector->base.dev = mgr->dev;
>> > +
>> >  	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
>> >  	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
>> >  	intel_connector->dp.dsc_hblank_expansion_quirk =
>> > -- 
>> > 2.44.2
>> > 

-- 
Jani Nikula, Intel
