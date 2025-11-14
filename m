Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A5CC5E169
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 17:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A981810E24F;
	Fri, 14 Nov 2025 16:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24A0810E24F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 16:07:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 036CC1AC1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:07:51 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 677F73F5A1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 08:07:58 -0800 (PST)
Date: Fri, 14 Nov 2025 16:07:50 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/komeda: Convert logging in d71_dev.c to drm_* with
 drm_device parameter
Message-ID: <aRdT1qscQqO7-U6h@e110455-lin.cambridge.arm.com>
References: <20251114143627.3981217-1-rk0006818@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251114143627.3981217-1-rk0006818@gmail.com>
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

On Fri, Nov 14, 2025 at 08:06:27PM +0530, Rahul Kumar wrote:
> Replace DRM_DEBUG() and DRM_ERROR() calls in
> drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c with the
> drm_dbg() and drm_err() helpers in functions where a drm_device
> parameter is available.
> 
> The drm_*() logging macros require a struct drm_device * parameter,
> which allows the DRM core to prefix log messages with the device
> instance. This improves debugging clarity when multiple Komeda or
> other DRM devices are present.
> 
> Logging in early hardware probing functions such as d71_identify()
> is intentionally left unchanged because they do not have access to
> a drm_device pointer at that stage of initialization.
> 
> This conversion follows the DRM TODO entry:
> "Convert logging to drm_* functions with drm_device parameter".

Hi Rahul,

It would've been nice if these patches were collected in a series.


> 
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> ---
>  .../gpu/drm/arm/display/komeda/d71/d71_dev.c  | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> index 80973975bfdb..4305354badc8 100644
> --- a/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> +++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_dev.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_print.h>
>  #include "d71_dev.h"
>  #include "malidp_io.h"
> +#include "komeda_kms.h"
>  
>  static u64 get_lpu_event(struct d71_pipeline *d71_pipeline)
>  {
> @@ -348,6 +349,8 @@ static void d71_cleanup(struct komeda_dev *mdev)
>  
>  static int d71_enum_resources(struct komeda_dev *mdev)
>  {
> +	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);

I've made a mistake when I've reviewed the previous patch but it applies here too:

dev_get_drvdata(mdev->dev) is going to give you a struct komeda_drv pointer,
because that is what we set it to in komeda_platform_probe(). So this patch
and the previous one for komeda_pipeline.c are invalid and need a respin.

Best regards,
Liviu


> +	struct drm_device *drm = &kms->base;
>  	struct d71_dev *d71;
>  	struct komeda_pipeline *pipe;
>  	struct block_header blk;
> @@ -366,7 +369,7 @@ static int d71_enum_resources(struct komeda_dev *mdev)
>  
>  	err = d71_reset(d71);
>  	if (err) {
> -		DRM_ERROR("Fail to reset d71 device.\n");
> +		drm_err(drm, "Fail to reset d71 device.\n");
>  		goto err_cleanup;
>  	}
>  
> @@ -376,8 +379,8 @@ static int d71_enum_resources(struct komeda_dev *mdev)
>  	d71->num_pipelines = (value >> 8) & 0x7;
>  
>  	if (d71->num_pipelines > D71_MAX_PIPELINE) {
> -		DRM_ERROR("d71 supports %d pipelines, but got: %d.\n",
> -			  D71_MAX_PIPELINE, d71->num_pipelines);
> +		drm_err(drm, "d71 supports %d pipelines, but got: %d.\n",
> +			D71_MAX_PIPELINE, d71->num_pipelines);
>  		err = -EINVAL;
>  		goto err_cleanup;
>  	}
> @@ -455,8 +458,8 @@ static int d71_enum_resources(struct komeda_dev *mdev)
>  		offset += D71_BLOCK_SIZE;
>  	}
>  
> -	DRM_DEBUG("total %d (out of %d) blocks are found.\n",
> -		  i, d71->num_blocks);
> +	drm_dbg(drm, "total %d (out of %d) blocks are found.\n",
> +		i, d71->num_blocks);
>  
>  	return 0;
>  
> @@ -555,6 +558,8 @@ static void d71_init_fmt_tbl(struct komeda_dev *mdev)
>  
>  static int d71_connect_iommu(struct komeda_dev *mdev)
>  {
> +	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);
> +	struct drm_device *drm = &kms->base;
>  	struct d71_dev *d71 = mdev->chip_data;
>  	u32 __iomem *reg = d71->gcu_addr;
>  	u32 check_bits = (d71->num_pipelines == 2) ?
> @@ -569,7 +574,7 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
>  	ret = dp_wait_cond(has_bits(check_bits, malidp_read32(reg, BLK_STATUS)),
>  			100, 1000, 1000);
>  	if (ret < 0) {
> -		DRM_ERROR("timed out connecting to TCU!\n");
> +		drm_err(drm, "timed out connecting to TCU!\n");
>  		malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE);
>  		return ret;
>  	}
> @@ -582,6 +587,8 @@ static int d71_connect_iommu(struct komeda_dev *mdev)
>  
>  static int d71_disconnect_iommu(struct komeda_dev *mdev)
>  {
> +	struct komeda_kms_dev *kms = dev_get_drvdata(mdev->dev);
> +	struct drm_device *drm = &kms->base;
>  	struct d71_dev *d71 = mdev->chip_data;
>  	u32 __iomem *reg = d71->gcu_addr;
>  	u32 check_bits = (d71->num_pipelines == 2) ?
> @@ -593,7 +600,7 @@ static int d71_disconnect_iommu(struct komeda_dev *mdev)
>  	ret = dp_wait_cond(((malidp_read32(reg, BLK_STATUS) & check_bits) == 0),
>  			100, 1000, 1000);
>  	if (ret < 0) {
> -		DRM_ERROR("timed out disconnecting from TCU!\n");
> +		drm_err(drm, "timed out disconnecting from TCU!\n");
>  		malidp_write32_mask(reg, BLK_CONTROL, 0x7, INACTIVE_MODE);
>  	}
>  
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
