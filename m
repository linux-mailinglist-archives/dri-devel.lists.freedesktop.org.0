Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 953BE5A0132
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE79ABFD76;
	Wed, 24 Aug 2022 18:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D208EB05;
 Wed, 17 Aug 2022 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660737565; x=1692273565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6b3c6v23oiX+x1U/ZFEx/KYy2/TE/UWN/aBtKal7zRQ=;
 b=Ess+6Q/Uf4F7JoEBu5UbMIJqkqe1QT3pqNvq76+YNEMEyFgcCMtMtFxe
 yKGVcWLg8U6DiIDzkS7tz4XBSUvc56J5dgGQ4PX20q7pBflPc+qPIj3U5
 VHsrEJpTbexk2CjQSwWmsguF6FaAWFHxX5W3VJYr2mt7ZuJ0LatIyeeP5
 g144e0kB8GtyAyeWDnD13tp8LjUroxCosSak2KwMElXYIBR+OvvZTSCJG
 F5FOLjbqZblYigKwOK9YZBlUAOLB2vHXQ8+52WkI+ByKHM1lYU3TmpBXU
 bFZEwUAyMWTCvLKVpQTiercoCTzX/47Ujz4KC/duiSz1P673PhJOZUW6f A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="318481909"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="318481909"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 04:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="610618489"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.59])
 by fmsmga007.fm.intel.com with SMTP; 17 Aug 2022 04:59:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 17 Aug 2022 14:59:20 +0300
Date: Wed, 17 Aug 2022 14:59:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when
 it's supported
Message-ID: <YvzYGGXils/Gf44d@intel.com>
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <CACO55tt=Op=0E94kK+1M8cDXNCk5Tkc=FMR8=OQFc5ohehjwaw@mail.gmail.com>
 <CAAd53p49X95MKrTDUq92LuHw3y2i09fUA2HEPzM1EcO8xO97Eg@mail.gmail.com>
 <CACO55tvgmb4Vog701idDYGuh125S9mjWPXhftxDMZ7hg-nQXBw@mail.gmail.com>
 <CAAd53p4W9rjmVJcUasy9hb1Yam+846+Oomvc2r9RMNmWeh_=0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd53p4W9rjmVJcUasy9hb1Yam+846+Oomvc2r9RMNmWeh_=0w@mail.gmail.com>
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 17, 2022 at 11:04:21AM +0800, Kai-Heng Feng wrote:
> On Wed, Aug 17, 2022 at 9:49 AM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Wed, Aug 17, 2022 at 3:18 AM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
> > >
> > > On Wed, Aug 17, 2022 at 2:50 AM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > On Tue, Aug 16, 2022 at 4:53 AM Kai-Heng Feng
> > > > <kai.heng.feng@canonical.com> wrote:
> > > > >
> > > > > On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
> > > > > dGFX so external monitors are routed to dGFX, and more monitors can be
> > > > > supported as result.
> > > > >
> > > > > To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
> > > > > on intel_dsm_guid2. This method is described in Intel document 632107.
> > > > >
> > > >
> > > > Can we please not do things like this just because?
> > >
> > > I there's a very good reason to support more external monitors,
> > > especially when eDP is already 4K so iGPU don't have enough buffer for
> > > more displays.
> > >
> >
> > well.. they do have it. What's the limit? 3 or 4 4K displays with gen
> > 11th+? I find conflicting information, but 3 4K displays are no
> > problem. It might be if you get to higher refresh rates or something.
> >
> > I know that 2 work quite reliably and I know I can put even more on
> > the Intel GPU.
> 
> More monitors can be supported via a thunderbolt dock.
> 
> >
> > > >
> > > > It forces the discrete GPU to be on leading to higher thermal pressure
> > > > and power consumption of the system. Lower battery runtime or higher
> > > > fan noise is the result. Not everybody wants to use an AC simply just
> > > > because they attach an external display.
> > >
> > > The system is designed in this way.
> > >
> >
> > ?!? This makes no sense. If the discrete GPU is turned on, it means
> > the system has to cool away more heat, because it consumes more power.
> > It then causes louder fans. No idea how a "system design" can just go
> > around simple physics...
> 
> The spec from HP [1] says:
> Multi Display Support
> Without HP Thunderbolt™ Dock G2
> UMA Graphics: Unit supports up to 4 independent displays. Any
> combination of displays outputs may be used except one of
> Thunderbolt™ 4 and HDMI.
> Hybrid Graphics: Unit supports up 5 simultaneous displays (4 from dGPU
> + 1 from iGPU). Any combination of displays outputs may
> be used except when using one USBC and HDMI are exclusive
> 
> With HP Thunderbolt™ Dock G2
> UMA Graphics: Unit supports up to 4 simultaneous displays. Any
> combination of displays outputs may be used except one of
> Thunderbolt™ 4 and HDMI.
> Hybrid Graphics (NVIDIA): Unit supports up to 5 simultaneous displays
> (4 from dGPU + 1 from iGPU). Any combination of displays
> outputs may be used except when using one USBC and HDMI are exclusive
> Hybrid Graphics (AMD): Unit supports up to 5 simultaneous displays (5
> from dGPU + 1 from iGPU). Any combination of displays
> outputs may be used except when using one USBC and HDMI are exclusive
> 
> So it's "designed" to use dGPU on the hybrid configs.
> 
> Let's hope the copper tubes have can dissipate the heat fast enough.
> 
> >
> > Even the CPU consumes more power, because on some systems it prevents
> > deeper package sleeping modes due to the active PCIe bridge
> > controller.
> >
> > But if you have certain systems where you want to enable this behavior
> > despite the drawbacks, maybe maintain a list of systems where to apply
> > this method?
> 
> The behavior will be enabled only when _DSM function 20 is present.
> So it's already a selected few.

I had a quick trawl through some Windows stuff for this and
it does seem to do a few extra checks:
- platform must be TGL-H (nothing else has the DPin stuff I guess)
- OpRegion header must indicate dGPU presence

Otherwise it does call this DSM uncoditionally on boot/S4 resume
so seems like that is the only really validated configuration.
Although it does seem to explicitly turn off displays prior to
the DSM so that does perhaps indicate that those ports might have
also been enabled via the iGPU by the BIOS. Not sure if disabling
the ports would work correctly after the DSM or not. If not then
the DSM call would need to happen after state readout/sanitization
so that we can shut things down gracefully.

Additionally after the DSM call it scans the FIA TC live state
bits to check for DPin usage. Looks like its trying to make sure
the driver stops poking at the relevant power wells once in DPin
mode. i915 doesn't check that stuff atm so we might end up
mangling something while the dGPU is driving the port.

-- 
Ville Syrjälä
Intel
