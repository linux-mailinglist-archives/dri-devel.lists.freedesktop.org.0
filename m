Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F49AD0A966
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 15:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64F610E8D8;
	Fri,  9 Jan 2026 14:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cAAtTLSF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A811510E8D8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 14:18:26 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D752A1D52;
 Fri,  9 Jan 2026 15:18:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1767968281;
 bh=zUN/XVoRv8CMUR0XZPzDOAanPbZyd762NK9j3Gkz0lg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cAAtTLSFxt/TGuQpLqPF6YJ3rh/uWFZuPikD83cDEwf/P27CVRIeGiu7hwK1AL6b2
 2bTwCPsVkOOg6rgBAAyKKY3tm9QRtg38UtAVAlFCprjTrqpsJnUoOe/HAVlhX7+8eM
 t0jsNbM2l2fe5lxRg660db511PeLYiriIuRUxkP8=
Message-ID: <ae2b549f-1231-405b-ac7d-cc3df8a1dbef@ideasonboard.com>
Date: Fri, 9 Jan 2026 16:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/tidss: Power up attached PM domains on probe
To: Swamil Jain <s-jain1@ti.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devarsht@ti.com, praneeth@ti.com,
 h-shenoy@ti.com, u-kumar1@ti.com, jyri.sarha@iki.fi, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, aradhya.bhatia@linux.dev
References: <20260107174525.1702585-1-s-jain1@ti.com>
 <20260107174525.1702585-3-s-jain1@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20260107174525.1702585-3-s-jain1@ti.com>
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

Hi,

On 07/01/2026 19:45, Swamil Jain wrote:
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> Some SoC's such as AM62P have dedicated power domains
> for OLDI which need to be powered on separately along
> with display controller.
> 
> So during driver probe, power up all attached PM domains
> enumerated in devicetree node for DSS.
> 
> This also prepares base to add display support for AM62P.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> [j-choudhary@ti.com: fix PM call sequence causing kernel crash in OLDI]
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 83 +++++++++++++++++++++++++++++--
>  drivers/gpu/drm/tidss/tidss_drv.h |  4 ++
>  2 files changed, 83 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 1c8cc18bc53c..33a10fba4325 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -8,6 +8,7 @@
>  #include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_domain.h>
>  #include <linux/aperture.h>
>  
>  #include <drm/clients/drm_client_setup.h>
> @@ -107,6 +108,68 @@ static const struct drm_driver tidss_driver = {
>  	.minor			= 0,
>  };
>  
> +static int tidss_detach_pm_domains(struct tidss_device *tidss)
> +{
> +	int i;
> +
> +	if (tidss->num_domains <= 1)
> +		return 0;
> +
> +	for (i = 0; i < tidss->num_domains; i++) {
> +		if (!IS_ERR_OR_NULL(tidss->pd_link[i]))
> +			device_link_del(tidss->pd_link[i]);
> +		if (!IS_ERR_OR_NULL(tidss->pd_dev[i]))
> +			dev_pm_domain_detach(tidss->pd_dev[i], true);
> +		tidss->pd_dev[i] = NULL;
> +		tidss->pd_link[i] = NULL;
> +	}
> +
> +	return 0;
> +}

This should be void, especially as you don't even check the return value
below.

> +
> +static int tidss_attach_pm_domains(struct tidss_device *tidss)
> +{
> +	struct device *dev = tidss->dev;
> +	int i;
> +	int ret;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct device_node *np = pdev->dev.of_node;

You should try to order these lines from longest to the shortest (not
possible for every line).

> +
> +	tidss->num_domains = of_count_phandle_with_args(np, "power-domains",
> +							"#power-domain-cells");
> +
> +	tidss->pd_dev = devm_kmalloc_array(dev, tidss->num_domains,
> +					   sizeof(*tidss->pd_dev), GFP_KERNEL);
> +	if (!tidss->pd_dev)
> +		return -ENOMEM;
> +
> +	tidss->pd_link = devm_kmalloc_array(dev, tidss->num_domains,
> +					    sizeof(*tidss->pd_link), GFP_KERNEL);
> +	if (!tidss->pd_link)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < tidss->num_domains; i++) {
> +		tidss->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR(tidss->pd_dev[i])) {
> +			ret = PTR_ERR(tidss->pd_dev[i]);
> +			goto fail;
> +		}
> +
> +		tidss->pd_link[i] = device_link_add(dev, tidss->pd_dev[i],
> +						    DL_FLAG_STATELESS |
> +						    DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> +		if (!tidss->pd_link[i]) {
> +			ret = -EINVAL;
> +			goto fail;
> +		}
> +	}
> +
> +	return 0;
> +fail:
> +	tidss_detach_pm_domains(tidss);
> +	return ret;
> +}
> +
>  static int tidss_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -129,15 +192,21 @@ static int tidss_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&tidss->irq_lock);
>  
> +	ret = tidss_attach_pm_domains(tidss);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to attach power domains\n");
> +
>  	ret = dispc_init(tidss);
>  	if (ret) {
> -		dev_err(dev, "failed to initialize dispc: %d\n", ret);
> -		return ret;
> +		dev_err_probe(dev, ret, "failed to initialize dispc\n");
> +		goto err_detach_pm_domains;
>  	}
>  
>  	ret = tidss_oldi_init(tidss);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "failed to init OLDI\n");
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to init OLDI\n");
> +		goto err_oldi_deinit;

This doesn't look right.

 Tomi


> +	}
>  
>  	pm_runtime_enable(dev);
>  
> @@ -203,8 +272,12 @@ static int tidss_probe(struct platform_device *pdev)
>  	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_disable(dev);
>  
> +err_oldi_deinit:
>  	tidss_oldi_deinit(tidss);
>  
> +err_detach_pm_domains:
> +	tidss_detach_pm_domains(tidss);
> +
>  	return ret;
>  }
>  
> @@ -232,6 +305,8 @@ static void tidss_remove(struct platform_device *pdev)
>  	/* devm allocated dispc goes away with the dev so mark it NULL */
>  	dispc_remove(tidss);
>  
> +	tidss_detach_pm_domains(tidss);
> +
>  	dev_dbg(dev, "%s done\n", __func__);
>  }
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index e1c1f41d8b4b..6625b989b815 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -41,6 +41,10 @@ struct tidss_device {
>  	/* protects the irq masks field and irqenable/irqstatus registers */
>  	spinlock_t irq_lock;
>  	dispc_irq_t irq_mask;	/* enabled irqs */
> +
> +	int num_domains; /* Count of PM domains to be handled */
> +	struct device **pd_dev;
> +	struct device_link **pd_link;
>  };
>  
>  #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)

