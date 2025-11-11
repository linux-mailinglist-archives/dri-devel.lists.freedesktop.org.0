Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D38C4F6D2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 19:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D08110E16A;
	Tue, 11 Nov 2025 18:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 79D1F10E16A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 18:25:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F4841655
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:25:13 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF5BB3F63F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 10:25:20 -0800 (PST)
Date: Tue, 11 Nov 2025 18:25:13 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Abhishek Rajput <abhiraj21put@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/komeda: Convert logging in d71_component.c to drm_*
 with drm_device parameter
Message-ID: <aRN_ierYW0i1VT0E@e110455-lin.cambridge.arm.com>
References: <20251111113717.139401-1-abhiraj21put@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111113717.139401-1-abhiraj21put@gmail.com>
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

On Tue, Nov 11, 2025 at 05:07:17PM +0530, Abhishek Rajput wrote:
> Replace DRM_ERROR() calls in
> drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> with the corresponding drm_err() helper.
> 
> The drm_*() logging helpers take a struct drm_device * as the first
> argument, allowing the DRM core to prefix log messages with the
> corresponding device instance. This improves log traceability when
> multiple display controllers are present.
> 
> The drm_device pointer is now safely obtained using
> komeda_kms_attach(d71->mdev), ensuring proper initialization and
> alignment with Komeda’s internal design.

That is absolutely not safe! komeda_kms_attach() is a heavy operation
that allocates a new drm device and it is meant to be used only at
probe time to "attach" a komeda KMS device. You cannot call it
from deep inside the implementation of a komeda_component.

When you've sent the previous patch I did have a look at d71_component.c
before replying but I've realised that it is not that easy to convert
to drm_err(). So we either remove all the error messages, which I'm
reluctant to do as they are useful for bring up, or we leave the file
alone.

For this patch:

NACKED by Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> This change aligns komeda with the DRM TODO item:
> "Convert logging to drm_* functions with drm_device parameter".
> 
> Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>
> ---
>  .../arm/display/komeda/d71/d71_component.c    | 34 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> index 67e5d3b4190f..3524ca623d6e 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
> @@ -409,6 +409,8 @@ static const struct komeda_component_funcs d71_layer_funcs = {
>  static int d71_layer_init(struct d71_dev *d71,
>  			  struct block_header *blk, u32 __iomem *reg)
>  {
> +	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *c;
>  	struct komeda_layer *layer;
>  	u32 pipe_id, layer_id, layer_info;
> @@ -421,7 +423,7 @@ static int d71_layer_init(struct d71_dev *d71,
>  				 get_valid_inputs(blk),
>  				 1, reg, "LPU%d_LAYER%d", pipe_id, layer_id);
>  	if (IS_ERR(c)) {
> -		DRM_ERROR("Failed to add layer component\n");
> +		drm_err(drm, "Failed to add layer component\n");
>  		return PTR_ERR(c);
>  	}
>  
> @@ -527,6 +529,8 @@ static const struct komeda_component_funcs d71_wb_layer_funcs = {
>  static int d71_wb_layer_init(struct d71_dev *d71,
>  			     struct block_header *blk, u32 __iomem *reg)
>  {
> +	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *c;
>  	struct komeda_layer *wb_layer;
>  	u32 pipe_id, layer_id;
> @@ -539,7 +543,7 @@ static int d71_wb_layer_init(struct d71_dev *d71,
>  				 1, get_valid_inputs(blk), 0, reg,
>  				 "LPU%d_LAYER_WR", pipe_id);
>  	if (IS_ERR(c)) {
> -		DRM_ERROR("Failed to add wb_layer component\n");
> +		drm_err(drm, "Failed to add wb_layer component\n");
>  		return PTR_ERR(c);
>  	}
>  
> @@ -837,6 +841,8 @@ static const struct komeda_component_funcs d71_scaler_funcs = {
>  static int d71_scaler_init(struct d71_dev *d71,
>  			   struct block_header *blk, u32 __iomem *reg)
>  {
> +	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *c;
>  	struct komeda_scaler *scaler;
>  	u32 pipe_id, comp_id;
> @@ -851,7 +857,7 @@ static int d71_scaler_init(struct d71_dev *d71,
>  				 pipe_id, BLOCK_INFO_BLK_ID(blk->block_info));
>  
>  	if (IS_ERR(c)) {
> -		DRM_ERROR("Failed to initialize scaler");
> +		drm_err(drm, "Failed to initialize scaler");
>  		return PTR_ERR(c);
>  	}
>  
> @@ -945,6 +951,8 @@ static const struct komeda_component_funcs d71_splitter_funcs = {
>  static int d71_splitter_init(struct d71_dev *d71,
>  			     struct block_header *blk, u32 __iomem *reg)
>  {
> +	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *c;
>  	struct komeda_splitter *splitter;
>  	u32 pipe_id, comp_id;
> @@ -959,7 +967,7 @@ static int d71_splitter_init(struct d71_dev *d71,
>  				 "CU%d_SPLITTER", pipe_id);
>  
>  	if (IS_ERR(c)) {
> -		DRM_ERROR("Failed to initialize splitter");
> +		drm_err(drm, "Failed to initialize splitter");
>  		return -1;
>  	}
>  
> @@ -1015,6 +1023,8 @@ static const struct komeda_component_funcs d71_merger_funcs = {
>  static int d71_merger_init(struct d71_dev *d71,
>  			   struct block_header *blk, u32 __iomem *reg)
>  {
> +	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *c;
>  	struct komeda_merger *merger;
>  	u32 pipe_id, comp_id;
> @@ -1030,7 +1040,7 @@ static int d71_merger_init(struct d71_dev *d71,
>  				 "CU%d_MERGER", pipe_id);
>  
>  	if (IS_ERR(c)) {
> -		DRM_ERROR("Failed to initialize merger.\n");
> +		drm_err(drm, "Failed to initialize merger.\n");
>  		return PTR_ERR(c);
>  	}
>  
> @@ -1126,6 +1136,8 @@ static const struct komeda_component_funcs d71_improc_funcs = {
>  static int d71_improc_init(struct d71_dev *d71,
>  			   struct block_header *blk, u32 __iomem *reg)
>  {
> +	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *c;
>  	struct komeda_improc *improc;
>  	u32 pipe_id, comp_id, value;
> @@ -1139,7 +1151,7 @@ static int d71_improc_init(struct d71_dev *d71,
>  				 get_valid_inputs(blk),
>  				 IPS_NUM_OUTPUT_IDS, reg, "DOU%d_IPS", pipe_id);
>  	if (IS_ERR(c)) {
> -		DRM_ERROR("Failed to add improc component\n");
> +		drm_err(drm, "Failed to add improc component\n");
>  		return PTR_ERR(c);
>  	}
>  
> @@ -1253,6 +1265,8 @@ static const struct komeda_component_funcs d71_timing_ctrlr_funcs = {
>  static int d71_timing_ctrlr_init(struct d71_dev *d71,
>  				 struct block_header *blk, u32 __iomem *reg)
>  {
> +	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
> +	struct drm_device *drm = &kms->base;
>  	struct komeda_component *c;
>  	struct komeda_timing_ctrlr *ctrlr;
>  	u32 pipe_id, comp_id;
> @@ -1266,7 +1280,7 @@ static int d71_timing_ctrlr_init(struct d71_dev *d71,
>  				 1, BIT(KOMEDA_COMPONENT_IPS0 + pipe_id),
>  				 BS_NUM_OUTPUT_IDS, reg, "DOU%d_BS", pipe_id);
>  	if (IS_ERR(c)) {
> -		DRM_ERROR("Failed to add display_ctrl component\n");
> +		drm_err(drm, "Failed to add display_ctrl component\n");
>  		return PTR_ERR(c);
>  	}
>  
> @@ -1280,6 +1294,8 @@ static int d71_timing_ctrlr_init(struct d71_dev *d71,
>  int d71_probe_block(struct d71_dev *d71,
>  		    struct block_header *blk, u32 __iomem *reg)
>  {
> +	struct komeda_kms_dev *kms = komeda_kms_attach(d71->mdev);
> +	struct drm_device *drm = &kms->base;
>  	struct d71_pipeline *pipe;
>  	int blk_id = BLOCK_INFO_BLK_ID(blk->block_info);
>  
> @@ -1346,8 +1362,8 @@ int d71_probe_block(struct d71_dev *d71,
>  		break;
>  
>  	default:
> -		DRM_ERROR("Unknown block (block_info: 0x%x) is found\n",
> -			  blk->block_info);
> +		drm_err(drm, "Unknown block (block_info: 0x%x) is found\n",
> +			blk->block_info);
>  		err = -EINVAL;
>  		break;
>  	}
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
