Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F391632BA64
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 21:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D19A6E9C8;
	Wed,  3 Mar 2021 20:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B5B6E9C8;
 Wed,  3 Mar 2021 20:38:53 +0000 (UTC)
IronPort-SDR: 6TDWgRTOwooP/zjSNI9SvJzLANfQZioflWIKHpqCD6gX9VsQ4N6BTb8PxwHfCS2GKCcaqFnbQ+
 sOMYugYVIJxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="183895946"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; d="scan'208";a="183895946"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 12:38:52 -0800
IronPort-SDR: pN9K3TDOnshdZh2IEWKSCKRMyI5B0P10V3dcUzjwoMw10HpQL3dw2leZGbigI7rxYdMyoBeFso
 w5dsERZPmk7w==
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; d="scan'208";a="407406107"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 12:38:51 -0800
Date: Wed, 3 Mar 2021 12:44:33 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <20210303204433.GA15819@labuser-Z97X-UD5H>
References: <20210302204132.12058-1-manasi.d.navare@intel.com>
 <20210303104744.2c064f09@eldfell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303104744.2c064f09@eldfell>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 03, 2021 at 10:47:44AM +0200, Pekka Paalanen wrote:
> On Tue,  2 Mar 2021 12:41:32 -0800
> Manasi Navare <manasi.d.navare@intel.com> wrote:
> =

> > In case of a modeset where a mode gets split across mutiple CRTCs
> > in the driver specific implementation (bigjoiner in i915) we wrongly co=
unt
> > the affected CRTCs based on the drm_crtc_mask and indicate the stolen C=
RTC as
> > an affected CRTC in atomic_check_only().
> > This triggers a warning since affected CRTCs doent match requested CRTC.
> > =

> > To fix this in such bigjoiner configurations, we should only
> > increment affected crtcs if that CRTC is enabled in UAPI not
> > if it is just used internally in the driver to split the mode.
> =

> Hi,
> =

> I think that makes sense to me. Stealing CRTCs that are not currently
> used by the userspace (display server) should be ok, as long as that
> is completely invisible to userspace: meaning that it does not cause
> userspace to unexpectedly e.g. receive or miss per-crtc atomic
> completion events.

Yes since we are only doing atomic_check_only() here, the stolen
crtc is completely invisible to the userspace and hence that is =

indicated by uapi.enable which is not true for this stolen
crtc. However if allow modeset flag set, then it will do a full
modeset and indicate the uapi.enable for this stolen crtc as well
since that cannot be used for other modeset requested by userspace.

> =

> Can that also be asserted somehow, or does this already do that?

Not clear what you want the assertion for? Could you elaborate

Manasi

> =

> =

> Thanks,
> pq
> =

> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> > Cc: Daniel Stone <daniels@collabora.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Manasi Navare <manasi.d.navare@intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index 5b4547e0f775..d7acd6bbd97e 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1358,8 +1358,10 @@ int drm_atomic_check_only(struct drm_atomic_stat=
e *state)
> >  		}
> >  	}
> >  =

> > -	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > -		affected_crtc |=3D drm_crtc_mask(crtc);
> > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > +		if (new_crtc_state->enable)
> > +			affected_crtc |=3D drm_crtc_mask(crtc);
> > +	}
> >  =

> >  	/*
> >  	 * For commits that allow modesets drivers can add other CRTCs to the
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
