Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA013EB51A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 14:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D07289B61;
	Fri, 13 Aug 2021 12:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B5789B61
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 12:16:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 287B54A1;
 Fri, 13 Aug 2021 14:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628856998;
 bh=wfulRNt8yvhsGrhM4LjmQoomH8J3dxet9JJ7iWsN0LU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ogGzu+2sDe9V8+1LOOop+qHu3LgoZvcEnrY8tEOLQtc1/qgkkfaL8Q1sgIO73jyP+
 BDFge6tJyCgSPGTuDHc23u6X4rvC1PMmjDYYAwaWyTXppXymYIyHw360FegVumaHU/
 2lseGF7hXKDM6ZCMjBGD2AmUJYjMa/+NHkg7ug+0=
Date: Fri, 13 Aug 2021 15:16:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Inki Dae <inki.dae@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 06/17] drm/exynos: dsi: Handle exynos specifics via
 driver_data
Message-ID: <YRZioZvYrU99fQxJ@pendragon.ideasonboard.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
 <20210704090230.26489-7-jagan@amarulasolutions.com>
 <CGME20210725172551epcas1p31dff839439ac37757cf061405b5ac65c@epcas1p3.samsung.com>
 <YP2el40V3K4R7ner@ravnborg.org>
 <79ef7f71-b167-2368-e0fd-d4ccaee596c2@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79ef7f71-b167-2368-e0fd-d4ccaee596c2@samsung.com>
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

Hi Inki,

On Fri, Aug 13, 2021 at 03:50:56PM +0900, Inki Dae wrote:
> 21. 7. 26. 오전 2:25에 Sam Ravnborg 이(가) 쓴 글:
> > On Sun, Jul 04, 2021 at 02:32:19PM +0530, Jagan Teki wrote:
> >> Exynos DSI driver is actually a Samsung MIPI DSIM bridge
> >> IP which is also used in i.MX8MM platforms.
> >>
> >> Right now the existing driver has some exynos drm specific
> >> code bases like te_irq, crtc and component_ops.
> >>
> >> In order to switch this driver into a common bridge driver
> >> We can see 2 options to handle the exynos specific code.
> >>
> >> A. Drop the component_ops, and rework other specifics.
> >>    This may lead to more foundation work as it requires
> >>    more changes in exynos drm drivers stack.
> >>
> >> B. Handle the exynos specifics via driver data, and make
> >>    the common bridge work in different platforms and plan
> >>    for option A in future.
> >>
> >> So, this patch is trying to add option B) changes to handle
> >> exynos specifics via driver_data.
> > 
> > We really should find someone that has the time, energy, knowledge and
> > hardware that can include device_link support once anf for all for
> > bridges.
> > Then we would avoid hacks like this.
> > 
> > I see no other options at the moment, but look forward for a better
> > solution.
> 
> I'm not sure that it's correct to share this mipi dsi driver with
> I.MX8MM SoC even though it's a same IP because this MIPI DSI device
> isn't peripheral device but in SoC.
>
> It would mean that Exynos MIPI DSI device depends on SoC architecture,
> and Exynos and I.MX series are totally different SoC. So if we share
> the same driver for the MIPI DSI device then many things we didn't
> predict may happen in the future.

Isn't that true for external components true thought ? Any driver shared
by multiple systems will face this issue, where it will be developed
with some use cases in mind, and regressions may happen when the driver
is then extended to support other use cases not required for the
original platform.

In general we don't want multiple drivers for the same IP core unless
there are valid technical reasons for that. It's the whole point of the
device tree, being able to describe how IP cores are integrated, so that
code can be reused across platforms. Of course, integration differences
between SoCs can sometimes vary wildly and require some amount of glue
code.

> I don't want to make Jagan's efforts
> in vain for the community but clarify whether this is correct way or
> not. If this is only the way we have to go then we could more focus on
> actual solution not such hack. Impossible work with Jagan alone I
> think.

I do agree that we need more correct solutions and less hacks in general
:-) The issues faced on Exynos also exist on other platforms, so it
would be much better to solve them well once that duplicating
implementations with less test coverage and reviews. There have been
efforts in the past to address some of these issues, which have resulted
in solutions such as the component framework. However, I'd argued that
we've never taken it to the last step, and have always stopped with half
solutions. The component framework, for instance, is painful to use, and
the handling of .remove() in most drivers is completely broken because
of that (not just because of that though, we have issues in the DRM core
that make hot-unplug just impossible to handle safetly).

> So let's get started with a question,
> - Is MIPI-DSI bridge device or Encoder device? I think that MIPI-DSI
> is a Encoder device managed by atomic KMS. If MIPI-DSI should be
> handled as bridge device then does now drm bridge framework provide
> everything to share one driver with one more SoC? I mean something
> that drm bridge has to consider for such driver support, which is
> shared with one more SoC.

The DRM "encoder" concept was a bit of a historical mistake that we are
stuck with as drm_encoder is exposed to userspace. It comes from a time
where nobody was envisioning chaining multiple encoders. DRM is moving
to modelling every component after the CRTC as a bridge. This brings
much more flexibility, and in that model, the drm_encoder becomes more
or less a stub.

The DRM bridge API has been extended in the past to support more
features, and if anything is still missing that makes it difficult to
move away from drm_encoder, we can of course address the issues in
drm_bridge.

> And Display mode - VIDEO and COMMAND mode - is generic type of MIPI
> DSI, and also componentised subsystem is a generic solution to resolve
> probing order issue not Exynos specific feature. These are driver
> specific ones not Exynos SoC I think. As SoC specific things should be
> considered, I think MIPI DSI Driver - interrupt handler and probing
> order things are really specific to device driver - should be
> separated but we could share the control part of the device.
> 
> I was busy with other projects so didn't care of Linux DRM world so
> there may be my missing something.
> 
> >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >> ---
> >>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 37 +++++++++++++++++++------
> >>  1 file changed, 29 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >> index 99a1b8c22313..53d878d4d2d7 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> >> @@ -250,6 +250,7 @@ struct exynos_dsi_driver_data {
> >>  	unsigned int wait_for_reset;
> >>  	unsigned int num_bits_resol;
> >>  	const unsigned int *reg_values;
> >> +	bool exynos_specific;
> >>  };
> >>  
> >>  struct exynos_dsi {
> >> @@ -459,6 +460,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
> >>  	.wait_for_reset = 1,
> >>  	.num_bits_resol = 11,
> >>  	.reg_values = reg_values,
> >> +	.exynos_specific = true,
> >>  };
> >>  
> >>  static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
> >> @@ -471,6 +473,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
> >>  	.wait_for_reset = 1,
> >>  	.num_bits_resol = 11,
> >>  	.reg_values = reg_values,
> >> +	.exynos_specific = true,
> >>  };
> >>  
> >>  static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
> >> @@ -481,6 +484,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
> >>  	.wait_for_reset = 1,
> >>  	.num_bits_resol = 11,
> >>  	.reg_values = reg_values,
> >> +	.exynos_specific = true,
> >>  };
> >>  
> >>  static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
> >> @@ -492,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
> >>  	.wait_for_reset = 0,
> >>  	.num_bits_resol = 12,
> >>  	.reg_values = exynos5433_reg_values,
> >> +	.exynos_specific = true,
> >>  };
> >>  
> >>  static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
> >> @@ -503,6 +508,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
> >>  	.wait_for_reset = 1,
> >>  	.num_bits_resol = 12,
> >>  	.reg_values = exynos5422_reg_values,
> >> +	.exynos_specific = true,
> >>  };
> >>  
> >>  static const struct of_device_id exynos_dsi_of_match[] = {
> >> @@ -1484,7 +1490,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >>  	 * If attached panel device is for command mode one, dsi should register
> >>  	 * TE interrupt handler.
> >>  	 */
> >> -	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> >> +	if (dsi->driver_data->exynos_specific &&
> >> +	    !(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
> >>  		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
> >>  		if (ret)
> >>  			return ret;
> >> @@ -1495,8 +1502,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> >>  	dsi->lanes = device->lanes;
> >>  	dsi->format = device->format;
> >>  	dsi->mode_flags = device->mode_flags;
> >> -	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
> >> -			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
> >> +	if (dsi->driver_data->exynos_specific)
> >> +		exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
> >> +					    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
> >>  
> >>  	mutex_unlock(&drm->mode_config.mutex);
> >>  
> >> @@ -1515,7 +1523,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
> >>  	if (drm->mode_config.poll_enabled)
> >>  		drm_kms_helper_hotplug_event(drm);
> >>  
> >> -	exynos_dsi_unregister_te_irq(dsi);
> >> +	if (dsi->driver_data->exynos_specific)
> >> +		exynos_dsi_unregister_te_irq(dsi);
> >>  
> >>  	return 0;
> >>  }
> >> @@ -1737,6 +1746,15 @@ static int exynos_dsi_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return ret;
> >>  
> >> +	if (!dsi->driver_data->exynos_specific) {
> >> +		ret = mipi_dsi_host_register(&dsi->dsi_host);
> >> +		if (ret) {
> >> +			dev_err(dev, "failed to register mipi dsi host: %d\n",
> >> +				ret);
> >> +			return ret;
> >> +		}
> >> +	}
> >> +
> >>  	platform_set_drvdata(pdev, dsi);
> >>  
> >>  	pm_runtime_enable(dev);
> >> @@ -1747,9 +1765,11 @@ static int exynos_dsi_probe(struct platform_device *pdev)
> >>  
> >>  	drm_bridge_add(&dsi->bridge);
> >>  
> >> -	ret = component_add(dev, &exynos_dsi_component_ops);
> >> -	if (ret)
> >> -		goto err_disable_runtime;
> >> +	if (dsi->driver_data->exynos_specific) {
> >> +		ret = component_add(dev, &exynos_dsi_component_ops);
> >> +		if (ret)
> >> +			goto err_disable_runtime;
> >> +	}
> >>  
> >>  	return 0;
> >>  
> >> @@ -1767,7 +1787,8 @@ static int exynos_dsi_remove(struct platform_device *pdev)
> >>  
> >>  	pm_runtime_disable(&pdev->dev);
> >>  
> >> -	component_del(&pdev->dev, &exynos_dsi_component_ops);
> >> +	if (dsi->driver_data->exynos_specific)
> >> +		component_del(&pdev->dev, &exynos_dsi_component_ops);
> >>  
> >>  	return 0;
> >>  }

-- 
Regards,

Laurent Pinchart
