Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE1111BEC1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 22:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5326EBD6;
	Wed, 11 Dec 2019 21:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5976EBD3;
 Wed, 11 Dec 2019 21:01:49 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df159360001>; Wed, 11 Dec 2019 13:01:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 11 Dec 2019 13:01:49 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 11 Dec 2019 13:01:49 -0800
Received: from [10.2.166.184] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Dec
 2019 21:01:48 +0000
Subject: Re: [PATCH 0/3] drm/nouveau: Support NVIDIA format modifiers
To: Ben Skeggs <bskeggs@redhat.com>
References: <20191211205922.7096-1-jajones@nvidia.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <e1e7ba4f-a88d-f451-217a-214cfff9541f@nvidia.com>
Date: Wed, 11 Dec 2019 13:01:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191211205922.7096-1-jajones@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576098103; bh=ZwEfFaFsdL0g8DOZZae56rSmiAwmb3h9uyM16Rij5T8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=AJX+o0uUOCZdybwsumShL3AB8Ec2llu7YItHqZhxmAbJWzI8Z1Sh787snkNK05IVr
 tjODwq+hSe9/AnjTQEtsPQgeEJ50wJvaF4r7Hb6RcqFLQ0ZFM6bmO10Kx+twerPcdT
 OWcOlomJGPPMmLUX/CpkFpzfDPTCMsBW42ciHOXYyuMiTforhraOBNrT+5ylkXWLK0
 aRf+SaPugm2znr+5hO60JsVYJy0jJTNAd9shmJyG0CkQu2iVdqdLpNxdHNMIUuT/qK
 aWWCybsdyJrh37AcuaGwpDRH4pWVXuYPf56c+29V6hznXd3cioeBfyDekwkF3oHz2A
 9z4osTaZ1pZVA==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please ignore the tegra diff on the bottom of this.  I never fail to 
find a way to mess up git-send-email.

-James

On 12/11/19 12:59 PM, James Jones wrote:
> This series modifies the NV5x+ nouveau display backends to advertise
> appropriate format modifiers on their display planes in atomic mode
> setting blobs.
> 
> Corresponding modifications to Mesa/userspace are available here:
> 
> https://gitlab.freedesktop.org/cubanismo/mesa/tree/nouveau_work
> 
> But those need a bit of cleanup before they're ready to submit.
> 
> I've tested this on Tesla, Kepler, Pascal, and Turing-class hardware
> using various formats and all the exposed format modifiers, plus some
> negative testing with invalid ones.
> 
> NOTE: this series depends on the "[PATCH v3] drm: Generalized NV Block
> Linear DRM format mod" patch submitted to dri-devel.
> 
> Signed-off-by: James Jones <jajones@nvidia.com>
> ---
>   drivers/gpu/drm/tegra/dc.c  | 10 ++++++++++
>   drivers/gpu/drm/tegra/fb.c  | 14 +++++++-------
>   drivers/gpu/drm/tegra/hub.c | 10 ++++++++++
>   3 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index fbf57bc3cdab..a2cc687dc2d8 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -588,6 +588,16 @@ static const u32 tegra124_primary_formats[] = {
>   
>   static const u64 tegra124_modifiers[] = {
>   	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
> +	/*
> +	 * For backwards compatibility with older userspace that may have
> +	 * baked in usage of the less-descriptive modifiers
> +	 */
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index e34325c83d28..d04e0b1c61ea 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -44,7 +44,7 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
>   {
>   	uint64_t modifier = framebuffer->modifier;
>   
> -	switch (modifier) {
> +	switch (drm_fourcc_canonicalize_nvidia_format_mod(modifier)) {
>   	case DRM_FORMAT_MOD_LINEAR:
>   		tiling->mode = TEGRA_BO_TILING_MODE_PITCH;
>   		tiling->value = 0;
> @@ -55,32 +55,32 @@ int tegra_fb_get_tiling(struct drm_framebuffer *framebuffer,
>   		tiling->value = 0;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 0;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 1;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 2;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 3;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 4;
>   		break;
>   
> -	case DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5):
> +	case DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5):
>   		tiling->mode = TEGRA_BO_TILING_MODE_BLOCK;
>   		tiling->value = 5;
>   		break;
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index 839b49c40e51..03c97b10b122 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -49,6 +49,16 @@ static const u32 tegra_shared_plane_formats[] = {
>   
>   static const u64 tegra_shared_plane_modifiers[] = {
>   	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 0),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 1),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 2),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 3),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 4),
> +	DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 0, 0, 0xfe, 5),
> +	/*
> +	 * For backwards compatibility with older userspace that may have
> +	 * baked in usage of the less-descriptive modifiers
> +	 */
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
>   	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
