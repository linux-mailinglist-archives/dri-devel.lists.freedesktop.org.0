Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91804388CA8
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A496ED20;
	Wed, 19 May 2021 11:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3506B6ED20
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 11:22:57 +0000 (UTC)
Date: Wed, 19 May 2021 12:22:42 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [V2][PATCH 2/2] drm: xlnx: consolidate the functions which
 programming AUDIO_VIDEO_SELECT register
To: quanyang.wang@windriver.com
Message-Id: <U9QCTQ.DGFR9WN49KYH@crapouillou.net>
In-Reply-To: <20210518095019.3855369-3-quanyang.wang@windriver.com>
References: <20210518095019.3855369-1-quanyang.wang@windriver.com>
 <20210518095019.3855369-3-quanyang.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mar., mai 18 2021 at 17:50:19 +0800, quanyang.wang@windriver.com a=20
=E9crit :
> From: Quanyang Wang <quanyang.wang@windriver.com>
>=20
> For now, the functions zynqmp_disp_avbuf_enable/disable_audio and
> zynqmp_disp_avbuf_enable/disable_video are all programming the=20
> register
> AV_BUF_OUTPUT_AUDIO_VIDEO_SELECT to select the output for audio or=20
> video.
> And in the future, many drm properties (like video_tpg, audio_tpg,
> audio_pl, etc) also need to access it. So let's introduce some=20
> variables
> of enum type and consolidate the code to unify handling this.
>=20
> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c      | 168=20
> ++++++++++++++----------
>  drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |  23 +---
>  2 files changed, 106 insertions(+), 85 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c=20
> b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index eefb278e24c6..3672d2f5665b 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -102,12 +102,39 @@ enum zynqmp_disp_layer_id {
>=20
>  /**
>   * enum zynqmp_disp_layer_mode - Layer mode
> - * @ZYNQMP_DISP_LAYER_NONLIVE: non-live (memory) mode
> + * @ZYNQMP_DISP_LAYER_MEM: memory mode
>   * @ZYNQMP_DISP_LAYER_LIVE: live (stream) mode
> + * @ZYNQMP_DISP_LAYER_TPG: tpg mode (only for video layer)
> + * @ZYNQMP_DISP_LAYER_DISABLE: disable mode
>   */
>  enum zynqmp_disp_layer_mode {
> -	ZYNQMP_DISP_LAYER_NONLIVE,
> -	ZYNQMP_DISP_LAYER_LIVE
> +	ZYNQMP_DISP_LAYER_MEM,
> +	ZYNQMP_DISP_LAYER_LIVE,
> +	ZYNQMP_DISP_LAYER_TPG,
> +	ZYNQMP_DISP_LAYER_DISABLE
> +};
> +
> +enum avbuf_vid_mode {
> +	VID_MODE_LIVE,
> +	VID_MODE_MEM,
> +	VID_MODE_TPG,
> +	VID_MODE_NONE
> +};
> +
> +enum avbuf_gfx_mode {
> +	GFX_MODE_DISABLE,
> +	GFX_MODE_MEM,
> +	GFX_MODE_LIVE,
> +	GFX_MODE_NONE
> +};
> +
> +enum avbuf_aud_mode {
> +	AUD1_MODE_LIVE,
> +	AUD1_MODE_MEM,
> +	AUD1_MODE_TPG,
> +	AUD1_MODE_DISABLE,
> +	AUD2_MODE_DISABLE,
> +	AUD2_MODE_ENABLE
>  };
>=20
>  /**
> @@ -542,92 +569,102 @@ static void=20
> zynqmp_disp_avbuf_disable_channels(struct zynqmp_disp_avbuf *avbuf)
>  }
>=20
>  /**
> - * zynqmp_disp_avbuf_enable_audio - Enable audio
> + * zynqmp_disp_avbuf_output_select - Select the buffer manager=20
> outputs
>   * @avbuf: Audio/video buffer manager
> + * @layer: The layer
> + * @mode: The mode for this layer
>   *
> - * Enable all audio buffers with a non-live (memory) source.
> + * Select the buffer manager outputs for @layer.
>   */
> -static void zynqmp_disp_avbuf_enable_audio(struct zynqmp_disp_avbuf=20
> *avbuf)
> +static void zynqmp_disp_avbuf_output_select(struct zynqmp_disp_avbuf=20
> *avbuf,
> +					   struct zynqmp_disp_layer *layer,
> +					   u32 mode)
>  {
> -	u32 val;
> +	u32 reg;
>=20
> -	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> -	val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
> -	val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM;
> -	val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
> -	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
> +	reg =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> +
> +	/* Select audio mode when the layer is NULL */
> +	if (layer =3D=3D NULL) {
> +		if (mode >=3D AUD2_MODE_DISABLE) {
> +			reg &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK;
> +			reg |=3D FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK,
> +					(mode - AUD2_MODE_DISABLE));
> +		} else {
> +			reg &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
> +			reg |=3D FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK, mode);
> +		}
> +	} else if (is_layer_vid(layer)) {
> +		reg &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
> +		reg |=3D FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK, mode);
> +	} else {
> +		reg &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
> +		reg |=3D FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK, mode);
> +	}
> +
> +	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, reg);
>  }
>=20
>  /**
> - * zynqmp_disp_avbuf_disable_audio - Disable audio
> + * zynqmp_disp_avbuf_enable_audio - Enable audio
>   * @avbuf: Audio/video buffer manager
>   *
> - * Disable all audio buffers.
> + * Enable all audio buffers.
>   */
> -static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf=20
> *avbuf)
> +static void zynqmp_disp_avbuf_enable_audio(struct zynqmp_disp_avbuf=20
> *avbuf)
>  {
> -	u32 val;
> -
> -	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> -	val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
> -	val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE;
> -	val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
> -	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
> +	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD1_MODE_MEM);
> +	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD2_MODE_ENABLE);
>  }
>=20
>  /**
> - * zynqmp_disp_avbuf_enable_video - Enable a video layer
> + * zynqmp_disp_avbuf_disable_audio - Disable audio
>   * @avbuf: Audio/video buffer manager
> - * @layer: The layer
> - * @mode: Operating mode of layer
>   *
> - * Enable the video/graphics buffer for @layer.
> + * Disable all audio buffers.
>   */
> -static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf=20
> *avbuf,
> -					   struct zynqmp_disp_layer *layer,
> -					   enum zynqmp_disp_layer_mode mode)
> +static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf=20
> *avbuf)
>  {
> -	u32 val;
> -
> -	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> -	if (is_layer_vid(layer)) {
> -		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
> -		if (mode =3D=3D ZYNQMP_DISP_LAYER_NONLIVE)
> -			val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
> -		else
> -			val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE;
> -	} else {
> -		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
> -		val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
> -		if (mode =3D=3D ZYNQMP_DISP_LAYER_NONLIVE)
> -			val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
> -		else
> -			val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE;
> -	}
> -	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
> +	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD1_MODE_DISABLE);
> +	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD2_MODE_DISABLE);
>  }
>=20
>  /**
> - * zynqmp_disp_avbuf_disable_video - Disable a video layer
> - * @avbuf: Audio/video buffer manager
> + * zynqmp_disp_avbuf_set_layer_output - Set layer output
>   * @layer: The layer
> + * @mode: The layer mode
>   *
> - * Disable the video/graphics buffer for @layer.
> + * Set output for @layer
>   */
> -static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf=20
> *avbuf,
> -					    struct zynqmp_disp_layer *layer)
> +static void zynqmp_disp_avbuf_set_layer_output(struct=20
> zynqmp_disp_layer *layer,
> +					   enum zynqmp_disp_layer_mode mode)
>  {
> -	u32 val;
> -
> -	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> -	if (is_layer_vid(layer)) {
> -		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
> -		val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
> -	} else {
> -		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
> -		val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE;
> +	struct zynqmp_disp *disp =3D layer->disp;
> +	int val;
> +
> +	switch (mode) {
> +	case ZYNQMP_DISP_LAYER_LIVE:
> +		val =3D is_layer_vid(layer) ? VID_MODE_LIVE : GFX_MODE_LIVE;
> +		break;
> +	case ZYNQMP_DISP_LAYER_MEM:
> +		val =3D is_layer_vid(layer) ? VID_MODE_MEM : GFX_MODE_MEM;
> +		break;
> +	case ZYNQMP_DISP_LAYER_TPG:
> +		if (!is_layer_vid(layer)) {
> +			dev_err(disp->dev, "gfx layer has no tpg mode\n");
> +			return;
> +		}
> +		val =3D VID_MODE_TPG;
> +		break;
> +	case ZYNQMP_DISP_LAYER_DISABLE:
> +		val =3D is_layer_vid(layer) ? VID_MODE_NONE : GFX_MODE_DISABLE;
> +		break;
> +	default:
> +		dev_err(disp->dev, "invalid layer mode\n");
> +		return;
>  	}
> -	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
> +
> +	zynqmp_disp_avbuf_output_select(&disp->avbuf, layer, val);
>  }
>=20
>  /**
> @@ -1030,11 +1067,10 @@ zynqmp_disp_layer_find_format(struct=20
> zynqmp_disp_layer *layer,
>   */
>  static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
>  {
> -	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
> -				       ZYNQMP_DISP_LAYER_NONLIVE);
> +	zynqmp_disp_avbuf_set_layer_output(layer, ZYNQMP_DISP_LAYER_MEM);
>  	zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
>=20
> -	layer->mode =3D ZYNQMP_DISP_LAYER_NONLIVE;
> +	layer->mode =3D ZYNQMP_DISP_LAYER_MEM;
>  }
>=20
>  /**
> @@ -1051,7 +1087,7 @@ static void zynqmp_disp_layer_disable(struct=20
> zynqmp_disp_layer *layer)
>  	for (i =3D 0; i < layer->drm_fmt->num_planes; i++)
>  		dmaengine_terminate_sync(layer->dmas[i].chan);
>=20
> -	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
> +	zynqmp_disp_avbuf_set_layer_output(layer,=20
> ZYNQMP_DISP_LAYER_DISABLE);
>  	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
>  }
>=20
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h=20
> b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> index f92a006d5070..4316e324102d 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
> @@ -118,25 +118,10 @@
>  #define ZYNQMP_DISP_AV_BUF_STC_SNAPSHOT0		0x60
>  #define ZYNQMP_DISP_AV_BUF_STC_SNAPSHOT1		0x64
>  #define ZYNQMP_DISP_AV_BUF_OUTPUT			0x70
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_SHIFT		0
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK		(0x3 << 0)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE		(0 << 0)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM		(1 << 0)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_PATTERN		(2 << 0)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE		(3 << 0)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_SHIFT		2
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK		(0x3 << 2)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE		(0 << 2)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM		(1 << 2)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE		(2 << 2)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_NONE		(3 << 2)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_SHIFT		4
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK		(0x3 << 4)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PL		(0 << 4)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM		(1 << 4)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PATTERN		(2 << 4)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE		(3 << 4)
> -#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN		BIT(6)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK		GENMASK(1, 0)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK		GENMASK(3, 2)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK		GENMASK(5, 4)
> +#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK		BIT(6)
>  #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT0		0x74
>  #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT1		0x78
>  #define ZYNQMP_DISP_AV_BUF_PATTERN_GEN_SELECT		0x100
> --
> 2.25.1
>=20


