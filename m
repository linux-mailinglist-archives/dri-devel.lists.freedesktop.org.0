Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3C4B5610
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370FC10E237;
	Mon, 14 Feb 2022 16:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D2D4010E237
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 16:23:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 878BC13D5;
 Mon, 14 Feb 2022 08:23:35 -0800 (PST)
Received: from [10.57.37.216] (unknown [10.57.37.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A86D23F70D;
 Mon, 14 Feb 2022 08:23:34 -0800 (PST)
Message-ID: <fcfedc32-32c6-4827-4cfa-d2b7098ee22b@arm.com>
Date: Mon, 14 Feb 2022 16:23:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/9] drm/panfrost: Add "clean only safe" feature bit
Content-Language: en-GB
To: alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-7-alyssa.rosenzweig@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220211202728.6146-7-alyssa.rosenzweig@collabora.com>
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
> Add the HW_FEATURE_CLEAN_ONLY_SAFE bit based on kbase. When I actually
> tried to port the logic from kbase, trivial jobs raised Data Invalid
> Faults, so this may depend on other coherency details. It's still useful
> to have the bit to record the feature bit when adding new models.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Sadly I don't have the hardware to try this out on, but it should be a
simple case of the below (untested):

----8<----
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 908d79520853..602e51c4966e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -212,9 +212,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
         * start */
        cfg |= JS_CONFIG_THREAD_PRI(8) |
                JS_CONFIG_START_FLUSH_CLEAN_INVALIDATE |
-               JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE |
                panfrost_get_job_chain_flag(job);
 
+       if (panfrost_has_hw_feature(pfdev, HW_FEATURE_CLEAN_ONLY_SAFE))
+               cfg |= JS_CONFIG_END_FLUSH_CLEAN;
+       else
+               cfg |= JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE;
+
        if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION))
                cfg |= JS_CONFIG_ENABLE_FLUSH_REDUCTION;
 
----8<----

Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_features.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
> index 36fadcf9634e..1a8bdebc86a3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_features.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_features.h
> @@ -21,6 +21,7 @@ enum panfrost_hw_feature {
>  	HW_FEATURE_TLS_HASHING,
>  	HW_FEATURE_THREAD_GROUP_SPLIT,
>  	HW_FEATURE_IDVS_GROUP_SIZE,
> +	HW_FEATURE_CLEAN_ONLY_SAFE,
>  	HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG,
>  };
>  

