Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670898867C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 15:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E422110EC71;
	Fri, 27 Sep 2024 13:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c6dDBzC+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119C610EC72;
 Fri, 27 Sep 2024 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727444750; x=1758980750;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=D7T8gbwDTyhSckUhWVxsxYFg+JjlnB5hGJ96ASmPuIY=;
 b=c6dDBzC+SqWt3TzP+jsOWKhvhOTha+LjQOGq9exPOnmyDo1/u1niPurZ
 /b7uSvfEcjfB99nqTLuY4TqAOISJFFtaDUoaFI/mR874XbeyyVGpBAGk7
 Ct4fVN1ezxpeJpIRewx1vu8U3qSLbyNoC0X9+OPTkNkV+uUWx1djIFFiJ
 pO0GfXcVlL3CsTKV5pX4ptjek4IlQHg3zLW05+zg23oZ1w/CemsR3UinC
 7oIYjP0WSDDna4Bgg6YE3/9Mrmh8P2PJ1qRvkvNpUd8xQPllUFbm0smj8
 6AyMXnDGb48nZV/DhxAWmGoaDvwKSdRGHKFkO+ZPv8IsrvwpDR2fAveNF Q==;
X-CSE-ConnectionGUID: z7Bt9w+DQfCjLkE6tl8N6w==
X-CSE-MsgGUID: fgXrgvGJR+m9I6sNAENphQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37259940"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37259940"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 06:45:49 -0700
X-CSE-ConnectionGUID: bJTNzlkkQ5qxtlEQtlGC9g==
X-CSE-MsgGUID: rfHMWwBER5WhHcbLuCQNpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="72703408"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Sep 2024 06:45:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Sep 2024 16:45:44 +0300
Date: Fri, 27 Sep 2024 16:45:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alessandro Zanni <alessandro.zanni87@gmail.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com
Subject: Re: [PATCH] gpu: drm: i915: display: Avoid null values
 intel_plane_atomic_check_with_state
Message-ID: <Zva3CAewBl8NBL91@intel.com>
References: <20240927000146.50830-1-alessandro.zanni87@gmail.com>
 <87tte1zewf.fsf@intel.com> <ZvaduhDERL-zvED3@intel.com>
 <87tte1xmqe.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tte1xmqe.fsf@intel.com>
X-Patchwork-Hint: comment
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

On Fri, Sep 27, 2024 at 04:14:17PM +0300, Jani Nikula wrote:
> On Fri, 27 Sep 2024, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Sep 27, 2024 at 11:20:32AM +0300, Jani Nikula wrote:
> >> On Fri, 27 Sep 2024, Alessandro Zanni <alessandro.zanni87@gmail.com> wrote:
> >> > This fix solves multiple Smatch errors:
> >> >
> >> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:660
> >> > intel_plane_atomic_check_with_state() error:
> >> > we previously assumed 'fb' could be null (see line 648)
> >> >
> >> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:664
> >> > intel_plane_atomic_check_with_state()
> >> > error: we previously assumed 'fb' could be null (see line 659)
> >> >
> >> > drivers/gpu/drm/i915/display/intel_atomic_plane.c:671
> >> > intel_plane_atomic_check_with_state()
> >> > error: we previously assumed 'fb' could be null (see line 663)
> >> >
> >> > We should check first if fb is not null before to access its properties.
> >> 
> >> new_plane_state->uapi.visible && !fb should not be possible, but it's
> >> probably too hard for smatch to figure out. It's not exactly trivial for
> >> humans to figure out either.
> >> 
> >> I'm thinking something like below to help both.
> >> 
> >> Ville, thoughts?
> >> 
> >> 
> >> BR,
> >> Jani.
> >> 
> >> 
> >> diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> >> index 3505a5b52eb9..d9da47aed55d 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> >> @@ -629,6 +629,9 @@ int intel_plane_atomic_check_with_state(const struct intel_crtc_state *old_crtc_
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> +	if (drm_WARN_ON(display->drm, new_plane_state->uapi.visible && !fb))
> >> +		return -EINVAL;
> >> +
> >
> > We have probably 100 places that would need this. So it's going
> > to be extremely ugly.
> >
> > One approach I could maybe tolerate is something like
> > intel_plane_is_visible(plane_state) 
> > {
> > 	if (drm_WARN_ON(visible && !fb))
> > 		return false;
> >
> > 	return plane_state->visible;
> > }
> >
> > + s/plane_state->visible/intel_plane_is_visible(plane_state)/
> >
> > But is that going to help these obtuse tools?
> 
> That does help people, which is more important. :)
> 
> I think the problem is first checking if fb is NULL, and then
> dereferencing it anyway.
> 
> visible always means fb != NULL, but I forget, is the reverse true? Can
> we have fb != NULL and !visible? I mean could we change the fb check to
> visible check?

No, the reverse does not hold. A plane can be invisible
while still having a valid fb. Eg. the plane could be
positioned completely offscreen, or the entire crtc may
be inactive (DPMS off).

And whenever we have an fb we want to do all the check to make sure
it satisfies all the requirements, whether the plane is visible or
not. Otherwise we could end up confusing userspace with something
like this:

1. Usespace assigns some unsupported fb to the plane
   but positions the plane offscreen -> success
2. Userspace moves the plane to somewhere onscreen -> fail

-- 
Ville Syrjälä
Intel
