Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E2383A69
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 18:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56C76E9EF;
	Mon, 17 May 2021 16:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A206E9EF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 16:48:22 +0000 (UTC)
Date: Mon, 17 May 2021 17:48:09 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] drm: xlnx: add is_layer_vid() to simplify the code
To: quanyang.wang@windriver.com
Message-Id: <90G9TQ.H0YO8VGDCBTU@crapouillou.net>
In-Reply-To: <20210513114540.1241122-2-quanyang.wang@windriver.com>
References: <20210513114540.1241122-1-quanyang.wang@windriver.com>
 <20210513114540.1241122-2-quanyang.wang@windriver.com>
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

Hi Quanyang,

Le jeu., mai 13 2021 at 19:45:39 +0800, quanyang.wang@windriver.com a=20
=E9crit :
> From: Quanyang Wang <quanyang.wang@windriver.com>
>=20
> Add a new function is_layer_vid() to simplify the code that
> judges if a layer is the video layer.
>=20
> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 39=20
> +++++++++++++++++-------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c=20
> b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 109d627968ac..c55e24412f8c 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -434,30 +434,35 @@ static void zynqmp_disp_avbuf_write(struct=20
> zynqmp_disp_avbuf *avbuf,
>  	writel(val, avbuf->base + reg);
>  }
>=20
> +static bool is_layer_vid(struct zynqmp_disp_layer *layer)

'layer' should be const.

> +{
> +	return (layer->id =3D=3D ZYNQMP_DISP_LAYER_VID) ? true : false;

return layer->id =3D=3D ZYNQMP_DISP_LAYER_VID;

The rest looks good.

With these fixed:
Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> +}
> +
>  /**
>   * zynqmp_disp_avbuf_set_format - Set the input format for a layer
>   * @avbuf: Audio/video buffer manager
> - * @layer: The layer ID
> + * @layer: The layer
>   * @fmt: The format information
>   *
>   * Set the video buffer manager format for @layer to @fmt.
>   */
>  static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp_avbuf=20
> *avbuf,
> -					 enum zynqmp_disp_layer_id layer,
> +					 struct zynqmp_disp_layer *layer,
>  					 const struct zynqmp_disp_format *fmt)
>  {
>  	unsigned int i;
>  	u32 val;
>=20
>  	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_FMT);
> -	val &=3D layer =3D=3D ZYNQMP_DISP_LAYER_VID
> +	val &=3D is_layer_vid(layer)
>  	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
>  	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
>  	val |=3D fmt->buf_fmt;
>  	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_FMT, val);
>=20
>  	for (i =3D 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
> -		unsigned int reg =3D layer =3D=3D ZYNQMP_DISP_LAYER_VID
> +		unsigned int reg =3D is_layer_vid(layer)
>  				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
>  				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
>=20
> @@ -573,19 +578,19 @@ static void=20
> zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
>  /**
>   * zynqmp_disp_avbuf_enable_video - Enable a video layer
>   * @avbuf: Audio/video buffer manager
> - * @layer: The layer ID
> + * @layer: The layer
>   * @mode: Operating mode of layer
>   *
>   * Enable the video/graphics buffer for @layer.
>   */
>  static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf=20
> *avbuf,
> -					   enum zynqmp_disp_layer_id layer,
> +					   struct zynqmp_disp_layer *layer,
>  					   enum zynqmp_disp_layer_mode mode)
>  {
>  	u32 val;
>=20
>  	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> -	if (layer =3D=3D ZYNQMP_DISP_LAYER_VID) {
> +	if (is_layer_vid(layer)) {
>  		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>  		if (mode =3D=3D ZYNQMP_DISP_LAYER_NONLIVE)
>  			val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
> @@ -605,17 +610,17 @@ static void=20
> zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
>  /**
>   * zynqmp_disp_avbuf_disable_video - Disable a video layer
>   * @avbuf: Audio/video buffer manager
> - * @layer: The layer ID
> + * @layer: The layer
>   *
>   * Disable the video/graphics buffer for @layer.
>   */
>  static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf=20
> *avbuf,
> -					    enum zynqmp_disp_layer_id layer)
> +					    struct zynqmp_disp_layer *layer)
>  {
>  	u32 val;
>=20
>  	val =3D zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
> -	if (layer =3D=3D ZYNQMP_DISP_LAYER_VID) {
> +	if (is_layer_vid(layer)) {
>  		val &=3D ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>  		val |=3D ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
>  	} else {
> @@ -807,7 +812,7 @@ static void=20
> zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
>  		}
>  	}
>=20
> -	if (layer->id =3D=3D ZYNQMP_DISP_LAYER_VID)
> +	if (is_layer_vid(layer))
>  		reg =3D ZYNQMP_DISP_V_BLEND_IN1CSC_COEFF(0);
>  	else
>  		reg =3D ZYNQMP_DISP_V_BLEND_IN2CSC_COEFF(0);
> @@ -818,7 +823,7 @@ static void=20
> zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
>  		zynqmp_disp_blend_write(blend, reg + 8, coeffs[i + swap[2]]);
>  	}
>=20
> -	if (layer->id =3D=3D ZYNQMP_DISP_LAYER_VID)
> +	if (is_layer_vid(layer))
>  		reg =3D ZYNQMP_DISP_V_BLEND_IN1CSC_OFFSET(0);
>  	else
>  		reg =3D ZYNQMP_DISP_V_BLEND_IN2CSC_OFFSET(0);
> @@ -1025,7 +1030,7 @@ zynqmp_disp_layer_find_format(struct=20
> zynqmp_disp_layer *layer,
>   */
>  static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
>  {
> -	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer->id,
> +	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
>  				       ZYNQMP_DISP_LAYER_NONLIVE);
>  	zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
>=20
> @@ -1046,7 +1051,7 @@ static void zynqmp_disp_layer_disable(struct=20
> zynqmp_disp_layer *layer)
>  	for (i =3D 0; i < layer->drm_fmt->num_planes; i++)
>  		dmaengine_terminate_sync(layer->dmas[i].chan);
>=20
> -	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer->id);
> +	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
>  	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
>  }
>=20
> @@ -1067,7 +1072,7 @@ static void zynqmp_disp_layer_set_format(struct=20
> zynqmp_disp_layer *layer,
>  	layer->disp_fmt =3D zynqmp_disp_layer_find_format(layer,=20
> info->format);
>  	layer->drm_fmt =3D info;
>=20
> -	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer->id,
> +	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer,
>  				     layer->disp_fmt);
>=20
>  	/*
> @@ -1244,8 +1249,8 @@ static int zynqmp_disp_create_planes(struct=20
> zynqmp_disp *disp)
>  			drm_formats[j] =3D layer->info->formats[j].drm_fmt;
>=20
>  		/* Graphics layer is primary, and video layer is overlay. */
> -		type =3D i =3D=3D ZYNQMP_DISP_LAYER_GFX
> -		     ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
> +		type =3D is_layer_vid(layer)
> +		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
>  		ret =3D drm_universal_plane_init(disp->drm, &layer->plane, 0,
>  					       &zynqmp_disp_plane_funcs,
>  					       drm_formats,


