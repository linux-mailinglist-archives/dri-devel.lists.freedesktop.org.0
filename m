Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF52992CFB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 15:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5DF10E39B;
	Mon,  7 Oct 2024 13:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8ECE810E39A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 13:18:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F40EDA7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 06:18:42 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFD153F640
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 06:18:12 -0700 (PDT)
Date: Mon, 7 Oct 2024 14:17:58 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] drm/panthor: Fix OPP refcnt leaks in devfreq
 initialisation
Message-ID: <ZwPfhg0z3T8u8a6_@e110455-lin.cambridge.arm.com>
References: <20241005160857.347796-1-adrian.larumbe@collabora.com>
 <20241005160857.347796-2-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241005160857.347796-2-adrian.larumbe@collabora.com>
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

On Sat, Oct 05, 2024 at 05:08:53PM +0100, Adrián Larumbe wrote:
> Rearrange lookup of recommended OPP for the Mali GPU device and its refcnt
> decremental to make sure no OPP object leaks happen in the error path.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: fac9b22df4b1 ("drm/panthor: Add the devfreq logical block")
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 9d0f891b9b53..ecc7a52bd688 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -163,13 +163,6 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  
>  	cur_freq = clk_get_rate(ptdev->clks.core);
>  
> -	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
> -	if (IS_ERR(opp))
> -		return PTR_ERR(opp);
> -
> -	panthor_devfreq_profile.initial_freq = cur_freq;
> -	ptdev->current_frequency = cur_freq;
> -
>  	/* Regulator coupling only takes care of synchronizing/balancing voltage
>  	 * updates, but the coupled regulator needs to be enabled manually.
>  	 *
> @@ -200,18 +193,24 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  		return ret;
>  	}
>  
> +	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	panthor_devfreq_profile.initial_freq = cur_freq;
> +	ptdev->current_frequency = cur_freq;
> +
>  	/*
>  	 * Set the recommend OPP this will enable and configure the regulator
>  	 * if any and will avoid a switch off by regulator_late_cleanup()
>  	 */
>  	ret = dev_pm_opp_set_opp(dev, opp);
> +	dev_pm_opp_put(opp);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
>  		return ret;
>  	}
>  
> -	dev_pm_opp_put(opp);
> -
>  	/* Find the fastest defined rate  */
>  	opp = dev_pm_opp_find_freq_floor(dev, &freq);
>  	if (IS_ERR(opp))
> -- 
> 2.46.2
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
