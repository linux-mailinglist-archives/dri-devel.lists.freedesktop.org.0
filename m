Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DCC895E72
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 23:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6E410F33F;
	Tue,  2 Apr 2024 21:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A8E10FDE6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 21:09:33 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1579C202FC;
 Tue,  2 Apr 2024 23:09:31 +0200 (CEST)
Date: Tue, 2 Apr 2024 23:09:29 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] drm/mipi-dsi: add mipi_dsi_compression_mode_ext()
Message-ID: <dgvztw55cr4wsbfxhf4ondzhaetodfcv4pndfug73suae5vp3v@4ozlmmsemfbm>
References: <20240402-lg-sw43408-panel-v3-0-144f17a11a56@linaro.org>
 <20240402-lg-sw43408-panel-v3-3-144f17a11a56@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402-lg-sw43408-panel-v3-3-144f17a11a56@linaro.org>
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

On 2024-04-02 02:51:14, Dmitry Baryshkov wrote:
> Add the extended version of mipi_dsi_compression_mode(). It provides
> a way to specify the algorithm and PPS selector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 33 +++++++++++++++++++++++++++------
>  include/drm/drm_mipi_dsi.h     |  9 +++++++++
>  2 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 9874ff6d4718..0ecbc811eb7a 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -645,19 +645,24 @@ int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
>  EXPORT_SYMBOL(mipi_dsi_set_maximum_return_packet_size);
>  
>  /**
> - * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
> + * mipi_dsi_compression_mode_ext() - enable/disable DSC on the peripheral
>   * @dsi: DSI peripheral device
>   * @enable: Whether to enable or disable the DSC
> + * @algo: Selected algorithm
> + * @pps_selector: The PPS selector

Not a big fan of paraphrasing the parameter name, it adds no value.  How about
describing what this parameter means and what it does?:

	PPS table index to use.  Corresponds to a table pre-programmed on the peripheral
	or a table programmed with &drm_dsc_picture_parameter_set.pps_identifier.

(That should be a valid kernel-doc cross-reference to the field)

>   *
> - * Enable or disable Display Stream Compression on the peripheral using the
> - * default Picture Parameter Set and VESA DSC 1.1 algorithm.
> + * Enable or disable Display Stream Compression on the peripheral.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> +int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
> +				  enum mipi_dsi_compression_algo algo,
> +				  unsigned int pps_selector)
>  {
> -	/* Note: Needs updating for non-default PPS or algorithm */
> -	u8 tx[2] = { enable << 0, 0 };
> +	u8 data = (enable << 0) |
> +		(algo << 1) |
> +		(pps_selector << 4);

Do we need some size validation (if > 3 return -EINVAL)?  FIELD_PREP() might be
too heavy though.

> +	u8 tx[2] = { data, 0 };
>  	struct mipi_dsi_msg msg = {
>  		.channel = dsi->channel,
>  		.type = MIPI_DSI_COMPRESSION_MODE,
> @@ -668,6 +673,22 @@ int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
>  
>  	return (ret < 0) ? ret : 0;
>  }
> +EXPORT_SYMBOL(mipi_dsi_compression_mode_ext);
> +
> +/**
> + * mipi_dsi_compression_mode() - enable/disable DSC on the peripheral
> + * @dsi: DSI peripheral device
> + * @enable: Whether to enable or disable the DSC
> + *
> + * Enable or disable Display Stream Compression on the peripheral using the
> + * default Picture Parameter Set and VESA DSC 1.1 algorithm.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable)
> +{
> +	return mipi_dsi_compression_mode_ext(dsi, enable, 0, MIPI_DSI_COMPRESSION_DSC);

I hope the compiler complains here that it should be MIPI_DSI_COMPRESSION_DSC,0

(Enum algo first, int pps_selector last)

> +}
>  EXPORT_SYMBOL(mipi_dsi_compression_mode);
>  
>  /**
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 3011d33eccbd..78cb7b688b1d 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -226,6 +226,12 @@ static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format fmt)
>  	return -EINVAL;
>  }
>  
> +enum mipi_dsi_compression_algo {
> +	MIPI_DSI_COMPRESSION_DSC = 0,

Add 1.1?  Or does it also allow 1.2 (when the version is also set via PPS)?

> +	MIPI_DSI_COMPRESSION_VENDOR = 3,
> +	/* other two values are reserved, DSI 1.3 */
> +};
> +
>  struct mipi_dsi_device *
>  mipi_dsi_device_register_full(struct mipi_dsi_host *host,
>  			      const struct mipi_dsi_device_info *info);
> @@ -242,6 +248,9 @@ int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
>  int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
>  					    u16 value);
>  int mipi_dsi_compression_mode(struct mipi_dsi_device *dsi, bool enable);
> +int mipi_dsi_compression_mode_ext(struct mipi_dsi_device *dsi, bool enable,
> +				  unsigned int pps_selector,
> +				  enum mipi_dsi_compression_algo algo);

Oh, this declaration is inverse from the definition...

- Marijn

>  int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
>  				   const struct drm_dsc_picture_parameter_set *pps);
>  
> 
> -- 
> 2.39.2
> 
