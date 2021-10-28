Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2C943E1A6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535106E0D6;
	Thu, 28 Oct 2021 13:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2426E090;
 Thu, 28 Oct 2021 13:08:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="211171693"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="211171693"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="498390859"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 28 Oct 2021 06:08:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 28 Oct 2021 16:08:16 +0300
Date: Thu, 28 Oct 2021 16:08:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Tsuchiya Yuto <kitakar@gmail.com>
Subject: Re: [PATCH] drm/i915: Add NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk
Message-ID: <YXqgwOA53rUB3vYJ@intel.com>
References: <20211024155010.126275-1-hdegoede@redhat.com>
 <YXlWVtnaTUEJ6yQs@intel.com>
 <7e74d851-b575-0f7b-34be-b389bd6323ca@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e74d851-b575-0f7b-34be-b389bd6323ca@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 27, 2021 at 08:39:57PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 10/27/21 15:38, Ville Syrjälä wrote:
> > On Sun, Oct 24, 2021 at 05:50:10PM +0200, Hans de Goede wrote:
> >> Add a NO_VLV_DISP_PW_DPIO_CMN_BC_INIT quirk to fix i915 not working on
> >> the Xiaomi Mi Pad 2 (with CHT x5-Z8500 SoC).
> >>
> >> The Xiaomi Mi Pad 2 uses quite an unusual hardware-design for a Cherry
> >> Trail tablet. It deviates from the typical reference design based tablets
> >> in many ways.
> >>
> >> The Mi Pad 2 does not have any DisplayPort or HDMI outouts. I suspect that
> >> as part of its unusual design it also has some supply rail which is only
> >> used for DisplayPort or HDMI not connected.
> > 
> > Do we have the VBT somewhere (preferable attached to a bug report)?
> > Maybe we can avoid an ugly quirk.
> 
> I agree that solving this in a way where we can avoid the quirk would be great.
> 
> I've filed an issue for this here now:
> 
> https://gitlab.freedesktop.org/drm/intel/-/issues/4385
> 
> This has a dump of /sys/kernel/debug/dri/0/i915_vbt as well as
> dmesg output from a boot with drm.debug=0x1e attached (from a boot
> with this patch, since otherwise the system hangs).
> 
> >>
> >> Force-enabling the dpio-common-bc powerwell as the i915 normal does at boot
> >> appears to cause the P-Unit to hang. When booting with a serial-usb console
> >> the following errors are logged before the system freezes:
> >>
> >>  i915 0000:00:02.0: [drm] *ERROR* timeout setting power well state 00000000 (fffff3ff)
> >>  i915 0000:00:02.0: [drm] *ERROR* Display PHY 0 is not power up
> > 
> > Hmm. I wonder if we're missing a clock or something...
> > 
> > Either of these do anything different?
> > 
> > --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> > @@ -1419,6 +1419,10 @@ static void vlv_display_power_well_init(struct drm_i915_private *dev_priv)
> >  	for_each_pipe(dev_priv, pipe) {
> >  		u32 val = intel_de_read(dev_priv, DPLL(pipe));
> >  
> > +		val |= DPLL_SSC_REF_CLK_CHV;
> > 		or
> > +		val &= ~DPLL_SSC_REF_CLK_CHV;
> > 
> >  		val |= DPLL_REF_CLK_ENABLE_VLV | DPLL_VGA_MODE_DIS;
> >  		if (pipe != PIPE_A)
> >  			val |= DPLL_INTEGRATED_CRI_CLK_VLV;
> > 
> 
> The hang gets triggered from chv_dpio_cmn_power_well_enable() which does not
> call vlv_display_power_well_init() at all, it directly calls vlv_set_power_well()
> without first calling vlv_display_power_well_init() .
> 
> Note the same goes for vlv_dpio_cmn_power_well_enable(). Only the
> vlv_display_power_well_enable() / chv_pipe_power_well_enable() call
> vlv_display_power_well_init().
> 
> Note I can still give the suggested change a try if you want,
> the "display" powerwell is listed first and has DOMAIN_INIT set,
> so assuming for_each_power_domain_well() goes through the domains in
> the order they are listed, then vlv_display_power_well_init() will
> still run first. But it would seem to be wrong if enabling one domain
> depends on things setup by another domain ?

The power wells are hierarchical. Also power wells != power domains.

-- 
Ville Syrjälä
Intel
