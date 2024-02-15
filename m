Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDCB85609E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16AA610E634;
	Thu, 15 Feb 2024 11:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OOHlvkaY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8245810E634
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 11:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707995012;
 bh=kzVcnFNNmOzs8GOwtdRGbBUIEmsIgui7Ywhz5JyEn4I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OOHlvkaYWNTke3pqt/4FzLNGWD1eIML9eIavJsoffiGO3wXred/AEM1ag73zXgWHX
 pynJjtKjObXzNhw13Bx7Ff/zOAGLvtTGPN/G1TVDdakVqPzWJE6WKd/TiEfOge646C
 WrYA/0e/x9Bg1BcD6DEWikTlQGOVKdSAxcB+kQ698h3B5VfOGQk0gcLm5EvPlOaaZv
 gNnKjmB2G6f2vTvx9Ybs53sqA0w5OrGV1Vzghf6egNm4JO5wupYNeOn/FsvRhn6Iw3
 He3p+9CIYOkCW3TxsUeFR+aF5OWEwaXSbwdrQLxXK3fJQ1xenzlccAInyEBK0aA/QE
 hOTysuuzCOV3A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 71B223781144;
 Thu, 15 Feb 2024 11:03:31 +0000 (UTC)
Message-ID: <7664fece-c29a-4374-a59c-4ce8fe831494@collabora.com>
Date: Thu, 15 Feb 2024 12:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] drm/mediatek: Support alpha blending in OVL
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Sean Paul <seanpaul@chromium.org>, Fei Shao <fshao@chromium.org>,
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
 <20240215101119.12629-9-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215101119.12629-9-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 15/02/24 11:11, Hsiao Chien Sung ha scritto:
> Support "Pre-multiplied" and "None" blend mode on MediaTek's chips.
> Before this patch, only the "Coverage" mode is supported.
> 
> Please refer to the description of the commit
> "drm/mediatek: Support alpha blending in display driver"
> for more information.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 83 +++++++++++++++++++++----
>   1 file changed, 72 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index c42fce38a35eb..98c989fddcc08 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -39,6 +39,7 @@
>   #define DISP_REG_OVL_PITCH_MSB(n)		(0x0040 + 0x20 * (n))
>   #define OVL_PITCH_MSB_2ND_SUBBUF			BIT(16)
>   #define DISP_REG_OVL_PITCH(n)			(0x0044 + 0x20 * (n))
> +#define OVL_CONST_BLEND					BIT(28)
>   #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
>   #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
>   #define DISP_REG_OVL_ADDR_MT2701		0x0040
> @@ -52,13 +53,16 @@
>   #define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
>   #define GMC_THRESHOLD_LOW	((1 << GMC_THRESHOLD_BITS) / 8)
>   
> +#define OVL_CON_CLRFMT_MAN	BIT(23)
>   #define OVL_CON_BYTE_SWAP	BIT(24)
> -#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> +#define OVL_CON_RGB_SWAP	BIT(25)
>   #define OVL_CON_CLRFMT_RGB	(1 << 12)
>   #define OVL_CON_CLRFMT_RGBA8888	(2 << 12)
>   #define OVL_CON_CLRFMT_ARGB8888	(3 << 12)
>   #define OVL_CON_CLRFMT_UYVY	(4 << 12)
>   #define OVL_CON_CLRFMT_YUYV	(5 << 12)
> +#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> +#define OVL_CON_CLRFMT_PARGB8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_CLRFMT_MAN)
>   #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
>   					0 : OVL_CON_CLRFMT_RGB)
>   #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
> @@ -72,6 +76,22 @@
>   #define	OVL_CON_VIRT_FLIP	BIT(9)
>   #define	OVL_CON_HORZ_FLIP	BIT(10)
>   
> +static inline bool is_10bit_rgb(u32 fmt)
> +{
> +	switch (fmt) {
> +	case DRM_FORMAT_XRGB2101010:
> +	case DRM_FORMAT_ARGB2101010:
> +	case DRM_FORMAT_RGBX1010102:
> +	case DRM_FORMAT_RGBA1010102:
> +	case DRM_FORMAT_XBGR2101010:
> +	case DRM_FORMAT_ABGR2101010:
> +	case DRM_FORMAT_BGRX1010102:
> +	case DRM_FORMAT_BGRA1010102:
> +		return true;
> +	}
> +	return false;
> +}
> +
>   static const u32 mt8173_formats[] = {
>   	DRM_FORMAT_XRGB8888,
>   	DRM_FORMAT_ARGB8888,
> @@ -89,12 +109,20 @@ static const u32 mt8173_formats[] = {
>   static const u32 mt8195_formats[] = {
>   	DRM_FORMAT_XRGB8888,
>   	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_XRGB2101010,
>   	DRM_FORMAT_ARGB2101010,
>   	DRM_FORMAT_BGRX8888,
>   	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRX1010102,
>   	DRM_FORMAT_BGRA1010102,
>   	DRM_FORMAT_ABGR8888,
>   	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_XBGR2101010,
> +	DRM_FORMAT_ABGR2101010,
> +	DRM_FORMAT_RGBX8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_RGBX1010102,
> +	DRM_FORMAT_RGBA1010102,
>   	DRM_FORMAT_RGB888,
>   	DRM_FORMAT_BGR888,
>   	DRM_FORMAT_RGB565,
> @@ -254,9 +282,7 @@ static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
>   	reg = readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
>   	reg &= ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
>   
> -	if (format == DRM_FORMAT_RGBA1010102 ||
> -	    format == DRM_FORMAT_BGRA1010102 ||
> -	    format == DRM_FORMAT_ARGB2101010)
> +	if (is_10bit_rgb(format))
>   		bit_depth = OVL_CON_CLRFMT_10_BIT;
>   
>   	reg |= OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
> @@ -274,7 +300,13 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
>   	if (w != 0 && h != 0)
>   		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, &ovl->cmdq_reg, ovl->regs,
>   				      DISP_REG_OVL_ROI_SIZE);
> -	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
> +
> +	/*
> +	 * The background color should be opaque black (ARGB),
> +	 * otherwise there will be no effect with alpha blend
> +	 */
> +	mtk_ddp_write_relaxed(cmdq_pkt, 0xff000000, &ovl->cmdq_reg,
> +			      ovl->regs, DISP_REG_OVL_ROI_BGCLR);

Multiple (all of?) OVL color registers, like{L0-3,EL0-2}_YUV1BIT_COLOR(x),
ROI_BGCLR, L{0-3}_CLR and others do follow this exact layout:

#define OVL_COLOR_ALPHA				GENMASK(31, 24)
#define OVL_COLOR_GREEN				GENMASK(23, 16)
#define OVL_COLOR_RED				GENMASK(15, 8)
#define OVL_COLOR_BLUE				GENMASK(7, 0)

...so we can define those as they're valid for multiple registers, and then
we can use the definition instead of an apparently random value.

/*
  * The background color should be opaque black (ARGB),
  * otherwise there will be no effect with alpha blend
  */
mtk_ddp_write_relaxed(cmdq_pkt, OVL_COLOR_ALPHA, &ovl->cmdq_reg,
		      ovl->regs, DISP_REG_OVL_ROI_BGCLR);

Everything else looks ok.

Regards,
Angelo

