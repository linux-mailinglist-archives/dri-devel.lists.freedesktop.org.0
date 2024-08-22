Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358F995B60F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 15:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCF310EA17;
	Thu, 22 Aug 2024 13:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Vk7aFrrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1151010EA14
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 13:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QaIWAh/v4oJkknzBozhsckoi7sWyy0hcYNAonJ8KyLs=; b=Vk7aFrrRKdGwvyknf6DiW95x1R
 tf+CKJ9J3Y5KJuKzKWQMMEixRZMspAxdCD8U5gKtSDBtY5slG0PGJL0Zxo81+1SkybXIoP+GaT3EG
 zGra8MNXNhHeXez8D3aK4IelozLYGPxTKFB2iFk7cKtk/Ur1U6eoCZENwUXTwxEyBWaSGqoUAm8cg
 0by6xIbFlSGgPQ3uIKwaBOGmbUCMlfqzyJa2wGkVpo3Z4z7TTPHlM4Heo/GW/zRZHZSlH+nV7aYRw
 sE3g8j3CEQuS4i32ncidYHUWm7k736luDh8ndTaiJjqBnbjQrhRPgOSkjofDEM7FtlhW0fr7G2pU+
 HfQhMrVA==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sh7Zx-003Z1J-KV; Thu, 22 Aug 2024 15:10:17 +0200
Message-ID: <2d120b20-81d0-445b-8936-537d5d12809f@igalia.com>
Date: Thu, 22 Aug 2024 10:10:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/9] drm/vc4: Get the rid of DRM_ERROR()
To: Stefan Wahren <wahrenst@gmx.net>, Russell King <linux@armlinux.org.uk>,
 Doug Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com
References: <20240821214052.6800-1-wahrenst@gmx.net>
 <20240821214052.6800-4-wahrenst@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240821214052.6800-4-wahrenst@gmx.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On 8/21/24 18:40, Stefan Wahren wrote:
> DRM_ERROR() has been deprecated in favor of pr_err(). However, we
> should prefer to use drm_err() whenever possible so we get device-
> specific output with the error message. In error case of kcalloc,
> we can simply drop DRM_ERROR(), because kcalloc already logs errors.
> 
> Suggested-by: Maíra Canal <mcanal@igalia.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>

Applied to drm/kernel/drm-misc-next!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/vc4_bo.c       | 14 ++++++------
>   drivers/gpu/drm/vc4/vc4_dpi.c      | 14 ++++++------
>   drivers/gpu/drm/vc4/vc4_dsi.c      | 32 ++++++++++++++------------
>   drivers/gpu/drm/vc4/vc4_gem.c      | 11 +++++----
>   drivers/gpu/drm/vc4/vc4_hdmi.c     | 36 +++++++++++++++---------------
>   drivers/gpu/drm/vc4/vc4_hvs.c      |  4 ++--
>   drivers/gpu/drm/vc4/vc4_irq.c      |  2 +-
>   drivers/gpu/drm/vc4/vc4_v3d.c      |  6 ++---
>   drivers/gpu/drm/vc4/vc4_validate.c |  8 +++----
>   drivers/gpu/drm/vc4/vc4_vec.c      | 10 ++++-----
>   10 files changed, 70 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index 86d629e45307..3f72be7490d5 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -469,7 +469,7 @@ struct vc4_bo *vc4_bo_create(struct drm_device *dev, size_t unaligned_size,
> 
>   	if (IS_ERR(dma_obj)) {
>   		struct drm_printer p = drm_info_printer(vc4->base.dev);
> -		DRM_ERROR("Failed to allocate from GEM DMA helper:\n");
> +		drm_err(dev, "Failed to allocate from GEM DMA helper:\n");
>   		vc4_bo_stats_print(&p, vc4);
>   		return ERR_PTR(-ENOMEM);
>   	}
> @@ -702,7 +702,7 @@ static struct dma_buf *vc4_prime_export(struct drm_gem_object *obj, int flags)
>   	 */
>   	ret = vc4_bo_inc_usecnt(bo);
>   	if (ret) {
> -		DRM_ERROR("Failed to increment BO usecnt\n");
> +		drm_err(obj->dev, "Failed to increment BO usecnt\n");
>   		return ERR_PTR(ret);
>   	}
> 
> @@ -1050,10 +1050,10 @@ static void vc4_bo_cache_destroy(struct drm_device *dev, void *unused)
> 
>   	for (i = 0; i < vc4->num_labels; i++) {
>   		if (vc4->bo_labels[i].num_allocated) {
> -			DRM_ERROR("Destroying BO cache with %d %s "
> -				  "BOs still allocated\n",
> -				  vc4->bo_labels[i].num_allocated,
> -				  vc4->bo_labels[i].name);
> +			drm_err(dev, "Destroying BO cache with %d %s "
> +				"BOs still allocated\n",
> +				vc4->bo_labels[i].num_allocated,
> +				vc4->bo_labels[i].name);
>   		}
> 
>   		if (is_user_label(i))
> @@ -1083,7 +1083,7 @@ int vc4_label_bo_ioctl(struct drm_device *dev, void *data,
> 
>   	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
>   	if (!gem_obj) {
> -		DRM_ERROR("Failed to look up GEM BO %d\n", args->handle);
> +		drm_err(dev, "Failed to look up GEM BO %d\n", args->handle);
>   		kfree(name);
>   		return -ENOENT;
>   	}
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index 39152e755a13..a382dc4654bd 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -199,8 +199,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>   						       DPI_FORMAT);
>   				break;
>   			default:
> -				DRM_ERROR("Unknown media bus format %d\n",
> -					  bus_format);
> +				drm_err(dev, "Unknown media bus format %d\n",
> +					bus_format);
>   				break;
>   			}
>   		}
> @@ -236,11 +236,11 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
> 
>   	ret = clk_set_rate(dpi->pixel_clock, mode->clock * 1000);
>   	if (ret)
> -		DRM_ERROR("Failed to set clock rate: %d\n", ret);
> +		drm_err(dev, "Failed to set clock rate: %d\n", ret);
> 
>   	ret = clk_prepare_enable(dpi->pixel_clock);
>   	if (ret)
> -		DRM_ERROR("Failed to set clock rate: %d\n", ret);
> +		drm_err(dev, "Failed to set clock rate: %d\n", ret);
> 
>   	drm_dev_exit(idx);
>   }
> @@ -339,7 +339,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>   	if (IS_ERR(dpi->core_clock)) {
>   		ret = PTR_ERR(dpi->core_clock);
>   		if (ret != -EPROBE_DEFER)
> -			DRM_ERROR("Failed to get core clock: %d\n", ret);
> +			drm_err(drm, "Failed to get core clock: %d\n", ret);
>   		return ret;
>   	}
> 
> @@ -347,13 +347,13 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>   	if (IS_ERR(dpi->pixel_clock)) {
>   		ret = PTR_ERR(dpi->pixel_clock);
>   		if (ret != -EPROBE_DEFER)
> -			DRM_ERROR("Failed to get pixel clock: %d\n", ret);
> +			drm_err(drm, "Failed to get pixel clock: %d\n", ret);
>   		return ret;
>   	}
> 
>   	ret = clk_prepare_enable(dpi->core_clock);
>   	if (ret) {
> -		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
> +		drm_err(drm, "Failed to turn on core clock: %d\n", ret);
>   		return ret;
>   	}
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 46f6c4ce61c5..f5ccc1bf7a63 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -613,6 +613,7 @@ struct vc4_dsi {
>   static inline void
>   dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
>   {
> +	struct drm_device *drm = dsi->bridge.dev;
>   	struct dma_chan *chan = dsi->reg_dma_chan;
>   	struct dma_async_tx_descriptor *tx;
>   	dma_cookie_t cookie;
> @@ -633,19 +634,19 @@ dsi_dma_workaround_write(struct vc4_dsi *dsi, u32 offset, u32 val)
>   						  dsi->reg_dma_paddr,
>   						  4, 0);
>   	if (!tx) {
> -		DRM_ERROR("Failed to set up DMA register write\n");
> +		drm_err(drm, "Failed to set up DMA register write\n");
>   		return;
>   	}
> 
>   	cookie = tx->tx_submit(tx);
>   	ret = dma_submit_error(cookie);
>   	if (ret) {
> -		DRM_ERROR("Failed to submit DMA: %d\n", ret);
> +		drm_err(drm, "Failed to submit DMA: %d\n", ret);
>   		return;
>   	}
>   	ret = dma_sync_wait(chan, cookie);
>   	if (ret)
> -		DRM_ERROR("Failed to wait for DMA: %d\n", ret);
> +		drm_err(drm, "Failed to wait for DMA: %d\n", ret);
>   }
> 
>   #define DSI_READ(offset)								\
> @@ -893,7 +894,7 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
> 
>   	ret = pm_runtime_resume_and_get(dev);
>   	if (ret) {
> -		DRM_ERROR("Failed to runtime PM enable on DSI%d\n", dsi->variant->port);
> +		drm_err(bridge->dev, "Failed to runtime PM enable on DSI%d\n", dsi->variant->port);
>   		return;
>   	}
> 
> @@ -986,13 +987,14 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
> 
>   	ret = clk_prepare_enable(dsi->escape_clock);
>   	if (ret) {
> -		DRM_ERROR("Failed to turn on DSI escape clock: %d\n", ret);
> +		drm_err(bridge->dev, "Failed to turn on DSI escape clock: %d\n",
> +			ret);
>   		return;
>   	}
> 
>   	ret = clk_prepare_enable(dsi->pll_phy_clock);
>   	if (ret) {
> -		DRM_ERROR("Failed to turn on DSI PLL: %d\n", ret);
> +		drm_err(bridge->dev, "Failed to turn on DSI PLL: %d\n", ret);
>   		return;
>   	}
> 
> @@ -1014,7 +1016,7 @@ static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
> 
>   	ret = clk_prepare_enable(dsi->pixel_clock);
>   	if (ret) {
> -		DRM_ERROR("Failed to turn on DSI pixel clock: %d\n", ret);
> +		drm_err(bridge->dev, "Failed to turn on DSI pixel clock: %d\n", ret);
>   		return;
>   	}
> 
> @@ -1172,6 +1174,7 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>   				     const struct mipi_dsi_msg *msg)
>   {
>   	struct vc4_dsi *dsi = host_to_dsi(host);
> +	struct drm_device *drm = dsi->bridge.dev;
>   	struct mipi_dsi_packet packet;
>   	u32 pkth = 0, pktc = 0;
>   	int i, ret;
> @@ -1303,8 +1306,8 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>   						  DSI_RXPKT1H_BC_PARAM);
> 
>   			if (rxlen != msg->rx_len) {
> -				DRM_ERROR("DSI returned %db, expecting %db\n",
> -					  rxlen, (int)msg->rx_len);
> +				drm_err(drm, "DSI returned %db, expecting %db\n",
> +					rxlen, (int)msg->rx_len);
>   				ret = -ENXIO;
>   				goto reset_fifo_and_return;
>   			}
> @@ -1326,7 +1329,7 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
>   	return ret;
> 
>   reset_fifo_and_return:
> -	DRM_ERROR("DSI transfer failed, resetting: %d\n", ret);
> +	drm_err(drm, "DSI transfer failed, resetting: %d\n", ret);
> 
>   	DSI_PORT_WRITE(TXPKT1C, DSI_PORT_READ(TXPKT1C) & ~DSI_TXPKT1C_CMD_EN);
>   	udelay(1);
> @@ -1468,7 +1471,8 @@ static void dsi_handle_error(struct vc4_dsi *dsi,
>   	if (!(stat & bit))
>   		return;
> 
> -	DRM_ERROR("DSI%d: %s error\n", dsi->variant->port, type);
> +	drm_err(dsi->bridge.dev, "DSI%d: %s error\n", dsi->variant->port,
> +		type);
>   	*ret = IRQ_HANDLED;
>   }
> 
> @@ -1687,7 +1691,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>   						      &dsi->reg_dma_paddr,
>   						      GFP_KERNEL);
>   		if (!dsi->reg_dma_mem) {
> -			DRM_ERROR("Failed to get DMA memory\n");
> +			drm_err(drm, "Failed to get DMA memory\n");
>   			return -ENOMEM;
>   		}
> 
> @@ -1702,8 +1706,8 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>   		if (IS_ERR(dsi->reg_dma_chan)) {
>   			ret = PTR_ERR(dsi->reg_dma_chan);
>   			if (ret != -EPROBE_DEFER)
> -				DRM_ERROR("Failed to get DMA channel: %d\n",
> -					  ret);
> +				drm_err(drm, "Failed to get DMA channel: %d\n",
> +					ret);
>   			return ret;
>   		}
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 03648f954985..24fb1b57e1dd 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -832,8 +832,8 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
>   	 */
>   	temp = kvmalloc_array(temp_size, 1, GFP_KERNEL);
>   	if (!temp) {
> -		DRM_ERROR("Failed to allocate storage for copying "
> -			  "in bin/render CLs.\n");
> +		drm_err(dev, "Failed to allocate storage for copying "
> +			"in bin/render CLs.\n");
>   		ret = -ENOMEM;
>   		goto fail;
>   	}
> @@ -866,7 +866,7 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
> 
>   	bo = vc4_bo_create(dev, exec_size, true, VC4_BO_TYPE_BCL);
>   	if (IS_ERR(bo)) {
> -		DRM_ERROR("Couldn't allocate BO for binning\n");
> +		drm_err(dev, "Couldn't allocate BO for binning\n");
>   		ret = PTR_ERR(bo);
>   		goto fail;
>   	}
> @@ -1153,10 +1153,9 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>   	}
> 
>   	exec = kcalloc(1, sizeof(*exec), GFP_KERNEL);
> -	if (!exec) {
> -		DRM_ERROR("malloc failure on exec struct\n");
> +	if (!exec)
>   		return -ENOMEM;
> -	}
> +
>   	exec->dev = vc4;
> 
>   	ret = vc4_v3d_pm_get(vc4);
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index cb424604484f..6611ab7c26a6 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -704,7 +704,7 @@ static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
> 
>   	ret = vc4_hdmi_stop_packet(vc4_hdmi, type, true);
>   	if (ret) {
> -		DRM_ERROR("Failed to wait for infoframe to go idle: %d\n", ret);
> +		drm_err(drm, "Failed to wait for infoframe to go idle: %d\n", ret);
>   		goto out;
>   	}
> 
> @@ -740,7 +740,7 @@ static int vc4_hdmi_write_infoframe(struct drm_connector *connector,
>   	ret = wait_for((HDMI_READ(HDMI_RAM_PACKET_STATUS) &
>   			BIT(packet_id)), 100);
>   	if (ret)
> -		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
> +		drm_err(drm, "Failed to wait for infoframe to start: %d\n", ret);
> 
>   out:
>   	drm_dev_exit(idx);
> @@ -901,7 +901,7 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
> 
>   	ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
>   	if (ret < 0)
> -		DRM_ERROR("Failed to release power domain: %d\n", ret);
> +		drm_err(drm, "Failed to release power domain: %d\n", ret);
> 
>   	drm_dev_exit(idx);
> 
> @@ -1443,7 +1443,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
> 
>   	ret = pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev);
>   	if (ret < 0) {
> -		DRM_ERROR("Failed to retain power domain: %d\n", ret);
> +		drm_err(drm, "Failed to retain power domain: %d\n", ret);
>   		goto err_dev_exit;
>   	}
> 
> @@ -1468,19 +1468,19 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>   			 div_u64(tmds_char_rate, 100) * 101);
>   	ret = clk_set_min_rate(vc4_hdmi->hsm_clock, hsm_rate);
>   	if (ret) {
> -		DRM_ERROR("Failed to set HSM clock rate: %d\n", ret);
> +		drm_err(drm, "Failed to set HSM clock rate: %d\n", ret);
>   		goto err_put_runtime_pm;
>   	}
> 
>   	ret = clk_set_rate(vc4_hdmi->pixel_clock, tmds_char_rate);
>   	if (ret) {
> -		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
> +		drm_err(drm, "Failed to set pixel clock rate: %d\n", ret);
>   		goto err_put_runtime_pm;
>   	}
> 
>   	ret = clk_prepare_enable(vc4_hdmi->pixel_clock);
>   	if (ret) {
> -		DRM_ERROR("Failed to turn on pixel clock: %d\n", ret);
> +		drm_err(drm, "Failed to turn on pixel clock: %d\n", ret);
>   		goto err_put_runtime_pm;
>   	}
> 
> @@ -1496,13 +1496,13 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
> 
>   	ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
>   	if (ret) {
> -		DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
> +		drm_err(drm, "Failed to set pixel bvb clock rate: %d\n", ret);
>   		goto err_disable_pixel_clock;
>   	}
> 
>   	ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
>   	if (ret) {
> -		DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
> +		drm_err(drm, "Failed to turn on pixel bvb clock: %d\n", ret);
>   		goto err_disable_pixel_clock;
>   	}
> 
> @@ -2951,13 +2951,13 @@ static int vc4_hdmi_init_resources(struct drm_device *drm,
>   	if (IS_ERR(vc4_hdmi->pixel_clock)) {
>   		ret = PTR_ERR(vc4_hdmi->pixel_clock);
>   		if (ret != -EPROBE_DEFER)
> -			DRM_ERROR("Failed to get pixel clock\n");
> +			drm_err(drm, "Failed to get pixel clock\n");
>   		return ret;
>   	}
> 
>   	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
>   	if (IS_ERR(vc4_hdmi->hsm_clock)) {
> -		DRM_ERROR("Failed to get HDMI state machine clock\n");
> +		drm_err(drm, "Failed to get HDMI state machine clock\n");
>   		return PTR_ERR(vc4_hdmi->hsm_clock);
>   	}
>   	vc4_hdmi->audio_clock = vc4_hdmi->hsm_clock;
> @@ -3041,31 +3041,31 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
> 
>   	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
>   	if (IS_ERR(vc4_hdmi->hsm_clock)) {
> -		DRM_ERROR("Failed to get HDMI state machine clock\n");
> +		drm_err(drm, "Failed to get HDMI state machine clock\n");
>   		return PTR_ERR(vc4_hdmi->hsm_clock);
>   	}
> 
>   	vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
>   	if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
> -		DRM_ERROR("Failed to get pixel bvb clock\n");
> +		drm_err(drm, "Failed to get pixel bvb clock\n");
>   		return PTR_ERR(vc4_hdmi->pixel_bvb_clock);
>   	}
> 
>   	vc4_hdmi->audio_clock = devm_clk_get(dev, "audio");
>   	if (IS_ERR(vc4_hdmi->audio_clock)) {
> -		DRM_ERROR("Failed to get audio clock\n");
> +		drm_err(drm, "Failed to get audio clock\n");
>   		return PTR_ERR(vc4_hdmi->audio_clock);
>   	}
> 
>   	vc4_hdmi->cec_clock = devm_clk_get(dev, "cec");
>   	if (IS_ERR(vc4_hdmi->cec_clock)) {
> -		DRM_ERROR("Failed to get CEC clock\n");
> +		drm_err(drm, "Failed to get CEC clock\n");
>   		return PTR_ERR(vc4_hdmi->cec_clock);
>   	}
> 
>   	vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
>   	if (IS_ERR(vc4_hdmi->reset)) {
> -		DRM_ERROR("Failed to get HDMI reset line\n");
> +		drm_err(drm, "Failed to get HDMI reset line\n");
>   		return PTR_ERR(vc4_hdmi->reset);
>   	}
> 
> @@ -3221,14 +3221,14 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
> 
>   	ddc_node = of_parse_phandle(dev->of_node, "ddc", 0);
>   	if (!ddc_node) {
> -		DRM_ERROR("Failed to find ddc node in device tree\n");
> +		drm_err(drm, "Failed to find ddc node in device tree\n");
>   		return -ENODEV;
>   	}
> 
>   	vc4_hdmi->ddc = of_find_i2c_adapter_by_node(ddc_node);
>   	of_node_put(ddc_node);
>   	if (!vc4_hdmi->ddc) {
> -		DRM_DEBUG("Failed to get ddc i2c adapter by node\n");
> +		drm_err(drm, "Failed to get ddc i2c adapter by node\n");
>   		return -EPROBE_DEFER;
>   	}
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 04af672caacb..2a835a5cff9d 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -191,8 +191,8 @@ static int vc4_hvs_upload_linear_kernel(struct vc4_hvs *hvs,
> 
>   	ret = drm_mm_insert_node(&hvs->dlist_mm, space, VC4_KERNEL_DWORDS);
>   	if (ret) {
> -		DRM_ERROR("Failed to allocate space for filter kernel: %d\n",
> -			  ret);
> +		drm_err(&hvs->vc4->base, "Failed to allocate space for filter kernel: %d\n",
> +			ret);
>   		return ret;
>   	}
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
> index 563b3dfeb9b9..ef93d8e22a35 100644
> --- a/drivers/gpu/drm/vc4/vc4_irq.c
> +++ b/drivers/gpu/drm/vc4/vc4_irq.c
> @@ -76,7 +76,7 @@ vc4_overflow_mem_work(struct work_struct *work)
> 
>   	bin_bo_slot = vc4_v3d_get_bin_slot(vc4);
>   	if (bin_bo_slot < 0) {
> -		DRM_ERROR("Couldn't allocate binner overflow mem\n");
> +		drm_err(&vc4->base, "Couldn't allocate binner overflow mem\n");
>   		goto complete;
>   	}
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
> index 04ac7805e6d5..6e566584afbf 100644
> --- a/drivers/gpu/drm/vc4/vc4_v3d.c
> +++ b/drivers/gpu/drm/vc4/vc4_v3d.c
> @@ -471,8 +471,8 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
>   		return ret;
> 
>   	if (V3D_READ(V3D_IDENT0) != V3D_EXPECTED_IDENT0) {
> -		DRM_ERROR("V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
> -			  V3D_READ(V3D_IDENT0), V3D_EXPECTED_IDENT0);
> +		drm_err(drm, "V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
> +			V3D_READ(V3D_IDENT0), V3D_EXPECTED_IDENT0);
>   		ret = -EINVAL;
>   		goto err_put_runtime_pm;
>   	}
> @@ -485,7 +485,7 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
> 
>   	ret = vc4_irq_install(drm, vc4->irq);
>   	if (ret) {
> -		DRM_ERROR("Failed to install IRQ handler\n");
> +		drm_err(drm, "Failed to install IRQ handler\n");
>   		goto err_put_runtime_pm;
>   	}
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
> index 7dff3ca5af6b..0c17284bf6f5 100644
> --- a/drivers/gpu/drm/vc4/vc4_validate.c
> +++ b/drivers/gpu/drm/vc4/vc4_validate.c
> @@ -65,7 +65,7 @@ utile_width(int cpp)
>   	case 8:
>   		return 2;
>   	default:
> -		DRM_ERROR("unknown cpp: %d\n", cpp);
> +		pr_err("unknown cpp: %d\n", cpp);
>   		return 1;
>   	}
>   }
> @@ -82,7 +82,7 @@ utile_height(int cpp)
>   	case 8:
>   		return 4;
>   	default:
> -		DRM_ERROR("unknown cpp: %d\n", cpp);
> +		pr_err("unknown cpp: %d\n", cpp);
>   		return 1;
>   	}
>   }
> @@ -390,8 +390,8 @@ validate_tile_binning_config(VALIDATE_ARGS)
>   	bin_slot = vc4_v3d_get_bin_slot(vc4);
>   	if (bin_slot < 0) {
>   		if (bin_slot != -EINTR && bin_slot != -ERESTARTSYS) {
> -			DRM_ERROR("Failed to allocate binner memory: %d\n",
> -				  bin_slot);
> +			drm_err(dev, "Failed to allocate binner memory: %d\n",
> +				bin_slot);
>   		}
>   		return bin_slot;
>   	}
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index 070813b8aff8..eb64e881051e 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -557,7 +557,7 @@ static void vc4_vec_encoder_disable(struct drm_encoder *encoder,
> 
>   	ret = pm_runtime_put(&vec->pdev->dev);
>   	if (ret < 0) {
> -		DRM_ERROR("Failed to release power domain: %d\n", ret);
> +		drm_err(drm, "Failed to release power domain: %d\n", ret);
>   		goto err_dev_exit;
>   	}
> 
> @@ -591,7 +591,7 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
> 
>   	ret = pm_runtime_resume_and_get(&vec->pdev->dev);
>   	if (ret < 0) {
> -		DRM_ERROR("Failed to retain power domain: %d\n", ret);
> +		drm_err(drm, "Failed to retain power domain: %d\n", ret);
>   		goto err_dev_exit;
>   	}
> 
> @@ -604,13 +604,13 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
>   	 */
>   	ret = clk_set_rate(vec->clock, 108000000);
>   	if (ret) {
> -		DRM_ERROR("Failed to set clock rate: %d\n", ret);
> +		drm_err(drm, "Failed to set clock rate: %d\n", ret);
>   		goto err_put_runtime_pm;
>   	}
> 
>   	ret = clk_prepare_enable(vec->clock);
>   	if (ret) {
> -		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
> +		drm_err(drm, "Failed to turn on core clock: %d\n", ret);
>   		goto err_put_runtime_pm;
>   	}
> 
> @@ -806,7 +806,7 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
>   	if (IS_ERR(vec->clock)) {
>   		ret = PTR_ERR(vec->clock);
>   		if (ret != -EPROBE_DEFER)
> -			DRM_ERROR("Failed to get clock: %d\n", ret);
> +			drm_err(drm, "Failed to get clock: %d\n", ret);
>   		return ret;
>   	}
> 
> --
> 2.34.1
> 
