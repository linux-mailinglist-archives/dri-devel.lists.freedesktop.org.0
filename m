Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FEE2BB119
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 17:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9716E8D3;
	Fri, 20 Nov 2020 16:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6886E8D3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 16:58:58 +0000 (UTC)
IronPort-SDR: 2SAikYGbV7NTZPYbBkSqSwbKRVHfR7isfM4cWsNSxwXSsQjrSOPGXjZ0MUT0wYzvXdw+jIheEo
 57kr8CtpzapQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="151350766"
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="151350766"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 08:58:57 -0800
IronPort-SDR: NmLAHEkvLJ6RChN9+u3hsIop2BBiuBDe/zlFD1ONBetxpbagGCw1hW3vXGpApyaq3uoUtJpR/e
 wMANHUKpK01w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="369266839"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 20 Nov 2020 08:58:51 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Nov 2020 18:58:50 +0200
Date: Fri, 20 Nov 2020 18:58:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] drm: Pass the full state to connectors atomic functions
Message-ID: <20201120165850.GK6112@intel.com>
References: <20201118094758.506730-1-maxime@cerno.tech>
 <20201119152148.GI6112@intel.com>
 <20201120112557.wxtjzrh4msnphjlx@gilmour>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120112557.wxtjzrh4msnphjlx@gilmour>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 12:25:57PM +0100, Maxime Ripard wrote:
> Hi,
> =

> On Thu, Nov 19, 2020 at 05:21:48PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Wed, Nov 18, 2020 at 10:47:58AM +0100, Maxime Ripard wrote:
> > > The current atomic helpers have either their object state being passe=
d as
> > > an argument or the full atomic state.
> > > =

> > > The former is the pattern that was done at first, before switching to=
 the
> > > latter for new hooks or when it was needed.
> > > =

> > > Now that the CRTCs have been converted, let's move forward with the
> > > connectors to provide a consistent interface.
> > > =

> > > The conversion was done using the coccinelle script below, and built =
tested
> > > on all the drivers.
> > > =

> > > @@
> > > identifier connector, connector_state;
> > > @@
> > > =

> > >  struct drm_connector_helper_funcs {
> > > 	...
> > > 	struct drm_encoder* (*atomic_best_encoder)(struct drm_connector *con=
nector,
> > > -						   struct drm_connector_state *connector_state);
> > > +						   struct drm_atomic_state *state);
> > > 	...
> > > }
> > > =

> > > @@
> > > identifier connector, connector_state;
> > > @@
> > > =

> > >  struct drm_connector_helper_funcs {
> > > 	...
> > > 	void (*atomic_commit)(struct drm_connector *connector,
> > > -			      struct drm_connector_state *connector_state);
> > > +			      struct drm_atomic_state *state);
> > > 	...
> > > }
> > > =

> > > @@
> > > struct drm_connector_helper_funcs *FUNCS;
> > > identifier state;
> > > identifier connector, connector_state;
> > > identifier f;
> > > @@
> > > =

> > >  f(..., struct drm_atomic_state *state, ...)
> > >  {
> > > 	<+...
> > > -	FUNCS->atomic_commit(connector, connector_state);
> > > +	FUNCS->atomic_commit(connector, state);
> > > 	...+>
> > >  }
> > > =

> > > @@
> > > struct drm_connector_helper_funcs *FUNCS;
> > > identifier state;
> > > identifier connector, connector_state;
> > > identifier var, f;
> > > @@
> > > =

> > >  f(struct drm_atomic_state *state, ...)
> > =

> > I think there was some way to deal with these variants using a single
> > rule, but maybe that required the use of the parameter list stuff
> > which IIRC was a bit ugly. Probably not worth the hassle here.
> =

> Do you have any recollection of some patch that used it? I couldn't find
> a cleaner way to deal with it, but I'd really like to use it if
> available.

git log --grep didn't show any commits from me using it at least.
I must have never sent them.

Digging through my pile of old cocci scripts I found a few uses. Eg.:
@r1@
identifier F !~ "_destroy$|_reset$";
identifier E;
parameter list[N] PS;
@@
F(PS,
- struct drm_encoder *E
+ struct intel_encoder *encoder
  ,...)
{ ... }

@@
identifier r1.F;
expression E;
expression list[r1.N] ES;
@@
F(ES,
- E
+ to_intel_encoder(E)
  ,...)

My vague recollection is that it would work for the
N=3D=3D0 case as well.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
