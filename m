Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F2051079C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 20:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E815D10E42B;
	Tue, 26 Apr 2022 18:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1C210E42B;
 Tue, 26 Apr 2022 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650999180; x=1682535180;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FJKMc/lYu6nm2RJBh6Fnpwy4iiyWCJ9XgCKkmL84ZA4=;
 b=mwKZiQxeQ2707eyAQGzGFkeRuQZ68CPjSWqgl57WtVsXLhlW3wgPOBFx
 4mMTpQu71NcMYLjG8u6rDrUIbHetwGNFfFMAM2PjOSA05GfTXYaUvDh2/
 o5kjfrD0EqBlMMoCS15l+vWP1lo76GPuUeF1GsbnSdXz3WnkNb8BZegyc
 Um3Jc4iipm+Jx5Ikf2wrByKgakxDdca3O0Z1MjUPqXjt9x5+252cwChRu
 TEXwhNvI06vvQfV/6VZrsHsepcLxYNEaYe4xxXFRPwkrr50skeiS4Ykt4
 d97tJV95h0XrimuuTxBFGT+rcCRkxc72EYQZWnkZNK9svtvwGCaZRZWqD w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245612386"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="245612386"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="580093662"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga008.jf.intel.com with SMTP; 26 Apr 2022 11:52:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 26 Apr 2022 21:52:56 +0300
Date: Tue, 26 Apr 2022 21:52:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 01/19] drm/edid: reset display info in
 drm_add_edid_modes() for NULL edid
Message-ID: <Ymg/iPJeQ2o9Zj2k@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
 <595358f27ca2abb29ce6eaf855e106ff19df87fa.1649948562.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <595358f27ca2abb29ce6eaf855e106ff19df87fa.1649948562.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 06:06:44PM +0300, Jani Nikula wrote:
> If a NULL edid gets passed to drm_add_edid_modes(), we should probably
> also reset the display info.

One concern I had with this is resetting of eg. {width,height}_mm
which might have been populated by intel_panel_add_fixed_mode().
But I think that might already happen anyway through one of the
other codepaths that call drm_reset_display_info() so probably not
something that is made any worse by this patch.

IIRC at one point I tried to startd cleaning up the display_info
mess a bit but the patches got stuck in some silly bikeshed
so I gave up.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 324ce8467915..4758e78fad82 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5721,6 +5721,7 @@ static int drm_edid_connector_update(struct drm_connector *connector,
>  	u32 quirks;
>  
>  	if (edid == NULL) {
> +		drm_reset_display_info(connector);
>  		clear_eld(connector);
>  		return 0;
>  	}
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
