Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F3183223
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 14:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5606EAC8;
	Thu, 12 Mar 2020 13:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EE56EAC8;
 Thu, 12 Mar 2020 13:54:45 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 06:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="235028953"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 12 Mar 2020 06:54:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 12 Mar 2020 15:54:38 +0200
Date: Thu, 12 Mar 2020 15:54:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Laxminarayan Bharadiya, Pankaj" <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [RFC][PATCH 5/5] drm/i915/display: Add Nearest-neighbor based
 integer scaling support
Message-ID: <20200312135438.GF13686@intel.com>
References: <20200225070545.4482-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200225070545.4482-6-pankaj.laxminarayan.bharadiya@intel.com>
 <20200310161723.GK13686@intel.com>
 <E92BA18FDE0A5B43B7B3DA7FCA031286057B2C55@BGSMSX107.gar.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E92BA18FDE0A5B43B7B3DA7FCA031286057B2C55@BGSMSX107.gar.corp.intel.com>
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@linux.ie" <airlied@linux.ie>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Souza,
 Jose" <jose.souza@intel.com>, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "mihail.atanassov@arm.com" <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 12, 2020 at 09:13:24AM +0000, Laxminarayan Bharadiya, Pankaj wr=
ote:
> =

> =

> > -----Original Message-----
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Sent: 10 March 2020 21:47
> > To: Laxminarayan Bharadiya, Pankaj
> > <pankaj.laxminarayan.bharadiya@intel.com>
> > Cc: jani.nikula@linux.intel.com; daniel@ffwll.ch; intel-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; airlied@lin=
ux.ie;
> > maarten.lankhorst@linux.intel.com; tzimmermann@suse.de;
> > mripard@kernel.org; mihail.atanassov@arm.com; Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.co=
m>;
> > Chris Wilson <chris@chris-wilson.co.uk>; Souza, Jose
> > <jose.souza@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>;
> > Roper, Matthew D <matthew.d.roper@intel.com>; Deak, Imre
> > <imre.deak@intel.com>; Shankar, Uma <uma.shankar@intel.com>; linux-
> > kernel@vger.kernel.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> > Subject: Re: [RFC][PATCH 5/5] drm/i915/display: Add Nearest-neighbor
> > based integer scaling support
> > =

> > On Tue, Feb 25, 2020 at 12:35:45PM +0530, Pankaj Bharadiya wrote:
> > > Integer scaling (IS) is a nearest-neighbor upscaling technique that
> > > simply scales up the existing pixels by an integer (i.e., whole
> > > number) multiplier.Nearest-neighbor (NN) interpolation works by
> > > filling in the missing color values in the upscaled image with that of
> > > the coordinate-mapped nearest source pixel value.
> > >
> > > Both IS and NN preserve the clarity of the original image. Integer
> > > scaling is particularly useful for pixel art games that rely on sharp,
> > > blocky images to deliver their distinctive look.
> > >
> > > Program the scaler filter coefficients to enable the NN filter if
> > > scaling filter property is set to DRM_SCALING_FILTER_NEAREST_NEIGHBOR
> > > and enable integer scaling.
> > >
> > > Bspec: 49247
> > >
> > > Signed-off-by: Pankaj Bharadiya
> > > <pankaj.laxminarayan.bharadiya@intel.com>
> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_display.c | 83
> > > +++++++++++++++++++-  drivers/gpu/drm/i915/display/intel_display.h |
> > > 2 +  drivers/gpu/drm/i915/display/intel_sprite.c  | 20 +++--
> > >  3 files changed, 97 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > > b/drivers/gpu/drm/i915/display/intel_display.c
> > > index b5903ef3c5a0..6d5f59203258 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > @@ -6237,6 +6237,73 @@ void skl_scaler_disable(const struct
> > intel_crtc_state *old_crtc_state)
> > >  		skl_detach_scaler(crtc, i);
> > >  }
> > >
> > > +/**
> > > + *  Theory behind setting nearest-neighbor integer scaling:
> > > + *
> > > + *  17 phase of 7 taps requires 119 coefficients in 60 dwords per se=
t.
> > > + *  The letter represents the filter tap (D is the center tap) and
> > > +the number
> > > + *  represents the coefficient set for a phase (0-16).
> > > + *
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |Index value | Data value coeffient 1 | Data value coeffi=
ent 2 |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   00h      |          B0            |          A0      =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   01h      |          D0            |          C0      =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   02h      |          F0            |          E0      =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   03h      |          A1            |          G0      =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   04h      |          C1            |          B1      =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   ...      |          ...           |          ...     =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   38h      |          B16           |          A16     =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   39h      |          D16           |          C16     =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   3Ah      |          F16           |          C16     =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *         |   3Bh      |        Reserved        |          G16     =
      |
> > > + *         +------------+------------------------+------------------=
------+
> > > + *
> > > + *  To enable nearest-neighbor scaling:  program scaler coefficents
> > > +with
> > > + *  the center tap (Dxx) values set to 1 and all other values set to
> > > +0 as per
> > > + *  SCALER_COEFFICIENT_FORMAT
> > > + *
> > > + */
> > > +void skl_setup_nearest_neighbor_filter(struct drm_i915_private
> > *dev_priv,
> > > +				  enum pipe pipe, int scaler_id)
> > =

> > skl_scaler_...
> > =

> > > +{
> > > +
> > > +	int coeff =3D 0;
> > > +	int phase =3D 0;
> > > +	int tap;
> > > +	int val =3D 0;
> > =

> > Needlessly wide scope for most of these.
> > =

> > > +
> > > +	/*enable the index auto increment.*/
> > > +	intel_de_write_fw(dev_priv, SKL_PS_COEF_INDEX_SET0(pipe,
> > scaler_id),
> > > +			  _PS_COEE_INDEX_AUTO_INC);
> > > +
> > > +	for (phase =3D 0; phase < 17; phase++) {
> > > +		for (tap =3D 0; tap < 7; tap++) {
> > > +			coeff++;
> > =

> > Can be part of the % check.
> =

> OK.
> =

> > =

> > > +			if (tap =3D=3D 3)
> > > +				val =3D (phase % 2) ? (0x800) : (0x800 << 16);
> > =

> > Parens overload.
> =

> OK. Will remove.
> > =

> > > +
> > > +			if (coeff % 2 =3D=3D 0) {
> > > +				intel_de_write_fw(dev_priv,
> > SKL_PS_COEF_DATA_SET0(pipe, scaler_id), val);
> > > +				val =3D 0;
> > =

> > Can drop this val=3D0 if you move the variable into tight scope and ini=
tialize
> > there.
> =

> Moving val=3D0 initialization to the tight scope will not work here as we=
 need
> to retain "val" and write only when 2 coefficients are ready (since 2 =

> coefficients are packed in 1 dword).
> =

> e.g. for (12th , 11th)  coefficients, coefficient reg value should be ( (=
0 << 16) | 0x800).
> If we initialize val =3D 0 in tight loop, 0 will be written to  coefficie=
nt register.

Hmm, right. I guess I'd try to rearrange this to iterate the
registers directly instead of the phases and taps. Something
like this perhaps:

static int cnl_coef_tap(int i)
{
	return i % 7;
}

static u16 cnl_coef(int t)
{
	return t =3D=3D 3 ? 0x0800 : 0x3000;
}

static void cnl_program_nearest_filter_coefs(void)
{
	int i;

	for (i =3D 0; i < 17 * 7; i +=3D 2) {
		uint32_t tmp;
		int t;

		t =3D cnl_coef_tap(i);
		tmp =3D cnl_nearest_filter_coef(t);

		t =3D cnl_coef_tap(i + 1);
		tmp |=3D cnl_nearest_filter_coef(t) << 16;

		intel_de_write_fw(tmp);
	}
}

More readable I think. The downside being all those modulo operations
but hopefully that's all in the noise when it comes to performance.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
