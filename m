Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 932361EECBF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 23:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916946E415;
	Thu,  4 Jun 2020 21:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7ED6E415;
 Thu,  4 Jun 2020 21:03:24 +0000 (UTC)
IronPort-SDR: UQn2F88JfSYrhCju6oCkeyXwhXnXSjx4w44qOLAFw2hLGpT20vvltzfs7dAqOvp2rnLTu37ysO
 EWAu9dnf19OA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 14:03:24 -0700
IronPort-SDR: DXqMuvXFKNQDydNYwgORt2rZlPupCCoLRyl0lYDQhOHb6we1HyEVeh2ZnYxxZ6zqWIjJh+kv/b
 qEveJCopPKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; d="scan'208";a="258479430"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 04 Jun 2020 14:03:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Jun 2020 00:03:19 +0300
Date: Fri, 5 Jun 2020 00:03:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: DP PHY compliance for JSL
Message-ID: <20200604210319.GJ6112@intel.com>
References: <1591247028-5868-1-git-send-email-vidya.srinivas@intel.com>
 <20200604190612.GI6112@intel.com>
 <fea323968324ceefe813d34d80fdd9779614aa01.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fea323968324ceefe813d34d80fdd9779614aa01.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Srinivas, Vidya" <vidya.srinivas@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 04, 2020 at 08:01:03PM +0000, Almahallawy, Khaled wrote:
> On Thu, 2020-06-04 at 22:06 +0300, Ville Syrj=E4l=E4 wrote:
> > On Thu, Jun 04, 2020 at 10:33:48AM +0530, Vidya Srinivas wrote:
> > > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp.c | 40
> > > ++++++++++++++++++++++++++-------
> > >  1 file changed, 32 insertions(+), 8 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > > b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 7223367171d1..44663e8ac9a1 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -5470,22 +5470,32 @@ intel_dp_autotest_phy_ddi_disable(struct
> > > intel_dp *intel_dp)
> > >  	struct drm_i915_private *dev_priv =3D to_i915(dev);
> > >  	struct intel_crtc *crtc =3D to_intel_crtc(intel_dig_port-
> > > >base.base.crtc);
> > >  	enum pipe pipe =3D crtc->pipe;
> > > -	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > dp_tp_ctl_value;
> > > +	u32 trans_ddi_func_ctl_value, trans_conf_value,
> > > dp_tp_ctl_value, trans_ddi_port_mask;
> > > +	enum port port =3D intel_dig_port->base.port;
> > > +	i915_reg_t dp_tp_reg;
> > > +
> > > +	if (IS_ELKHARTLAKE(dev_priv)) {
> > > +		dp_tp_reg =3D DP_TP_CTL(port);
> > > +		trans_ddi_port_mask =3D TRANS_DDI_PORT_MASK;
> > > +	} else if (IS_TIGERLAKE(dev_priv)) {
> > > +		dp_tp_reg =3D TGL_DP_TP_CTL(pipe);
> > > +		trans_ddi_port_mask =3D TGL_TRANS_DDI_PORT_MASK;
> > > +	}
> > >  =

> > >  	trans_ddi_func_ctl_value =3D intel_de_read(dev_priv,
> > >  						 TRANS_DDI_FUNC_CTL(pip
> > > e));
> > >  	trans_conf_value =3D intel_de_read(dev_priv, PIPECONF(pipe));
> > > -	dp_tp_ctl_value =3D intel_de_read(dev_priv, TGL_DP_TP_CTL(pipe));
> > >  =

> > > +	dp_tp_ctl_value =3D intel_de_read(dev_priv, dp_tp_reg);
> > >  	trans_ddi_func_ctl_value &=3D ~(TRANS_DDI_FUNC_ENABLE |
> > > -				      TGL_TRANS_DDI_PORT_MASK);
> > > +					trans_ddi_port_mask);
> > >  	trans_conf_value &=3D ~PIPECONF_ENABLE;
> > >  	dp_tp_ctl_value &=3D ~DP_TP_CTL_ENABLE;
> > >  =

> > >  	intel_de_write(dev_priv, PIPECONF(pipe), trans_conf_value);
> > >  	intel_de_write(dev_priv, TRANS_DDI_FUNC_CTL(pipe),
> > >  		       trans_ddi_func_ctl_value);
> > > -	intel_de_write(dev_priv, TGL_DP_TP_CTL(pipe), dp_tp_ctl_value);
> > > +	intel_de_write(dev_priv, dp_tp_reg, dp_tp_ctl_value);
> > =

> > All this ad-hoc modeset code really should not exist. It's going to
> > have different bugs than the norma modeset paths, so compliance
> > testing
> > this special code proves absolutely nothing about the normal modeset
> > code. IMO someone needs to take up the task of rewrtiting all this to
> > just perform normal modesets.
> =

> Agree. I've just found that we get kernel NULL pointer dereference and
> panic when we try to access to_intel_crtc(intel_dig_port-
> >base.base.crtc).

Yeah, that's a legacy pointer which should no longer be used at all
with atomic drivers. I'm slowly trying to clear out all this legacy
cruft. The next step I had hoped to take was
https://patchwork.freedesktop.org/series/76993/ but then this
compliacnce stuff landed and threw another wrench into the works.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
