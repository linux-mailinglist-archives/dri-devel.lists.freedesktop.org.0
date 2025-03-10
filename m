Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA3AA59221
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 12:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B973110E3DD;
	Mon, 10 Mar 2025 11:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jK2yaWHy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B307510E3DD;
 Mon, 10 Mar 2025 11:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741604410; x=1773140410;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=XaQBs1Nr/FchWKiFTmuwev64vfYgVRJ7ab2aDhqhA1c=;
 b=jK2yaWHyCPuIveCQt/jmb/LEJUfoW7aJnFuNKL4a8mggiYlszBL1WcEU
 OUo451MoXsF1AWDbamkBEACiLb+cZcFK36tYZsKFZ0eBXppusbnNSNG+P
 GAJJJ2+6VR89y9llSa8PbAB85yHvK5Xz0SOJKp50RUsCs7cq6fvjNRJBZ
 0aV0UzOztUBTy1ifoOpSTNtSzG9iJT3G3IBWLVo0C9KPViwhDRc9VMHWd
 TdKBGkN9AQlrFOEVg9GaZZ7l7ELXdub8C/vdx+AxwTYAl0vwkhAahFHWu
 lWzryDjj4IGyNG1d25X6VHO2XdcWEbEhCBNYkGpSSglmoHrrYntMVQUkr A==;
X-CSE-ConnectionGUID: KiUp07q4QZeezzB04gcxoQ==
X-CSE-MsgGUID: +sSmggxNTOq/KqTFS9tF6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="45388096"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="45388096"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:00:10 -0700
X-CSE-ConnectionGUID: +puv9aV/T96CmqylHz8mCQ==
X-CSE-MsgGUID: R6tdX17yTEC6VyKioWEyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="120665810"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:00:08 -0700
Date: Mon, 10 Mar 2025 13:00:05 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Lyude Paul <lyude@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/dp_mst: Fix locking when skipping CSN before
 topology probing
Message-ID: <Z87GNTziGPAl6UCv@ideak-desk.fi.intel.com>
References: <20250307183152.3822170-1-imre.deak@intel.com>
 <CO6PR12MB5489FF5590A559FD1B48A34EFCD62@CO6PR12MB5489.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO6PR12MB5489FF5590A559FD1B48A34EFCD62@CO6PR12MB5489.namprd12.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 10, 2025 at 08:59:51AM +0000, Lin, Wayne wrote:
> 
> > -----Original Message-----
> > From: Imre Deak <imre.deak@intel.com>
> > Sent: Saturday, March 8, 2025 2:32 AM
> > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
> > devel@lists.freedesktop.org
> > Cc: Lin, Wayne <Wayne.Lin@amd.com>; Lyude Paul <lyude@redhat.com>;
> > stable@vger.kernel.org
> > Subject: [PATCH] drm/dp_mst: Fix locking when skipping CSN before topology
> > probing
> >
> > The handling of the MST Connection Status Notify message is skipped if the probing
> > of the topology is still pending. Acquiring the drm_dp_mst_topology_mgr::probe_lock
> > for this in
> > drm_dp_mst_handle_up_req() is problematic: the task/work this function is called
> > from is also responsible for handling MST down-request replies (in
> > drm_dp_mst_handle_down_rep()). Thus drm_dp_mst_link_probe_work() - holding
> > already probe_lock - could be blocked waiting for an MST down-request reply while
> > drm_dp_mst_handle_up_req() is waiting for probe_lock while processing a CSN
> > message. This leads to the probe work's down-request message timing out.
> >
> > A scenario similar to the above leading to a down-request timeout is handling a CSN
> > message in drm_dp_mst_handle_conn_stat(), holding the probe_lock and sending
> > down-request messages while a second CSN message sent by the sink
> > subsequently is handled by drm_dp_mst_handle_up_req().
> >
> > Fix the above by moving the logic to skip the CSN handling to
> > drm_dp_mst_process_up_req(). This function is called from a work (separate from
> > the task/work handling new up/down messages), already holding probe_lock. This
> > solves the above timeout issue, since handling of down-request replies won't be
> > blocked by probe_lock.
> >
> > Fixes: ddf983488c3e ("drm/dp_mst: Skip CSN if topology probing is not done yet")
> > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: stable@vger.kernel.org # v6.6+
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 40 +++++++++++--------
> >  1 file changed, 24 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > index 8b68bb3fbffb0..3a1f1ffc7b552 100644
> > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > @@ -4036,6 +4036,22 @@ static int drm_dp_mst_handle_down_rep(struct
> > drm_dp_mst_topology_mgr *mgr)
> >       return 0;
> >  }
> >
> > +static bool primary_mstb_probing_is_done(struct drm_dp_mst_topology_mgr
> > +*mgr) {
> > +     bool probing_done = false;
> > +
> > +     mutex_lock(&mgr->lock);
> 
> Thanks for catching this, Imre!
>
> Here I think using mgr->lock is not sufficient for determining probing
> is done or not by mst_primary->link_address_sent. Since it might still
> be probing the rest of the topology with mst_primary probed. Use
> probe_lock instead? Thanks!

mgr->lock is taken here to guard the mgr->mst_primary access.

probe_lock is also held, taken already by the caller in
drm_dp_mst_up_req_work().

> > +
> > +     if (mgr->mst_primary && drm_dp_mst_topology_try_get_mstb(mgr-> >mst_primary)) {
> > +             probing_done = mgr->mst_primary->link_address_sent;
> > +             drm_dp_mst_topology_put_mstb(mgr->mst_primary);
> > +     }
> > +
> > +     mutex_unlock(&mgr->lock);
> > +
> > +     return probing_done;
> > +}
