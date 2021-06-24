Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E3C3B29F8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 10:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265A26EA93;
	Thu, 24 Jun 2021 08:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2595A6EA8A;
 Thu, 24 Jun 2021 08:08:43 +0000 (UTC)
IronPort-SDR: LaozbgsojEP3ttzs9e22oIhsNRruDipeedoHPQ8le40JQmv3vlSAu3oAb766pUusI9hdpWorpn
 G2iQBoU1gONQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="204416590"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="204416590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 01:08:42 -0700
IronPort-SDR: v1mHNk7YTLq4tjD5PLpygsJp7Fqze5GXwAn13Kp5Vz0yOGXKTgtBHR0yr5kpfQ465GdrghRoVP
 Wpn21FG3jdhg==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="453335994"
Received: from schulke-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 01:08:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzysztof.kozlowski@canonical.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 benjamin.gaignard@linaro.org, yannick.fertre@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, jyri.sarha@iki.fi,
 emma@anholt.net, linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: Re: [PATCH v3 06/27] drm/i915: Track IRQ state in local device state
In-Reply-To: <20210624072916.27703-7-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-7-tzimmermann@suse.de>
Date: Thu, 24 Jun 2021 11:08:16 +0300
Message-ID: <87fsx7u1lb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Replace usage of struct drm_device.irq_enabled with the driver's
> own state field struct drm_i915_private.irq_enabled. The field in
> the DRM device structure is considered legacy and should not be
> used by KMS drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

and ack for merging through drm-misc-next or whatever you think is best.

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 2 ++
>  drivers/gpu/drm/i915/i915_irq.c | 8 ++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 01e11fe38642..48c1835bd54b 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1134,6 +1134,8 @@ struct drm_i915_private {
>  	/* For i915gm/i945gm vblank irq workaround */
>  	u8 vblank_enabled;
>  
> +	bool irq_enabled;
> +
>  	/* perform PHY state sanity checks? */
>  	bool chv_phy_assert[2];
>  
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index a11bdb667241..987211f21761 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -4488,14 +4488,14 @@ int intel_irq_install(struct drm_i915_private *dev_priv)
>  	 */
>  	dev_priv->runtime_pm.irqs_enabled = true;
>  
> -	dev_priv->drm.irq_enabled = true;
> +	dev_priv->irq_enabled = true;
>  
>  	intel_irq_reset(dev_priv);
>  
>  	ret = request_irq(irq, intel_irq_handler(dev_priv),
>  			  IRQF_SHARED, DRIVER_NAME, dev_priv);
>  	if (ret < 0) {
> -		dev_priv->drm.irq_enabled = false;
> +		dev_priv->irq_enabled = false;
>  		return ret;
>  	}
>  
> @@ -4521,10 +4521,10 @@ void intel_irq_uninstall(struct drm_i915_private *dev_priv)
>  	 * intel_modeset_driver_remove() calling us out of sequence.
>  	 * Would be nice if it didn't do that...
>  	 */
> -	if (!dev_priv->drm.irq_enabled)
> +	if (!dev_priv->irq_enabled)
>  		return;
>  
> -	dev_priv->drm.irq_enabled = false;
> +	dev_priv->irq_enabled = false;
>  
>  	intel_irq_reset(dev_priv);

-- 
Jani Nikula, Intel Open Source Graphics Center
