Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC7348242C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 14:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2516310E21F;
	Fri, 31 Dec 2021 13:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603D110E21F;
 Fri, 31 Dec 2021 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640957017; x=1672493017;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3U1m5dV+LX9hqYpSjP4IKQuDf37N/Q5YIFeiIoF4Hgs=;
 b=AFxgkBl40a4IaTsg6aEqE9gO/6fGA4dM4evt3e//s3xa3JYlPjlQf2Oz
 xffO8eTpZ04ZAADQ5V/FnS2V7lFdxUa4itrD9yw5pEgXHJkMZk81ecbEJ
 lTJwbX+mI/lqQgXzXvomJaf9QrNUFVJwdjTEf93lCTyIfFLL4GKQHnfFE
 VlYnVFZ1vljjzShPStUzmsxaJ/Ad9iprxI0SXl9sHW5j+6UOK44B41pXU
 1No6W80Ix9XRsuEirqEOB+bU723x1pu+LJtnbr0AMk9ClPvOTfBOhAPzH
 u8nZUbvuhxbprzUOEBuTDewhFjt3CmmJVqgccLBQikKtB8ex+cPAShcdo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="240597241"
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; d="scan'208";a="240597241"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2021 05:23:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; d="scan'208";a="470946826"
Received: from arudakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.25.42])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2021 05:23:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/atomic: Make private objs proper objects
In-Reply-To: <20170712155102.26276-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20170712155102.26276-1-ville.syrjala@linux.intel.com>
 <20170712155102.26276-3-ville.syrjala@linux.intel.com>
Date: Fri, 31 Dec 2021 15:23:31 +0200
Message-ID: <87tueoj4bw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2017, ville.syrjala@linux.intel.com wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Make the atomic private object stuff less special by introducing proper
> base classes for the object and its state. Drivers can embed these in
> their own appropriate objects, after which these things will work
> exactly like the plane/crtc/connector states during atomic operations.
>
> v2: Reorder to not depend on drm_dynarray (Daniel)
>
> Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> #v1
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Stumbled upon an old commit

commit a4370c777406c2810e37fafd166ccddecdb2a60c
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Date:   Wed Jul 12 18:51:02 2017 +0300

    drm/atomic: Make private objs proper objects

which is this patch.

> @@ -3050,8 +3043,7 @@ struct drm_dp_mst_topology_state *drm_atomic_get_ms=
t_topology_state(struct drm_a
>  	struct drm_device *dev =3D mgr->dev;
>=20=20
>  	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> -	return drm_atomic_get_private_obj_state(state, mgr,
> -						&mst_state_funcs);
> +	return to_dp_mst_topology_state(drm_atomic_get_private_obj_state(state,=
 &mgr->base));
>  }
>  EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);

I don't think this combines well with...

> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_hel=
per.h
> index 177ab6f86855..d55abb75f29a 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -404,12 +404,17 @@ struct drm_dp_payload {
>  	int vcpi;
>  };
>=20=20
> +#define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst_to=
pology_state, base)

...this in case of error pointers that
drm_atomic_get_private_obj_state() may return.

Is that right, or am I just ready to 'shutdown -h now' for 2021...?


BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
