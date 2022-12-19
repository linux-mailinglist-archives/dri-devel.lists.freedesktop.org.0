Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6231651504
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 22:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CEB10E077;
	Mon, 19 Dec 2022 21:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AF410E045
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 21:37:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FB56825;
 Mon, 19 Dec 2022 22:37:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671485852;
 bh=u+B9570Rpp6TN+Rdv1uEDa/bkGvDMyqBdhLUNIZC0H4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K/kxZqtn59ZsTyRSl6G2ZnyaD7n8rH+e/BL4w/bFU3yQsRXDYkuafhGgdZJfFx2yC
 WIUYjR2N7VhanaYz52RNYkv0t7ipdPUDQ5dbXTyRj6gfRQJCHmfqGm5nA3efQxPY7T
 y6BOllAeITuVgRpAnR5vTYB7AGbQU4hQB4MZ/+rQ=
Date: Mon, 19 Dec 2022 23:37:28 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 5/7] media: renesas: vsp1: Add new formats (2-10-10-10
 ARGB, Y210)
Message-ID: <Y6DZmBxW4Wr7Wssw@pendragon.ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-6-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221219140139.294245-6-tomi.valkeinen+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Mon, Dec 19, 2022 at 04:01:37PM +0200, Tomi Valkeinen wrote:
> Add new pixel formats: XBGR2101010, ABGR2101010, BGRA1010102 and Y210.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   | 15 ++++++
>  .../media/platform/renesas/vsp1/vsp1_regs.h   | 22 +++++++++
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    | 49 +++++++++++++++++++
>  3 files changed, 86 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index f72ac01c21ea..2867b3de06fa 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -146,6 +146,18 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
>  	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>  	  1, { 32, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_XBGR2101010, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
> +	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_ABGR2101010, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
> +	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_BGRA1010102, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
> +	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 1, 1, false },
>  	{ V4L2_PIX_FMT_UYVY, MEDIA_BUS_FMT_AYUV8_1X32,
>  	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> @@ -202,6 +214,9 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
>  	  VI6_FMT_Y_U_V_444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>  	  3, { 8, 8, 8 }, false, true, 1, 1, false },
> +	{ V4L2_PIX_FMT_Y210, MEDIA_BUS_FMT_AYUV8_1X32,
> +	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 2, 1, false },
>  };
>  
>  /**
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> index c61e8dafeecf..8947ea05f95e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -228,6 +228,27 @@
>  #define VI6_RPF_MULT_ALPHA_RATIO_MASK	(0xff << 0)
>  #define VI6_RPF_MULT_ALPHA_RATIO_SHIFT	0
>  
> +#define VI6_RPF_EXT_INFMT0		0x0370
> +#define VI6_RPF_EXT_INFMT0_F2B_LSB		(0 << 12)
> +#define VI6_RPF_EXT_INFMT0_F2B_MSB		(1 << 12)

We don't normally define two macros for each bit. You can drop the
F2B_LSB macro, rename F2B_MSB to F2B, and use BIT(12).

> +#define VI6_RPF_EXT_INFMT0_IPBD_Y_8		(0 << 8)
> +#define VI6_RPF_EXT_INFMT0_IPBD_Y_10		(1 << 8)
> +#define VI6_RPF_EXT_INFMT0_IPBD_Y_12		(2 << 8)
> +#define VI6_RPF_EXT_INFMT0_IPBD_C_8		(0 << 4)
> +#define VI6_RPF_EXT_INFMT0_IPBD_C_10		(1 << 4)
> +#define VI6_RPF_EXT_INFMT0_IPBD_C_12		(2 << 4)
> +#define VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10	(3 << 0)
> +#define VI6_RPF_EXT_INFMT0_BYPP_M1_N_RGB10	(0 << 0)

I would drop the last one as you don't use it.

> +
> +#define VI6_RPF_EXT_INFMT1		0x0374
> +#define VI6_RPF_EXT_INFMT2		0x0378
> +
> +#define VI6_RPF_BRDITH_CTRL		0x03e0
> +#define VI6_RPF_BRDITH_CTRL_ODE_EN	(1 << 8)
> +#define VI6_RPF_BRDITH_CTRL_ODE_DIS	(0 << 8)
> +#define VI6_RPF_BRDITH_CTRL_CBRM_RO	(1 << 0)
> +#define VI6_RPF_BRDITH_CTRL_CBRM_TR	(0 << 0)

Same here, one macro per bit.

The BRDITH_CTRL registers doesn't seem to be used. I don't mind adding
it though.

> +
>  /* -----------------------------------------------------------------------------
>   * WPF Control Registers
>   */
> @@ -846,6 +867,7 @@
>  #define VI6_FMT_XBXGXR_262626		0x21
>  #define VI6_FMT_ABGR_8888		0x22
>  #define VI6_FMT_XXRGB_88565		0x23
> +#define VI6_FMT_RGB10_RGB10A2_A2RGB10	0x30
>  
>  #define VI6_FMT_Y_UV_444		0x40
>  #define VI6_FMT_Y_UV_422		0x41
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 045aa54f7998..60ba3c62e86c 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -55,6 +55,11 @@ static const struct v4l2_subdev_ops rpf_ops = {
>   * VSP1 Entity Operations
>   */
>  
> +#define PACK_CPOS(a, b, c, d) \
> +	(((a) << 24) | ((b) << 16) | ((c) << 8) | ((d) << 0))
> +#define PACK_CLEN(a, b, c, d) \
> +	(((a) << 24) | ((b) << 16) | ((c) << 8) | ((d) << 0))
> +

Please move this to vsp1_regs.h, just below the corresponding registers.
I would also prefer giving the macros names that related to the
registers.

>  static void rpf_configure_stream(struct vsp1_entity *entity,
>  				 struct vsp1_pipeline *pipe,
>  				 struct vsp1_dl_list *dl,
> @@ -109,6 +114,50 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
>  
> +	if ((entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) == VI6_IP_VERSION_MODEL_VSPD_GEN4) {

Please wrap this as

	if ((entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
	    VI6_IP_VERSION_MODEL_VSPD_GEN4) {

You could also test entity->vsp1->gen == 4, up to you.

> +		u32 ext_infmt0;
> +		u32 ext_infmt1;
> +		u32 ext_infmt2;
> +
> +		switch (fmtinfo->fourcc) {
> +		case V4L2_PIX_FMT_XBGR2101010:
> +			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +			ext_infmt1 = PACK_CPOS(0, 10, 20, 0);
> +			ext_infmt2 = PACK_CLEN(10, 10, 10, 0);

While this matches the detailed bit order of the V4L2 format as defined
in patch 1/7, it doesn't match the XBGR2101010 name, at least if
interpreted the same way as DRM_FORMAT_XBGR2101010. I think this should
be DRM_FORMAT_RGBX1010102 instead.

Same for the nex two formats, they should be RGBA1010102 and
ARGB2101010.

> +			break;
> +
> +		case V4L2_PIX_FMT_ABGR2101010:
> +			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +			ext_infmt1 = PACK_CPOS(0, 10, 20, 30);
> +			ext_infmt2 = PACK_CLEN(10, 10, 10, 2);
> +			break;
> +
> +		case V4L2_PIX_FMT_BGRA1010102:
> +			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +			ext_infmt1 = PACK_CPOS(2, 12, 22, 0);
> +			ext_infmt2 = PACK_CLEN(10, 10, 10, 2);
> +			break;
> +
> +		case V4L2_PIX_FMT_Y210:
> +			ext_infmt0 = VI6_RPF_EXT_INFMT0_F2B_MSB |
> +				     VI6_RPF_EXT_INFMT0_IPBD_Y_10 |
> +				     VI6_RPF_EXT_INFMT0_IPBD_C_10;
> +			ext_infmt1 = 0x0;
> +			ext_infmt2 = 0x0;
> +			break;
> +
> +		default:
> +			ext_infmt0 = 0;
> +			ext_infmt1 = 0;
> +			ext_infmt2 = 0;
> +			break;
> +		}
> +
> +		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT0, ext_infmt0);
> +		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT1, ext_infmt1);
> +		vsp1_rpf_write(rpf, dlb, VI6_RPF_EXT_INFMT2, ext_infmt2);
> +	}
> +
>  	/* Output location. */
>  	if (pipe->brx) {
>  		const struct v4l2_rect *compose;

-- 
Regards,

Laurent Pinchart
