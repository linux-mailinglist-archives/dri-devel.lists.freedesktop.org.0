Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 373974B5613
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED79510E24F;
	Mon, 14 Feb 2022 16:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E444A10E258
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:23:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9765313D5;
 Mon, 14 Feb 2022 08:23:44 -0800 (PST)
Received: from [10.57.37.216] (unknown [10.57.37.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE7F63F70D;
 Mon, 14 Feb 2022 08:23:43 -0800 (PST)
Message-ID: <e9d3425f-2e26-1bc1-da98-a7836da68d76@arm.com>
Date: Mon, 14 Feb 2022 16:23:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 8/9] drm/panfrost: Add Mali-G57 "Natt" support
Content-Language: en-GB
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-9-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220211202728.6146-9-alyssa.rosenzweig@collabora.com>
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

On 11/02/2022 20:27, alyssa.rosenzweig@collabora.com wrote:
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> 
> Add the features, issues, and GPU ID for Mali-G57, a first-generation
> Valhall GPU. Other first- and second-generation Valhall GPUs should be
> similar.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_features.h | 12 ++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gpu.c      |  2 ++
>  drivers/gpu/drm/panfrost/panfrost_issues.h   |  5 +++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
> index 1a8bdebc86a3..7ed0cd3ea2d4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_features.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_features.h
> @@ -106,6 +106,18 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_TLS_HASHING) | \
>  	BIT_ULL(HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG))
>  
> +#define hw_features_g57 (\
> +	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
> +	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
> +	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> +	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
> +	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> +	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
> +	BIT_ULL(HW_FEATURE_COHERENCY_REG) | \
> +	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
> +	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
> +	BIT_ULL(HW_FEATURE_CLEAN_ONLY_SAFE))
> +
>  static inline bool panfrost_has_hw_feature(struct panfrost_device *pfdev,
>  					   enum panfrost_hw_feature feat)
>  {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 73e5774f01c1..08d657527099 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -201,6 +201,8 @@ static const struct panfrost_model gpu_models[] = {
>  	GPU_MODEL(g52, 0x7002),
>  	GPU_MODEL(g31, 0x7003,
>  		GPU_REV(g31, 1, 0)),
> +
> +	GPU_MODEL(g57, 0x9001),
>  };
>  
>  static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
> index b8865fc9efce..1a0dc7f7f857 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
> @@ -258,6 +258,11 @@ enum panfrost_hw_issue {
>  
>  #define hw_issues_g76 0
>  
> +#define hw_issues_g57 (\
> +	BIT_ULL(HW_ISSUE_TTRX_2968_TTRX_3162) | \
> +	BIT_ULL(HW_ISSUE_TTRX_3076) | \
> +	BIT_ULL(HW_ISSUE_TTRX_3485))

Do you know whether you have an r0p0 or an r0p1 Natt? Only the r0p0 has
the 3485 issue, and we might be lucky and it's the r0p1 that's "in the
wild".

It would be good to annotate these lists with the hardware revisions
when there is a difference.

Steve

> +
>  static inline bool panfrost_has_hw_issue(const struct panfrost_device *pfdev,
>  					 enum panfrost_hw_issue issue)
>  {

