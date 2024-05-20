Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A548C9B6E
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 12:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BE110E361;
	Mon, 20 May 2024 10:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SB22LO1C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5565510E361
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716201519;
 bh=hwIUK11OjdQdaDBHznDyjBuzHAdXk6WYhTMYBV91TIc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SB22LO1CBQBi40bGyF59OeVMVjdBz/3MlrstfXnlBGP01JRu1wzKLolmHtIRAgNbp
 zeiIBPLTuIgAxcLjQyy+ONxM1+XumLowRQ7KvmSMgEZqJ+bgW/chVLiv6apmdLvPr9
 63FzeJ4I4W0sLtBHB0AVoDxwiFJ9q3U454GZOoKMfszMVrITUoAQA1MyXiY8LSVRxj
 ATTcPH9ysQMPkyOZi1DeP5wt58mbAOJJavg3KltR9CbEU18CgVXw5XxXV0ChUdOBO/
 n2yXM5dGfsFDvMmo7ek2EYnxGdKpBaHZi+clA6T74xrGGkbg9xGt8B3HM0k8uPQeJX
 F4VX3Oi3ZA/ZQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5FA72378219E;
 Mon, 20 May 2024 10:38:38 +0000 (UTC)
Message-ID: <448db9fa-22c4-4123-892c-8d1fe4e7d562@collabora.com>
Date: Mon, 20 May 2024 12:38:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/16] SoC: mediatek: mt8365: support audio clock
 control
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-5-082b22186d4c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v4-5-082b22186d4c@baylibre.com>
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

Il 26/04/24 19:22, Alexandre Mergnat ha scritto:
> Add audio clock wrapper and audio tuner control.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-afe-clk.c | 443 +++++++++++++++++++++++++++++
>   sound/soc/mediatek/mt8365/mt8365-afe-clk.h |  49 ++++
>   2 files changed, 492 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
> new file mode 100644
> index 000000000000..3a525dae857c
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
> @@ -0,0 +1,443 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek 8365 AFE clock control
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + * Authors: Jia Zeng <jia.zeng@mediatek.com>
> + *          Alexandre Mergnat <amergnat@baylibre.com>
> + */
> +
> +#include "mt8365-afe-clk.h"
> +#include "mt8365-afe-common.h"
> +#include "mt8365-reg.h"
> +#include "../common/mtk-base-afe.h"
> +#include <linux/device.h>
> +#include <linux/mfd/syscon.h>
> +
> +static const char *aud_clks[MT8365_CLK_NUM] = {
> +	[MT8365_CLK_TOP_AUD_SEL] = "top_audio_sel",
> +	[MT8365_CLK_AUD_I2S0_M] = "audio_i2s0_m",
> +	[MT8365_CLK_AUD_I2S1_M] = "audio_i2s1_m",
> +	[MT8365_CLK_AUD_I2S2_M] = "audio_i2s2_m",
> +	[MT8365_CLK_AUD_I2S3_M] = "audio_i2s3_m",
> +	[MT8365_CLK_ENGEN1] = "engen1",
> +	[MT8365_CLK_ENGEN2] = "engen2",
> +	[MT8365_CLK_AUD1] = "aud1",
> +	[MT8365_CLK_AUD2] = "aud2",
> +	[MT8365_CLK_I2S0_M_SEL] = "i2s0_m_sel",
> +	[MT8365_CLK_I2S1_M_SEL] = "i2s1_m_sel",
> +	[MT8365_CLK_I2S2_M_SEL] = "i2s2_m_sel",
> +	[MT8365_CLK_I2S3_M_SEL] = "i2s3_m_sel",
> +	[MT8365_CLK_CLK26M] = "top_clk26m_clk",
> +};
> +
> +int mt8365_afe_init_audio_clk(struct mtk_base_afe *afe)
> +{
> +	size_t i;
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +
> +	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
> +		afe_priv->clocks[i] = devm_clk_get(afe->dev, aud_clks[i]);
> +		if (IS_ERR(afe_priv->clocks[i])) {
> +			dev_err(afe->dev, "%s devm_clk_get %s fail\n",
> +				__func__, aud_clks[i]);
> +			return PTR_ERR(afe_priv->clocks[i]);
> +		}
> +	}
> +	return 0;
> +}
> +
> +int mt8365_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)

Do you really really really need those helper functions?
I say that you can simply call the clk API from the users instead, as you are
really just doing that in those functions...

> +{
> +	int ret;
> +
> +	if (clk) {
> +		ret = clk_prepare_enable(clk);
> +		if (ret) {
> +			dev_err(afe->dev, "Failed to enable clk\n");
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +
> +void mt8365_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
> +{
> +	if (clk)
> +		clk_disable_unprepare(clk);
> +}
> +
> +int mt8365_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
> +			    unsigned int rate)
> +{
> +	int ret;
> +
> +	if (clk) {
> +		ret = clk_set_rate(clk, rate);
> +		if (ret) {
> +			dev_err(afe->dev, "Failed to set rate\n");
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +
> +int mt8365_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
> +			      struct clk *parent)
> +{
> +	int ret;
> +
> +	if (clk && parent) {
> +		ret = clk_set_parent(clk, parent);
> +		if (ret) {
> +			dev_err(afe->dev, "Failed to set parent\n");
> +			return ret;
> +		}
> +	}
> +	return 0;
> +}
> +

..snip..

> +int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll)
> +{
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +
> +	mutex_lock(&afe_priv->afe_clk_mutex);
> +
> +	afe_priv->apll_tuner_ref_cnt[apll]++;
> +	if (afe_priv->apll_tuner_ref_cnt[apll] != 1) {
> +		mutex_unlock(&afe_priv->afe_clk_mutex);
> +		return 0;
> +	}
> +
> +	if (apll == MT8365_AFE_APLL1) {
> +		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
> +				   AFE_APLL_TUNER_CFG_MASK, 0x432);
> +		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
> +				   AFE_APLL_TUNER_CFG_EN_MASK, 0x1);
> +	} else {
> +		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG1,
> +				   AFE_APLL_TUNER_CFG1_MASK, 0x434);
> +		regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG1,
> +				   AFE_APLL_TUNER_CFG1_EN_MASK, 0x1);
> +	}
> +
> +	mutex_unlock(&afe_priv->afe_clk_mutex);
> +	return 0;
> +}
> +
> +int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe,	unsigned int apll)

There's a tabulation here, please use spaces....

> +{
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +
> +	mutex_lock(&afe_priv->afe_clk_mutex);
> +
> +	afe_priv->apll_tuner_ref_cnt[apll]--;
> +	if (afe_priv->apll_tuner_ref_cnt[apll] == 0) {
> +		if (apll == MT8365_AFE_APLL1)
> +			regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG,
> +					   AFE_APLL_TUNER_CFG_EN_MASK, 0x0);
> +		else
> +			regmap_update_bits(afe->regmap, AFE_APLL_TUNER_CFG1,
> +					   AFE_APLL_TUNER_CFG1_EN_MASK, 0x0);
> +
> +	} else if (afe_priv->apll_tuner_ref_cnt[apll] < 0) {
> +		afe_priv->apll_tuner_ref_cnt[apll] = 0;
> +	}
> +
> +	mutex_unlock(&afe_priv->afe_clk_mutex);
> +	return 0;
> +}
> +
> +int mt8365_afe_enable_apll_associated_cfg(struct mtk_base_afe *afe, unsigned int apll)
> +{
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +
> +	if (apll == MT8365_AFE_APLL1) {
> +		if (clk_prepare_enable(afe_priv->clocks[MT8365_CLK_ENGEN1])) {
> +			dev_info(afe->dev, "%s Failed to enable ENGEN1 clk\n",
> +				 __func__);
> +			return 0;
> +		}
> +		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_22M);
> +		mt8365_afe_hd_engen_enable(afe, true);
> +#ifdef ENABLE_AFE_APLL_TUNER
> +		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_APLL_TUNER);
> +		mt8365_afe_enable_apll_tuner_cfg(afe, MT8365_AFE_APLL1);
> +#endif
> +	} else {
> +		if (clk_prepare_enable(afe_priv->clocks[MT8365_CLK_ENGEN2])) {
> +			dev_info(afe->dev, "%s Failed to enable ENGEN2 clk\n",
> +				 __func__);
> +			return 0;
> +		}
> +		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_24M);
> +		mt8365_afe_hd_engen_enable(afe, false);
> +#ifdef ENABLE_AFE_APLL_TUNER

Those ifdefs are ugly. If you're not using that code, please remove.

> +		mt8365_afe_enable_top_cg(afe, MT8365_TOP_CG_APLL2_TUNER);
> +		mt8365_afe_enable_apll_tuner_cfg(afe, MT8365_AFE_APLL2);
> +#endif
> +	}
> +
> +	return 0;
> +}
> +
> +int mt8365_afe_disable_apll_associated_cfg(struct mtk_base_afe *afe, unsigned int apll)
> +{
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +
> +	if (apll == MT8365_AFE_APLL1) {
> +#ifdef ENABLE_AFE_APLL_TUNER
> +		mt8365_afe_disable_apll_tuner_cfg(afe, MT8365_AFE_APLL1);
> +		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_APLL_TUNER);
> +#endif
> +		mt8365_afe_hd_engen_disable(afe, true);
> +		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_22M);
> +		clk_disable_unprepare(afe_priv->clocks[MT8365_CLK_ENGEN1]);
> +	} else {
> +#ifdef ENABLE_AFE_APLL_TUNER
> +		mt8365_afe_disable_apll_tuner_cfg(afe, MT8365_AFE_APLL2);
> +		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_APLL2_TUNER);
> +#endif
> +		mt8365_afe_hd_engen_disable(afe, false);
> +		mt8365_afe_disable_top_cg(afe, MT8365_TOP_CG_24M);
> +		clk_disable_unprepare(afe_priv->clocks[MT8365_CLK_ENGEN2]);
> +	}
> +
> +	return 0;
> +}
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.h b/sound/soc/mediatek/mt8365/mt8365-afe-clk.h
> new file mode 100644
> index 000000000000..14fca6ae2641
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Mediatek 8365 AFE clock control definitions
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + * Authors: Jia Zeng <jia.zeng@mediatek.com>
> + *          Alexandre Mergnat <amergnat@baylibre.com>
> + */
> +
> +#ifndef _MT8365_AFE_UTILS_H_
> +#define _MT8365_AFE_UTILS_H_
> +
> +struct mtk_base_afe;
> +struct clk;
> +
> +int mt8365_afe_init_audio_clk(struct mtk_base_afe *afe);
> +

Please drop all those blank lines between function signatures, they're not needed.

Cheers,
Angelo

> +int mt8365_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
> +
> +void mt8365_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
> +
> +int mt8365_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk, unsigned int rate);
> +
> +int mt8365_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk, struct clk *parent);
> +
> +int mt8365_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type);
> +
> +int mt8365_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type);
> +
> +int mt8365_afe_enable_main_clk(struct mtk_base_afe *afe);
> +
> +int mt8365_afe_disable_main_clk(struct mtk_base_afe *afe);
> +
> +int mt8365_afe_emi_clk_on(struct mtk_base_afe *afe);
> +
> +int mt8365_afe_emi_clk_off(struct mtk_base_afe *afe);
> +
> +int mt8365_afe_enable_afe_on(struct mtk_base_afe *afe);
> +
> +int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe);
> +
> +int mt8365_afe_enable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll);
> +
> +int mt8365_afe_disable_apll_tuner_cfg(struct mtk_base_afe *afe, unsigned int apll);
> +
> +int mt8365_afe_enable_apll_associated_cfg(struct mtk_base_afe *afe, unsigned int apll);
> +
> +int mt8365_afe_disable_apll_associated_cfg(struct mtk_base_afe *afe, unsigned int apll);
> +#endif
> 

