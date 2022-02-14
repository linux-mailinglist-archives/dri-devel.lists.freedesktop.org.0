Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABE34B5B7D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 21:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1B310E2DB;
	Mon, 14 Feb 2022 20:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2D710E2DB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 20:55:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 0684A1F43F8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644872138;
 bh=FhWthb7qNxu03PTR+1xu680Z2C1ejB/i7ZmEdzpMulc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h7bvmDJKC/KLr4wErTlMsyAfKeEyGqSN6gQTzua8c952ikB5zzidLyuqZj/TmEacs
 y0YqIAKrwnY7a2hNH1aCH5UuWsRK3+1SOs/aH/NXsIA7MJy9fDzCmfK+sun84KWgX+
 sywl+KZvKaya4FjMpVwt6+yvpC3l68VBJp11/y3VLGMxzojyzM0KR6LDs05abIasap
 UN1GWUHQpLTOh8bSLc92ByJyQ3ejdBHgFfb3lD8f/sF3BryDEsMrZAVgH7XTQu5TN4
 ymmZSQTxVGkaaV0g1kdEbkROA2OYHVmxI92OptcZPPM25ICEcvkcUufskkBr+GBBt4
 EP48qKEq6heJw==
Date: Mon, 14 Feb 2022 15:55:31 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Dynamically allocate pm_domains
Message-ID: <YgrBwwT37DpOOkt5@maud>
References: <20220214203132.4722-1-alyssa.rosenzweig@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214203132.4722-1-alyssa.rosenzweig@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mali_kbase hardcodes MAX_PM_DOMAINS (=5 for the mt8192 kernel). I have
no real objection to it but Angelo did. Maybe should've marked this RFC.

On Mon, Feb 14, 2022 at 03:31:32PM -0500, Alyssa Rosenzweig wrote:
> MT8192 requires 5 power domains. Rather than bump MAX_PM_DOMAINS and
> waste memory on every supported Panfrost chip, instead dynamically
> allocate pm_domain_devs and pm_domain_links. This adds some flexibility;
> it seems inevitable a new MediaTek device will require more than 5
> domains.
> 
> On non-MediaTek devices, this saves a small amount of memory.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 14 ++++++++++----
>  drivers/gpu/drm/panfrost/panfrost_device.h |  5 ++---
>  2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index ee612303f076..661cdec320af 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -127,7 +127,10 @@ static void panfrost_pm_domain_fini(struct panfrost_device *pfdev)
>  {
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(pfdev->pm_domain_devs); i++) {
> +	if (!pfdev->pm_domain_devs || !pfdev->pm_domain_links)
> +		return;
> +
> +	for (i = 0; i < pfdev->comp->num_pm_domains; i++) {
>  		if (!pfdev->pm_domain_devs[i])
>  			break;
>  
> @@ -161,9 +164,12 @@ static int panfrost_pm_domain_init(struct panfrost_device *pfdev)
>  		return -EINVAL;
>  	}
>  
> -	if (WARN(num_domains > ARRAY_SIZE(pfdev->pm_domain_devs),
> -			"Too many supplies in compatible structure.\n"))
> -		return -EINVAL;
> +	pfdev->pm_domain_devs = devm_kcalloc(pfdev->dev, num_domains,
> +					     sizeof(*pfdev->pm_domain_devs),
> +					     GFP_KERNEL);
> +	pfdev->pm_domain_links = devm_kcalloc(pfdev->dev, num_domains,
> +					      sizeof(*pfdev->pm_domain_links),
> +					      GFP_KERNEL);
>  
>  	for (i = 0; i < num_domains; i++) {
>  		pfdev->pm_domain_devs[i] =
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 8b25278f34c8..98e3039696f9 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -22,7 +22,6 @@ struct panfrost_job;
>  struct panfrost_perfcnt;
>  
>  #define NUM_JOB_SLOTS 3
> -#define MAX_PM_DOMAINS 3
>  
>  struct panfrost_features {
>  	u16 id;
> @@ -87,8 +86,8 @@ struct panfrost_device {
>  	struct regulator_bulk_data *regulators;
>  	struct reset_control *rstc;
>  	/* pm_domains for devices with more than one. */
> -	struct device *pm_domain_devs[MAX_PM_DOMAINS];
> -	struct device_link *pm_domain_links[MAX_PM_DOMAINS];
> +	struct device **pm_domain_devs;
> +	struct device_link **pm_domain_links;
>  	bool coherent;
>  
>  	struct panfrost_features features;
> -- 
> 2.34.1
> 
