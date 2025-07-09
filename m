Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86D1AFF460
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 00:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE0510E0EA;
	Wed,  9 Jul 2025 22:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ZwR2qLEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A9310E0EA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 22:07:16 +0000 (UTC)
Message-ID: <b28cb9d6-a280-4d27-a987-d707ee0dadce@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1752098834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKT+aLQckbA47j8c6j24QKkcEoUaV7BFT/xYV2Y2qOI=;
 b=ZwR2qLEaRaITQBcOf2TE4tfqc9nZSgPX6Xo7MFvCAOYpbJT49MGp6p0sqEvCh+QtIWz9nA
 Oin+fRnWvlvrUyJxmHSZRvQlaYj2+d/womtC4naa3nmVgLiJSOtW4dtMzttun2XtSOyiA4
 B+6TB6ubJhNZ1plXopB6cyRLsBXjLtQ=
Date: Wed, 9 Jul 2025 23:07:09 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/tidss: oldi: convert to devm_drm_bridge_alloc() API
To: Jayesh Choudhary <j-choudhary@ti.com>, jyri.sarha@iki.fi,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, devarsht@ti.com,
 tomi.valkeinen@ideasonboard.com
Cc: airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org
References: <20250701055002.52336-1-j-choudhary@ti.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20250701055002.52336-1-j-choudhary@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi Jayesh,

Thank you for testing the OLDI series out, and finding and reporting the
issue.

On 01/07/25 06:50, Jayesh Choudhary wrote:
> DRM bridges now uses "devm_drm_bridge_alloc()" for allocation and
> initialization. "devm_kzalloc()" is not allowed anymore and it results
> in WARNING. So convert it.
> 
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> 
> Warning log:
> <https://gist.github.com/Jayesh2000/e42c235bb57cb0f0af06c8c3bf886ef2>
> 
>  drivers/gpu/drm/tidss/tidss_oldi.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
> index 8223b8fec8ce..b0f99656e87e 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -534,11 +534,10 @@ int tidss_oldi_init(struct tidss_device *tidss)
>  			continue;
>  		}
>  
> -		oldi = devm_kzalloc(tidss->dev, sizeof(*oldi), GFP_KERNEL);
> -		if (!oldi) {
> -			ret = -ENOMEM;
> -			goto err_put_node;
> -		}
> +		oldi = devm_drm_bridge_alloc(tidss->dev, struct tidss_oldi, bridge,
> +					     &tidss_oldi_bridge_funcs);
> +		if (IS_ERR(oldi))
> +			return PTR_ERR(oldi);

The 'child' and 'oldi_parent' device nodes need to be put back before
the error is returned.

This should do it.
	
	ret = PTR_ERR(oldi);
	goto err_put_node;

>  
>  		oldi->parent_vp = parent_vp;
>  		oldi->oldi_instance = oldi_instance;
> @@ -577,7 +576,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
>  		/* Register the bridge. */
>  		oldi->bridge.of_node = child;
>  		oldi->bridge.driver_private = oldi;
> -		oldi->bridge.funcs = &tidss_oldi_bridge_funcs;
>  		oldi->bridge.timings = &default_tidss_oldi_timings;
>  
>  		tidss->oldis[tidss->num_oldis++] = oldi;

With that changed,

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya

