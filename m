Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D1684A8FD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 23:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D333112633;
	Mon,  5 Feb 2024 22:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SzrWIzC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7219311262E;
 Mon,  5 Feb 2024 22:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707171445; x=1738707445;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lSbIoKUaQP5e158WSd2mze7ziXW4IngltiltpvZPs9U=;
 b=SzrWIzC4EaosYJzfz8WgesLm/J8CypirH7ZR5vFF/aPgqP0xuGT5LYik
 3Gv1ug0ISpIZ4/103Opm4Hqb3Cp+XNMTZZgnjEyFLTWrQkIdWalRjUkXc
 OQblXdotbmL9fbwx656Xs8COxw6cys6O4I2ycUHob6Ugb1mnr9KcWFUJH
 5uE0a0UayB0QbNm52DZzWV2Fz8ylApsiEO9waa16CfqCI/4Y8WxvNmsTW
 zFywXkENuW7a0idAyX47kg1isTlKbugkKxLSgHz5KG8sMisgkPkPbUxnJ
 BQiV9Z65c9BLLV2BbcBS2Ex5tLoY5JxYgngkA2rhzwXkuwD2zdKmr5TVF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11353995"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11353995"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 14:17:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="823984138"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="823984138"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Feb 2024 14:17:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 00:17:18 +0200
Date: Tue, 6 Feb 2024 00:17:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/19] drm/dp: Add support for DP tunneling
Message-ID: <ZcFebqQ9EA5vDBDa@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-3-imre.deak@intel.com>
 <ZbpwoA1gXI_dnZAr@intel.com>
 <ZbqWLMLHMHpj+SLX@ideak-desk.fi.intel.com>
 <ZcEJKkLKeJyggHac@intel.com>
 <ZcEXpYkbrOnSGILQ@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcEXpYkbrOnSGILQ@ideak-desk.fi.intel.com>
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

On Mon, Feb 05, 2024 at 07:15:17PM +0200, Imre Deak wrote:
> On Mon, Feb 05, 2024 at 06:13:30PM +0200, Ville Syrjälä wrote:
> > On Wed, Jan 31, 2024 at 08:49:16PM +0200, Imre Deak wrote:
> > > On Wed, Jan 31, 2024 at 06:09:04PM +0200, Ville Syrjälä wrote:
> > > > On Tue, Jan 23, 2024 at 12:28:33PM +0200, Imre Deak wrote:
> > > > > +static void untrack_tunnel_ref(struct drm_dp_tunnel *tunnel,
> > > > > +			       struct ref_tracker **tracker)
> > > > > +{
> > > > > +	ref_tracker_free(&tunnel->group->mgr->ref_tracker,
> > > > > +			 tracker);
> > > > > +}
> > > > > +
> > > > > +struct drm_dp_tunnel *
> > > > > +drm_dp_tunnel_get_untracked(struct drm_dp_tunnel *tunnel)
> > > > > +{
> > > > > +	track_tunnel_ref(tunnel, NULL);
> > > > > +
> > > > > +	return tunnel_get(tunnel);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_dp_tunnel_get_untracked);
> > > > 
> > > > Why do these exist?
> > > 
> > > They implement drm_dp_tunnel_get()/put() if
> > > CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE=n.
> > 
> > Why does that kind of irrelevant detail need to be visible
> > in the exported api?
> 
> In non-debug builds the ref_tracker object isn't needed and so
> drm_dp_tunnel_ref won't contain a pointer to it either.

Since it's just a pointer I don't see much point in making
things more complicated by leaving it out.

> drm_dp_tunnel_get/put_untracked() provide a way to get/put a tunnel
> reference without having to pass a ref_tracker pointer.
> 
> > 
> > -- 
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
