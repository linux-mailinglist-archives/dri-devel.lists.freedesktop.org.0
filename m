Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4C084A061
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B50E10F571;
	Mon,  5 Feb 2024 17:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JPe3GvBh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C3810F53D;
 Mon,  5 Feb 2024 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707153328; x=1738689328;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bphZFYQgzU2jBC0cphWMdU++c6NuvBVvFSDzshG3fMc=;
 b=JPe3GvBhooBcBKRiyLI3dTEZWo26qAa/wedseBwBfn5MtDH4AaJb2MpG
 pW7otktZukjKazindUHdKLRFy1X3UouHVr1+bo9gt7XJ3Lz6i/KISRjOk
 tT+Z2rn4azXAob3AmHLHP1kS6HXb6g5faNm1H0LkdK3JVLM/eh6gMAvjt
 CdfLotk901uDUJEyU3AtEcn0mCkro4Qa5kkmn6koVh5Fj7wbDXyJnkHUN
 q1DJlMQGXZGBts8RtDNzBE9IEdKdg3azWbHYdFYCUvFSDPH9OG/hB1yuA
 ffEAQCHHI0NQA5mUtXPsRig9rpBBSqH411KCi032BJPTjA8YGflDQtX15 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="394987380"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="394987380"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 09:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="792252"
Received: from unknown (HELO ideak-desk.fi.intel.com) ([10.237.66.155])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 09:15:26 -0800
Date: Mon, 5 Feb 2024 19:15:17 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/19] drm/dp: Add support for DP tunneling
Message-ID: <ZcEXpYkbrOnSGILQ@ideak-desk.fi.intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-3-imre.deak@intel.com>
 <ZbpwoA1gXI_dnZAr@intel.com>
 <ZbqWLMLHMHpj+SLX@ideak-desk.fi.intel.com>
 <ZcEJKkLKeJyggHac@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcEJKkLKeJyggHac@intel.com>
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

On Mon, Feb 05, 2024 at 06:13:30PM +0200, Ville Syrjälä wrote:
> On Wed, Jan 31, 2024 at 08:49:16PM +0200, Imre Deak wrote:
> > On Wed, Jan 31, 2024 at 06:09:04PM +0200, Ville Syrjälä wrote:
> > > On Tue, Jan 23, 2024 at 12:28:33PM +0200, Imre Deak wrote:
> > > > +static void untrack_tunnel_ref(struct drm_dp_tunnel *tunnel,
> > > > +			       struct ref_tracker **tracker)
> > > > +{
> > > > +	ref_tracker_free(&tunnel->group->mgr->ref_tracker,
> > > > +			 tracker);
> > > > +}
> > > > +
> > > > +struct drm_dp_tunnel *
> > > > +drm_dp_tunnel_get_untracked(struct drm_dp_tunnel *tunnel)
> > > > +{
> > > > +	track_tunnel_ref(tunnel, NULL);
> > > > +
> > > > +	return tunnel_get(tunnel);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_dp_tunnel_get_untracked);
> > > 
> > > Why do these exist?
> > 
> > They implement drm_dp_tunnel_get()/put() if
> > CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE=n.
> 
> Why does that kind of irrelevant detail need to be visible
> in the exported api?

In non-debug builds the ref_tracker object isn't needed and so
drm_dp_tunnel_ref won't contain a pointer to it either.
drm_dp_tunnel_get/put_untracked() provide a way to get/put a tunnel
reference without having to pass a ref_tracker pointer.

> 
> -- 
> Ville Syrjälä
> Intel
