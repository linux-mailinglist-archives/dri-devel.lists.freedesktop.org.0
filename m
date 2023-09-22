Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F168F7AB9F8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 21:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCB510E72F;
	Fri, 22 Sep 2023 19:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA3D10E6A3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 19:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695410524; x=1726946524;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=nvcrQo2rL5r9UFSm+cmfQJnb28t5Kpu5MR2khnCIlMk=;
 b=CtFB6ulYab+549jKJj4LOoNGgmGcNP4HYt2xcguvaAbrZDaxTqM53odX
 1hg5wmghIxXLiBvNKczWiscOPMIq85Kbq+2DihYSGd2UWlS+xW/+cnXPf
 lD9Y6it1cq5Jr1HKZwg9Ltv2iWLFwXGvfIQPCpAbXvUjTUTwrlXOQbGoG
 wpc7DtyQquSfyaMrixieU0PdrSGvdAeqb6aL/HwsI44AXKV//WKdZojG9
 UDFzDfN4oM4Ywx0zhnBKjK6E4ctBdoGlxUoyviiQlxYTesMC6DgEAvqUZ
 Ew6vrLsOgh6stQ4tWNUxZKE5EoAN4fBVGEu/5DsvMHHIkx3SpeJRuhwhE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="360303439"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="360303439"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 12:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="817915002"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="817915002"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 12:22:00 -0700
Date: Fri, 22 Sep 2023 22:22:21 +0300
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v1] drm/dp/mst: fix missing modeset unlock for MST port
 detect
Message-ID: <ZQ3pbVHRXMiLfUCf@ideak-desk.fi.intel.com>
References: <1694753689-29782-1-git-send-email-quic_rsr@quicinc.com>
 <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19ce2cd9abfd3bdf3ea91f9bceb43206e4740c2e.camel@redhat.com>
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
Reply-To: imre.deak@intel.com
Cc: Jani Nikula <jani.nikula@intel.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Ramya SR <quic_rsr@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 03:02:23PM -0400, Lyude Paul wrote:
> 
> Oh! wow thank you for catching this:
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> I will go and push this to drm-misc-next in just a moment
> 
> On Fri, 2023-09-15 at 10:24 +0530, Ramya SR wrote:
> > Modeset mutex unlock is missing in drm_dp_mst_detect_port function.
> > This will lead to deadlock if calling the function multiple times in
> > an atomic operation, for example, getting imultiple MST ports status
> > for a DP MST bonding scenario.
> > 
> > Signed-off-by: Ramya SR <quic_rsr@quicinc.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index ed96cfc..d6512c4 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -4154,7 +4154,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
> >  
> >  	ret = drm_modeset_lock(&mgr->base.lock, ctx);
> >  	if (ret)
> > -		goto out;
> > +		goto fail;
> >  
> >  	ret = connector_status_disconnected;
> >  
> > @@ -4181,6 +4181,8 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
> >  		break;
> >  	}
> >  out:
> > +	drm_modeset_unlock(&mgr->base.lock);

Isn't this supposed to be unlocked only by drm_helper_probe_detect_ctx()
/ drm_helper_probe_detect() ?

> > +fail:
> >  	drm_dp_mst_topology_put_port(port);
> >  	return ret;
> >  }
> 
> -- 
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
> 
