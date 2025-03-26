Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47626A719BD
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 16:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B644F10E6EE;
	Wed, 26 Mar 2025 15:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2249110E6EE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 15:07:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67D0A106F;
 Wed, 26 Mar 2025 08:07:17 -0700 (PDT)
Received: from [10.57.14.42] (unknown [10.57.14.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 985153F63F;
 Wed, 26 Mar 2025 08:07:07 -0700 (PDT)
Message-ID: <3df61a2e-5216-4ae3-961f-856d6334e6b7@arm.com>
Date: Wed, 26 Mar 2025 15:07:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] drm/panthor: Implement support for multiple power
 domains
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-6-marex@denx.de>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250321200625.132494-6-marex@denx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/03/2025 20:05, Marek Vasut wrote:
> The driver code power domain binding to driver instances only works
> for single power domain, in case there are multiple power domains,
> it is necessary to explicitly attach via dev_pm_domain_attach*().
> As DT bindings list support for up to 5 power domains, add support
> for attaching them all. This is useful on Freescale i.MX95 which
> does have two power domains.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2: Exit from panthor_genpd_init() on any pm_domain_attach_by_id() failure
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 52 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h |  5 +++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 51ee9cae94504..8aa79c6d157e1 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -75,6 +75,54 @@ static int panthor_reset_init(struct panthor_device *ptdev)
>  	return 0;
>  }
>  
> +/* Generic power domain handling code, see drivers/gpu/drm/tiny/simpledrm.c */
> +static void panthor_detach_genpd(void *res)
> +{
> +	struct panthor_device *ptdev = res;
> +	int i;
> +
> +	if (ptdev->pwr_dom_count <= 1)
> +		return;
> +
> +	for (i = ptdev->pwr_dom_count - 1; i >= 0; i--)
> +		dev_pm_domain_detach(ptdev->pwr_dom_devs[i], true);
> +}
> +
> +static int panthor_genpd_init(struct panthor_device *ptdev)
> +{
> +	struct device *dev = ptdev->base.dev;
> +	int i;
> +
> +	ptdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
> +							  "#power-domain-cells");
> +	/*
> +	 * Single power-domain devices are handled by driver core nothing to do
> +	 * here. The same for device nodes without "power-domains" property.
> +	 */
> +	if (ptdev->pwr_dom_count <= 1)
> +		return 0;
> +
> +	if (ptdev->pwr_dom_count > ARRAY_SIZE(ptdev->pwr_dom_devs)) {
> +		drm_warn(&ptdev->base, "Too many power domains (%d) for this device\n",
> +			 ptdev->pwr_dom_count);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ptdev->pwr_dom_count; i++) {
> +		ptdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (!IS_ERR(ptdev->pwr_dom_devs[i]))
> +			continue;
> +
> +		/* Missing dependency, try again. */
> +		panthor_detach_genpd(ptdev);

If ptdev->pwr_dom_devs[i] is assigned an error pointer, then the call in
panthor_detach_genpd() to dev_pm_domain_detach() is going to use that
error pointer. But AFAICT dev_pm_domain_detach() assumes the pointer is
valid. So this will break.

Steve

> +		return dev_err_probe(ptdev->base.dev,
> +				     PTR_ERR(ptdev->pwr_dom_devs[i]),
> +				     "pm_domain_attach_by_id(%u) failed\n", i);
> +	}
> +
> +	return devm_add_action_or_reset(dev, panthor_detach_genpd, ptdev);
> +}
> +
>  void panthor_device_unplug(struct panthor_device *ptdev)
>  {
>  	/* This function can be called from two different path: the reset work
> @@ -232,6 +280,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = panthor_genpd_init(ptdev);
> +	if (ret)
> +		return ret;
> +
>  	ret = panthor_devfreq_init(ptdev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index fea3a05778e2e..7fb65447253e9 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -114,6 +114,11 @@ struct panthor_device {
>  	/** @resets: GPU reset. */
>  	struct reset_control *resets;
>  
> +	/** @pwr_dom_count: Power domain count */
> +	int pwr_dom_count;
> +	/** @pwr_dom_dev: Power domain devices */
> +	struct device *pwr_dom_devs[5];
> +
>  	/** @coherent: True if the CPU/GPU are memory coherent. */
>  	bool coherent;
>  

