Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576C937907
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 16:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64C310EC35;
	Fri, 19 Jul 2024 14:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57BC010EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 14:15:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 673091042;
 Fri, 19 Jul 2024 07:15:32 -0700 (PDT)
Received: from [10.1.38.23] (e122027.cambridge.arm.com [10.1.38.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB75A3F73F;
 Fri, 19 Jul 2024 07:15:04 -0700 (PDT)
Message-ID: <228161f4-6f97-43ac-a09a-79edeeebea7b@arm.com>
Date: Fri, 19 Jul 2024 15:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/panthor: add sysfs knob for enabling job
 profiling
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240716201302.2939894-1-adrian.larumbe@collabora.com>
 <20240716201302.2939894-5-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240716201302.2939894-5-adrian.larumbe@collabora.com>
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

On 16/07/2024 21:11, Adrián Larumbe wrote:
> This commit introduces a DRM device sysfs attribute that lets UM control
> the job accounting status in the device. The knob variable had been brought
> in as part of a previous commit, but now we're able to fix it manually.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Although we should probably copy/paste
Documentation/ABI/testing/sysfs-driver-panfrost-profiling - or at least
mention somewhere that the same knob is available for panthor.

Steve

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 36 +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 6a0c1a06a709..a2876310856f 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1448,6 +1448,41 @@ static void panthor_remove(struct platform_device *pdev)
>  	panthor_device_unplug(ptdev);
>  }
>  
> +static ssize_t profiling_show(struct device *dev,
> +			      struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", ptdev->profile_mode);
> +}
> +
> +static ssize_t profiling_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t len)
> +{
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> +	bool value;
> +	int err;
> +
> +	err = kstrtobool(buf, &value);
> +	if (err)
> +		return err;
> +
> +	ptdev->profile_mode = value;
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR_RW(profiling);
> +
> +static struct attribute *panthor_attrs[] = {
> +	&dev_attr_profiling.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(panthor);
> +
>  static const struct of_device_id dt_match[] = {
>  	{ .compatible = "rockchip,rk3588-mali" },
>  	{ .compatible = "arm,mali-valhall-csf" },
> @@ -1467,6 +1502,7 @@ static struct platform_driver panthor_driver = {
>  		.name = "panthor",
>  		.pm = pm_ptr(&panthor_pm_ops),
>  		.of_match_table = dt_match,
> +		.dev_groups = panthor_groups,
>  	},
>  };
>  

