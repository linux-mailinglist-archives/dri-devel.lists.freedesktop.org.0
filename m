Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B544B8542
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 11:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667E010E7A6;
	Wed, 16 Feb 2022 10:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A78010E775;
 Wed, 16 Feb 2022 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645006303; x=1676542303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+FJRsZksRk4hm38iGEai+Nae1XuHF0MB1kBHEBkxWCM=;
 b=FaKJ9+7SDzfp8QZtw5sWqhAqQ9dHL9xhwELPI0j36n4qfqSNc9AM+6fQ
 vvPaP7NaXuihiDQbC8IKCHulJw1ntKYU5j5RGo2Htxy7U8GWzg5hAQIrh
 xOSwTtYDvHcsFYePMCXQdoRwlk8WcRFob2HG9JaLH+J0LlNfZI72kkD+v
 bkd3SF6speKRkQmczyx5J7rL3y629O5F0DXDSP1rPrP6pMORBfqJ/RE64
 y+iuZ4UDsvrtvHmJPQOpoMGfAL1+u7EjXuDO537QgdW37R5pDwEmOnGSl
 gCNAbxbLpl6UExrhIzNur/gVLJQvt0BgV0QuUYrErHK+o3QjXJLaeM5Uh Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="337004032"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="337004032"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 02:07:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="544850819"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 16 Feb 2022 02:07:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Feb 2022 12:07:08 +0200
Date: Wed, 16 Feb 2022 12:07:08 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Message-ID: <YgzMzNYlAoQPGhj1@intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-4-ramalingam.c@intel.com>
 <Ygy68/f1ERpTKJJW@intel.com>
 <392e942460079346d1ce9d3a17db11f9d02a17f5.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <392e942460079346d1ce9d3a17db11f9d02a17f5.camel@intel.com>
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

On Wed, Feb 16, 2022 at 09:36:02AM +0000, Hogander, Jouni wrote:
> On Wed, 2022-02-16 at 10:50 +0200, Ville Syrjälä wrote:
> > On Tue, Feb 15, 2022 at 11:21:54AM +0530, Ramalingam C wrote:
> > > From: Jouni Högander <jouni.hogander@intel.com>
> > > 
> > > Currently ICL_PHY_MISC macro is returning offset 0x64C10 for PHY_E
> > > port. Correct offset is 0x64C14.
> > 
> > Why is it PHY_E and not PHY_F?
> 
> This is a valid question. It seems we have followed intel_phy_is_snps()
> here:
> 
> // snip
> else if (IS_DG2(dev_priv))
> 		/*
> 		 * All four "combo" ports and the TC1 port (PHY E) use
> 		 * Synopsis PHYs.
> 		 */
> 		return phy <= PHY_E;
> // snip
> 
> According to spec port E is "No connection". Better place to fix this
> could be intel_phy_is_snps() itself?

I think the crucial question is where are all the places that
the results of intel_port_to_phy() get used.

I do see that for all the actual snps phy registers we
do want PHY_E, but maybe it would be better to have a local
SNPS_PHY enum just for intel_snps_phy.c, and leave the other
phy thing for everything else?

Not sure if there is some other register we index with the
phy that specifically wants PHY_E?

Also it kinda looks to me like for VBT port mapping we also
want PHY_F essentially since the modern platforms make the
VBT port mapping PHY based and xelpd_port_mapping() uses
PORT_TC1<->DVO_PORT_*F. Not that we actually use enum phy
in the VBT code atm, but I'm thinking we probably should
since it might allow us to get rid of all those different
mapping tables. Though the whole intel_port_to_phy()
disaster needs to get cleaned up first IMO.

-- 
Ville Syrjälä
Intel
