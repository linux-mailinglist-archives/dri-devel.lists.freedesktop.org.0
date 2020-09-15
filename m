Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677026B1EE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 00:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226D06E91B;
	Tue, 15 Sep 2020 22:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE196E91A;
 Tue, 15 Sep 2020 22:38:04 +0000 (UTC)
IronPort-SDR: 8bI/Hnf6zk6EaUf07korDnMTA+Xg8XPq77jx1i2B4K8G+xqZ7yaJxtd6nfK/hiOGELVh+0t/RZ
 xJi3vjP/1Y0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="177430516"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="177430516"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 15:38:02 -0700
IronPort-SDR: iHUi8q7VOJNtb0bryI6PtzgxsAPVMIoQ/wl8sG7b+bumZJMLbEubUICeQbZhJIYkCSqJ9+QBO8
 GPwsDxo+9CuA==
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="343679082"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO labuser-Z97X-UD5H)
 ([10.165.21.211])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 15:38:02 -0700
Date: Tue, 15 Sep 2020 15:38:41 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC 1/5] drm/i915/dp: Program source OUI on eDP panels
Message-ID: <20200915223841.GA14183@labuser-Z97X-UD5H>
References: <20200915172939.2810538-1-lyude@redhat.com>
 <20200915172939.2810538-2-lyude@redhat.com>
 <20200915190639.GC503362@intel.com>
 <b1b77b7022f9e388808bc3835f8fc88cda0718bc.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b1b77b7022f9e388808bc3835f8fc88cda0718bc.camel@redhat.com>
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
Cc: thaytan@noraisin.net, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 03:47:01PM -0400, Lyude Paul wrote:
> On Tue, 2020-09-15 at 15:06 -0400, Rodrigo Vivi wrote:
> > On Tue, Sep 15, 2020 at 01:29:35PM -0400, Lyude Paul wrote:
> > > Since we're about to start adding support for Intel's magic HDR
> > > backlight interface over DPCD, we need to ensure we're properly
> > > programming this field so that Intel specific sink services are exposed.
> > > Otherwise, 0x300-0x3ff will just read zeroes.
> > > 
> > > We also take care not to reprogram the source OUI if it already matches
> > > what we expect. This is just to be careful so that we don't accidentally
> > > take the panel out of any backlight control modes we found it in.
> > > 
> > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > Cc: thaytan@noraisin.net
> > > Cc: Vasily Khoruzhick <anarsoul@gmail.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp.c | 32 +++++++++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > > b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 4bd10456ad188..b591672ec4eab 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -3428,6 +3428,7 @@ void intel_dp_sink_set_decompression_state(struct
> > > intel_dp *intel_dp,
> > >  void intel_dp_sink_dpms(struct intel_dp *intel_dp, int mode)
> > >  {
> > >  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > > +	u8 edp_oui[] = { 0x00, 0xaa, 0x01 };
> > 
> > what are these values?

We in i915 typically use the OUI number for adding any eDP specific
quirks. I have seen these getting spit out in the dmesg log at thebeginning.
AFAIK It is some kind of OEM identification number for a display panel.

Manasi
> 
> I wish I knew, my assumption is this is the OUI that Intel's GPU driver uses on
> other platforms, but I don't have any documentation mentioning this (in fact,
> the few documents I do have on this backlight interface don't seem to make any
> mention of it). I only managed to find this when looking through the last
> attempt someone did at adding support for this backlight interface:
> 
> https://patchwork.freedesktop.org/patch/334989/
> 
> I think it should be fairly safe to write, as I know nouveau always programs a
> source OUI (we don't do it from our driver, but nvidia hardware seems to do it
> automatically) and I don't believe I've seen it ever change any behavior besides
> making things appear in the 0x300-0x3ff register range.
> 
> AFAICT though, the backlight interface won't advertise itself without this being
> set early on. If you could find anyone from Intel who knows more about it though
> I'd definitely appreciate it (and just in general for the rest of the patch
> series as well)
> 
> > 
> > >  	int ret, i;
> > >  
> > >  	/* Should have a valid DPCD by this point */
> > > @@ -3443,6 +3444,14 @@ void intel_dp_sink_dpms(struct intel_dp *intel_dp,
> > > int mode)
> > >  	} else {
> > >  		struct intel_lspcon *lspcon = dp_to_lspcon(intel_dp);
> > >  
> > > +		/* Write the source OUI as early as possible */
> > > +		if (intel_dp_is_edp(intel_dp)) {
> > > +			ret = drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI,
> > > edp_oui,
> > > +						sizeof(edp_oui));
> > > +			if (ret < 0)
> > > +				drm_err(&i915->drm, "Failed to write eDP source
> > > OUI\n");
> > > +		}
> > > +
> > >  		/*
> > >  		 * When turning on, we need to retry for 1ms to give the sink
> > >  		 * time to wake up.
> > > @@ -4530,6 +4539,23 @@ static void intel_dp_get_dsc_sink_cap(struct intel_dp
> > > *intel_dp)
> > >  	}
> > >  }
> > >  
> > > +static void
> > > +intel_edp_init_source_oui(struct intel_dp *intel_dp)
> > > +{
> > > +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > > +	u8 oui[] = { 0x00, 0xaa, 0x01 };
> > > +	u8 buf[3] = { 0 };
> > > +
> > > +	if (drm_dp_dpcd_read(&intel_dp->aux, DP_SOURCE_OUI, buf, sizeof(buf)) <
> > > 0)
> > > +		drm_err(&i915->drm, "Failed to read source OUI\n");
> > > +
> > > +	if (memcmp(oui, buf, sizeof(oui)) == 0)
> > > +		return;
> > > +
> > > +	if (drm_dp_dpcd_write(&intel_dp->aux, DP_SOURCE_OUI, oui, sizeof(oui)) <
> > > 0)
> > > +		drm_err(&i915->drm, "Failed to write source OUI\n");
> > > +}
> > > +
> > >  static bool
> > >  intel_edp_init_dpcd(struct intel_dp *intel_dp)
> > >  {
> > > @@ -4607,6 +4633,12 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
> > >  	if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
> > >  		intel_dp_get_dsc_sink_cap(intel_dp);
> > >  
> > > +	/*
> > > +	 * Program our source OUI so we can make various Intel-specific AUX
> > > +	 * services available (such as HDR backlight controls)
> > > +	 */
> > > +	intel_edp_init_source_oui(intel_dp);
> > 
> > I believe we should restrict this to the supported platforms: cfl, whl, cml,
> > icl, tgl
> > no?
> > 
> > > +
> > >  	return true;
> > >  }
> > >  
> > > -- 
> > > 2.26.2
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> -- 
> Sincerely,
>       Lyude Paul (she/her)
>       Software Engineer at Red Hat
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
