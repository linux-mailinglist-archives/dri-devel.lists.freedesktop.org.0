Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD656F57D7
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 14:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E5E10E11B;
	Wed,  3 May 2023 12:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F121E10E2A4;
 Wed,  3 May 2023 12:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683116600; x=1714652600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lJyTyRILL9WaVNaArAUPZeJSllBlPMxu0RNkKC4JW4U=;
 b=dCEOOSgcZoM1C6H+KGJ70ExTBw08n+nrZREaY5bsgQSgciHQbBWST3gy
 KPNkEpyfY+s7Y+KPQB+DcKyBtCj3Plz/I5B10SYPipyHQ5JLqL/MORr/P
 5hFDwQVwDnXsVh+CHDpdIfLf6qw3l8/3ErwU58c5/IcS83NLhK8365LXc
 cbxZKyaKCWQ6am8lXMKpqOmFxU0EBNfmPaIDvpYGKO7ZUl8YLgDmNt+4+
 kCKMYXluqzt/XjilM+SttbQUiZGjkYvuistceO9wlLbRqBgmKWVyFSDSO
 sw90m+HaxBOCGQBHo2WhWpHDpgm9zxirJBSIKnor4J/NWQqX0+I0CP78L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="333002977"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="333002977"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 05:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="727121504"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="727121504"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 05:23:17 -0700
Date: Wed, 3 May 2023 15:23:11 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 02/11] drm/i915/mst: Remove broken MST DSC support
Message-ID: <ZFJSLwVrlE8ABtei@intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-3-ville.syrjala@linux.intel.com>
 <ZFIPCm+k9TCyfMfS@intel.com> <ZFJAWCGuWcLDQOfS@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZFJAWCGuWcLDQOfS@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 03, 2023 at 02:07:04PM +0300, Ville Syrjälä wrote:
> On Wed, May 03, 2023 at 10:36:42AM +0300, Lisovskiy, Stanislav wrote:
> > On Tue, May 02, 2023 at 05:38:57PM +0300, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > The MST DSC code has a myriad of issues:
> > > - Platform checks are wrong (MST+DSC is TGL+ only IIRC)
> > > - Return values of .mode_valid_ctx() are wrong
> > > - .mode_valid_ctx() assumes bigjoiner might be used, but ther rest
> > >   of the code doesn't agree
> > > - compressed bpp calculations don't make sense
> > > - FEC handling needs to consider the entire link as opposed to just
> > >   the single stream. Currently FEC would only get enabled if the
> > >   first enabled stream is compressed. Also I'm not seeing anything
> > >   that would account for the FEC overhead in any bandwidth calculations
> > > - PPS SDP is only handled for the first stream via the dig_port
> > >   hooks, other streams will not be transmittitng any PPS SDPs
> > > - PPS SDP readout is missing (also missing for SST!)
> > > - VDSC readout is missing (also missing for SST!)
> > > 
> > > The FEC issues is really the big one since we have no way currently
> > > to apply such link wide configuration constraints. Changing that is
> > > going to require a much bigger rework of the higher level modeset
> > > .compute_config() logic. We will also need such a rework to properly
> > > distribute the available bandwidth across all the streams on the
> > > same link (which is a must to eg. enable deep color).
> > 
> > Also all the things you mentioned are subject for discussion, for example
> > I see that FEC overhead is actually accounted for bpp calculation for instance.
> 
> AFAICS FEC is only accounted for in the data M/N calculations,
> assuming that particular stream happened to be compressed. I'm
> not sure if that actually matters since at least the link M/N
> are not even used by the MST sink. I suppose the data M/N might
> still be used for something though. For any uncompressed stream
> on the same link the data M/N values will be calculated
> incorrectly without FEC.
> 
> And as mentioned, the FEC bandwidth overhead doesn't seem to
> be accounted anywhere so no guarantee that we won't try to
> oversubcribe the link.
> 
> And FEC will only be enabled if the first stream to be enabled
> is compressed, otherwise we will enable the link without FEC
> and still try to cram other compressed streams through it
> (albeit without the PPS SDP so who knows what will happen)
> and that is illegal.
> 
> > We usually improve things by gradually fixing, because if we act same way towards
> > all wrong code in the driver, we could end up removing the whole i915.
> 
> We ususally don't merge code that has this many obvious and/or
> fundemental issues.

Well, this is arguable and subjective judgement. Fact is that, so far we had more MST hubs
working with that code than without. Also no regressions or anything like that.
Moreover we usually merge code after code review, in particular those patches
did spend lots of time in review, where you could comment also.

Regarding merging code with fundamental issues, just recently you had admitted yourself
that bigjoiner issue for instance, we had recently, was partly caused by your code, because
we don't anymore copy the pll state to slave crtc. 
I would say that words like "obvious" and "fundamental"
issues can be applied to many things, however I thought that we always fix things in constructive,
but not destructive/negative way. 
Should I call also all code completely broken and remove it, once we discover some flaws 
there? Oh, we had many regressions, where I could say the same.

And once again I'm completely okay, if you did introduce better functionality instead
AND I know you have some valid points there, but now we are just removing everything completely,
without providing anything better.

But okay, I've mentioned what I think about this and from side this is nak. 
And once the guys to whom those patches helped will pop up from gitlab,
asking why their MST hubs stopped working - I will just refer them here.

> 
> Now, most of the issues I listed above are probably fixable
> in a way that could be backported to stable kernels, but
> unfortunately the FEC issue is not one of those. That one
> will likely need massive amounts of work all over the driver
> modeset code, making a backport impossible.
> 
> > So from my side I would nack it, at least until you have a code which handles
> > all of this better - I have no doubt you probably have some ideas in your mind, so lets be constructive at least and propose something better first.
> > This code doesn't cause any regressions, but still provides "some" support to DP MST DSC to say the least and even if that would be removed, if some of those users 
> > refer to me, I would probably then just point to this mail discussion everytime.
> 
> It seems very likely that it will cause regressions at some point,
> it just needs a specific multi-display MST setup. The resulting
> problems will be very confusing to debug since the order in which
> you enable/disable the outputs will have an impact on what actually
> goes wrong on account of the FEC and PPS SDP issues. The longer
> we wait disabling this the harder it will be to deal with those
> regressions since we the probably can't revert anymore (a straight
> revert was already not possible) but also can't fix it in a way
> that can be backported (due to the FEC issues in particular).
> 
> -- 
> Ville Syrjälä
> Intel
