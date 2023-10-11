Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E977C58D5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 18:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0258B10E486;
	Wed, 11 Oct 2023 16:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7287710E486
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 16:05:27 +0000 (UTC)
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0AC3866072FC;
 Wed, 11 Oct 2023 17:05:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697040326;
 bh=JX/FNFTRvgUjRggNucUPj/avlj5AIJtfvklHcuIrhpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FOvsvP2z4ELP9LV96w8lC8IG53tbUcpfdEjCzCWhy/UHUKlqPJKxAjKU7yzF4Yy7N
 /YC08oleXh/SM7zMPX0cUpXEghvg0c950bgpJPz3XHcjo2sb972iSTv1/L3xRhurGj
 cqtbstLlprV0C0Hw/4WhEkTTMeynQsyOW7QZqYgbgGrkwUapU9I7r5hQnaIyl2f/0A
 ekkyHILY/UiLaVp9xK0pQl107nduU5BO6a+DG7nIu9xxO6KKiqcPzwa8ZDF7HKMnbZ
 gzaWCPuhM0PrsfZodIBY96FK42HFPak2R1vZO01rFQo6VmvwZro0xCeYca14c6COUA
 iyESeUwrHaw9w==
Date: Wed, 11 Oct 2023 12:05:19 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v10 08/16] drm/mediatek: De-commonize disp_aal/disp_gamma
 gamma_set functions
Message-ID: <8cf3d18a-fe99-49c5-8d0c-eb5deaef79d6@notapiano>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804072850.89365-9-angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 09:28:42AM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding a 12-bits gamma support for the DISP_GAMMA
> IP, remove the mtk_gamma_set_common() function and move the relevant
> bits in mtk_gamma_set() for DISP_GAMMA and mtk_aal_gamma_set() for
> DISP_AAL: since the latter has no more support for gamma manipulation
> (being moved to a different IP) in newer revisions, those functions
> are about to diverge and it makes no sense to keep a common one (with
> all the complications of passing common data and making exclusions
> for device driver data) for just a few bits.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 39 +++++++++++++++++++++--
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  1 -
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 34 ++++----------------
>  3 files changed, 44 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> index bec035780db0..21b25470e9b7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -17,10 +17,18 @@
>  
>  #define DISP_AAL_EN				0x0000
>  #define AAL_EN						BIT(0)
> +#define DISP_AAL_CFG				0x0020
> +#define AAL_RELAY_MODE					BIT(0)
> +#define AAL_GAMMA_LUT_EN				BIT(1)
>  #define DISP_AAL_SIZE				0x0030
>  #define DISP_AAL_SIZE_HSIZE				GENMASK(28, 16)
>  #define DISP_AAL_SIZE_VSIZE				GENMASK(12, 0)
>  #define DISP_AAL_OUTPUT_SIZE			0x04d8
> +#define DISP_AAL_GAMMA_LUT			0x0700
> +#define DISP_AAL_GAMMA_LUT_R				GENMASK(29, 20)
> +#define DISP_AAL_GAMMA_LUT_G				GENMASK(19, 10)
> +#define DISP_AAL_GAMMA_LUT_B				GENMASK(9, 0)
> +#define DISP_AAL_LUT_BITS			10
>  #define DISP_AAL_LUT_SIZE			512
>  
>  struct mtk_disp_aal_data {
> @@ -85,9 +93,36 @@ unsigned int mtk_aal_gamma_get_lut_size(struct device *dev)
>  void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
>  {
>  	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
> +	struct drm_color_lut *lut;
> +	unsigned int i;
> +	u32 cfg_val;
> +
> +	/* If gamma is not supported in AAL, go out immediately */
> +	if (!(aal->data && aal->data->has_gamma))
> +		return;
> +
> +	/* Also, if there's no gamma lut there's nothing to do here. */
> +	if (!state->gamma_lut)
> +		return;
> +
> +	cfg_val = readl(aal->regs + DISP_AAL_CFG);
> +	lut = (struct drm_color_lut *)state->gamma_lut->data;
> +
> +	for (i = 0; i < DISP_AAL_LUT_SIZE; i++) {
> +		struct drm_color_lut hwlut = {
> +			.red = drm_color_lut_extract(lut[i].red, DISP_AAL_LUT_BITS),
> +			.green = drm_color_lut_extract(lut[i].green, DISP_AAL_LUT_BITS),
> +			.blue = drm_color_lut_extract(lut[i].blue, DISP_AAL_LUT_BITS)
> +		};
> +		u32 word;
> +
> +		word = FIELD_PREP(DISP_AAL_GAMMA_LUT_R, hwlut.red);
> +		word |= FIELD_PREP(DISP_AAL_GAMMA_LUT_G, hwlut.green);
> +		word |= FIELD_PREP(DISP_AAL_GAMMA_LUT_B, hwlut.blue);
> +		writel(word, (aal->regs + DISP_AAL_GAMMA_LUT) + (i * 4));
> +	}

Hi Angelo,

it looks like you're missing a

  	cfg_val |= FIELD_PREP(AAL_GAMMA_LUT_EN, 1);

to actually enable the AAL gamma table here, like was done in the common
function.

Thanks,
Nícolas

>  
> -	if (aal->data && aal->data->has_gamma)
> -		mtk_gamma_set_common(NULL, aal->regs, state);
> +	writel(cfg_val, aal->regs + DISP_AAL_CFG);
>  }
[..]
