Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8864EF3B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01DB10E5F6;
	Fri, 16 Dec 2022 16:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBE610E5F6;
 Fri, 16 Dec 2022 16:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671208427; x=1702744427;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=3omOzoexz7b2rPBIg3en969awPF/T7AOgbuk5SQGxBk=;
 b=mAmEAv/mALZFTCSp0u84qwu8bMYAP7YYbDKAJHQPhwViLFbP3sYm0T8B
 h44XmyIeX+oUndQ1N5012XHgDcxs/Bfhf8Un+gdJnZOptEErV97yOpThm
 Ix8OTUCIKX5w0lEu+alcnNB2eTm1afB78LXt6TepKyH/6h1NhgI4emLA3
 znuB+ME/VgjECkrH3ZrmB62rZtciAfGeQNwdoYnhPcUqVIfbbyipHmmck
 1IV410Oof43xGNX7bqjOmFYXdmhAuqgBqGczW0RVJ0dHYaa6+lju0P93I
 /kSKix4VoEgw2hYYXIjXQcTJwvtrGrW8wZWtzkT0CuXjQe5v+qRWsnM2l Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="405258210"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="405258210"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:33:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="643323420"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="643323420"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:33:44 -0800
Date: Fri, 16 Dec 2022 18:33:40 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/display/dp_mst: Fix down/up message
 handling after sink disconnect
Message-ID: <Y5yd5PvWb2fl66/s@ideak-desk.fi.intel.com>
References: <20221214184258.2869417-1-imre.deak@intel.com>
 <1ade43347769118c82f1b68bd8b51172a1012a37.camel@redhat.com>
 <Y5yKXXBUycSHov5g@ideak-desk.fi.intel.com>
 <875yebuy68.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yebuy68.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 16, 2022 at 06:10:39PM +0200, Jani Nikula wrote:
> On Fri, 16 Dec 2022, Imre Deak <imre.deak@intel.com> wrote:
> > On Wed, Dec 14, 2022 at 04:41:42PM -0500, Lyude Paul wrote:
> >> For the whole series:
> >> 
> >> Reviewed-by: Lyude Paul <lyude@redhat.com>
> >
> > Thanks for the review, pushed it to drm-misc-next.
> 
> Hmm, with the drm-misc *not* cherry-picking patches from drm-misc-next
> to drm-misc-fixes, these will only get backported to stable kernels
> after they hit Linus' tree in the next (as opposed to current) merge
> window after a full development cycle. Wonder if they should be
> expedited.

Ok, it should've been pushed to -fixes then, will do that next time.
Yes, I think sending them already before the next merge window would be
good.

> 
> BR,
> Jani.
> 
> >
> >> Thanks!
> >> 
> >> On Wed, 2022-12-14 at 20:42 +0200, Imre Deak wrote:
> >> > If the sink gets disconnected during receiving a multi-packet DP MST AUX
> >> > down-reply/up-request sideband message, the state keeping track of which
> >> > packets have been received already is not reset. This results in a failed
> >> > sanity check for the subsequent message packet received after a sink is
> >> > reconnected (due to the pending message not yet completed with an
> >> > end-of-message-transfer packet), indicated by the
> >> > 
> >> > "sideband msg set header failed"
> >> > 
> >> > error.
> >> > 
> >> > Fix the above by resetting the up/down message reception state after a
> >> > disconnect event.
> >> > 
> >> > Cc: Lyude Paul <lyude@redhat.com>
> >> > Cc: <stable@vger.kernel.org> # v3.17+
> >> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +++
> >> >  1 file changed, 3 insertions(+)
> >> > 
> >> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> > index 51a46689cda70..90819fff2c9ba 100644
> >> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> > @@ -3641,6 +3641,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
> >> >  		drm_dp_dpcd_writeb(mgr->aux, DP_MSTM_CTRL, 0);
> >> >  		ret = 0;
> >> >  		mgr->payload_id_table_cleared = false;
> >> > +
> >> > +		memset(&mgr->down_rep_recv, 0, sizeof(mgr->down_rep_recv));
> >> > +		memset(&mgr->up_req_recv, 0, sizeof(mgr->up_req_recv));
> >> >  	}
> >> >  
> >> >  out_unlock:
> >> 
> >> -- 
> >> Cheers,
> >>  Lyude Paul (she/her)
> >>  Software Engineer at Red Hat
> >> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
