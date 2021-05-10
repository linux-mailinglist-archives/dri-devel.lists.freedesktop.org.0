Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A1D37974E
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 20:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E122489E15;
	Mon, 10 May 2021 18:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FEF89E15
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 18:58:22 +0000 (UTC)
IronPort-SDR: hrtk5h5yA1vbJ3aieqhF0Oy5oDT7YMkmP3B2zHOWHsjqUT/KAQs6TcWYdUQNDTal8VgMHY70re
 YmvXe5+wBxmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="186397479"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; d="scan'208";a="186397479"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 11:58:21 -0700
IronPort-SDR: +nz7qXDCXeB+sCLTczfEsaDbsEEhfvqceOUFejnXjavRMsg/m+68aE4tZ6lvoEdeuPgiJgsNsl
 hvgdIKnler3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; d="scan'208";a="392023840"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 10 May 2021 11:58:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 10 May 2021 21:58:17 +0300
Date: Mon, 10 May 2021 21:58:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/dp: Fix bogus DPCD version check in
 drm_dp_read_downstream_info()
Message-ID: <YJmCSTg+j+M/6SoC@intel.com>
References: <20210507214209.554866-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210507214209.554866-1-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 07, 2021 at 05:42:09PM -0400, Lyude Paul wrote:
> Ville pointed this out to me when fixing some issues in
> drm_dp_read_downstream_info() - the DPCD version check here is bogus as
> there's no DisplayPort versions prior to 1.0. The original code from i915
> that this was extracted from actually did:
> 
>   dpcd[DP_DPCD_REV] == DP_DPCD_REV_10
> 
> Which is correct, and somehow got missed when extracting this function. So
> let's fix this. Note that as far as I'm aware, I don't think this fixes any
> actual issues users are hitting.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_dp_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 0f84df8798ab..55b53df6ce34 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -677,7 +677,7 @@ int drm_dp_read_downstream_info(struct drm_dp_aux *aux,
>  	memset(downstream_ports, 0, DP_MAX_DOWNSTREAM_PORTS);
>  
>  	/* No downstream info to read */
> -	if (!drm_dp_is_branch(dpcd) || dpcd[DP_DPCD_REV] < DP_DPCD_REV_10)
> +	if (!drm_dp_is_branch(dpcd) || dpcd[DP_DPCD_REV] == DP_DPCD_REV_10)
>  		return 0;
>  
>  	/* Some branches advertise having 0 downstream ports, despite also advertising they have a
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
