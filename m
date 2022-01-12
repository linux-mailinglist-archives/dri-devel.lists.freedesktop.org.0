Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AC448C84A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 17:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3840210EECA;
	Wed, 12 Jan 2022 16:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1339210EECA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 16:28:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CAEB1FB;
 Wed, 12 Jan 2022 08:28:11 -0800 (PST)
Received: from [10.57.36.149] (unknown [10.57.36.149])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B03A3F774;
 Wed, 12 Jan 2022 08:28:10 -0800 (PST)
Subject: Re: [PATCH 1/2] drm/panfrost: Remove features meant for userspace
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20220109170920.2921-1-alyssa.rosenzweig@collabora.com>
 <20220109170920.2921-2-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <c13f9381-120b-e891-bdda-86cfec39b31f@arm.com>
Date: Wed, 12 Jan 2022 16:28:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109170920.2921-2-alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2022 17:09, Alyssa Rosenzweig wrote:
> Early versions of the legacy kernel driver included comprehensive
> feature lists for every GPU, even though most of the enumerated features
> only matter to userspace. For example, HW_FEATURE_INTERPIPE_REG_ALIASING
> was a feature bit indicating that a GPU had "interpipe register
> aliasing": arithmetic, load/store, and texture instruction all use
> common general-purpose registers. GPUs without this feature bit have
> dedicated load/store and texture "registers". Whether a GPU has this
> feature or not is irrelevant to the kernel; it only matters in the
> userspace compiler's register allocator. It's silly to enumerate it in
> kernel space, and the information is understandably unused. To
> underscore the point, this feature only makes sense in the context of
> the Midgard instruction set. Bifrost never had dedicated load/store or
> texture registers, so the feature bit was vacuously set for all Bifrost
> hardware, even though this conveys no useful information.
> 
> To clean up the feature list, delete feature bits which could not
> possibly matter to the kernel, leaving only those which do affect the
> register-level operation of the chip.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

(although it's a good thing kbase never did this cleanup - it's a useful
source of public information ;) )

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_features.h | 172 -------------------
>  1 file changed, 172 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
> index 5056777c7744..f557fad5d5ff 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_features.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_features.h
> @@ -12,24 +12,6 @@ enum panfrost_hw_feature {
>  	HW_FEATURE_JOBCHAIN_DISAMBIGUATION,
>  	HW_FEATURE_PWRON_DURING_PWROFF_TRANS,
>  	HW_FEATURE_XAFFINITY,
> -	HW_FEATURE_OUT_OF_ORDER_EXEC,
> -	HW_FEATURE_MRT,
> -	HW_FEATURE_BRNDOUT_CC,
> -	HW_FEATURE_INTERPIPE_REG_ALIASING,
> -	HW_FEATURE_LD_ST_TILEBUFFER,
> -	HW_FEATURE_MSAA_16X,
> -	HW_FEATURE_32_BIT_UNIFORM_ADDRESS,
> -	HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL,
> -	HW_FEATURE_OPTIMIZED_COVERAGE_MASK,
> -	HW_FEATURE_T7XX_PAIRING_RULES,
> -	HW_FEATURE_LD_ST_LEA_TEX,
> -	HW_FEATURE_LINEAR_FILTER_FLOAT,
> -	HW_FEATURE_WORKGROUP_ROUND_MULTIPLE_OF_4,
> -	HW_FEATURE_IMAGES_IN_FRAGMENT_SHADERS,
> -	HW_FEATURE_TEST4_DATUM_MODE,
> -	HW_FEATURE_NEXT_INSTRUCTION_TYPE,
> -	HW_FEATURE_BRNDOUT_KILL,
> -	HW_FEATURE_WARPING,
>  	HW_FEATURE_V4,
>  	HW_FEATURE_FLUSH_REDUCTION,
>  	HW_FEATURE_PROTECTED_MODE,
> @@ -42,27 +24,15 @@ enum panfrost_hw_feature {
>  };
>  
>  #define hw_features_t600 (\
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_V4))
>  
>  #define hw_features_t620 (\
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_V4))
>  
>  #define hw_features_t720 (\
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_INTERPIPE_REG_ALIASING) | \
> -	BIT_ULL(HW_FEATURE_OPTIMIZED_COVERAGE_MASK) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
> -	BIT_ULL(HW_FEATURE_WORKGROUP_ROUND_MULTIPLE_OF_4) | \
> -	BIT_ULL(HW_FEATURE_WARPING) | \
>  	BIT_ULL(HW_FEATURE_V4))
>  
>  
> @@ -70,17 +40,6 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_MSAA_16X) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
>  
>  // T860
> @@ -88,19 +47,6 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_KILL) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_MSAA_16X) | \
> -	BIT_ULL(HW_FEATURE_NEXT_INSTRUCTION_TYPE) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
>  
>  #define hw_features_t880 hw_features_t860
> @@ -109,61 +55,18 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_WARPING) | \
> -	BIT_ULL(HW_FEATURE_INTERPIPE_REG_ALIASING) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_KILL) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_NEXT_INSTRUCTION_TYPE) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
>  
>  #define hw_features_t820 (\
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_WARPING) | \
> -	BIT_ULL(HW_FEATURE_INTERPIPE_REG_ALIASING) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_KILL) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_NEXT_INSTRUCTION_TYPE) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
>  
>  #define hw_features_g71 (\
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_WARPING) | \
> -	BIT_ULL(HW_FEATURE_INTERPIPE_REG_ALIASING) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_KILL) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_MSAA_16X) | \
> -	BIT_ULL(HW_FEATURE_NEXT_INSTRUCTION_TYPE) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> @@ -173,21 +76,6 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_WARPING) | \
> -	BIT_ULL(HW_FEATURE_INTERPIPE_REG_ALIASING) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_KILL) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_MSAA_16X) | \
> -	BIT_ULL(HW_FEATURE_NEXT_INSTRUCTION_TYPE) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> @@ -198,21 +86,6 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_WARPING) | \
> -	BIT_ULL(HW_FEATURE_INTERPIPE_REG_ALIASING) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_KILL) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_MSAA_16X) | \
> -	BIT_ULL(HW_FEATURE_NEXT_INSTRUCTION_TYPE) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> @@ -223,21 +96,6 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_WARPING) | \
> -	BIT_ULL(HW_FEATURE_INTERPIPE_REG_ALIASING) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_KILL) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_MSAA_16X) | \
> -	BIT_ULL(HW_FEATURE_NEXT_INSTRUCTION_TYPE) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> @@ -248,21 +106,6 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_WARPING) | \
> -	BIT_ULL(HW_FEATURE_INTERPIPE_REG_ALIASING) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_KILL) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_MSAA_16X) | \
> -	BIT_ULL(HW_FEATURE_NEXT_INSTRUCTION_TYPE) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> @@ -276,21 +119,6 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
>  	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_WARPING) | \
> -	BIT_ULL(HW_FEATURE_INTERPIPE_REG_ALIASING) | \
> -	BIT_ULL(HW_FEATURE_32_BIT_UNIFORM_ADDRESS) | \
> -	BIT_ULL(HW_FEATURE_ATTR_AUTO_TYPE_INFERRAL) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_CC) | \
> -	BIT_ULL(HW_FEATURE_BRNDOUT_KILL) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_LEA_TEX) | \
> -	BIT_ULL(HW_FEATURE_LD_ST_TILEBUFFER) | \
> -	BIT_ULL(HW_FEATURE_LINEAR_FILTER_FLOAT) | \
> -	BIT_ULL(HW_FEATURE_MRT) | \
> -	BIT_ULL(HW_FEATURE_MSAA_16X) | \
> -	BIT_ULL(HW_FEATURE_NEXT_INSTRUCTION_TYPE) | \
> -	BIT_ULL(HW_FEATURE_OUT_OF_ORDER_EXEC) | \
> -	BIT_ULL(HW_FEATURE_T7XX_PAIRING_RULES) | \
> -	BIT_ULL(HW_FEATURE_TEST4_DATUM_MODE) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
>  	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> 

