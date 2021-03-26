Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E5D34AC63
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 17:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1836F425;
	Fri, 26 Mar 2021 16:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F876F421;
 Fri, 26 Mar 2021 16:15:27 +0000 (UTC)
IronPort-SDR: FtwrJfPjRkG5nzK0TKtlDkj2yFadRbDTY3zAUG0XwSR6WhhXC1/q3Ou4h0w5IfbRyNGkAv36vz
 E3AMePuHRtEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="187891477"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="187891477"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 09:15:26 -0700
IronPort-SDR: CAgqW+zStyWs23Jeva8WM6R/LIlj4zzOsA2bOQ+f4y24ZPOKdv6uKnA9E36oupDSH6YqqtmU+S
 Muyq55vko6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="377290237"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 26 Mar 2021 09:15:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 26 Mar 2021 18:15:22 +0200
Date: Fri, 26 Mar 2021 18:15:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Navare, Manasi" <manasi.d.navare@intel.com>
Subject: Re: [PATCH] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
Message-ID: <YF4ImoReniVIz+TT@intel.com>
References: <20210309005252.GA27491@labuser-Z97X-UD5H>
 <20210309111350.3be0543f@eldfell>
 <CAKMK7uEak_2YNDZpyho5bBhhYCvoXh6MoPNL6FmV9sU8oELGPA@mail.gmail.com>
 <20210318230126.GA1900@labuser-Z97X-UD5H>
 <YFS7mINBWsHiYIKm@intel.com>
 <20210319205413.GA6359@labuser-Z97X-UD5H>
 <YFUTyb6ofKRI12hO@intel.com>
 <20210319212624.GA6560@labuser-Z97X-UD5H>
 <YFUXX/pDcBheiNWL@intel.com>
 <20210325220127.GA28898@labuser-Z97X-UD5H>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325220127.GA28898@labuser-Z97X-UD5H>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 03:01:29PM -0700, Navare, Manasi wrote:
> On Fri, Mar 19, 2021 at 11:27:59PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Fri, Mar 19, 2021 at 02:26:24PM -0700, Navare, Manasi wrote:
> > > On Fri, Mar 19, 2021 at 11:12:41PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > On Fri, Mar 19, 2021 at 01:54:13PM -0700, Navare, Manasi wrote:
> > > > > On Fri, Mar 19, 2021 at 04:56:24PM +0200, Ville Syrj=E4l=E4 wrote:
> > > > > > On Thu, Mar 18, 2021 at 04:01:26PM -0700, Navare, Manasi wrote:
> > > > > > > So basically we see this warning only in case of bigjoiner wh=
en
> > > > > > > drm_atomic_check gets called without setting the state->allow=
_modeset flag.
> > > > > > =

> > > > > > Considering the code is 'WARN(!state->allow_modeset, ...' that
> > > > > > fact should be rather obvious.
> > > > > > =

> > > > > > > =

> > > > > > > So do you think that in i915, in intel_atomic_check_bigjoiner=
() we should only
> > > > > > > steal the crtc when allow_modeset flag is set in state?
> > > > > > =

> > > > > > No. If you fully read drm_atomic_check_only() you will observe
> > > > > > that it will reject any commit w/ allow_modeset=3D=3Dfalse whic=
h =

> > > > > > needs a modeset. And it does that before the WARN.
> > > > > > =

> > > > > > So you're barking up the wrong tree here. The problem I think
> > > > > > is that you're just computing requested_crtcs wrong.
> > > > > =

> > > > > So here in this case, requested CRTC =3D 0x1 since it requests mo=
deset on CRTC 0
> > > > > Now in teh atomic check, it steals the slave CRTC 1 and hence aff=
ected CRTC comes out
> > > > > as 0x3 and hence the mismatch.
> > > > =

> > > > Hmm. How can it be 0x3 if we filtered out the uapi.enable=3D=3Dfals=
e case?
> > > > =

> > > =

> > > Yes if I add that condition like in this patch then it correctly calc=
ulates
> > > the affected crtc bitmask as only 0x1 since it doesnt include the sla=
ve crtc.
> > > So with this patch, requested crtc =3D 0x 1, affected crtc =3D 0x1
> > > =

> > > If this looks good then this fixes our bigjoiner warnings.
> > > Does this patch look good to you as is then?
> > =

> > I think you still need to fix the requested_crtcs calculation.
> =

> We calculate requested crtc at the beginning :
> for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
>                 requested_crtc |=3D drm_crtc_mask(crtc);
> =

> Are you suggesting adding this to after:
>  if (config->funcs->atomic_check) {
>                 ret =3D config->funcs->atomic_check(state->dev, state);
> =

>                 if (ret) {
>                         DRM_DEBUG_ATOMIC("atomic driver check for %p fail=
ed: %d\n",
>                                          state, ret);
>                         return ret;
>                 }
> 		requested_crtc |=3D drm_crtc_mask(crtc);    // Here it will have reques=
ted crtc =3D 0x11
>         }
> =

> in this case here the state should already have master crtc 0 and slave c=
rtc 1
> and that requested crtc should already be 0x11
> =

> Then in that case we dont need any special check for calculating affected=
 crtc, that also will be 0x11

All I'm saying is that you're currently calculating requested_crtcs and
affected_crtcs differently. So I'm not at all surprised that they might
not match.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
