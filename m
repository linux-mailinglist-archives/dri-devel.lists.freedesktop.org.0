Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6451C5CB61
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 11:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514AF10EA32;
	Fri, 14 Nov 2025 10:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E2ADF10EA32
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 10:56:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEBAF1063
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 02:56:13 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 423B53F66E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 02:56:21 -0800 (PST)
Date: Fri, 14 Nov 2025 10:56:13 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/komeda: Convert logging in komeda_pipeline.c to
 drm_* with drm_device parameter
Message-ID: <aRcKzbV_cKbC6vlV@e110455-lin.cambridge.arm.com>
References: <20251114091825.3591430-1-rk0006818@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114091825.3591430-1-rk0006818@gmail.com>
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

On Fri, Nov 14, 2025 at 02:48:25PM +0530, Rahul Kumar wrote:
> Replace DRM_ERROR/WARN/INFO() and DRM_DEBUG() calls in
> drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c with the
> drm_err(), drm_warn(), drm_info() and drm_dbg() helpers.
> 
> The drm_*() logging macros require a struct drm_device * parameter,
> which allows the DRM core to prefix log messages with the device
> instance. This is important for distinguishing logs when multiple
> Komeda or other DRM devices are present.
> 
> This conversion follows the DRM TODO entry:
> "Convert logging to drm_* functions with drm_device parameter".
> 
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Will push this today to drm-misc-next.

Best regards,
Liviu

> ---
>  .../drm/arm/display/komeda/komeda_pipeline.c  | 53 ++++++++++++-------
>  1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
> index 81e244f0c0ca..88d24b074e5e 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
> @@ -18,16 +18,18 @@ struct komeda_pipeline *
>  komeda_pipeline_add(struct komeda_dev *mdev, size_t size,
>  		    const struct komeda_pipeline_funcs *funcs)
>  {
> +	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_pipeline *pipe;
>  
>  	if (mdev->n_pipelines + 1 > KOMEDA_MAX_PIPELINES) {
> -		DRM_ERROR("Exceed max support %d pipelines.\n",
> -			  KOMEDA_MAX_PIPELINES);
> +		drm_err(drm, "Exceed max support %d pipelines.\n",
> +			KOMEDA_MAX_PIPELINES);
>  		return ERR_PTR(-ENOSPC);
>  	}
>  
>  	if (size < sizeof(*pipe)) {
> -		DRM_ERROR("Request pipeline size too small.\n");
> +		drm_err(drm, "Request pipeline size too small.\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> @@ -71,6 +73,8 @@ static struct komeda_component **
>  komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
>  {
>  	struct komeda_dev *mdev = pipe->mdev;
> +	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_pipeline *temp = NULL;
>  	struct komeda_component **pos = NULL;
>  
> @@ -88,7 +92,7 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
>  	case KOMEDA_COMPONENT_COMPIZ1:
>  		temp = mdev->pipelines[id - KOMEDA_COMPONENT_COMPIZ0];
>  		if (!temp) {
> -			DRM_ERROR("compiz-%d doesn't exist.\n", id);
> +			drm_err(drm, "compiz-%d doesn't exist.\n", id);
>  			return NULL;
>  		}
>  		pos = to_cpos(temp->compiz);
> @@ -107,7 +111,7 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
>  	case KOMEDA_COMPONENT_IPS1:
>  		temp = mdev->pipelines[id - KOMEDA_COMPONENT_IPS0];
>  		if (!temp) {
> -			DRM_ERROR("ips-%d doesn't exist.\n", id);
> +			drm_err(drm, "ips-%d doesn't exist.\n", id);
>  			return NULL;
>  		}
>  		pos = to_cpos(temp->improc);
> @@ -117,7 +121,7 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
>  		break;
>  	default:
>  		pos = NULL;
> -		DRM_ERROR("Unknown pipeline resource ID: %d.\n", id);
> +		drm_err(drm, "Unknown pipeline resource ID: %d.\n", id);
>  		break;
>  	}
>  
> @@ -169,6 +173,8 @@ komeda_component_add(struct komeda_pipeline *pipe,
>  		     u8 max_active_outputs, u32 __iomem *reg,
>  		     const char *name_fmt, ...)
>  {
> +	struct komeda_kms_dev *kms = dev_get_drvdata(pipe->mdev->dev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component **pos;
>  	struct komeda_component *c;
>  	int idx, *num = NULL;
> @@ -187,14 +193,14 @@ komeda_component_add(struct komeda_pipeline *pipe,
>  		idx = id - KOMEDA_COMPONENT_LAYER0;
>  		num = &pipe->n_layers;
>  		if (idx != pipe->n_layers) {
> -			DRM_ERROR("please add Layer by id sequence.\n");
> +			drm_err(drm, "please add Layer by id sequence.\n");
>  			return ERR_PTR(-EINVAL);
>  		}
>  	} else if (has_bit(id,  KOMEDA_PIPELINE_SCALERS)) {
>  		idx = id - KOMEDA_COMPONENT_SCALER0;
>  		num = &pipe->n_scalers;
>  		if (idx != pipe->n_scalers) {
> -			DRM_ERROR("please add Scaler by id sequence.\n");
> +			drm_err(drm, "please add Scaler by id sequence.\n");
>  			return ERR_PTR(-EINVAL);
>  		}
>  	}
> @@ -240,27 +246,32 @@ static void komeda_component_dump(struct komeda_component *c)
>  	if (!c)
>  		return;
>  
> -	DRM_DEBUG("	%s: ID %d-0x%08lx.\n",
> -		  c->name, c->id, BIT(c->id));
> -	DRM_DEBUG("		max_active_inputs:%d, supported_inputs: 0x%08x.\n",
> -		  c->max_active_inputs, c->supported_inputs);
> -	DRM_DEBUG("		max_active_outputs:%d, supported_outputs: 0x%08x.\n",
> -		  c->max_active_outputs, c->supported_outputs);
> +	struct komeda_kms_dev *kms = dev_get_drvdata(c->pipeline->mdev->dev);
> +	struct drm_device *drm = &kms->base;
> +
> +	drm_dbg(drm, "	%s: ID %d-0x%08lx.\n",
> +		c->name, c->id, BIT(c->id));
> +	drm_dbg(drm, "		max_active_inputs:%d, supported_inputs: 0x%08x.\n",
> +		c->max_active_inputs, c->supported_inputs);
> +	drm_dbg(drm, "		max_active_outputs:%d, supported_outputs: 0x%08x.\n",
> +		c->max_active_outputs, c->supported_outputs);
>  }
>  
>  void komeda_pipeline_dump(struct komeda_pipeline *pipe)
>  {
> +	struct komeda_kms_dev *kms = dev_get_drvdata(pipe->mdev->dev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *c;
>  	int id;
>  	unsigned long avail_comps = pipe->avail_comps;
>  
> -	DRM_INFO("Pipeline-%d: n_layers: %d, n_scalers: %d, output: %s.\n",
> +	drm_info(drm, "Pipeline-%d: n_layers: %d, n_scalers: %d, output: %s.\n",
>  		 pipe->id, pipe->n_layers, pipe->n_scalers,
>  		 pipe->dual_link ? "dual-link" : "single-link");
> -	DRM_INFO("	output_link[0]: %s.\n",
> +	drm_info(drm, "	output_link[0]: %s.\n",
>  		 pipe->of_output_links[0] ?
>  		 pipe->of_output_links[0]->full_name : "none");
> -	DRM_INFO("	output_link[1]: %s.\n",
> +	drm_info(drm, "	output_link[1]: %s.\n",
>  		 pipe->of_output_links[1] ?
>  		 pipe->of_output_links[1]->full_name : "none");
>  
> @@ -274,6 +285,8 @@ void komeda_pipeline_dump(struct komeda_pipeline *pipe)
>  static void komeda_component_verify_inputs(struct komeda_component *c)
>  {
>  	struct komeda_pipeline *pipe = c->pipeline;
> +	struct komeda_kms_dev *kms = dev_get_drvdata(pipe->mdev->dev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *input;
>  	int id;
>  	unsigned long supported_inputs = c->supported_inputs;
> @@ -282,7 +295,7 @@ static void komeda_component_verify_inputs(struct komeda_component *c)
>  		input = komeda_pipeline_get_component(pipe, id);
>  		if (!input) {
>  			c->supported_inputs &= ~(BIT(id));
> -			DRM_WARN("Can not find input(ID-%d) for component: %s.\n",
> +			drm_warn(drm, "Can not find input(ID-%d) for component: %s.\n",
>  				 id, c->name);
>  			continue;
>  		}
> @@ -306,6 +319,8 @@ komeda_get_layer_split_right_layer(struct komeda_pipeline *pipe,
>  
>  static void komeda_pipeline_assemble(struct komeda_pipeline *pipe)
>  {
> +	struct komeda_kms_dev *kms = dev_get_drvdata(pipe->mdev->dev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *c;
>  	struct komeda_layer *layer;
>  	int i, id;
> @@ -324,7 +339,7 @@ static void komeda_pipeline_assemble(struct komeda_pipeline *pipe)
>  
>  	if (pipe->dual_link && !pipe->ctrlr->supports_dual_link) {
>  		pipe->dual_link = false;
> -		DRM_WARN("PIPE-%d doesn't support dual-link, ignore DT dual-link configuration.\n",
> +		drm_warn(drm, "PIPE-%d doesn't support dual-link, ignore DT dual-link configuration.\n",
>  			 pipe->id);
>  	}
>  }
> -- 
> 2.43.0
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
