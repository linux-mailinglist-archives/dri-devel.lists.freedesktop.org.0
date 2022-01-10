Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B0489CF8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 17:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A1110E60F;
	Mon, 10 Jan 2022 16:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE11010E609;
 Mon, 10 Jan 2022 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641830458; x=1673366458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xNlY1Y/YH39gybgNG6Nse0y4znLN9alGLRSZSuPD7aU=;
 b=eFgk5mJ76IMMEmTEoDj10ztkbCldKsXZm6ygOmWzdGo1N/eW7YujAjB0
 eWpy+VKkqFFXpOTpEO5/gaychv2wcfrJYVxWyfoaK8JP68HiO+9uL220M
 mSvBtBKjtdUqUXmyiRluGvCQ+tocWxsBDe4A2kwygxNreeYqj57AIpblq
 0OhYeIYzFZtzt1Bt7fm302nc7FPadnB+HrIAPoJLTR1aVp3EEjjDbtCBs
 sCdGUEHQ+JQyy9/7W0OPbLm/RuOBYOHVjVFYKXGezaIeNx1nx0mEHz/XL
 fl/PZU5Yl6MTaiGrOyrO+11OQjm55PEOvAmG7WU9GXU4Gr/xswl721xe0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="223948689"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="223948689"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 08:00:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="528323047"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga008.jf.intel.com with SMTP; 10 Jan 2022 08:00:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 18:00:53 +0200
Date: Mon, 10 Jan 2022 18:00:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/atomic: Make private objs proper objects
Message-ID: <YdxYNV9AhlvHxibp@intel.com>
References: <20170712155102.26276-1-ville.syrjala@linux.intel.com>
 <20170712155102.26276-3-ville.syrjala@linux.intel.com>
 <87tueoj4bw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87tueoj4bw.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 31, 2021 at 03:23:31PM +0200, Jani Nikula wrote:
> On Wed, 12 Jul 2017, ville.syrjala@linux.intel.com wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Make the atomic private object stuff less special by introducing proper
> > base classes for the object and its state. Drivers can embed these in
> > their own appropriate objects, after which these things will work
> > exactly like the plane/crtc/connector states during atomic operations.
> >
> > v2: Reorder to not depend on drm_dynarray (Daniel)
> >
> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> #v1
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Stumbled upon an old commit
> 
> commit a4370c777406c2810e37fafd166ccddecdb2a60c
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Date:   Wed Jul 12 18:51:02 2017 +0300
> 
>     drm/atomic: Make private objs proper objects
> 
> which is this patch.
> 
> > @@ -3050,8 +3043,7 @@ struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_a
> >  	struct drm_device *dev = mgr->dev;
> >  
> >  	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> > -	return drm_atomic_get_private_obj_state(state, mgr,
> > -						&mst_state_funcs);
> > +	return to_dp_mst_topology_state(drm_atomic_get_private_obj_state(state, &mgr->base));
> >  }
> >  EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
> 
> I don't think this combines well with...
> 
> > diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> > index 177ab6f86855..d55abb75f29a 100644
> > --- a/include/drm/drm_dp_mst_helper.h
> > +++ b/include/drm/drm_dp_mst_helper.h
> > @@ -404,12 +404,17 @@ struct drm_dp_payload {
> >  	int vcpi;
> >  };
> >  
> > +#define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst_topology_state, base)
> 
> ...this in case of error pointers that
> drm_atomic_get_private_obj_state() may return.

offsetof(base)==0 so should work in practice.

-- 
Ville Syrjälä
Intel
