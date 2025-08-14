Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0391DB26431
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FE610E84C;
	Thu, 14 Aug 2025 11:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="A+DhvwE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335D410E84C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:26:38 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250814112636euoutp028ae6ec40a91a1b2bbfed9bc1497b27fd~bnopHzimv1577415774euoutp020
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:26:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250814112636euoutp028ae6ec40a91a1b2bbfed9bc1497b27fd~bnopHzimv1577415774euoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1755170796;
 bh=+OXY5MBEwk0jrYJZN16GlrQS4PB2GzTe0j9NScg3+/A=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=A+DhvwE++uOVIyVb32AbTkLnS0oSjjeRky46vJGRu7TzHyQkqfXMTCOt9SMdCc/RV
 8963aRXVrqn98Sj0lbI/3dG6oCvYZNijxAvU4+h9z23V0E3wC1u6sLqhWvxLuy8fpu
 FqNuc1KECR1VvvwWfi/odeq+7I3K+kjRlJ4RnIWY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250814112636eucas1p206b752b35c984c7eac2d87eb14dfb270~bnoos_SS51872218722eucas1p2G;
 Thu, 14 Aug 2025 11:26:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250814112634eusmtip2866c82989b01dc30cd17f669701e5f35~bnonZXT4g2264922649eusmtip2c;
 Thu, 14 Aug 2025 11:26:34 +0000 (GMT)
Message-ID: <1840a54c-c03a-42e3-a3a8-52e38919df38@samsung.com>
Date: Thu, 14 Aug 2025 13:26:33 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
To: Henrik Grimler <henrik@grimler.se>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814112636eucas1p206b752b35c984c7eac2d87eb14dfb270
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250724185204eucas1p1d699db3abebc702ea8261b2e41a77c52
X-EPHeader: CA
X-CMS-RootMailID: 20250724185204eucas1p1d699db3abebc702ea8261b2e41a77c52
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <CGME20250724185204eucas1p1d699db3abebc702ea8261b2e41a77c52@eucas1p1.samsung.com>
 <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
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

On 24.07.2025 20:50, Henrik Grimler wrote:
> To use MHL we currently need the MHL chip to be permanently on, which
> consumes unnecessary power. Let's use extcon attached to MUIC to enable
> the MHL chip only if it detects an MHL cable.
>
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> v2: add dependency on extcon. Issue reported by kernel test robot
>      <lkp@intel.com>
> ---
>   drivers/gpu/drm/bridge/Kconfig   |  1 +
>   drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 87 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a603a24f90c6879d1499f824060cb..f18a083f6e1c6fe40bde5e65a1548acc61a162ae 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -303,6 +303,7 @@ config DRM_SII902X
>   config DRM_SII9234
>   	tristate "Silicon Image SII9234 HDMI/MHL bridge"
>   	depends on OF
> +	select EXTCON
>   	help
>   	  Say Y here if you want support for the MHL interface.
>   	  It is an I2C driver, that detects connection of MHL bridge
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 0e0bb1bf71fdcef788715cfd6fa158a6992def33..4d84ba01ea76816bebdbc29d48a041c9c6cd508e 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -19,6 +19,7 @@
>   
>   #include <linux/delay.h>
>   #include <linux/err.h>
> +#include <linux/extcon.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/i2c.h>
>   #include <linux/interrupt.h>
> @@ -26,6 +27,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
> +#include <linux/of_graph.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
>   
> @@ -170,8 +172,12 @@ struct sii9234 {
>   	struct drm_bridge bridge;
>   	struct device *dev;
>   	struct gpio_desc *gpio_reset;
> -	int i2c_error;
>   	struct regulator_bulk_data supplies[4];
> +	struct extcon_dev *extcon;
> +	struct notifier_block extcon_nb;
> +	struct work_struct extcon_wq;
> +	int cable_state;
> +	int i2c_error;
>   
>   	struct mutex lock; /* Protects fields below and device registers */
>   	enum sii9234_state state;
> @@ -864,6 +870,70 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>   	return 0;
>   }
>   
> +static void sii9234_extcon_work(struct work_struct *work)
> +{
> +	struct sii9234 *ctx =
> +		container_of(work, struct sii9234, extcon_wq);
> +	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
> +
> +	if (state == ctx->cable_state)
> +		return;
> +
> +	ctx->cable_state = state;
> +
> +	if (state > 0)
> +		sii9234_cable_in(ctx);
> +	else
> +		sii9234_cable_out(ctx);
> +}
> +
> +static int sii9234_extcon_notifier(struct notifier_block *self,
> +			unsigned long event, void *ptr)
> +{
> +	struct sii9234 *ctx =
> +		container_of(self, struct sii9234, extcon_nb);
> +
> +	schedule_work(&ctx->extcon_wq);
> +
> +	return NOTIFY_DONE;
> +}
> +
> +static int sii9234_extcon_init(struct sii9234 *ctx)
> +{
> +	struct extcon_dev *edev;
> +	struct device_node *musb, *muic;
> +	int ret;
> +
> +	/* Get micro-USB connector node */
> +	musb = of_graph_get_remote_node(ctx->dev->of_node, 1, -1);
> +	/* Then get micro-USB Interface Controller node */
> +	muic = of_get_next_parent(musb);
> +
> +	if (!muic) {
> +		dev_info(ctx->dev,
> +			 "no extcon found, switching to 'always on' mode\n");
> +		return 0;
> +	}
> +
> +	edev = extcon_find_edev_by_node(muic);
> +	of_node_put(muic);
> +	if (IS_ERR(edev)) {
> +		dev_err_probe(ctx->dev, PTR_ERR(edev),
> +			      "invalid or missing extcon\n");
> +	}

It looks that the original logic got lost somehow in the above code 
block, what causes kernel oops if compiled as module and loaded before 
extcon provider. Please handle -EPROBE_DEFER and propagate error value, 
like the original code did in sii8620 driver:

         if (IS_ERR(edev)) {
                 if (PTR_ERR(edev) == -EPROBE_DEFER)
                         return -EPROBE_DEFER;
                 dev_err(ctx->dev, "Invalid or missing extcon\n");
                 return PTR_ERR(edev);
         }


> +
> +	ctx->extcon = edev;
> +	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
> +	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
> +	ret = extcon_register_notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
> +	if (ret) {
> +		dev_err(ctx->dev, "failed to register notifier for MHL\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
>   					 const struct drm_display_info *info,
>   					 const struct drm_display_mode *mode)
> @@ -916,12 +986,17 @@ static int sii9234_probe(struct i2c_client *client)
>   	if (ret < 0)
>   		return ret;
>   
> +	ret = sii9234_extcon_init(ctx);
> +	if (ret < 0)
> +		return ret;
> +
>   	i2c_set_clientdata(client, ctx);
>   
>   	ctx->bridge.of_node = dev->of_node;
>   	drm_bridge_add(&ctx->bridge);
>   
> -	sii9234_cable_in(ctx);
> +	if (!ctx->extcon)
> +		sii9234_cable_in(ctx);
>   
>   	return 0;
>   }
> @@ -930,7 +1005,15 @@ static void sii9234_remove(struct i2c_client *client)
>   {
>   	struct sii9234 *ctx = i2c_get_clientdata(client);
>   
> -	sii9234_cable_out(ctx);
> +	if (ctx->extcon) {
> +		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
> +					   &ctx->extcon_nb);
> +		flush_work(&ctx->extcon_wq);
> +		if (ctx->cable_state > 0)
> +			sii9234_cable_out(ctx);
> +	} else {
> +		sii9234_cable_out(ctx);
> +	}
>   	drm_bridge_remove(&ctx->bridge);
>   }
>   
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

