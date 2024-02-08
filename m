Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521684E3DB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E414610E864;
	Thu,  8 Feb 2024 15:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gYjDeyBS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAD010E864;
 Thu,  8 Feb 2024 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707405512; x=1738941512;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JME/C0EeXRQRbOsRrDc04RQxGLlUKW8cb8oWVwsFIQk=;
 b=gYjDeyBSNBCHIpJ1xOL2L7BRlPv+3PcKBpzcZZqOA7ZQjzefbF8KhP1z
 1idWRDjD38wxY095zMxCD00ECK6hGyB3I84yEGHPexoBKSyQafEixjqae
 iTHfrGjNgnG8BLgKWfBAls4ssMQtkix3pB63LC+qyYTq5Tk9Wqa1UupRG
 LERQoWycadz37eGLo1Mrp7v9fynOK+tpqTPbTL91FJo5vXx7cbUkUInOR
 0i35b64NZz/Xocoz14vwBZnQkEbK2+8UPZqoaAlv5VQrG/wUPLwjP28cG
 LxjRJpxZ3LB9bFD4cOAvrBYfFLAuiiNUvHH+B0FAEHAHsOglgdWsg9ry4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="4219418"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="4219418"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 07:18:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="824863713"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="824863713"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Feb 2024 07:18:29 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 08 Feb 2024 17:18:28 +0200
Date: Thu, 8 Feb 2024 17:18:28 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 02/19] drm/dp: Add support for DP tunneling
Message-ID: <ZcTwxOziN3v_3mDK@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-3-imre.deak@intel.com>
 <ZcPhyk1RbE5bXcCv@intel.com>
 <ZcPsq2WdP7oJQ4Ep@ideak-desk.fi.intel.com>
 <ZcPv4+0uMpJhcySu@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcPv4+0uMpJhcySu@ideak-desk.fi.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 07, 2024 at 11:02:27PM +0200, Imre Deak wrote:
> On Wed, Feb 07, 2024 at 10:48:53PM +0200, Imre Deak wrote:
> > On Wed, Feb 07, 2024 at 10:02:18PM +0200, Ville Syrjälä wrote:
> > > > [...]
> > > > +static int
> > > > +drm_dp_tunnel_atomic_check_group_bw(struct drm_dp_tunnel_group_state *new_group_state,
> > > > +				    u32 *failed_stream_mask)
> > > > +{
> > > > +	struct drm_dp_tunnel_group *group = to_group(new_group_state->base.obj);
> > > > +	struct drm_dp_tunnel_state *new_tunnel_state;
> > > > +	u32 group_stream_mask = 0;
> > > > +	int group_bw = 0;
> > > > +
> > > > +	for_each_tunnel_state(new_group_state, new_tunnel_state) {
> > > > +		struct drm_dp_tunnel *tunnel = new_tunnel_state->tunnel_ref.tunnel;
> > > > +		int max_dprx_bw = get_max_dprx_bw(tunnel);
> > > > +		int tunnel_bw = drm_dp_tunnel_atomic_get_tunnel_bw(new_tunnel_state);
> > > > +
> > > > +		tun_dbg(tunnel,
> > > > +			"%sRequired %d/%d Mb/s total for tunnel.\n",
> > > > +			tunnel_bw > max_dprx_bw ? "Not enough BW: " : "",
> > > > +			DPTUN_BW_ARG(tunnel_bw),
> > > > +			DPTUN_BW_ARG(max_dprx_bw));
> > > > +
> > > > +		if (tunnel_bw > max_dprx_bw) {
> > > 
> > > I'm a bit confused why we're checking this here. Aren't we already
> > > checking this somewhere else?
> > 
> > Ah, yes this should be checked already by the encoder compute config +
> > the MST link BW check. It can be removed, thanks.
> 
> Though neither of that is guaranteed for drivers in general, so
> shouldn't it be here still?

I suppose there isn't any real harm in doing it here too.

> 
> > > > +			*failed_stream_mask = new_tunnel_state->stream_mask;
> > > > +			return -ENOSPC;
> > > > +		}
> > > > +
> > > > +		group_bw += min(roundup(tunnel_bw, tunnel->bw_granularity),
> > > > +				max_dprx_bw);
> > > > +		group_stream_mask |= new_tunnel_state->stream_mask;
> > > > +	}
> > > > +
> > > > +	tun_grp_dbg(group,
> > > > +		    "%sRequired %d/%d Mb/s total for tunnel group.\n",
> > > > +		    group_bw > group->available_bw ? "Not enough BW: " : "",
> > > > +		    DPTUN_BW_ARG(group_bw),
> > > > +		    DPTUN_BW_ARG(group->available_bw));
> > > > +
> > > > +	if (group_bw > group->available_bw) {
> > > > +		*failed_stream_mask = group_stream_mask;
> > > > +		return -ENOSPC;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +

-- 
Ville Syrjälä
Intel
