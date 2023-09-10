Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AF3799FA3
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 22:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B4710E08C;
	Sun, 10 Sep 2023 20:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr
 [80.12.242.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F1910E08C
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 20:16:10 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id fQqjqzpvD0408fQqjqaHQK; Sun, 10 Sep 2023 22:16:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1694376968;
 bh=RKE0XROMFTZ69Gm317IVP+Ru3SLHlplqDelJtYvM1po=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BBC51B1Sbtz0f4sl/qpUwpRpyKq085Zkcx8+6V1LUaXSEcmUlw+wYNJPuKJNTbi6D
 qn4jGCJu6FhX2ErsBZLPU+8zG+o5H0mokvHXpyn/TepkpFETWpx3xjuZ7mn3XCjkpZ
 af0Z6OWnx9r7EhrKeTYCj2lzne0eeE7dTaTv+zFdCZmIa3XT52VWlGxqlxd9Q+B3xu
 rZws69OYxsCYXU5NlX+tqMbPGGKmkcn0xR9MYWoP3taFsYiOaOP2s62HBkjPK4AeyN
 jqoGdGOAlqmYMN7SQJ7gBScbw2RGz6UworUavwwr0nOQg3W+Yit5nsac/NKUsd/KKQ
 dH/aPV3OPoWpA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 10 Sep 2023 22:16:07 +0200
X-ME-IP: 86.243.2.178
Message-ID: <0b6ad379-049a-5152-12e5-77c62ffc4541@wanadoo.fr>
Date: Sun, 10 Sep 2023 22:16:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/simpledrm: Add support for multiple "power-domains"
Content-Language: fr
To: j@jannau.net, Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685@jannau.net>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 10/09/2023 à 18:39, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> Multiple power domains need to be handled explicitly in each driver. The
> driver core can not handle it automatically since it is not aware of
> power sequencing requirements the hardware might have. This is not a
> problem for simpledrm since everything is expected to be powered on by
> the bootloader. simpledrm has just ensure it remains powered on during
> its lifetime.
> This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
> systems. The HDMI output initialized by the bootloader requires keeping
> the display controller and a DP phy power domain on.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   drivers/gpu/drm/tiny/simpledrm.c | 106 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 106 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
> index ff86ba1ae1b8..efedede57d42 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -6,6 +6,7 @@
>   #include <linux/of_address.h>
>   #include <linux/platform_data/simplefb.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>   #include <linux/regulator/consumer.h>
>   
>   #include <drm/drm_aperture.h>
> @@ -227,6 +228,12 @@ struct simpledrm_device {
>   	unsigned int regulator_count;
>   	struct regulator **regulators;
>   #endif
> +	/* power-domains */
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +	int pwr_dom_count;
> +	struct device **pwr_dom_devs;
> +	struct device_link **pwr_dom_links;
> +#endif
>   
>   	/* simplefb settings */
>   	struct drm_display_mode mode;
> @@ -468,6 +475,102 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
>   }
>   #endif
>   
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +/*
> + * Generic power domain handling code.
> + *
> + * Here we handle the power-domains properties of our "simple-framebuffer"
> + * dt node. This is only necessary if there is more than one power-domain.
> + * A single power-domains is handled automatically by the driver core. Multiple
> + * power-domains have to be handled by drivers since the driver core can't know
> + * the correct power sequencing. Power sequencing is not an issue for simpledrm
> + * since the bootloader has put the power domains already in the correct state.
> + * simpledrm has only to ensure they remain active for its lifetime.
> + *
> + * When the driver unloads, we detach from the power-domains.
> + *
> + * We only complain about errors here, no action is taken as the most likely
> + * error can only happen due to a mismatch between the bootloader which set
> + * up the "simple-framebuffer" dt node, and the PM domain providers in the
> + * device tree. Chances are that there are no adverse effects, and if there are,
> + * a clean teardown of the fb probe will not help us much either. So just
> + * complain and carry on, and hope that the user actually gets a working fb at
> + * the end of things.
> + */
> +static void simpledrm_device_detach_genpd(void *res)
> +{
> +	int i;
> +	struct simpledrm_device *sdev = /*(struct simpledrm_device *)*/res;
> +
> +
> +	drm_err(&sdev->dev, "% power-domains count:%d\n", __func__, sdev->pwr_dom_count);
> +	if (sdev->pwr_dom_count <= 1)
> +		return;
> +
> +	for (i = sdev->pwr_dom_count - 1; i >= 0; i--) {
> +		if (!sdev->pwr_dom_links[i])
> +			device_link_del(sdev->pwr_dom_links[i]);
> +		if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
> +			dev_pm_domain_detach(sdev->pwr_dom_devs[i], true);
> +	}
> +}
> +
> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
> +{
> +	struct device *dev = sdev->dev.dev;
> +	int i;
> +
> +	sdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
> +							 "#power-domain-cells");
> +	/*
> +	 * Single power-domain devices are handled by driver core nothing to do
> +	 * here. The same for device nodes without "power-domains" property.
> +	 */
> +	if (sdev->pwr_dom_count <= 1)
> +		return 0;
> +
> +	sdev->pwr_dom_devs = devm_kcalloc(dev, sdev->pwr_dom_count,
> +					       sizeof(*sdev->pwr_dom_devs),
> +					       GFP_KERNEL);
> +	if (!sdev->pwr_dom_devs)
> +		return -ENOMEM;
> +
> +	sdev->pwr_dom_links = devm_kcalloc(dev, sdev->pwr_dom_count,
> +						sizeof(*sdev->pwr_dom_links),
> +						GFP_KERNEL);
> +	if (!sdev->pwr_dom_links)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < sdev->pwr_dom_count; i++) {
> +		sdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR(sdev->pwr_dom_devs[i])) {
> +			int ret = PTR_ERR(sdev->pwr_dom_devs[i]);
> +			if (ret == -EPROBE_DEFER) {
> +				simpledrm_device_detach_genpd(sdev);
> +				return PTR_ERR(sdev->pwr_dom_devs[i]);
> +			}
> +			drm_err(&sdev->dev,
> +				"pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
> +		}
> +

sdev->pwr_dom_devs[i] can be an ERR_PTR here.
Maybe a break or a continue missing after drm_err() above?

CJ

> +		sdev->pwr_dom_links[i] = device_link_add(dev,
> +							 sdev->pwr_dom_devs[i],
> +							 DL_FLAG_STATELESS |
> +							 DL_FLAG_PM_RUNTIME |
> +							 DL_FLAG_RPM_ACTIVE);
> +		if (!sdev->pwr_dom_links[i])
> +			drm_err(&sdev->dev, "failed to link power-domain %u\n", i);
> +	}
> +
> +	return devm_add_action_or_reset(dev, simpledrm_device_detach_genpd, sdev);
> +}
> +#else
> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
> +{
> +	return 0;
> +}
> +#endif
> +
>   /*
>    * Modesetting
>    */
> @@ -651,6 +754,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>   	if (ret)
>   		return ERR_PTR(ret);
>   	ret = simpledrm_device_init_regulators(sdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	ret = simpledrm_device_attach_genpd(sdev);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
> 
> ---
> base-commit: 15d30b46573d75f5cb58cfacded8ebab9c76a2b0
> change-id: 20230910-simpledrm-multiple-power-domains-f41efa6ad9bc
> 
> Best regards,

