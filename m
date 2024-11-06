Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C119C9BF267
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 17:00:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB0710E2F5;
	Wed,  6 Nov 2024 16:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6EA710E2F5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 16:00:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39DE6497;
 Wed,  6 Nov 2024 08:01:06 -0800 (PST)
Received: from [10.57.91.71] (unknown [10.57.91.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7DDD83F528;
 Wed,  6 Nov 2024 08:00:33 -0800 (PST)
Message-ID: <7c4a3ed4-d37b-4de9-af53-5f022b5170c0@arm.com>
Date: Wed, 6 Nov 2024 16:00:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/panfrost: Add missing OPP table refcnt
 decremental
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241105205458.1318989-1-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20241105205458.1318989-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 05/11/2024 20:54, Adrián Larumbe wrote:
> Commit f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
> retrieves the OPP for the maximum device clock frequency, but forgets to
> keep the reference count balanced by putting the returned OPP object. This
> eventually leads to an OPP core warning when removing the device.
> 
> Fix it by putting OPP objects as many times as they're retrieved.
> 
> Also remove an unnecessary whitespace.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Both pushed to drm-misc-next.

Thanks,
Steve

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 2d30da38c2c3..3385fd3ef41a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -38,7 +38,7 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
>  		return PTR_ERR(opp);
>  	dev_pm_opp_put(opp);
>  
> -	err =  dev_pm_opp_set_rate(dev, *freq);
> +	err = dev_pm_opp_set_rate(dev, *freq);
>  	if (!err)
>  		ptdev->pfdevfreq.current_frequency = *freq;
>  
> @@ -182,6 +182,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	 * if any and will avoid a switch off by regulator_late_cleanup()
>  	 */
>  	ret = dev_pm_opp_set_opp(dev, opp);
> +	dev_pm_opp_put(opp);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
>  		return ret;
> 
> base-commit: aadcf584583ca9833b4fb2140a4f437569ddbcd7

