Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB0A98F1D1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 16:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C9A10E86A;
	Thu,  3 Oct 2024 14:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B027810E86A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 14:50:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8574B339;
 Thu,  3 Oct 2024 07:51:26 -0700 (PDT)
Received: from [10.1.39.32] (e122027.cambridge.arm.com [10.1.39.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 948B53F640;
 Thu,  3 Oct 2024 07:50:54 -0700 (PDT)
Message-ID: <327ea967-bb29-4634-9a23-4b6bc48b0d63@arm.com>
Date: Thu, 3 Oct 2024 15:50:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/panfrost: Add missing OPP table refcnt
 decremental
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241003133037.3398144-1-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20241003133037.3398144-1-adrian.larumbe@collabora.com>
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

On 03/10/2024 14:30, Adrián Larumbe wrote:
> Commit f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
> retrieves the OPP for the maximum device clock frequency, but forgets to
> keep the reference count balanced by putting the returned OPP object. This
> eventually leads to an OPP core warning when removing the device.
> 
> Fix it by putting OPP objects as many times as they're retrieved. That
> includes putting the OPP object in case setting it fails.
> 
> Also remove an unnecessary whitespace.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 2d30da38c2c3..4b8840a41779 100644
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
> @@ -184,9 +184,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	ret = dev_pm_opp_set_opp(dev, opp);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> +		dev_pm_opp_put(opp);
>  		return ret;
>  	}
>  
> +	dev_pm_opp_put(opp);
> +
>  	/* Find the fastest defined rate  */
>  	opp = dev_pm_opp_find_freq_floor(dev, &freq);
>  	if (IS_ERR(opp))

