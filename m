Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B862B3521CA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 23:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A353F6ED9C;
	Thu,  1 Apr 2021 21:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F486ED84;
 Thu,  1 Apr 2021 21:42:39 +0000 (UTC)
IronPort-SDR: 6HUZ5VbNbHQAt3zXjHklm2gHXlSc42b53CVE0NeORMsfyUrYJo6r3Y7t4CyKNbB4uqQ272W6Le
 BM+nrRijMUjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="190105800"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="190105800"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 14:42:39 -0700
IronPort-SDR: o3d/DUoF9LzhOTidnrLAjU24MXOKJUcrfv8km+FJG/hkSq+LUr4zq66niCenwopMeyO8+cYDe0
 BcUY1eVp/f2A==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="456162371"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 14:42:38 -0700
Date: Thu, 1 Apr 2021 14:49:13 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <20210401214908.GA24310@labuser-Z97X-UD5H>
References: <20210309111350.3be0543f@eldfell>
 <CAKMK7uEak_2YNDZpyho5bBhhYCvoXh6MoPNL6FmV9sU8oELGPA@mail.gmail.com>
 <20210318230126.GA1900@labuser-Z97X-UD5H>
 <YFS7mINBWsHiYIKm@intel.com>
 <20210319205413.GA6359@labuser-Z97X-UD5H>
 <YFUTyb6ofKRI12hO@intel.com>
 <20210319212624.GA6560@labuser-Z97X-UD5H>
 <YFUXX/pDcBheiNWL@intel.com>
 <20210325220127.GA28898@labuser-Z97X-UD5H>
 <YF4ImoReniVIz+TT@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YF4ImoReniVIz+TT@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 06:15:22PM +0200, Ville Syrj=E4l=E4 wrote:
> On Thu, Mar 25, 2021 at 03:01:29PM -0700, Navare, Manasi wrote:
> > On Fri, Mar 19, 2021 at 11:27:59PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Fri, Mar 19, 2021 at 02:26:24PM -0700, Navare, Manasi wrote:
> > > > On Fri, Mar 19, 2021 at 11:12:41PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > > On Fri, Mar 19, 2021 at 01:54:13PM -0700, Navare, Manasi wrote:
> > > > > > On Fri, Mar 19, 2021 at 04:56:24PM +0200, Ville Syrj=E4l=E4 wro=
te:
> > > > > > > On Thu, Mar 18, 2021 at 04:01:26PM -0700, Navare, Manasi wrot=
e:
> > > > > > > > So basically we see this warning only in case of bigjoiner =
when
> > > > > > > > drm_atomic_check gets called without setting the state->all=
ow_modeset flag.
> > > > > > > =

> > > > > > > Considering the code is 'WARN(!state->allow_modeset, ...' that
> > > > > > > fact should be rather obvious.
> > > > > > > =

> > > > > > > > =

> > > > > > > > So do you think that in i915, in intel_atomic_check_bigjoin=
er() we should only
> > > > > > > > steal the crtc when allow_modeset flag is set in state?
> > > > > > > =

> > > > > > > No. If you fully read drm_atomic_check_only() you will observe
> > > > > > > that it will reject any commit w/ allow_modeset=3D=3Dfalse wh=
ich =

> > > > > > > needs a modeset. And it does that before the WARN.
> > > > > > > =

> > > > > > > So you're barking up the wrong tree here. The problem I think
> > > > > > > is that you're just computing requested_crtcs wrong.
> > > > > > =

> > > > > > So here in this case, requested CRTC =3D 0x1 since it requests =
modeset on CRTC 0
> > > > > > Now in teh atomic check, it steals the slave CRTC 1 and hence a=
ffected CRTC comes out
> > > > > > as 0x3 and hence the mismatch.
> > > > > =

> > > > > Hmm. How can it be 0x3 if we filtered out the uapi.enable=3D=3Dfa=
lse case?
> > > > > =

> > > > =

> > > > Yes if I add that condition like in this patch then it correctly ca=
lculates
> > > > the affected crtc bitmask as only 0x1 since it doesnt include the s=
lave crtc.
> > > > So with this patch, requested crtc =3D 0x 1, affected crtc =3D 0x1
> > > > =

> > > > If this looks good then this fixes our bigjoiner warnings.
> > > > Does this patch look good to you as is then?
> > > =

> > > I think you still need to fix the requested_crtcs calculation.
> > =

> > We calculate requested crtc at the beginning :
> > for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> >                 requested_crtc |=3D drm_crtc_mask(crtc);
> > =

> > Are you suggesting adding this to after:
> >  if (config->funcs->atomic_check) {
> >                 ret =3D config->funcs->atomic_check(state->dev, state);
> > =

> >                 if (ret) {
> >                         DRM_DEBUG_ATOMIC("atomic driver check for %p fa=
iled: %d\n",
> >                                          state, ret);
> >                         return ret;
> >                 }
> > 		requested_crtc |=3D drm_crtc_mask(crtc);    // Here it will have requ=
ested crtc =3D 0x11
> >         }
> > =

> > in this case here the state should already have master crtc 0 and slave=
 crtc 1
> > and that requested crtc should already be 0x11
> > =

> > Then in that case we dont need any special check for calculating affect=
ed crtc, that also will be 0x11
> =

> All I'm saying is that you're currently calculating requested_crtcs and
> affected_crtcs differently. So I'm not at all surprised that they might
> not match.
>

I dont get your point yet.
requested crtc is calculated before the atomic check call and we dont check=
 for crtc uapi.enable to be true.
And hence requested crtc  =3D CRTC 0 =3D 0x2
After I added the check in this patch where affected crtc will include only=
 the crtcs that have uapi.enable =3D true
then  it perfectly matches the requested crtc and return 0x2 but without th=
is check when the calculation of
requested and affected crtc is the same is where we see the affected crtc =
=3D CRTC 0 and 1 =3D 0x3

So when the calculation is different infcat we dont see the mismatch

What is your point here?

Manasi
> -- =

> Ville Syrj=E4l=E4
> Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
