Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B6FB429F3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 21:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE3710E92A;
	Wed,  3 Sep 2025 19:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="TUp//0B/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2007910E1E9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 19:32:41 +0000 (UTC)
Date: Wed, 3 Sep 2025 21:32:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1756927958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6TJQFWEs0lqxsAc3VyBDgiQ7ISjtKZ5k/cdkhimoeI=;
 b=TUp//0B/vpzEYgRzRqG8hT0DluleYeAkUiSt5nXN1CkVrANuLGD4scuJov3pysDvAkqzJX
 K18nsik+KgSFWW2fJCpuCYUghRqojX/+rxNb/Xvo0AOCyOaJJjzpuAH8ZmanHx0DfUNCx1
 Y7Z+sSDQGcS4AYurpiom1UKdY7hqBhU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <20250903193231.GA5526@l14.localdomain>
References: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
 <CGME20250824111745eucas1p20e336aecd501200bdd035bfc30ce1e63@eucas1p2.samsung.com>
 <20250824-exynos4-sii9234-driver-v3-3-80849e716a37@grimler.se>
 <ac222017-d4e2-4fa7-beed-cc6b73042a73@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac222017-d4e2-4fa7-beed-cc6b73042a73@samsung.com>
X-Migadu-Flow: FLOW_OUT
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

Hi Marek,

On Mon, Aug 25, 2025 at 04:16:50PM +0200, Marek Szyprowski wrote:
> On 24.08.2025 13:16, Henrik Grimler wrote:
> > To use MHL we currently need the MHL chip to be permanently on, which
> > consumes unnecessary power. Let's use extcon attached to MUIC to enable
> > the MHL chip only if it detects an MHL cable.
> >
> > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> On Trats2 board the status of HDMI connector is no properly reported as 
> disconnected when no cable is attached.

Thanks for testing (again)!

In what way is it not properly reported as disconnected, are you
checking some sysfs property, or with some userspace tool?

If cable is connected and then disconnected, is status then correctly
reported?

Best regards,
Henrik Grimler

> > ---
> > v3: add missing return in error path, spotted by Marek
> >      Use depends on EXTCON || !EXTCON instead of select
> > v2: add dependency on extcon. Issue reported by kernel test robot
> >      <lkp@intel.com>
> > ---
> >   drivers/gpu/drm/bridge/Kconfig   |  1 +
> >   drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
> >   2 files changed, 87 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index 6945029b35929a8e30054ac1a699bd88ab0487f2..bf73f8d900ebd8da9fa3444c0b2d9bfc901ea773 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -304,6 +304,7 @@ config DRM_SII902X
> >   config DRM_SII9234
> >   	tristate "Silicon Image SII9234 HDMI/MHL bridge"
> >   	depends on OF
> > +	depends on EXTCON || !EXTCON
> >   	help
> >   	  Say Y here if you want support for the MHL interface.
> >   	  It is an I2C driver, that detects connection of MHL bridge
> > diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> > index e43248e515b3dcdde043997288d61f738417b8f0..72c6aeed6e12e43df3b052dadc0990f1609253f0 100644
> > --- a/drivers/gpu/drm/bridge/sii9234.c
> > +++ b/drivers/gpu/drm/bridge/sii9234.c
> > @@ -19,6 +19,7 @@
> >   
> >   #include <linux/delay.h>
> >   #include <linux/err.h>
> > +#include <linux/extcon.h>
> >   #include <linux/gpio/consumer.h>
> >   #include <linux/i2c.h>
> >   #include <linux/interrupt.h>
> > @@ -26,6 +27,7 @@
> >   #include <linux/kernel.h>
> >   #include <linux/module.h>
> >   #include <linux/mutex.h>
> > +#include <linux/of_graph.h>
> >   #include <linux/regulator/consumer.h>
> >   #include <linux/slab.h>
> >   
> > @@ -170,8 +172,12 @@ struct sii9234 {
> >   	struct drm_bridge bridge;
> >   	struct device *dev;
> >   	struct gpio_desc *gpio_reset;
> > -	int i2c_error;
> >   	struct regulator_bulk_data supplies[4];
> > +	struct extcon_dev *extcon;
> > +	struct notifier_block extcon_nb;
> > +	struct work_struct extcon_wq;
> > +	int cable_state;
> > +	int i2c_error;
> >   
> >   	struct mutex lock; /* Protects fields below and device registers */
> >   	enum sii9234_state state;
> > @@ -863,6 +869,70 @@ static int sii9234_init_resources(struct sii9234 *ctx,
> >   	return 0;
> >   }
> >   
> > +static void sii9234_extcon_work(struct work_struct *work)
> > +{
> > +	struct sii9234 *ctx =
> > +		container_of(work, struct sii9234, extcon_wq);
> > +	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
> > +
> > +	if (state == ctx->cable_state)
> > +		return;
> > +
> > +	ctx->cable_state = state;
> > +
> > +	if (state > 0)
> > +		sii9234_cable_in(ctx);
> > +	else
> > +		sii9234_cable_out(ctx);
> > +}
> > +
> > +static int sii9234_extcon_notifier(struct notifier_block *self,
> > +			unsigned long event, void *ptr)
> > +{
> > +	struct sii9234 *ctx =
> > +		container_of(self, struct sii9234, extcon_nb);
> > +
> > +	schedule_work(&ctx->extcon_wq);
> > +
> > +	return NOTIFY_DONE;
> > +}
> > +
> > +static int sii9234_extcon_init(struct sii9234 *ctx)
> > +{
> > +	struct extcon_dev *edev;
> > +	struct device_node *musb, *muic;
> > +	int ret;
> > +
> > +	/* Get micro-USB connector node */
> > +	musb = of_graph_get_remote_node(ctx->dev->of_node, 1, -1);
> > +	/* Then get micro-USB Interface Controller node */
> > +	muic = of_get_next_parent(musb);
> > +
> > +	if (!muic) {
> > +		dev_info(ctx->dev,
> > +			 "no extcon found, switching to 'always on' mode\n");
> > +		return 0;
> > +	}
> > +
> > +	edev = extcon_find_edev_by_node(muic);
> > +	of_node_put(muic);
> > +	if (IS_ERR(edev)) {
> > +		return dev_err_probe(ctx->dev, PTR_ERR(edev),
> > +			      "invalid or missing extcon\n");
> > +	}
> > +
> > +	ctx->extcon = edev;
> > +	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
> > +	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
> > +	ret = extcon_register_notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
> > +	if (ret) {
> > +		dev_err(ctx->dev, "failed to register notifier for MHL\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
> >   					 const struct drm_display_info *info,
> >   					 const struct drm_display_mode *mode)
> > @@ -915,12 +985,17 @@ static int sii9234_probe(struct i2c_client *client)
> >   	if (ret < 0)
> >   		return ret;
> >   
> > +	ret = sii9234_extcon_init(ctx);
> > +	if (ret < 0)
> > +		return ret;
> > +
> >   	i2c_set_clientdata(client, ctx);
> >   
> >   	ctx->bridge.of_node = dev->of_node;
> >   	drm_bridge_add(&ctx->bridge);
> >   
> > -	sii9234_cable_in(ctx);
> > +	if (!ctx->extcon)
> > +		sii9234_cable_in(ctx);
> >   
> >   	return 0;
> >   }
> > @@ -929,7 +1004,15 @@ static void sii9234_remove(struct i2c_client *client)
> >   {
> >   	struct sii9234 *ctx = i2c_get_clientdata(client);
> >   
> > -	sii9234_cable_out(ctx);
> > +	if (ctx->extcon) {
> > +		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
> > +					   &ctx->extcon_nb);
> > +		flush_work(&ctx->extcon_wq);
> > +		if (ctx->cable_state > 0)
> > +			sii9234_cable_out(ctx);
> > +	} else {
> > +		sii9234_cable_out(ctx);
> > +	}
> >   	drm_bridge_remove(&ctx->bridge);
> >   }
> >   
> >
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
