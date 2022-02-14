Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7384B5607
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCA310E204;
	Mon, 14 Feb 2022 16:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3200F10E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:23:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE00813D5;
 Mon, 14 Feb 2022 08:23:05 -0800 (PST)
Received: from [10.57.37.216] (unknown [10.57.37.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F03003F70D;
 Mon, 14 Feb 2022 08:23:04 -0800 (PST)
Message-ID: <f902d2b1-144d-f960-d70f-68155725849f@arm.com>
Date: Mon, 14 Feb 2022 16:23:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/9] drm/panfrost: Handle HW_ISSUE_TTRX_2968_TTRX_3162
Content-Language: en-GB
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-3-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220211202728.6146-3-alyssa.rosenzweig@collabora.com>
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
> Add handling for the HW_ISSUE_TTRX_2968_TTRX_3162 quirk. Logic ported
> from kbase. kbase lists this workaround as used on Mali-G57.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 3 +++
>  drivers/gpu/drm/panfrost/panfrost_issues.h | 3 +++
>  drivers/gpu/drm/panfrost/panfrost_regs.h   | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> index 50c8922694d7..1c1e2017aa80 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> @@ -108,6 +108,9 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
>  			quirks |= SC_LS_ALLOW_ATTR_TYPES;
>  	}
>  
> +	if (panfrost_has_hw_issue(pfdev, HW_ISSUE_TTRX_2968_TTRX_3162))
> +		quirks |= SC_VAR_ALGORITHM;
> +
>  	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_TLS_HASHING))
>  		quirks |= SC_TLS_HASH_ENABLE;
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
> index 8e59d765bf19..3af7d723377e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
> @@ -125,6 +125,9 @@ enum panfrost_hw_issue {
>  	 * kernel must fiddle with L2 caches to prevent data leakage */
>  	HW_ISSUE_TGOX_R1_1234,
>  
> +	/* Must set SC_VAR_ALGORITHM */
> +	HW_ISSUE_TTRX_2968_TTRX_3162,
> +
>  	HW_ISSUE_END
>  };
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> index 16e776cc82ea..fa1e1af56e17 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> @@ -195,6 +195,7 @@
>  #define SC_TLS_HASH_ENABLE		BIT(17)
>  #define SC_LS_ATTR_CHECK_DISABLE	BIT(18)
>  #define SC_ENABLE_TEXGRD_FLAGS		BIT(25)
> +#define SC_VAR_ALGORITHM		BIT(29)
>  /* End SHADER_CONFIG register */
>  
>  /* TILER_CONFIG register */

