Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9B5FB032
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 12:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9184210E7EF;
	Tue, 11 Oct 2022 10:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E396C10E7F7;
 Tue, 11 Oct 2022 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665483031; x=1697019031;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=stVivBrUOWNM3XfYcDu1vIrYQlmmFL5o1eWxnZQ3OZk=;
 b=aqCeUwF6GQ8amXIbFMxu6qWV+CS2Q2bKLqsA9ELWF6i2nMPF+1kznh4X
 kogPomIddO+adN2W+oeNbUYBQUSJqtevls+gYPad/Gbj8wDfzuxZ6oOmC
 kg9UP5SX1XYivgnm2WAgrbLK7lYGZzFUWwXNHrtfizzOr0rA+1shqRh3P
 qEyz5rEzAa1+6GDvipjMpNr9utctrwW8drI7Q4nmdZlppJqKaGaeFd43x
 o+20jBliCFxsi+k5a2sW296OjhE3zWjVq0T/yPunMeEHgG2KqC2OFWb/a
 /eYQ1/lH0u29OGwyQN0TG+Ns6rIA1SviXQ3LKs8SH7vcC+1cLg/Vw8bbS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="330941052"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="330941052"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 03:10:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10496"; a="657294434"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="657294434"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 03:10:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/i915: Use graphics ver, rel info for media on old
 platforms
In-Reply-To: <DM4PR11MB59714D6C8D496B5538DA27AB87239@DM4PR11MB5971.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221010231720.3730568-1-radhakrishna.sripada@intel.com>
 <87pmeyyg3n.fsf@intel.com>
 <DM4PR11MB59714D6C8D496B5538DA27AB87239@DM4PR11MB5971.namprd11.prod.outlook.com>
Date: Tue, 11 Oct 2022 13:10:26 +0300
Message-ID: <87k056y8kt.fsf@intel.com>
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Oct 2022, "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com> wrote:
> Hi Jani,
>
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: Tuesday, October 11, 2022 12:28 AM
>> To: Sripada, Radhakrishna <radhakrishna.sripada@intel.com>; intel-
>> gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org; Sripada, Radhakrishna
>> <radhakrishna.sripada@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>
>> Subject: Re: [PATCH] drm/i915: Use graphics ver, rel info for media on old
>> platforms
>> 
>> On Mon, 10 Oct 2022, Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> wrote:
>> > Platforms prior to MTL do not have a separate media and graphics version.
>> > On platforms where GMD id is not supported, reuse the graphics ip version,
>> > release info for media.
>> >
>> > The rest of the IP graphics, display versions would be copied during driver
>> > creation.
>> >
>> > While at it warn if GMD is not used for platforms greater than gen12.
>> >
>> > Fixes: c2c7075225ef ("drm/i915: Read graphics/media/display arch version
>> from hw")
>> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Cc: Matt Roper <matthew.d.roper@intel.com>
>> > Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/intel_device_info.c | 12 +++++++++++-
>> >  1 file changed, 11 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/intel_device_info.c
>> b/drivers/gpu/drm/i915/intel_device_info.c
>> > index 090097bb3c0a..ba178b61bceb 100644
>> > --- a/drivers/gpu/drm/i915/intel_device_info.c
>> > +++ b/drivers/gpu/drm/i915/intel_device_info.c
>> > @@ -329,8 +329,18 @@ static void intel_ipver_early_init(struct
>> drm_i915_private *i915)
>> >  {
>> >  	struct intel_runtime_info *runtime = RUNTIME_INFO(i915);
>> >
>> > -	if (!HAS_GMD_ID(i915))
>> > +	if (!HAS_GMD_ID(i915)) {
>> > +		drm_WARN_ON(&i915->drm, RUNTIME_INFO(i915)-
>> >graphics.ip.ver > 12);
>> > +		/*
>> > +		 * On older platforms, graphics and media share the same ip
>> > +		 * version and release.
>> > +		 */
>> > +		RUNTIME_INFO(i915)->media.ip.ver =
>> > +			RUNTIME_INFO(i915)->graphics.ip.ver;
>> > +		RUNTIME_INFO(i915)->media.ip.rel =
>> > +			RUNTIME_INFO(i915)->graphics.ip.rel;
>> 
>> You could assign the whole struct ip_version (*) at once, or is there a
>> reason you're intentionally not assigning step?
> Step info would anyways be determined later in the function intel_step_init.
> We already have macros in place to handle common gt and media steps there.
>
> Do you suggest we memcpy(&RUNTIME_INFO(i915)->media.ip, &RUNTIME_INFO->graphics.ip, sizeof(struct ip_version)) here?

Simple assign should do it for such a small struct.

BR,
Jani.

>
>> 
>> BR,
>> Jani.
>> 
>> (*) Why does that name not have intel_ prefix?
> Good question. Since introduced in " a5b7ef27da60 drm/i915: Add struct to hold IP version"
> we have been using as is. The author might have felt that the structure is not big enough/used in as many places
> to have an intel_ prefix. Do you see a symbol collision here that we
> need to add intel_ prefix?

It's not just about avoiding any immediate symbol collisions, it's also
about setting an example. People see this and think it's fine not to
have the prefix. And then the practice proliferates until there's a
collision.

> If so should we do it in a separate patch?

If there's a semantically separate change, it should always be a
separate patch.

BR,
Jani.

>
> Thanks,
> Radhakrishna(RK) Sripada
>> 
>> >  		return;
>> > +	}
>> >
>> >  	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS),
>> >  		    &runtime->graphics.ip);
>> 
>> --
>> Jani Nikula, Intel Open Source Graphics Center

-- 
Jani Nikula, Intel Open Source Graphics Center
