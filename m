Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60826BCF93
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 13:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68E310ECFA;
	Thu, 16 Mar 2023 12:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104F310E0FA;
 Thu, 16 Mar 2023 12:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678970134; x=1710506134;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Bxd5D5poEannFRpyuG1K4bXgeIh5wtya4y2smkpZhag=;
 b=ikikb0+ABVEcZTnIlqf0wFhvySJ1SHVC2uk32gmiXO3vuX9QCM0YBsIP
 tVoGeNyGYP9O7SKw+rTQVfrFuGrWN00FlqKxLWo3Lp9bv4Qhi7QivYCQB
 ByyNaq3MvQbvlAS6ijtS7zdblvPJakdDXbo3pGnqXVFX9zdoXT5JiSl6W
 wP1PPTbalsxska6UbkFM6Hx3Q0IYC/mIXZEUGHZG6AASNHSXdot1nbwPL
 m4Oig+tF8fov2dtZb0Y8L3rO+Ee2c8OVnDcaZGkwMt6xHxzuPWIJRnUde
 Pb/Ut1kuHHXdLS90P8kLDE7Gg2xAIBfUw+5rUPuur8dZ3Vn4g6+dHwHo2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="400542829"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="400542829"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 05:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10650"; a="679877198"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="679877198"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga002.jf.intel.com with SMTP; 16 Mar 2023 05:35:29 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 Mar 2023 14:35:29 +0200
Date: Thu, 16 Mar 2023 14:35:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3 09/17] drm/amd/display: Register Colorspace property
 for DP and HDMI
Message-ID: <ZBMNEdYWsyfVq46p@intel.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
 <20230307151107.49649-10-harry.wentland@amd.com>
 <CA+hFU4yiniJdxWOxDKnD7bTGw3QA8uSLyG5sbeiQ5oWqitTZcQ@mail.gmail.com>
 <ZBLmYzVcnBgU6uo5@intel.com> <20230316120701.523bcb37@eldfell>
 <ZBLz17f8YFmNEJlY@intel.com> <20230316133449.26b62760@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316133449.26b62760@eldfell>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 01:34:49PM +0200, Pekka Paalanen wrote:
> On Thu, 16 Mar 2023 12:47:51 +0200
> Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> 
> > On Thu, Mar 16, 2023 at 12:07:01PM +0200, Pekka Paalanen wrote:
> > > On Thu, 16 Mar 2023 11:50:27 +0200
> > > Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > >   
> > > > On Thu, Mar 16, 2023 at 01:37:24AM +0100, Sebastian Wick wrote:  
> > > > > On Tue, Mar 7, 2023 at 4:12 PM Harry Wentland <harry.wentland@amd.com> wrote:    
> > > > > >
> > > > > > We want compositors to be able to set the output
> > > > > > colorspace on DP and HDMI outputs, based on the
> > > > > > caps reported from the receiver via EDID.    
> > > > > 
> > > > > About that... The documentation says that user space has to check the
> > > > > EDID for what the sink actually supports. So whatever is in
> > > > > supported_colorspaces is just what the driver/hardware is able to set
> > > > > but doesn't actually indicate that the sink supports it.
> > > > > 
> > > > > So the only way to enable bt2020 is by checking if the sink supports
> > > > > both RGB and YUV variants because both could be used by the driver.
> > > > > Not great at all. Something to remember for the new property.    
> > > > 
> > > > Hmm. I wonder if that's even legal... Looks like maybe it
> > > > is since I can't immediately spot anything in CTA-861 to
> > > > forbid it :/  
> > > 
> > > Wouldn't the driver do the same EDID check before choosing whether it
> > > uses RGB or YCbCr signalling?  
> > 
> > I suppose it could. The modeset would then fail, which is perhaps
> 
> Could? What are they missing?

The fact that the new property that also affects the rgb->ycbcr matrix
doesn't even exist?

> 
> I mean, drivers are already automatically choosing between RGB and YCbCr
> signalling based on e.g. available bandwidth. Surely they already will
> not attempt to send a signal format to a monitor that does not say it
> supports that?

We just signal default/bt.709 colorimetry. There is nothing to
check for those IIRC.

> 
> > not a huge issue, except maybe for suspend+resume if we fail in
> > the resume path. Although I guess the EDID/etc. should not yet
> > be refreshed at that point so if the modeset worked before suspend
> > resume should be able to restore it without failures.
> 
> I assumed that if a monitor can be driven, and it supports any BT2020
> format, then it always supports the BT2020 format it is being driven
> in (RGB vs. YCbCr flavors). Bad assumption?

I didn't spot any rule that both must be there. But didn't look
too hard either.

-- 
Ville Syrjälä
Intel
