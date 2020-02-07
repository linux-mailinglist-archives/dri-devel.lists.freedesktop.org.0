Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD698155BE2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 17:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39ADD6FD26;
	Fri,  7 Feb 2020 16:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7576FD1B;
 Fri,  7 Feb 2020 16:34:51 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 08:34:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,414,1574150400"; d="scan'208";a="250462951"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 07 Feb 2020 08:34:48 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 18:34:47 +0200
Date: Fri, 7 Feb 2020 18:34:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH v2 1/6] drm: Include the encoder itself in
 possible_clones
Message-ID: <20200207163447.GN13686@intel.com>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-2-ville.syrjala@linux.intel.com>
 <d58f13cf-6c9e-9a1c-5cbd-e51e1ad04e80@suse.de>
 <20200207145001.GI13686@intel.com>
 <20200207162751.GJ43062@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207162751.GJ43062@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 05:27:51PM +0100, Daniel Vetter wrote:
> On Fri, Feb 07, 2020 at 04:50:01PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Fri, Feb 07, 2020 at 03:28:35PM +0100, Thomas Zimmermann wrote:
> > > Hi
> > > =

> > > Am 07.02.20 um 14:59 schrieb Ville Syrjala:
> > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > =

> > > > The docs say possible_clones should always include the encoder itse=
lf.
> > > > Since most drivers don't want to deal with the complexities of clon=
ing
> > > > let's allow them to set possible_clones=3D0 and instead we'll fix t=
hat
> > > > up in the core.
> > > > =

> > > > We can't put this special case into drm_encoder_init() because driv=
ers
> > > > will have to fill up possible_clones after adding all the relevant
> > > > encoders. Otherwise they wouldn't know the proper encoder indexes to
> > > > use. So we'll just do it just before registering the encoders.
> > > > =

> > > > TODO: Should we do something similar for possible_crtcs=3D=3D0?
> > > > =

> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > =

> > > May this fixup function should warn iff possible_clones was set to no=
n-0
> > > by the driver, but the encoder itself is missing.
> > =

> > Yeah, I guess we could do that.
> =

> +1 on that, should catch some bugs at least.
> =

> Also can you pls fix up the kerneldoc for drm_encoder.possible_clones,
> defacto this now means that 0 is a totally fine setting.

Sure.

And for possible_crtcs I was thinking similar concept:

for_each_encoder()
	if (possible_crtc =3D=3D 0)
		possible_crtcs =3D all_crtc_mask;

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
