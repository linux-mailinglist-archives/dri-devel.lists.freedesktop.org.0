Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D7590630
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 20:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427F1120EB;
	Thu, 11 Aug 2022 18:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54DFD14A91A;
 Thu, 11 Aug 2022 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660241359; x=1691777359;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ucgrEvIJ3CB2H2h68uHhBlgS+0ZIqt5p3WEUGYt7+v4=;
 b=GYotEF33tcl6LZLATb1ODPDJffQgaKeI8xPvXln8Xm68OWTmYDEMjnvl
 dEyw7GJ9D8NBRtx1y6ZcMBH6o0Guc2ww7S0xKYrfxiy48jhYLCsbO0ApI
 quyEpH+aU6eISIEQOzVwGAfOUGu9ePJ1olmOY7DWYWUikkLTKodg2ECZ0
 9zCcYqkvY/2AfwNNxnrRtJ7dXZfUkiVPBl4oOuBrAjLVPUrDxKeyfPK97
 EETgoJhMAmRIWq/DAMASiHN+oFWclHQPaPhMVj2MLPXk26r5Vzm9bFVXI
 2HbUtkbvTJ1jvCPoP0/cnOZoGSibTHCfljZa5Aynn18ocjdAp7lVLU2yH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="292686270"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="292686270"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 11:09:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="634337169"
Received: from mdnavare-mobl1.jf.intel.com ([10.165.21.211])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 11:09:18 -0700
Date: Thu, 11 Aug 2022 11:11:39 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH 0/2] Add DP MST DSC support to i915
Message-ID: <20220811181139.GA660634@mdnavare-mobl1.jf.intel.com>
References: <20220810081753.12075-1-stanislav.lisovskiy@intel.com>
 <419bcc405fa4b298acb3f167316217bcca9f7c07.camel@redhat.com>
 <YvSvDpq35CxfbnRJ@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvSvDpq35CxfbnRJ@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 jani.saarinen@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 10:33:51AM +0300, Lisovskiy, Stanislav wrote:
> On Wed, Aug 10, 2022 at 04:02:08PM -0400, Lyude Paul wrote:
> > Btw, what's the plan for this? Figured I'd ask since I noticed this on the ML,
> > nd I'm now finishing up getting the atomic only MST patches I've been working
> > on merged :)
> 
> Current plan is that I need to fix this, as current implementation doesn't
> seem to work because of my wrong assumption that drm_dp_mst_find_vcpi_slots
> will fail if no slots are available and then we can fallback to DSC.
> 
> In reality that function can return whatever bogus value it wants, like
> 71 slots, while you have only 63 available. The real check is done in
> drm_dp_mst_atomic_check, which would of course reject that configuration,
> however by that moment its going to be too late for swithcing to DSC.
> 
> So looke like I will have to move that check at least partly to where DSC/no DSC decision is done. However if there are multiple displays we get
> another problem, lets say we have 2 displays requiring 40 vcpi slots each in DSC
> mode with certain input bpp.
> We have now either option to reject the whole config or go back and try with
> another bpp to check if we can reduce amount of slots.
> Because by default we choose the first one which fits, however by the time when 
> compute_config is called, we still don't have all config computed, which might
> lead to that last crtc can either run our of vcpi slots or we will have to 
> go back and try recalculating with higher compression ratio.
> 
> My other question was that DSC was supposed to be "visually" lossless, wondering
> why we are still trying with different bpps? Could have just set highest
> compression ratio right away.

We do want to still maintain as high pic quality as possible. So we try
to find out the min compression ration that will make the mode fit into
the available link BW.

Manasi

> 
> So need to sort this out first before floating new series.
> 
> Stan
> 
> > 
> > On Wed, 2022-08-10 at 11:17 +0300, Stanislav Lisovskiy wrote:
> > > Currently we have only DSC support for DP SST.
> > > 
> > > Stanislav Lisovskiy (2):
> > >   drm: Add missing DP DSC extended capability definitions.
> > >   drm/i915: Add DSC support to MST path
> > > 
> > >  drivers/gpu/drm/i915/display/intel_dp.c     |  76 +++++-----
> > >  drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
> > >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 145 ++++++++++++++++++++
> > >  include/drm/display/drm_dp.h                |  10 +-
> > >  4 files changed, 203 insertions(+), 45 deletions(-)
> > > 
> > 
> > -- 
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> > 
