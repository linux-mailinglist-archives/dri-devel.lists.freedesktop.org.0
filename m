Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3BC4B289C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 16:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F40710EC92;
	Fri, 11 Feb 2022 15:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E914310EC84
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 15:01:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73645106F;
 Fri, 11 Feb 2022 07:01:40 -0800 (PST)
Received: from [10.57.42.59] (unknown [10.57.42.59])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93C583F718;
 Fri, 11 Feb 2022 07:01:39 -0800 (PST)
Message-ID: <68dc6d42-dd6e-936f-1de4-5862c8b8c5a6@arm.com>
Date: Fri, 11 Feb 2022 15:01:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/panfrost: Handle IDVS_GROUP_SIZE feature
Content-Language: en-GB
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220211145849.3148-1-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220211145849.3148-1-alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: airlied@linux.ie, tomeu.vizoso@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2022 14:58, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> The IDVS group size feature was missing. It is used on some Bifrost and
> Valhall GPUs, and is the last kernel-relevant Bifrost feature we're
> missing.
> 
> This feature adds an extra IDVS group size field to the JM_CONFIG
> register. In kbase, the value is configurable via the device tree; kbase
> uses 0xF as a default if no value is specified. Until we find a device
> demanding otherwise, let's always set the 0xF default on devices which
> support this feature mimicking kbase's behaviour.
> 
> Tuning this register slightly improves performance of index-driven vertex
> shading. On Mali-G52 (with Mesa), overall glmark2 score is improved from 1026 to
> 1037. Geometry-heavy scenes like -bshading are improved from 1068 to 1098.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_features.h | 3 +++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c      | 3 +++
>  drivers/gpu/drm/panfrost/panfrost_regs.h     | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
> index 34f2bae1ec8c..36fadcf9634e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_features.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_features.h
> @@ -20,6 +20,7 @@ enum panfrost_hw_feature {
>  	HW_FEATURE_AARCH64_MMU,
>  	HW_FEATURE_TLS_HASHING,
>  	HW_FEATURE_THREAD_GROUP_SPLIT,
> +	HW_FEATURE_IDVS_GROUP_SIZE,
>  	HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG,
>  };
>  
> @@ -74,6 +75,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
> +	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>  
>  #define hw_features_g76 (\
> @@ -87,6 +89,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG) | \
>  	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
>  	BIT_ULL(HW_FEATURE_TLS_HASHING) | \
> +	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
>  	BIT_ULL(HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG))
>  
>  #define hw_features_g31 (\
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index bbe628b306ee..50c8922694d7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -145,6 +145,9 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
>  		quirks |= (COHERENCY_ACE_LITE | COHERENCY_ACE) <<
>  			   JM_FORCE_COHERENCY_FEATURES_SHIFT;
>  
> +	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_IDVS_GROUP_SIZE))
> +		quirks |= JM_DEFAULT_IDVS_GROUP_SIZE << JM_IDVS_GROUP_SIZE_SHIFT;
> +
>  	if (quirks)
>  		gpu_write(pfdev, GPU_JM_CONFIG, quirks);
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index 6c5a11ef1ee8..16e776cc82ea 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -208,6 +208,7 @@
>  #define JM_MAX_JOB_THROTTLE_LIMIT	0x3F
>  #define JM_FORCE_COHERENCY_FEATURES_SHIFT 2
>  #define JM_IDVS_GROUP_SIZE_SHIFT	16
> +#define JM_DEFAULT_IDVS_GROUP_SIZE	0xF
>  #define JM_MAX_IDVS_GROUP_SIZE		0x3F
>  
>  

