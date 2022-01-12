Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19248C47D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 14:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0798511218C;
	Wed, 12 Jan 2022 13:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BFD11219C;
 Wed, 12 Jan 2022 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641993171; x=1673529171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qCsob8UMWQvb0TVxnSwy/tHHpqKaW37R5V/tqLwOhwk=;
 b=MNyT8PMIhCbMk6UW0UCLTWV03+KIjp75v6CiqAylNa2nfAhrE5967+GS
 MVssvEjGk4wZXouItlufiQzngPxVg8M3dK5n0Bt749XsLTd4tVWJCNOle
 35bG7hDMUtEqzhwUA5eIfIfIm3nQ7atAm5gvXiTE5QeJbl7d4O/rGIuTc
 rkffJaoaHsH5f/hf/kHNTSs7cKnItqqhklZ8m3AcRVlj8cyDdmkBBr/JX
 fEsm37jPOlhcFKYXGWe/R+KVNXihiCh7U5X6kn4FpECh0NtVUvYE8GsdD
 28WgEF6jauVhiC8bTsV4fqiL885DgcFvS5hlOvLvfhNW2//C539lT6uo3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="223709772"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="223709772"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 05:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="620184849"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by fmsmga002.fm.intel.com with SMTP; 12 Jan 2022 05:12:47 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jan 2022 15:12:47 +0200
Date: Wed, 12 Jan 2022 15:12:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/atomic: Make private objs proper objects
Message-ID: <Yd7Tz0sHZsx/+ROL@intel.com>
References: <20170712155102.26276-1-ville.syrjala@linux.intel.com>
 <20170712155102.26276-3-ville.syrjala@linux.intel.com>
 <87tueoj4bw.fsf@intel.com> <YdxYNV9AhlvHxibp@intel.com>
 <87y23m8ycl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y23m8ycl.fsf@intel.com>
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

On Tue, Jan 11, 2022 at 10:34:34AM +0200, Jani Nikula wrote:
> On Mon, 10 Jan 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Fri, Dec 31, 2021 at 03:23:31PM +0200, Jani Nikula wrote:
> >> On Wed, 12 Jul 2017, ville.syrjala@linux.intel.com wrote:
> >> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> >
> >> > Make the atomic private object stuff less special by introducing proper
> >> > base classes for the object and its state. Drivers can embed these in
> >> > their own appropriate objects, after which these things will work
> >> > exactly like the plane/crtc/connector states during atomic operations.
> >> >
> >> > v2: Reorder to not depend on drm_dynarray (Daniel)
> >> >
> >> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> >> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> #v1
> >> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> 
> >> Stumbled upon an old commit
> >> 
> >> commit a4370c777406c2810e37fafd166ccddecdb2a60c
> >> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> Date:   Wed Jul 12 18:51:02 2017 +0300
> >> 
> >>     drm/atomic: Make private objs proper objects
> >> 
> >> which is this patch.
> >> 
> >> > @@ -3050,8 +3043,7 @@ struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_a
> >> >  	struct drm_device *dev = mgr->dev;
> >> >  
> >> >  	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> >> > -	return drm_atomic_get_private_obj_state(state, mgr,
> >> > -						&mst_state_funcs);
> >> > +	return to_dp_mst_topology_state(drm_atomic_get_private_obj_state(state, &mgr->base));
> >> >  }
> >> >  EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
> >> 
> >> I don't think this combines well with...
> >> 
> >> > diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> >> > index 177ab6f86855..d55abb75f29a 100644
> >> > --- a/include/drm/drm_dp_mst_helper.h
> >> > +++ b/include/drm/drm_dp_mst_helper.h
> >> > @@ -404,12 +404,17 @@ struct drm_dp_payload {
> >> >  	int vcpi;
> >> >  };
> >> >  
> >> > +#define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst_topology_state, base)
> >> 
> >> ...this in case of error pointers that
> >> drm_atomic_get_private_obj_state() may return.
> >
> > offsetof(base)==0 so should work in practice.
> 
> Returning zeros is fine, but error pointers are another matter.

Why? This is just 'return ptr-0' so shouldn't matter what you
have in that pointer AFAICS.

-- 
Ville Syrjälä
Intel
