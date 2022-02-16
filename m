Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7954B8BF1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 16:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6866610EA83;
	Wed, 16 Feb 2022 15:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5213F10EA7D;
 Wed, 16 Feb 2022 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645023701; x=1676559701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5xfW1HvZ7iKqWVR/Q0C/UUx7HpSTufggaRMVXpLErbI=;
 b=kobMgQoGVKqiWXRAVYWaHvw3hVxXgi6cqcUZ7eZtggVHqqGNVlsmlVAF
 uCURmps5L5A9n0Y+MjrxxStGUt6anP79Kas7psfpDOY37r9K/mwmi90Ie
 24pEc/r/FGA2M0/SWWnCbHOBuudm8Dq8oQH0ztu6i9xNqHWOHnvFO+gXq
 zZxWvfK83bP49zC+n10+rgV3J5JgTGCx/pi6+pwnRLRQEqxuHg+WDYav8
 2SvuJj25vS4vCrgGw893X86GmHf5Y5LPbLlGCr2vGZgJbduvHiTmMoiRs
 eie5hAKHh673J3laQ8ji8kXMjkfjreJ8/LHRSwgb7luIFaoEJC/ymhl0s w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="231245618"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="231245618"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 07:01:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="544972054"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 16 Feb 2022 07:01:36 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 17:01:35 +0200
Date: Wed, 16 Feb 2022 17:01:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Message-ID: <Yg0Rz8hntpO4WfAx@intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-4-ramalingam.c@intel.com>
 <Ygy68/f1ERpTKJJW@intel.com>
 <392e942460079346d1ce9d3a17db11f9d02a17f5.camel@intel.com>
 <YgzMzNYlAoQPGhj1@intel.com>
 <11bc21211988d45e73a7be212d31263574dfb1ca.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11bc21211988d45e73a7be212d31263574dfb1ca.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 02:11:54PM +0000, Hogander, Jouni wrote:
> On Wed, 2022-02-16 at 12:07 +0200, Ville Syrjälä wrote:
> > On Wed, Feb 16, 2022 at 09:36:02AM +0000, Hogander, Jouni wrote:
> > > On Wed, 2022-02-16 at 10:50 +0200, Ville Syrjälä wrote:
> > > > On Tue, Feb 15, 2022 at 11:21:54AM +0530, Ramalingam C wrote:
> > > > > From: Jouni Högander <jouni.hogander@intel.com>
> > > > > 
> > > > > Currently ICL_PHY_MISC macro is returning offset 0x64C10 for
> > > > > PHY_E
> > > > > port. Correct offset is 0x64C14.
> > > > 
> > > > Why is it PHY_E and not PHY_F?
> > > 
> > > This is a valid question. It seems we have followed
> > > intel_phy_is_snps()
> > > here:
> > > 
> > > // snip
> > > else if (IS_DG2(dev_priv))
> > > 		/*
> > > 		 * All four "combo" ports and the TC1 port (PHY E) use
> > > 		 * Synopsis PHYs.
> > > 		 */
> > > 		return phy <= PHY_E;
> > > // snip
> > > 
> > > According to spec port E is "No connection". Better place to fix
> > > this
> > > could be intel_phy_is_snps() itself?
> > 
> > I think the crucial question is where are all the places that
> > the results of intel_port_to_phy() get used.
> > 
> > I do see that for all the actual snps phy registers we
> > do want PHY_E, but maybe it would be better to have a local
> > SNPS_PHY enum just for intel_snps_phy.c, and leave the other
> > phy thing for everything else?
> > 
> > Not sure if there is some other register we index with the
> > phy that specifically wants PHY_E?
> 
> I went through registers accesses in intel_snps_phy.c. It is actually
> only this one register which offset is wrong with PHY_E. Everything
> else seems to be assuming PHY_E including those SNPS_* registers (as
> you mentioned). I'm starting to think it would be overkill to open up
> this phy enum for this purpose. I would propose to stick with current
> patch. Maybe just update commit message. What do you think?

I would put it the other way. It is *only* the SNPS PHY IP registers
that use the wonky offsets (unless you found some others?). Everythting
on the Intel IP side wants it to be PHY_F.

So still would make more sense to me to add a new enum for the
SNPS PHY instance and remap across the boundary. Otherwise we're
just propagating this madness everwhere rather than containing in
the SNPS PHY implementation.

-- 
Ville Syrjälä
Intel
