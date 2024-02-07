Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131AB84D368
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 22:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1291A10E49C;
	Wed,  7 Feb 2024 21:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7r6rSBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44C710E49C;
 Wed,  7 Feb 2024 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707339773; x=1738875773;
 h=date:from:to:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UsfWfr2Kma7JvEIgkjOyOkNPCpZWoXCV2Fn96OZ0780=;
 b=j7r6rSBH+df1WprrWy4N4GsOb3MChkYryxzXT4ZW0v5bf0A1sT/xjAK6
 CjmAbX5+8WBzvHn1wfkgbwJ9QDRv5Yh7l400DgbOux4wUoOnQmXFc4cL/
 lIVm5K9pCwVrEZDULmKPTqmmXS2Wzocdfvo+jkrug9zpDrErKpesqtjEm
 HSQcxXcKCBZUqxyNq5GJYT3zkPwqCRwPLmQtcoGVNgaYQa5OR2t8PoIVn
 q4V6pbtwtaxPY9aAW3Zk2oba3j0lXDPgZqj7WU1VMA46wpoFHEltqZh69
 6Dy9duDQC+x/vJSN4FwX7eklMpzH/SyloF4hsTdeywK5dpWAkknUSWEUz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1222762"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1222762"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 13:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="32252398"
Received: from jeroenke-mobl.ger.corp.intel.com (HELO ideak-desk.fi.intel.com)
 ([10.252.43.85])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 13:02:08 -0800
Date: Wed, 7 Feb 2024 23:02:27 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 02/19] drm/dp: Add support for DP tunneling
Message-ID: <ZcPv4+0uMpJhcySu@ideak-desk.fi.intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-3-imre.deak@intel.com>
 <ZcPhyk1RbE5bXcCv@intel.com>
 <ZcPsq2WdP7oJQ4Ep@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcPsq2WdP7oJQ4Ep@ideak-desk.fi.intel.com>
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

On Wed, Feb 07, 2024 at 10:48:53PM +0200, Imre Deak wrote:
> On Wed, Feb 07, 2024 at 10:02:18PM +0200, Ville Syrjälä wrote:
> > > [...]
> > > +static int
> > > +drm_dp_tunnel_atomic_check_group_bw(struct drm_dp_tunnel_group_state *new_group_state,
> > > +				    u32 *failed_stream_mask)
> > > +{
> > > +	struct drm_dp_tunnel_group *group = to_group(new_group_state->base.obj);
> > > +	struct drm_dp_tunnel_state *new_tunnel_state;
> > > +	u32 group_stream_mask = 0;
> > > +	int group_bw = 0;
> > > +
> > > +	for_each_tunnel_state(new_group_state, new_tunnel_state) {
> > > +		struct drm_dp_tunnel *tunnel = new_tunnel_state->tunnel_ref.tunnel;
> > > +		int max_dprx_bw = get_max_dprx_bw(tunnel);
> > > +		int tunnel_bw = drm_dp_tunnel_atomic_get_tunnel_bw(new_tunnel_state);
> > > +
> > > +		tun_dbg(tunnel,
> > > +			"%sRequired %d/%d Mb/s total for tunnel.\n",
> > > +			tunnel_bw > max_dprx_bw ? "Not enough BW: " : "",
> > > +			DPTUN_BW_ARG(tunnel_bw),
> > > +			DPTUN_BW_ARG(max_dprx_bw));
> > > +
> > > +		if (tunnel_bw > max_dprx_bw) {
> > 
> > I'm a bit confused why we're checking this here. Aren't we already
> > checking this somewhere else?
> 
> Ah, yes this should be checked already by the encoder compute config +
> the MST link BW check. It can be removed, thanks.

Though neither of that is guaranteed for drivers in general, so
shouldn't it be here still?

> > > +			*failed_stream_mask = new_tunnel_state->stream_mask;
> > > +			return -ENOSPC;
> > > +		}
> > > +
> > > +		group_bw += min(roundup(tunnel_bw, tunnel->bw_granularity),
> > > +				max_dprx_bw);
> > > +		group_stream_mask |= new_tunnel_state->stream_mask;
> > > +	}
> > > +
> > > +	tun_grp_dbg(group,
> > > +		    "%sRequired %d/%d Mb/s total for tunnel group.\n",
> > > +		    group_bw > group->available_bw ? "Not enough BW: " : "",
> > > +		    DPTUN_BW_ARG(group_bw),
> > > +		    DPTUN_BW_ARG(group->available_bw));
> > > +
> > > +	if (group_bw > group->available_bw) {
> > > +		*failed_stream_mask = group_stream_mask;
> > > +		return -ENOSPC;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
