Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A263F49AB88
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 06:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBF210E311;
	Tue, 25 Jan 2022 05:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AA410E2F4;
 Tue, 25 Jan 2022 05:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643087852; x=1674623852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=szMhn+GZucHPTDtHBcqaEh1jiwyMxWJmIcgFkQpSSbQ=;
 b=OaUH3Gr7tRwXXkRd3UTj6vOpewleXmaXs0qOmUJU8MI61wU4khd9jxXy
 3HGerIXEsGHSmW/3yq079Hdmex6Ej7OVVaUt+lYpg5WdY5mR2/v4GMxRn
 eFPGo9JetxyfEtQYJrowf8r2EFv1xFLi0zp3Ve3qpxZCFXy6OtVw4ezFT
 Q4JPMtpAICecsWt/DYEcYkU2FRLa3vzhlU/UN1Tr/upo++Zf9lLBJMB4d
 ncAk/Sp4X2uW154o0xtkKrT/llXTSKNM42q0YQscaNyabih1aj/Q5UJzt
 AWqdeEqy9beIY9CwfY3pZqMAddUJl96Ug3HaS227UAPCS+5622+Len9l8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246004088"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="246004088"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 21:17:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="624343984"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by fmsmga002.fm.intel.com with SMTP; 24 Jan 2022 21:17:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 07:17:25 +0200
Date: Tue, 25 Jan 2022 07:17:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/i915/overlay: Prevent divide by zero bugs in scaling
Message-ID: <Ye+H5fF6KeNA1Be3@intel.com>
References: <20220124122409.GA31673@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220124122409.GA31673@kili>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Eric Anholt <eric@anholt.net>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 03:24:09PM +0300, Dan Carpenter wrote:
> Smatch detected a divide by zero bug in check_overlay_scaling().
> 
>     drivers/gpu/drm/i915/display/intel_overlay.c:976 check_overlay_scaling()
>     error: potential divide by zero bug '/ rec->dst_height'.
>     drivers/gpu/drm/i915/display/intel_overlay.c:980 check_overlay_scaling()
>     error: potential divide by zero bug '/ rec->dst_width'.
> 
> Prevent this by ensuring that the dst height and width are non-zero.
> 
> Fixes: 02e792fbaadb ("drm/i915: implement drmmode overlay support v4")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks. Pushed to drm-intel-next.

> ---
> >From static analysis.  Not tested.
> 
>  drivers/gpu/drm/i915/display/intel_overlay.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index 1a376e9a1ff3..d610e48cab94 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -959,6 +959,9 @@ static int check_overlay_dst(struct intel_overlay *overlay,
>  	const struct intel_crtc_state *pipe_config =
>  		overlay->crtc->config;
>  
> +	if (rec->dst_height == 0 || rec->dst_width == 0)
> +		return -EINVAL;
> +
>  	if (rec->dst_x < pipe_config->pipe_src_w &&
>  	    rec->dst_x + rec->dst_width <= pipe_config->pipe_src_w &&
>  	    rec->dst_y < pipe_config->pipe_src_h &&
> -- 
> 2.20.1

-- 
Ville Syrjälä
Intel
