Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E862372934
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 12:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F51C6EAC8;
	Tue,  4 May 2021 10:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA4C6E1DE;
 Tue,  4 May 2021 10:53:00 +0000 (UTC)
IronPort-SDR: ozcfRNmBn95H4eOIHkO1+ugvzlSkG/ihRGViz9JenHy4YIfmai0I4zZ6XjpQGbCTwjEN7FNRvJ
 14vyLb+u4YvA==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="198039000"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="198039000"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 03:52:57 -0700
IronPort-SDR: 8kpud4yKwO3lO7OI/NhGahwX40w8HKTdvNhnjw00lBQzUVw/r4qe8VSwjfRuh5GM1fpq+7RveW
 0+fgQZbF3Nkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="427731060"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga007.jf.intel.com with SMTP; 04 May 2021 03:52:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 May 2021 13:52:54 +0300
Date: Tue, 4 May 2021 13:52:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [Intel-gfx] [PATCH resend 2/2] drm/i915/display: Make
 vlv_find_free_pps() skip pipes which are in use for non DP purposes
Message-ID: <YJEnhuYrKsuvE/XH@intel.com>
References: <20210302120040.94435-1-hdegoede@redhat.com>
 <20210302120040.94435-3-hdegoede@redhat.com>
 <YD5Q8mA6y4/qcelo@intel.com>
 <d620fd9d-1685-3b2a-7c3b-a5d5fa6daddc@redhat.com>
 <YFtGjHEdkMfR3bLr@intel.com>
 <7d9bb155-5e07-161d-c699-581d89b9fb39@redhat.com>
 <YFtOmoklro5vnQsH@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFtOmoklro5vnQsH@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 04:37:14PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Mar 24, 2021 at 03:10:59PM +0100, Hans de Goede wrote:
> > Hi,
> > =

> > On 3/24/21 3:02 PM, Ville Syrj=E4l=E4 wrote:
> > > On Tue, Mar 23, 2021 at 11:39:09AM +0100, Hans de Goede wrote:
> > >> Hi,
> > >>
> > >> On 3/2/21 3:51 PM, Ville Syrj=E4l=E4 wrote:
> > >>> On Tue, Mar 02, 2021 at 01:00:40PM +0100, Hans de Goede wrote:
> > >>>> As explained by a long comment block, on VLV intel_setup_outputs()
> > >>>> sometimes thinks there might be an eDP panel connected while there=
 is none.
> > >>>> In this case intel_setup_outputs() will call intel_dp_init() to ch=
eck.
> > >>>>
> > >>>> In this scenario vlv_find_free_pps() ends up selecting pipe A for =
the pps,
> > >>>> even though this might be in use for non DP purposes. When this is=
 the case
> > >>>> then the assert_pipe() in vlv_force_pll_on() will fail when called=
 from
> > >>>> vlv_power_sequencer_kick().
> > >>>
> > >>> The idea is that you *can* select a PPS from a pipe used for a non-=
DP
> > >>> port since those don't care about the PPS stuff. So this doesn't se=
em
> > >>> correct.
> > >>
> > >> They may not care about the PPS stuff, but as the WARN / backtrace
> > >> shows if the DPLL_VCO_ENABLE bit is not already set for the pipe, wh=
ile
> > >> the pipe is "otherwise" in use then vlv_force_pll_on() becomes unhap=
py
> > >> triggering the WARN.DPLL_VCO_ENABLE bit is not
> > >>
> > >>> a) I would like to see the VBT for this machine
> > >>
> > >> https://fedorapeople.org/~jwrdegoede/voyo-winpad-a15-vbt
> > >>
> > >>> b) I wonder if the DSI PLL is sufficient for getting the PPS going?
> > >>
> > >> I have no idea, I just noticed the WARN / backtrace and this seemed
> > >> like a reasonably way to deal with it. With that said I'm fine with =
fixing
> > >> this a different way.
> > >>
> > >>> c) If we do need the normal DPLL is there any harm to DSI in enabli=
ng it?
> > >>
> > >> I would assume this increases power-consumption and DSI panels are a=
lmost
> > >> always used in battery powered devices.
> > > =

> > > This is just used while probing the panel, so power consumption is
> > > not a concern.
> > =

> > Sorry I misinterpreted what you wrote, I interpreted it as have the DSI
> > code enable it to avoid this problem. I see now that that is now what
> > you meant.
> > =

> > >> Also this would impact all BYT/CHT devices, possible triggering unwa=
nted
> > >> side-effects. Where as the proposed fix below is much more narrowly =
targeted
> > >> at the problem. It might not be the most pretty fix but AFAICT it ha=
s a low
> > >> risk of causing regressions.
> > > =

> > > It rather significantly changes the logic of the workaround, potentia=
lly
> > > causing us to not find a free PPS at all. Eg. if you were to boot with
> > > a VLV with pipe A -> eDP B + eDP C inactive + pipe B -> VGA then your
> > > change would cause us to not find the free pipe B PPS for probing eDP=
 C,
> > > and in the end we'd get a WARN and fall back to pipe A PPS which would
> > > clobber the actually in use pipe A PPS.
> > =

> > I would welcome, and will happily test, another fix for this. ATM we
> > have a WARN triggering on actual hardware (and not just in a hypothetic=
al
> > example) and I would like to see that WARN fixed. If you can come up wi=
th
> > a better fix I would be happy to test.
> =

> Well, I think there are a couple things we want to experiment wiht:
> =

> a) Just skip the asserts and see if enabling the DPLL/poking the PPS
>    perturbs the DSI output in any way.
> =

> --- a/drivers/gpu/drm/i915/display/intel_dpll.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll.c
> @@ -1467,7 +1467,7 @@ void vlv_enable_pll(struct intel_crtc *crtc,
>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
>  	enum pipe pipe =3D crtc->pipe;
>  =

> -	assert_pipe_disabled(dev_priv, pipe_config->cpu_transcoder);
> +	//assert_pipe_disabled(dev_priv, pipe_config->cpu_transcoder);
>  =

>  	/* PLL is protected by panel, make sure we can write it */
>  	assert_panel_unlocked(dev_priv, pipe);
> @@ -1800,7 +1800,7 @@ void vlv_disable_pll(struct drm_i915_private *dev_p=
riv, enum pipe pipe)
>  	u32 val;
>  =

>  	/* Make sure the pipe isn't still relying on us */
> -	assert_pipe_disabled(dev_priv, (enum transcoder)pipe);
> +	//assert_pipe_disabled(dev_priv, (enum transcoder)pipe);
>  =

>  	val =3D DPLL_INTEGRATED_REF_CLK_VLV |
>  		DPLL_REF_CLK_ENABLE_VLV | DPLL_VGA_MODE_DIS;
> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -110,6 +110,8 @@ vlv_power_sequencer_kick(struct intel_dp *intel_dp)
>  	intel_de_write(dev_priv, intel_dp->output_reg, DP & ~DP_PORT_EN);
>  	intel_de_posting_read(dev_priv, intel_dp->output_reg);
>  =

> +	msleep(1000); // just to make sure we keep angering DSI for a bit longer
> +
>  	if (!pll_enabled) {
>  		vlv_force_pll_off(dev_priv, pipe);
>  =

> =

> b) Don't enable the DPLL at all and see if the DSI PLL is capable of
>    clocking the PPS. My gut feeling says this will not work and we
>    should see the PPS state machine not make progress, but not sure.
> =

> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -77,7 +77,7 @@ vlv_power_sequencer_kick(struct intel_dp *intel_dp)
>  	else
>  		DP |=3D DP_PIPE_SEL(pipe);
>  =

> -	pll_enabled =3D intel_de_read(dev_priv, DPLL(pipe)) & DPLL_VCO_ENABLE;
> +	pll_enabled =3D true;//intel_de_read(dev_priv, DPLL(pipe)) & DPLL_VCO_E=
NABLE;
>  =

>  	/*
>  	 * The DPLL for the pipe must be enabled for this to work.
> =

> I do have DSI VLV machine at the office, so I can also try to poke it a
> bit next time I'm at the office.

Finally managed to frob the VLV DSI a bit.

I pushed a couple of ideas here:
git://github.com/vsyrjala/linux.git vlv_pps_vs_dsi

The first patch just skips the DPLL forcing if the pipe
is already on. At least the power sequencer didn't get totally
upset about it, but it can cause some visual issues for the DSI
output; the screen just goes all gray while the DP port is =

temporarily enabled, though I guess that might also happen
with HDMI/CRT outputs, haven't actually double checked that
so not sure.

The other more complicated patch tries to avoid touching
the PPS on any pipe currently driving DSI. Not sure if it's
worth the extra complexity for this niche use case if the
simple approach of just not forcing the DPLL works well
enough.

The third approach I didn't even impelement would be just declare
DSI and eDP mutually exclusive. But in theory the display engine
at least supports such mixed configurations, not so sure about
the pin muxing on SoC though.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
