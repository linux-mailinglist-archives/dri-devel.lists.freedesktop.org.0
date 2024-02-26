Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BA867370
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C89110E59A;
	Mon, 26 Feb 2024 11:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfBFvazj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954DD10E586;
 Mon, 26 Feb 2024 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708947593; x=1740483593;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PW+3V7li7NWspCrFINqFVFDXWaO6sy9FjTLyg8NOhBI=;
 b=jfBFvazjuIa72ENiaYquVo9tLAMXijcBzGkUZ1mTT6u+JK6HGBbaRwgu
 eDZySmZje3MJMOy2C/tfEyelDZ/ZnL+1aF79e01XGYlNC6kdbx+M69bsx
 nCNuf0uuJd2pGQzuvf+PszK2e8mvGfSUyy6T9ooAwX/1NCX8rs1uoC+EI
 wEoyh9DacfJVPDQJ0VY4j2PuE+7vNLtUjmurqZiG3wwydGn6ZeiwT5z0C
 ndFdKA6uKUxOYNvAq1O0g5XlO4EY38OGlEvsqejXmLfVT6xuF+1DuyFUh
 MzqaUSm7cWlbnRX8nUw+IJ2mprN3SBYeU1BpMRT4DK+0QT5M1Nv+4oLZj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3145888"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3145888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7068043"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 03:39:51 -0800
Date: Mon, 26 Feb 2024 13:40:13 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 02/21] drm/dp: Add support for DP tunneling
Message-ID: <Zdx4nbMF4lNwF3Ze@ideak-desk.fi.intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-3-imre.deak@intel.com>
 <ZdkO5VHKxG4Rbzjf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdkO5VHKxG4Rbzjf@intel.com>
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

On Fri, Feb 23, 2024 at 11:32:21PM +0200, Ville Syrjälä wrote:
> On Tue, Feb 20, 2024 at 11:18:22PM +0200, Imre Deak wrote:
> > +static inline void drm_dp_tunnel_ref_put(struct drm_dp_tunnel_ref *tunnel_ref)
> > +{
> > +	drm_dp_tunnel_put(tunnel_ref->tunnel, &tunnel_ref->tracker);
> 
> Should we set tunnel_ref->tunnel=NULL here?

Yes, thanks for spotting this. It also fixes 
intel_crtc_prepare_cleared_state()->
intel_dp_tunnel_atomic_clear_stream_bw()

if crtc_state::dp_tunnel_ref state doesn't get recomputed, for instance
when disabling the crtc.

> 
> -- 
> Ville Syrjälä
> Intel
