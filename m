Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A93B08D8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936816E593;
	Tue, 22 Jun 2021 15:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7B3C6E593;
 Tue, 22 Jun 2021 15:25:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C59731B;
 Tue, 22 Jun 2021 08:25:06 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1ECC3F718;
 Tue, 22 Jun 2021 08:25:05 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 7C5A86837C9; Tue, 22 Jun 2021 16:25:04 +0100 (BST)
Date: Tue, 22 Jun 2021 16:25:04 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/22] drm: Don't test for IRQ support in VBLANK ioctls
Message-ID: <20210622152504.2sw6khajwydsoaqa@e110455-lin.cambridge.arm.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <20210622141002.11590-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210622141002.11590-5-tzimmermann@suse.de>
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
Cc: emma@anholt.net, airlied@linux.ie, nouveau@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 mihail.atanassov@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wens@csie.org, jernej.skrabec@gmail.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com,
 tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 Xinhui.Pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 christian.koenig@amd.com, kyungmin.park@samsung.com,
 philippe.cornu@foss.st.com, alexander.deucher@amd.com, tiantao6@hisilicon.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Tue, Jun 22, 2021 at 04:09:44PM +0200, Thomas Zimmermann wrote:
> For KMS drivers, replace the IRQ check in VBLANK ioctls with a check for
> vblank support. IRQs might be enabled wthout vblanking being supported.
> 
> This change also removes the DRM framework's only dependency on IRQ state
> for non-legacy drivers. For legacy drivers with userspace modesetting,
> the original test remains in drm_wait_vblank_ioctl().
> 
> v2:
> 	* keep the old test for legacy drivers in
> 	  drm_wait_vblank_ioctl() (Daniel)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_irq.c    | 10 +++-------
>  drivers/gpu/drm/drm_vblank.c | 13 +++++++++----
>  2 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
> index c3bd664ea733..1d7785721323 100644
> --- a/drivers/gpu/drm/drm_irq.c
> +++ b/drivers/gpu/drm/drm_irq.c
> @@ -74,10 +74,8 @@
>   * only supports devices with a single interrupt on the main device stored in
>   * &drm_device.dev and set as the device paramter in drm_dev_alloc().
>   *
> - * These IRQ helpers are strictly optional. Drivers which roll their own only
> - * need to set &drm_device.irq_enabled to signal the DRM core that vblank
> - * interrupts are working. Since these helpers don't automatically clean up the
> - * requested interrupt like e.g. devm_request_irq() they're not really
> + * These IRQ helpers are strictly optional. Since these helpers don't automatically
> + * clean up the requested interrupt like e.g. devm_request_irq() they're not really
>   * recommended.
>   */
>  
> @@ -91,9 +89,7 @@
>   * and after the installation.
>   *
>   * This is the simplified helper interface provided for drivers with no special
> - * needs. Drivers which need to install interrupt handlers for multiple
> - * interrupts must instead set &drm_device.irq_enabled to signal the DRM core
> - * that vblank interrupts are available.
> + * needs.
>   *
>   * @irq must match the interrupt number that would be passed to request_irq(),
>   * if called directly instead of using this helper function.
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 3417e1ac7918..a98a4aad5037 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1748,8 +1748,13 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
>  	unsigned int pipe_index;
>  	unsigned int flags, pipe, high_pipe;
>  
> -	if (!dev->irq_enabled)
> -		return -EOPNOTSUPP;
> +	if  (drm_core_check_feature(dev, DRIVER_MODESET)) {
> +		if (!drm_dev_has_vblank(dev))
> +			return -EOPNOTSUPP;
> +	} else {
> +		if (!dev->irq_enabled)
> +			return -EOPNOTSUPP;
> +	}

For a system call that is used quite a lot by userspace we have increased the code size
in a noticeable way. Can we not cache it privately?

Best regards,
Liviu

>  
>  	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>  		return -EINVAL;
> @@ -2023,7 +2028,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	if (!dev->irq_enabled)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EOPNOTSUPP;
>  
>  	crtc = drm_crtc_find(dev, file_priv, get_seq->crtc_id);
> @@ -2082,7 +2087,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return -EOPNOTSUPP;
>  
> -	if (!dev->irq_enabled)
> +	if (!drm_dev_has_vblank(dev))
>  		return -EOPNOTSUPP;
>  
>  	crtc = drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
> -- 
> 2.32.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
