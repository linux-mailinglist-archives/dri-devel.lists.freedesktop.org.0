Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481EF677B4E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC5110E489;
	Mon, 23 Jan 2023 12:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5B210E489;
 Mon, 23 Jan 2023 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674477819; x=1706013819;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=tRbs/UoHVtXDOBOYKUxsFltiw7c2Mm+WoB8J9VfWjwQ=;
 b=fyYbyhN/7w3h7Q/lTmMwNg/MfIqNn1krVL+mSCp746pvPKdp2+txeqhE
 koHlposGO1Z3rcHub8In6XiuszGNOwWyKF6+UYYmhNHMuw1jMVAvBxvzK
 7/pSP6XyHEAmVVabSbxtbJRKG2LzdnZReB18aV0FKt+6/etoo7C68tS3q
 jq3UcypiYoHJGuux+iXsnc/A45a/E7tsN4DBQwG9WoI+uXAdLIfyjQ6+a
 AUSMa9AQUhpxAXYfPPWB0JX68dktnQKgOIt0xdWxGLXDL7IK1WXo/BhzG
 gjHqHAU+rvpXVkjtv7zf2SW/UuIBtj6uST8UFMLUxY6zTxdaP6eD+FFAe A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="328117378"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="328117378"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 04:43:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="692120203"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="692120203"
Received: from possola-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.125])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 04:43:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>
Subject: RE: [Intel-gfx] [PATCH v5 2/6] drm/i915/pxp: add device link
 between i915 and mei_pxp
In-Reply-To: <CY5PR11MB63660409E141F1D0E65A9B95EDCB9@CY5PR11MB6366.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-3-alan.previn.teres.alexis@intel.com>
 <Y8mZGMjjlTW3U0jA@intel.com>
 <CY5PR11MB63660409E141F1D0E65A9B95EDCB9@CY5PR11MB6366.namprd11.prod.outlook.com>
Date: Mon, 23 Jan 2023 14:43:33 +0200
Message-ID: <874jsh8lqi.fsf@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Winkler,
 Tomas" <tomas.winkler@intel.com>, "Vivi@freedesktop.org" <Vivi@freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 22 Jan 2023, "Usyskin, Alexander" <alexander.usyskin@intel.com> wrote:
>> > diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> > index d50354bfb993..bef6d7f8ac55 100644
>> > --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> > +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
>> > @@ -127,6 +127,10 @@ static int i915_pxp_tee_component_bind(struct
>> device *i915_kdev,
>> >  	intel_wakeref_t wakeref;
>> >  	int ret = 0;
>> >
>> > +	if (!HAS_HECI_PXP(i915) &&
>> > +	    drm_WARN_ON(&i915->drm, !device_link_add(i915_kdev,
>> tee_kdev,
>> 
>> I don't like the action here hidden behind the drm_WARN_ON.
>> Please notice that almost every use of this and other helpers like
>> this expect the param as a failure. Not an actual action. So,
>> most of lazy readers like me might ignore that the main function
>> is actually a param inside  this warn condition.
>> 
> Honestly, copy-pasted from drivers/gpu/drm/i915/display/intel_audio.c +1266
> I don't have deep knowledge of drm macros, so thought this should be ok.
> Can make it any other form that acceptable in drm tree...

Unfortunately, some pattern being present in the driver does not mean
it's a good example to be emulated. If we copy a bad pattern, it seems
more acceptable, and even more people will copy it.


BR,
Jani.

>
>> We should probably stash the link as well...
>> 
>> pxp->dev_link = device_link_add(i915_kdev, tee_kdev,...);
>> 
>> so in the end below, instead of checking the HAS_HECI_PXP again
>> and use the remove version you check the dev_link and use the del
>> function.
>> 
>> something like:
>> 
>> if (pxp->dev_link)
>>    device_link_del(pxp->dev_link);
>> 
> Not sure that this simplification warrants additional clutter in struct.
>
>> Also, do you really need the WARN to see the stack when this happens
>> or you already know the callers?
>> Why not a simple drm_error msg?
>> 
>> if (!HAS_HECI_PXP(i915) {
>> 	pxp->dev_link = device_link_add(i915_kdev, tee_kdev,...);
>> 	if (!pxp->dev_link) {
>> 	   drm_error();
>> 	   return -ESOMETHING;
>> 
>> >  DL_FLAG_STATELESS)))
>> 
>> do we need the RPM in sync as well?
>> I mean:
>> 
>> DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)))
>> 
>> ?
>
> No, the mei device should not be active all the time when i915 is active, only when pxp requires it.
>
>> 
>> > +		return -ENOMEM;
>> 
>> why ENOMEM?
> Copy-paste from i915 audio.
>
>> 
>> > +
>> >  	mutex_lock(&pxp->tee_mutex);
>> >  	pxp->pxp_component = data;
>> >  	pxp->pxp_component->tee_dev = tee_kdev;
>> > @@ -169,6 +173,9 @@ static void i915_pxp_tee_component_unbind(struct
>> device *i915_kdev,
>> >  	mutex_lock(&pxp->tee_mutex);
>> >  	pxp->pxp_component = NULL;
>> >  	mutex_unlock(&pxp->tee_mutex);
>> > +
>> > +	if (!HAS_HECI_PXP(i915))
>> > +		device_link_remove(i915_kdev, tee_kdev);
>> >  }
>> >
>> >  static const struct component_ops i915_pxp_tee_component_ops = {
>> > --
>> > 2.39.0
>> >

-- 
Jani Nikula, Intel Open Source Graphics Center
