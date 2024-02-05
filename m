Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2F849F4D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 17:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BEB10FA8E;
	Mon,  5 Feb 2024 16:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7Mu+ABr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24910FA8E;
 Mon,  5 Feb 2024 16:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707149614; x=1738685614;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OurjTyffyBhVC+5gDBnUUz3s/yHBJOc9kb5Um3PS++c=;
 b=G7Mu+ABrUsE7zrtEoIATTe4UzM2B3MroshHQ8OCDGiJaVHogMo4IL66d
 kbd95NjA/8Li+mbD/ehcRSMGDAhZooXR2AUiKFxDxhjLoMoIm2ZBl3gGj
 Q8VmIn0b2WmvSqfA6HJaNanR74YTikoTTsr1PvuDuyZVJH0viF9MMqnWU
 73zNm49rIxDb/Aqu1qu266eoVXigHLdhNTObJhDri1nw1/7ccy2Xwy5AR
 OpUBG6VtX8JPyPLDQKmMmXoDAFPhCqgUkgjJhcW+b4KYMr6DEhSiTlbm7
 17Gdnc17XuQhK7+Ng0W7JRYsE8ZnvBosbM3m1MLPh5XN56RNCjefAQoh2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11197819"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11197819"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 08:13:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="823895222"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="823895222"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Feb 2024 08:13:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 18:13:30 +0200
Date: Mon, 5 Feb 2024 18:13:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 02/19] drm/dp: Add support for DP tunneling
Message-ID: <ZcEJKkLKeJyggHac@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-3-imre.deak@intel.com>
 <ZbpwoA1gXI_dnZAr@intel.com>
 <ZbqWLMLHMHpj+SLX@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbqWLMLHMHpj+SLX@ideak-desk.fi.intel.com>
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

On Wed, Jan 31, 2024 at 08:49:16PM +0200, Imre Deak wrote:
> On Wed, Jan 31, 2024 at 06:09:04PM +0200, Ville Syrjälä wrote:
> > On Tue, Jan 23, 2024 at 12:28:33PM +0200, Imre Deak wrote:
> > > +static void untrack_tunnel_ref(struct drm_dp_tunnel *tunnel,
> > > +			       struct ref_tracker **tracker)
> > > +{
> > > +	ref_tracker_free(&tunnel->group->mgr->ref_tracker,
> > > +			 tracker);
> > > +}
> > > +
> > > +struct drm_dp_tunnel *
> > > +drm_dp_tunnel_get_untracked(struct drm_dp_tunnel *tunnel)
> > > +{
> > > +	track_tunnel_ref(tunnel, NULL);
> > > +
> > > +	return tunnel_get(tunnel);
> > > +}
> > > +EXPORT_SYMBOL(drm_dp_tunnel_get_untracked);
> > 
> > Why do these exist?
> 
> They implement drm_dp_tunnel_get()/put() if
> CONFIG_DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE=n.

Why does that kind of irrelevant detail need to be visible
in the exported api?

-- 
Ville Syrjälä
Intel
