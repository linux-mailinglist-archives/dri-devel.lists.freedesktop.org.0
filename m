Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1725365AFD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 16:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B516E830;
	Tue, 20 Apr 2021 14:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976A989DEA;
 Tue, 20 Apr 2021 14:14:47 +0000 (UTC)
IronPort-SDR: Fz9nuAD9X5sEx3re3IddpegxuXUyrXj+Q6HbvALPrWPyffLYjsDyT7qiY5NwjnGJQUGNb4yY8d
 ZWCFhRgK0IHA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="192325053"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="192325053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 07:14:46 -0700
IronPort-SDR: q/GQMT/wE/Kr2aQ6ZrfxZhx8yWoJSN1FQ0DyeD4QXmjxXaHoFZQWlL+UU+DixPiVNOH2H+pWkC
 Q07Owa5Fdlzw==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="426970209"
Received: from jyick-mobl.amr.corp.intel.com (HELO intel.com) ([10.212.57.228])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 07:14:44 -0700
Date: Tue, 20 Apr 2021 10:14:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/i915: fix an error code in
 intel_overlay_do_put_image()
Message-ID: <YH7h0jEiCcN2z5e8@intel.com>
References: <YHaFcEzcnh/hk1/Q@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHaFcEzcnh/hk1/Q@mwanda>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 09:02:24AM +0300, Dan Carpenter wrote:
> This code should propagate the error from intel_overlay_pin_fb()
> but currently it returns success.
> 
> Fixes: 1b321026e213 ("drm/i915: Pass ww ctx to intel_pin_to_display_plane")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

and pushed. thanks for the patch.

> ---
>  drivers/gpu/drm/i915/display/intel_overlay.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index e477b6114a60..e5dadde422f7 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -803,8 +803,10 @@ static int intel_overlay_do_put_image(struct intel_overlay *overlay,
>  	atomic_inc(&dev_priv->gpu_error.pending_fb_pin);
>  
>  	vma = intel_overlay_pin_fb(new_bo);
> -	if (IS_ERR(vma))
> +	if (IS_ERR(vma)) {
> +		ret = PTR_ERR(vma);
>  		goto out_pin_section;
> +	}
>  
>  	i915_gem_object_flush_frontbuffer(new_bo, ORIGIN_DIRTYFB);
>  
> -- 
> 2.30.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
