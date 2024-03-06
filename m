Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E62873808
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 14:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FF31131C0;
	Wed,  6 Mar 2024 13:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 741C91131C0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 13:44:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9A59C15
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 05:44:37 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 464E03F762
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 05:44:00 -0800 (PST)
Date: Wed, 6 Mar 2024 13:43:56 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Faiz Abbas <faiz.abbas@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH 1/3] drm/arm/komeda: Fix komeda probe failing if there
 are no links in the secondary pipeline
Message-ID: <ZehzHJonrS7dLSHn@e110455-lin.cambridge.arm.com>
References: <20240219100915.192475-1-faiz.abbas@arm.com>
 <20240219100915.192475-2-faiz.abbas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240219100915.192475-2-faiz.abbas@arm.com>
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

Hi Faiz,

On Mon, Feb 19, 2024 at 03:39:13PM +0530, Faiz Abbas wrote:
> Since commit f7936d6beda9 ("drm/arm/komeda: Remove component framework and
> add a simple encoder"), the devm_drm_of_get_bridge() call happens
> regardless of whether any remote nodes are available on the pipeline. Fix
> this by moving the bridge attach to its own function and calling it
> conditional on there being an output link.
> 
> Fixes: f7936d6beda9 ("drm/arm/komeda: Remove component framework and add a simple encoder")

I don't know what tree you're using, but the commit that you're quoting here is
actually 4cfe5cc02e3f. I will fix it when I merge the patch.

Best regards,
Liviu

> Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 43 ++++++++++++++-----
>  1 file changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> index 2c661f28410e..b645c5998230 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
> @@ -5,6 +5,7 @@
>   *
>   */
>  #include <linux/clk.h>
> +#include <linux/of.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/spinlock.h>
>  
> @@ -610,12 +611,34 @@ get_crtc_primary(struct komeda_kms_dev *kms, struct komeda_crtc *crtc)
>  	return NULL;
>  }
>  
> +static int komeda_attach_bridge(struct device *dev,
> +				struct komeda_pipeline *pipe,
> +				struct drm_encoder *encoder)
> +{
> +	struct drm_bridge *bridge;
> +	int err;
> +
> +	bridge = devm_drm_of_get_bridge(dev, pipe->of_node,
> +					KOMEDA_OF_PORT_OUTPUT, 0);
> +	if (IS_ERR(bridge))
> +		return dev_err_probe(dev, PTR_ERR(bridge), "remote bridge not found for pipe: %s\n",
> +				     of_node_full_name(pipe->of_node));
> +
> +	err = drm_bridge_attach(encoder, bridge, NULL, 0);
> +	if (err)
> +		dev_err(dev, "bridge_attach() failed for pipe: %s\n",
> +			of_node_full_name(pipe->of_node));
> +
> +	return err;
> +}
> +
>  static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  			   struct komeda_crtc *kcrtc)
>  {
>  	struct drm_crtc *crtc = &kcrtc->base;
>  	struct drm_device *base = &kms->base;
> -	struct drm_bridge *bridge;
> +	struct komeda_pipeline *pipe = kcrtc->master;
> +	struct drm_encoder *encoder = &kcrtc->encoder;
>  	int err;
>  
>  	err = drm_crtc_init_with_planes(base, crtc,
> @@ -626,27 +649,25 @@ static int komeda_crtc_add(struct komeda_kms_dev *kms,
>  
>  	drm_crtc_helper_add(crtc, &komeda_crtc_helper_funcs);
>  
> -	crtc->port = kcrtc->master->of_output_port;
> +	crtc->port = pipe->of_output_port;
>  
>  	/* Construct an encoder for each pipeline and attach it to the remote
>  	 * bridge
>  	 */
>  	kcrtc->encoder.possible_crtcs = drm_crtc_mask(crtc);
> -	err = drm_simple_encoder_init(base, &kcrtc->encoder,
> -				      DRM_MODE_ENCODER_TMDS);
> +	err = drm_simple_encoder_init(base, encoder, DRM_MODE_ENCODER_TMDS);
>  	if (err)
>  		return err;
>  
> -	bridge = devm_drm_of_get_bridge(base->dev, kcrtc->master->of_node,
> -					KOMEDA_OF_PORT_OUTPUT, 0);
> -	if (IS_ERR(bridge))
> -		return PTR_ERR(bridge);
> -
> -	err = drm_bridge_attach(&kcrtc->encoder, bridge, NULL, 0);
> +	if (pipe->of_output_links[0]) {
> +		err = komeda_attach_bridge(base->dev, pipe, encoder);
> +		if (err)
> +			return err;
> +	}
>  
>  	drm_crtc_enable_color_mgmt(crtc, 0, true, KOMEDA_COLOR_LUT_SIZE);
>  
> -	return err;
> +	return 0;
>  }
>  
>  int komeda_kms_add_crtcs(struct komeda_kms_dev *kms, struct komeda_dev *mdev)
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
