Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3A13ACB1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 15:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C3C6E3FE;
	Tue, 14 Jan 2020 14:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FE26E3FE;
 Tue, 14 Jan 2020 14:55:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 06:55:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,433,1571727600"; d="scan'208";a="242495126"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 14 Jan 2020 06:55:42 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 14 Jan 2020 16:55:41 +0200
Date: Tue, 14 Jan 2020 16:55:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915: Re-init lspcon after HPD if lspcon probe
 failed
Message-ID: <20200114145541.GW13686@intel.com>
References: <20191224084251.28414-1-kai.heng.feng@canonical.com>
 <85235F00-7FBA-46E4-B7A5-45294DE1B824@canonical.com>
 <87ftgiku03.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ftgiku03.fsf@intel.com>
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, swati2.sharma@intel.com,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2020 at 04:11:40PM +0200, Jani Nikula wrote:
> On Mon, 06 Jan 2020, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> > Hi Jani,
> >
> >> On Dec 24, 2019, at 16:42, Kai-Heng Feng <kai.heng.feng@canonical.com>=
 wrote:
> >> =

> >> On HP 800 G4 DM, if HDMI cable isn't plugged before boot, the HDMI port
> >> becomes useless and never responds to cable hotplugging:
> >> [    3.031904] [drm:lspcon_init [i915]] *ERROR* Failed to probe lspcon
> >> [    3.031945] [drm:intel_ddi_init [i915]] *ERROR* LSPCON init failed =
on port D
> >> =

> >> Seems like the lspcon chip on the system in question only gets powered
> >> after the cable is plugged.
> >> =

> >> So let's call lspcon_init() dynamically to properly initialize the
> >> lspcon chip and make HDMI port work.
> >
> > Do you have any further suggestion for this patch?
> =

> Sorry for taking so long. Comments inline.
> =

> >
> > Kai-Heng
> >
> >> =

> >> Closes: https://gitlab.freedesktop.org/drm/intel/issues/203
> >> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >> ---
> >> v3:
> >> - Make sure it's handled under long HPD case.
> >> =

> >> v2: =

> >> - Move lspcon_init() inside of intel_dp_hpd_pulse().
> >> =

> >> drivers/gpu/drm/i915/display/intel_dp.c | 8 +++++++-
> >> 1 file changed, 7 insertions(+), 1 deletion(-)
> >> =

> >> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm=
/i915/display/intel_dp.c
> >> index fe31bbfd6c62..a72c9c041c60 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> >> @@ -6573,6 +6573,7 @@ enum irqreturn
> >> intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_port, bool lon=
g_hpd)
> >> {
> >> 	struct intel_dp *intel_dp =3D &intel_dig_port->dp;
> >> +	struct drm_i915_private *dev_priv =3D dp_to_i915(intel_dp);
> >> =

> >> 	if (long_hpd && intel_dig_port->base.type =3D=3D INTEL_OUTPUT_EDP) {
> >> 		/*
> >> @@ -6593,7 +6594,12 @@ intel_dp_hpd_pulse(struct intel_digital_port *i=
ntel_dig_port, bool long_hpd)
> >> 		      long_hpd ? "long" : "short");
> >> =

> >> 	if (long_hpd) {
> >> -		intel_dp->reset_link_params =3D true;
> >> +		if (intel_dig_port->base.type =3D=3D INTEL_OUTPUT_DDI &&
> >> +		    HAS_LSPCON(dev_priv) && !intel_dig_port->lspcon.active)
> >> +			lspcon_init(intel_dig_port);
> >> +		else
> >> +			intel_dp->reset_link_params =3D true;
> >> +
> =

> Hmm, I think this will try to init lspcon on ports that do not have
> lspcon. Also, why wouldn't we reset the params?
> =

> I think this boils down to just adding the following lines:
> =

> 	if (intel_bios_is_lspcon_present(dev_priv, intel_dig_port->base.port) &&
>             !intel_dig_port->lspcon.active)
> 		lspcon_init(intel_dig_port);
> =

> =

> Ville?

This won't work right. Eg. intel_infoframe_init() assumes that lspcon
init happens during driver load. We should probably change that to just
trust the VBT and simply move the lspcon probe (if we even need one)
into dp_detect() instead of sprinkling it around in several places.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
