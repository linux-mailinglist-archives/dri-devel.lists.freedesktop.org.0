Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F119848C84C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 17:28:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CD510F03C;
	Wed, 12 Jan 2022 16:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E4C9610F03C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 16:28:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EF5A1FB;
 Wed, 12 Jan 2022 08:28:15 -0800 (PST)
Received: from [10.57.36.149] (unknown [10.57.36.149])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B4743F774;
 Wed, 12 Jan 2022 08:28:13 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/panfrost: Merge some feature lists
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20220109170920.2921-1-alyssa.rosenzweig@collabora.com>
 <20220109170920.2921-3-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <c34845c7-481b-91c1-d2ae-e239324f8364@arm.com>
Date: Wed, 12 Jan 2022 16:28:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109170920.2921-3-alyssa.rosenzweig@collabora.com>
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
> Now that we only list features of interest to kernel space, lots of GPUs
> have the same feature bits. To cut down on the repetition in the file,
> merge feature lists that are identical between similar GPUs.
> 
> Note that this leaves some unmerged identical Bifrost feature lists, as
> there are more features affecting Bifrost kernel space that we do not
> yet hanlde.

NIT: s/hanlde/handle/ ;)

Do you have any features in mind that we're missing? The list looks very
similar to the kbase one. And anyway it is simple enough to split again
if we need to.

Thanks,

Steve

> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_features.h | 40 ++++----------------
>  1 file changed, 7 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
> index f557fad5d5ff..34f2bae1ec8c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_features.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_features.h
> @@ -27,14 +27,9 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
>  	BIT_ULL(HW_FEATURE_V4))
>  
> -#define hw_features_t620 (\
> -	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
> -	BIT_ULL(HW_FEATURE_V4))
> -
> -#define hw_features_t720 (\
> -	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
> -	BIT_ULL(HW_FEATURE_V4))
> +#define hw_features_t620 hw_features_t600
>  
> +#define hw_features_t720 hw_features_t600
>  
>  #define hw_features_t760 (\
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
> @@ -42,26 +37,13 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_XAFFINITY) | \
>  	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
>  
> -// T860
> -#define hw_features_t860 (\
> -	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
> -	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
> -	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
> +#define hw_features_t860 hw_features_t760
>  
> -#define hw_features_t880 hw_features_t860
> +#define hw_features_t880 hw_features_t760
>  
> -#define hw_features_t830 (\
> -	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
> -	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
> -	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
> +#define hw_features_t830 hw_features_t760
>  
> -#define hw_features_t820 (\
> -	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
> -	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
> -	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT))
> +#define hw_features_t820 hw_features_t760
>  
>  #define hw_features_g71 (\
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
> @@ -82,15 +64,7 @@ enum panfrost_hw_feature {
>  	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
>  	BIT_ULL(HW_FEATURE_COHERENCY_REG))
>  
> -#define hw_features_g51 (\
> -	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
> -	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
> -	BIT_ULL(HW_FEATURE_XAFFINITY) | \
> -	BIT_ULL(HW_FEATURE_THREAD_GROUP_SPLIT) | \
> -	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
> -	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
> -	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
> -	BIT_ULL(HW_FEATURE_COHERENCY_REG))
> +#define hw_features_g51 hw_features_g72
>  
>  #define hw_features_g52 (\
>  	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
> 

