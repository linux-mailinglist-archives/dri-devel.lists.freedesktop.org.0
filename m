Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A994B5609
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D583B10E20E;
	Mon, 14 Feb 2022 16:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CDCC10E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:23:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CE3C13D5;
 Mon, 14 Feb 2022 08:23:20 -0800 (PST)
Received: from [10.57.37.216] (unknown [10.57.37.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CDD73F70D;
 Mon, 14 Feb 2022 08:23:19 -0800 (PST)
Message-ID: <9eac9ce6-3bd8-0dc2-4686-9ea1e623b1c4@arm.com>
Date: Mon, 14 Feb 2022 16:23:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/9] drm/panfrost: Handle HW_ISSUE_TTRX_3076
Content-Language: en-GB
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-5-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220211202728.6146-5-alyssa.rosenzweig@collabora.com>
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
> Some Valhall GPUs require resets when encountering bus faults due to
> occlusion query writes. Add the issue bit for this and handle it.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>
(although one nit below)

Just in case any one is wondering - these bus faults occur when
switching the GPU's MMU to unmapped - it's not a normal "bus fault" from
the external bus. This is triggered by an attempt to read unmapped
memory which is completed by the driver by switching the entire MMU to
unmapped.

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 9 +++++++--
>  drivers/gpu/drm/panfrost/panfrost_issues.h | 4 ++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 7f51a4682ccb..ee612303f076 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -11,6 +11,7 @@
>  #include "panfrost_device.h"
>  #include "panfrost_devfreq.h"
>  #include "panfrost_features.h"
> +#include "panfrost_issues.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_job.h"
>  #include "panfrost_mmu.h"
> @@ -380,9 +381,13 @@ const char *panfrost_exception_name(u32 exception_code)
>  bool panfrost_exception_needs_reset(const struct panfrost_device *pfdev,
>  				    u32 exception_code)
>  {
> -	/* Right now, none of the GPU we support need a reset, but this
> -	 * might change.
> +	/* If an occlusion query write causes a bus fault on affected GPUs,
> +	 * future fragment jobs may hang. Reset to workaround.
>  	 */
> +	if (exception_code == DRM_PANFROST_EXCEPTION_JOB_BUS_FAULT)
> +		return panfrost_has_hw_issue(pfdev, HW_ISSUE_TTRX_3076);
> +
> +	/* No other GPUs we support need a reset */
>  	return false;
>  }
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
> index a66692663833..058f6a4c8435 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
> @@ -128,6 +128,10 @@ enum panfrost_hw_issue {
>  	/* Must set SC_VAR_ALGORITHM */
>  	HW_ISSUE_TTRX_2968_TTRX_3162,
>  
> +	/* Bus fault from occlusion query write may cause future fragment jobs
> +	 * to hang */

NIT: Kernel comment style has the "/*" and "*/" on lines by themselves
for multi-line comments. checkpatch will complain!

> +	HW_ISSUE_TTRX_3076,
> +
>  	HW_ISSUE_END
>  };
>  

