Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E09958F872
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 09:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A902A820C;
	Thu, 11 Aug 2022 07:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC9EA7E5E;
 Thu, 11 Aug 2022 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660203209; x=1691739209;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5ef6y5VXF9DR5UMaiLyCTeK6oO9xYEjcR0hlSfgh09s=;
 b=IaAzVBpCL+kyUJACs+Yf9uVnHX+ZDmOQjFJCFp+TvzrCaN+l0AIl4JNU
 26y/tf/AygqmIeuY4IOALAtXiwTGf12hpVP/T3cuUDmfMua4z/iqZzhlK
 Fl9hV99nMKv4bGyYS9YfRFUhe/71Uslhe2VhPdauo94FXd/yY8rsN35S3
 X4wtCHgQ9BnhxmEIM5T3F/N7Y3VeLYdbGmQu/gpp7g0XFbeJ8IdwumWI9
 M27/64I4Wh56jnugP9Iqmu+PdHcX/BlbJqIUfahfFwPOKiA1tpOSIE5N+
 R6pbrsIfZs2OTCvVaVHuI9LenrnbreK72E2hSA0c5DyCJEAXWlOzGyuMB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="290036701"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="290036701"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 00:33:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="581561387"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 00:33:15 -0700
Date: Thu, 11 Aug 2022 10:33:51 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/2] Add DP MST DSC support to i915
Message-ID: <YvSvDpq35CxfbnRJ@intel.com>
References: <20220810081753.12075-1-stanislav.lisovskiy@intel.com>
 <419bcc405fa4b298acb3f167316217bcca9f7c07.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <419bcc405fa4b298acb3f167316217bcca9f7c07.camel@redhat.com>
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
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 intel-gfx@lists.freedesktop.org, jani.saarinen@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 04:02:08PM -0400, Lyude Paul wrote:
> Btw, what's the plan for this? Figured I'd ask since I noticed this on the ML,
> nd I'm now finishing up getting the atomic only MST patches I've been working
> on merged :)

Current plan is that I need to fix this, as current implementation doesn't
seem to work because of my wrong assumption that drm_dp_mst_find_vcpi_slots
will fail if no slots are available and then we can fallback to DSC.

In reality that function can return whatever bogus value it wants, like
71 slots, while you have only 63 available. The real check is done in
drm_dp_mst_atomic_check, which would of course reject that configuration,
however by that moment its going to be too late for swithcing to DSC.

So looke like I will have to move that check at least partly to where DSC/no DSC decision is done. However if there are multiple displays we get
another problem, lets say we have 2 displays requiring 40 vcpi slots each in DSC
mode with certain input bpp.
We have now either option to reject the whole config or go back and try with
another bpp to check if we can reduce amount of slots.
Because by default we choose the first one which fits, however by the time when 
compute_config is called, we still don't have all config computed, which might
lead to that last crtc can either run our of vcpi slots or we will have to 
go back and try recalculating with higher compression ratio.

My other question was that DSC was supposed to be "visually" lossless, wondering
why we are still trying with different bpps? Could have just set highest
compression ratio right away.

So need to sort this out first before floating new series.

Stan

> 
> On Wed, 2022-08-10 at 11:17 +0300, Stanislav Lisovskiy wrote:
> > Currently we have only DSC support for DP SST.
> > 
> > Stanislav Lisovskiy (2):
> >   drm: Add missing DP DSC extended capability definitions.
> >   drm/i915: Add DSC support to MST path
> > 
> >  drivers/gpu/drm/i915/display/intel_dp.c     |  76 +++++-----
> >  drivers/gpu/drm/i915/display/intel_dp.h     |  17 +++
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 145 ++++++++++++++++++++
> >  include/drm/display/drm_dp.h                |  10 +-
> >  4 files changed, 203 insertions(+), 45 deletions(-)
> > 
> 
> -- 
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
> 
