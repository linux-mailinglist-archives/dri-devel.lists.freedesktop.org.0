Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADC56563A5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 15:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A340510E115;
	Mon, 26 Dec 2022 14:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B9A10E115
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 14:52:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B215174C;
 Mon, 26 Dec 2022 15:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1672066337;
 bh=YizK+oV+C4UhInfD48iLOipmBuKOXwKapqSTIP152XM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=irKCd/TxlSZIgdh5ZR73dcgC2BTvvV+ZMi5OBYpvYwAeLM84VCrKSxva8upEJolGh
 ym6JiptJuSQEMxYrkNmbA7Mh/y0a4uqEN+hwZkqpMSh212ipuYf/aBmS4GymIagIMb
 nfdW5L74fttTTaQOAfF1WrvUpEfEvye6WvPBxQ5s=
Date: Mon, 26 Dec 2022 16:52:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 5/7] media: renesas: vsp1: Add new formats (2-10-10-10
 ARGB, Y210, Y212)
Message-ID: <Y6m1Hm1G2snkkpeA@pendragon.ideasonboard.com>
References: <20221221092448.741294-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221221092448.741294-6-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221221092448.741294-6-tomi.valkeinen+renesas@ideasonboard.com>
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

On Wed, Dec 21, 2022 at 11:24:46AM +0200, Tomi Valkeinen wrote:
> Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010, Y210 and
> Y212.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   | 18 +++++++
>  .../media/platform/renesas/vsp1/vsp1_regs.h   | 23 ++++++++
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    | 52 +++++++++++++++++++
>  3 files changed, 93 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index f72ac01c21ea..f8093ba9539e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -146,6 +146,18 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
>  	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>  	  1, { 32, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_RGBX1010102, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
> +	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_RGBA1010102, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
> +	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 1, 1, false },
> +	{ V4L2_PIX_FMT_ARGB2101010, MEDIA_BUS_FMT_ARGB8888_1X32,
> +	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
> +	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 1, 1, false },
>  	{ V4L2_PIX_FMT_UYVY, MEDIA_BUS_FMT_AYUV8_1X32,
>  	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
> @@ -202,6 +214,12 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
>  	  VI6_FMT_Y_U_V_444, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
>  	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
>  	  3, { 8, 8, 8 }, false, true, 1, 1, false },
> +	{ V4L2_PIX_FMT_Y210, MEDIA_BUS_FMT_AYUV8_1X32,
> +	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 2, 1, false },
> +	{ V4L2_PIX_FMT_Y212, MEDIA_BUS_FMT_AYUV8_1X32,
> +	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
> +	  1, { 32, 0, 0 }, false, false, 2, 1, false },
>  };
>  
>  /**
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> index c61e8dafeecf..d94343ae57a1 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> @@ -228,6 +228,28 @@
>  #define VI6_RPF_MULT_ALPHA_RATIO_MASK	(0xff << 0)
>  #define VI6_RPF_MULT_ALPHA_RATIO_SHIFT	0
>  
> +#define VI6_RPF_EXT_INFMT0		0x0370
> +#define VI6_RPF_EXT_INFMT0_F2B		BIT(12)
> +#define VI6_RPF_EXT_INFMT0_IPBD_Y_8	(0 << 8)
> +#define VI6_RPF_EXT_INFMT0_IPBD_Y_10	(1 << 8)
> +#define VI6_RPF_EXT_INFMT0_IPBD_Y_12	(2 << 8)
> +#define VI6_RPF_EXT_INFMT0_IPBD_C_8	(0 << 4)
> +#define VI6_RPF_EXT_INFMT0_IPBD_C_10	(1 << 4)
> +#define VI6_RPF_EXT_INFMT0_IPBD_C_12	(2 << 4)
> +#define VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10	(3 << 0)
> +
> +#define VI6_RPF_EXT_INFMT1		0x0374
> +#define VI6_RPF_EXT_INFMT1_PACK_CPOS(a, b, c, d) \
> +	(((a) << 24) | ((b) << 16) | ((c) << 8) | ((d) << 0))
> +
> +#define VI6_RPF_EXT_INFMT2		0x0378
> +#define VI6_RPF_EXT_INFMT2_PACK_CLEN(a, b, c, d) \
> +	(((a) << 24) | ((b) << 16) | ((c) << 8) | ((d) << 0))
> +
> +#define VI6_RPF_BRDITH_CTRL		0x03e0
> +#define VI6_RPF_BRDITH_CTRL_ODE		BIT(8)
> +#define VI6_RPF_BRDITH_CTRL_CBRM	BIT(0)
> +
>  /* -----------------------------------------------------------------------------
>   * WPF Control Registers
>   */
> @@ -846,6 +868,7 @@
>  #define VI6_FMT_XBXGXR_262626		0x21
>  #define VI6_FMT_ABGR_8888		0x22
>  #define VI6_FMT_XXRGB_88565		0x23
> +#define VI6_FMT_RGB10_RGB10A2_A2RGB10	0x30
>  
>  #define VI6_FMT_Y_UV_444		0x40
>  #define VI6_FMT_Y_UV_422		0x41
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 045aa54f7998..3b17f5fa4067 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -109,6 +109,58 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
>  	vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
>  
> +	if (entity->vsp1->info->gen == 4) {
> +		u32 ext_infmt0;
> +		u32 ext_infmt1;
> +		u32 ext_infmt2;
> +
> +		switch (fmtinfo->fourcc) {
> +		case V4L2_PIX_FMT_RGBX1010102:
> +			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +			ext_infmt1 = VI6_RPF_EXT_INFMT1_PACK_CPOS(0, 10, 20, 0);
> +			ext_infmt2 = VI6_RPF_EXT_INFMT2_PACK_CLEN(10, 10, 10, 0);
> +			break;
> +
> +		case V4L2_PIX_FMT_RGBA1010102:
> +			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +			ext_infmt1 = VI6_RPF_EXT_INFMT1_PACK_CPOS(0, 10, 20, 30);
> +			ext_infmt2 = VI6_RPF_EXT_INFMT2_PACK_CLEN(10, 10, 10, 2);
> +			break;
> +
> +		case V4L2_PIX_FMT_ARGB2101010:
> +			ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
> +			ext_infmt1 = VI6_RPF_EXT_INFMT1_PACK_CPOS(2, 12, 22, 0);
> +			ext_infmt2 = VI6_RPF_EXT_INFMT2_PACK_CLEN(10, 10, 10, 2);
> +			break;
> +
> +		case V4L2_PIX_FMT_Y210:
> +			ext_infmt0 = VI6_RPF_EXT_INFMT0_F2B |
> +				     VI6_RPF_EXT_INFMT0_IPBD_Y_10 |
> +				     VI6_RPF_EXT_INFMT0_IPBD_C_10;
> +			ext_infmt1 = 0x0;
> +			ext_infmt2 = 0x0;
> +			break;
> +
> +		case V4L2_PIX_FMT_Y212:
> +			ext_infmt0 = VI6_RPF_EXT_INFMT0_F2B |
> +				     VI6_RPF_EXT_INFMT0_IPBD_Y_12 |
> +				     VI6_RPF_EXT_INFMT0_IPBD_C_12;
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
