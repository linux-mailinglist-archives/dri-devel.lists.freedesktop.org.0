Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EF9BA4CB8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 19:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D770E10E058;
	Fri, 26 Sep 2025 17:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jhjqEjtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372B510E058
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 17:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1758909538;
 bh=17pixrGRYhpbm+90PUEn9IYxObckq4ZG6ZstELZ1SOA=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=jhjqEjtPiBqQ8MQ0PpuCY0Mp3ucQ41U/4V6AqAjKjVQxD6XkUrAhENq56TmnUWfBF
 oN9V8Iz//nZYKZIK3P0v6Iq/KfMDBuoz22M5QfaLKkb5AUVuoVLSjJbdMrshS45rGm
 xZMEkmJsvJiqDezAlMhT7HrACK54BwU+HDVB4OqUCj9j2MuEWw+1Dm2evCduR38ERC
 xynAOu0V+XdLmLhEZCN6I+Nqfcoip+87ddSNYNnaLhK3Ux8zCZGNbTdxxbBQrBOvlM
 8AHFKC42ZJ7mqVfRJf1s7X8sba8VNgl2sY8MUXX0HB89uXVSAH21PKGW0enihVuJn3
 BdiBefEMlK8BA==
Received: from [192.168.1.90] (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D1A417E10F3;
 Fri, 26 Sep 2025 19:58:58 +0200 (CEST)
Message-ID: <ffc0a7b0-378f-4bdd-bd09-ec2c4b6b796d@collabora.com>
Date: Fri, 26 Sep 2025 20:58:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH 8/8] drm/rockchip: Implement "color format" DRM property
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com,
 andri@yngvason.is, sebastian.wick@redhat.com, mripard@kernel.org,
 daniel.stone@collabora.com, jani.nikula@linux.intel.com,
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com,
 christian.koenig@amd.com, derek.foreman@collabora.com
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-9-marius.vlad@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911130739.4936-9-marius.vlad@collabora.com>
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

On 2025/09/11, Marius Vlad wrote:
> From: Derek Foreman <derek.foreman@collabora.com>
>
> This adds YUV444 and Auto, which will fallback to RGB as per
> commit "drm: Pass supported color formats straight onto drm_bridge".
>
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 10 +++-
>  drivers/gpu/drm/rockchip/inno_hdmi.c          |  8 ++++
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c        |  8 ++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 46 +++++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h  |  2 +
>  5 files changed, 73 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 58e24669ef34..794b8de9c9c5 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -427,6 +427,11 @@ static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
>
> +static const u32 supported_colorformats =
> +       DRM_COLOR_FORMAT_AUTO |
> +       DRM_COLOR_FORMAT_RGB444 |
> +       DRM_COLOR_FORMAT_YCBCR444;
> +
>  static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  				    void *data)
>  {
> @@ -563,13 +568,16 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  		return ret;
>  	}
>
> -	connector = drm_bridge_connector_init(drm, encoder, BIT(HDMI_COLORSPACE_RGB));
> +	connector = drm_bridge_connector_init(drm, encoder, supported_colorformats);

The supported formats set to BIT(HDMI_COLORSPACE_RGB) initially as part
of drm_bridge_connector_init() and further moved out and passed as an
argument via "[PATCH 5/8] drm: Pass supported color formats straight
onto drm_bridge" is nothing but a default value to be used later on
drmm_connector_hdmi_init() invocation if the HDMI bridge in the display
pipeline (currently the framework allows only one bridge in a chain to
set DRM_BRIDGE_OP_HDMI) does not provide it's own supported_formats
before it gets attached to the encoder's chain.  Otherwise it will be
simply overridden:

    if (bridge->supported_formats)
        supported_formats = bridge->supported_formats;

This is precisely the case with [1] handling platform supported formats
and color depth in DW HDMI QP library.

>  	if (IS_ERR(connector)) {
>  		ret = PTR_ERR(connector);
>  		dev_err(hdmi->dev, "failed to init bridge connector: %d\n", ret);
>  		return ret;
>  	}
>
> +	if (!drm_mode_create_hdmi_color_format_property(connector, supported_colorformats))
> +		drm_connector_attach_color_format_property(connector);
> +
>  	return drm_connector_attach_encoder(connector, encoder);
>  }

[...]

> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 186f6452a7d3..5634e59a6412 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1543,6 +1543,50 @@ static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
>  				DITHER_DOWN_ALLEGRO);
>  }
>
> +static void vop2_bcsh_config(struct drm_crtc *crtc, struct vop2_video_port *vp)
> +{
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_connector *connector;
> +	u32 format = 0;
> +	enum drm_colorspace colorspace = 0;
> +	u32 val = 0;
> +
> +	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		if (!(crtc->state->connector_mask & drm_connector_mask(connector)))
> +			continue;
> +
> +		format = connector->state->color_format;
> +		colorspace = connector->state->colorspace;
> +		break;
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	if (format == DRM_COLOR_FORMAT_YCBCR420 ||
> +	    format == DRM_COLOR_FORMAT_YCBCR444 ||
> +	    format == DRM_COLOR_FORMAT_YCBCR422) {
> +		val = RK3568_VP_BCSH_CTRL__BCSH_R2Y_EN | BIT(7);
> +
> +		switch (colorspace) {
> +		case DRM_MODE_COLORIMETRY_BT2020_RGB:
> +		case DRM_MODE_COLORIMETRY_BT2020_YCC:
> +			val |= BIT(7) | BIT(6);
> +			break;
> +		case DRM_MODE_COLORIMETRY_BT709_YCC:
> +			val |= BIT(6);
> +			break;
> +		default:
> +			break;
> +		}
> +		if (colorspace == DRM_MODE_COLORIMETRY_BT2020_RGB ||
> +		    colorspace == DRM_MODE_COLORIMETRY_BT2020_YCC)

While working on YUV420 output format support [2] I noticed VOP2 relies
on v4l2_colorspace instead of drm_colorspace, presumably that's just a
downstream inheritance.  Moreover, it also defines a custom
vop_csc_format and provides the vop2_convert_csc_mode() helper to translate
the V4L2_COLORSPACE_* entries into the internal CSC_* representation, as
required for the actual HW programming.

I implemented the rockchip_drm_colorimetry_to_v4l_colorspace() utility
in [3] to convert drm_colorspace to v4l2_colorspace as a temporary
workaround to pass conn_state->colorspace via
dw_hdmi_qp_rockchip_encoder_atomic_check() in [2].

I think we should try first to clean this up before adding even more
colorspace related mess, i.e. if possible get rid of v4l2_colorspace and
rely exclusively on drm_colorspace while providing a conversion helper
to the internal vop_csc_format.

Alternatively, we could keep the rockchip changes in this series to the
bare minimum (i.e. RGB-only) and handle YUV separately, to avoid adding
here unnecessary and/or unrelated complexity.  It's worth noting the 
indicated YUV420 related work has been done on top of the high color 
depth support series [1] for the required platform support, while in 
turn it conflicts with the HDMI CEC series [4], hence added as a 
dependency.

[1] https://lore.kernel.org/all/20250825-rk3588-10bpc-v2-2-955622d16985@collabora.com/
[2] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/6d78f42a5b88cf83cff771f7cccc44c8d67b9695
[3] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commit/9ce7c0c95ce024ee5799a3e5f776c98609683090
[4] https://lore.kernel.org/all/20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com/
