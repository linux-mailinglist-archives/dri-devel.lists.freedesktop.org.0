Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8117064EDA0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 16:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36C810E5D4;
	Fri, 16 Dec 2022 15:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D253D10E5D3;
 Fri, 16 Dec 2022 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671203432; x=1702739432;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=emGcT4Xnk63cWO9TnSa5/SLFBAjCaEY6T+Xm7GwkSSw=;
 b=jrsog9Tw0OBPS8VqgwZ2g1s+E/ihYyO4a4FmxVrJQKyz81HGvv0iE1WB
 9MT9f7h5TOLUkICLXaGFnzm/vn3KLGA1Brv6T9vjpU8gZnx4CD7rqT63v
 VdOveBEM+Qq0YBwcEabT7FLW7D4ED+Lk8heMO2ueSApXAFWzXHkrerU6u
 EYpCc3jaQoA3zH0MaSqRwJEYp9JtTaSXpnrTh/qgeRFiPfByDUoBh2yxT
 9izd1lIf4FEyXcH2KLJbe9NlvqYk79ZaQvzixfFXZSlQzxgVcVAmdMXvu
 r4TcMKqjHFaHVgEpk2L486HtlZ5fm/AHNoVWd0sLUatdgCKHE085ZIQXw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="381204847"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="381204847"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 07:10:27 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="713278668"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="713278668"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 07:10:24 -0800
Date: Fri, 16 Dec 2022 17:10:21 +0200
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/3] drm/display/dp_mst: Fix down/up message handling
 after sink disconnect
Message-ID: <Y5yKXXBUycSHov5g@ideak-desk.fi.intel.com>
References: <20221214184258.2869417-1-imre.deak@intel.com>
 <1ade43347769118c82f1b68bd8b51172a1012a37.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ade43347769118c82f1b68bd8b51172a1012a37.camel@redhat.com>
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 04:41:42PM -0500, Lyude Paul wrote:
> For the whole series:
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks for the review, pushed it to drm-misc-next.

> Thanks!
> 
> On Wed, 2022-12-14 at 20:42 +0200, Imre Deak wrote:
> > If the sink gets disconnected during receiving a multi-packet DP MST AUX
> > down-reply/up-request sideband message, the state keeping track of which
> > packets have been received already is not reset. This results in a failed
> > sanity check for the subsequent message packet received after a sink is
> > reconnected (due to the pending message not yet completed with an
> > end-of-message-transfer packet), indicated by the
> > 
> > "sideband msg set header failed"
> > 
> > error.
> > 
> > Fix the above by resetting the up/down message reception state after a
> > disconnect event.
> > 
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: <stable@vger.kernel.org> # v3.17+
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 51a46689cda70..90819fff2c9ba 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -3641,6 +3641,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
> >  		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
> >  		ret = 0;
> >  		mgr->payload_id_table_cleared = false;
> > +
> > +		memset(&mgr->down_rep_recv, 0, sizeof(mgr->down_rep_recv));
> > +		memset(&mgr->up_req_recv, 0, sizeof(mgr->up_req_recv));
> >  	}
> >  
> >  out_unlock:
> 
> -- 
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
> 
