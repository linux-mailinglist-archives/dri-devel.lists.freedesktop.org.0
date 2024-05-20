Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B2A8C9B3F
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 12:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2172510E261;
	Mon, 20 May 2024 10:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oH2UqPcV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A195E10E261
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716200907;
 bh=bRKzyqcLlrX4+PGCOXat0+khakBlpiwK24ehTi1z8yM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oH2UqPcVf6XjzjCSoqpkEqHstieql7cPzcsJsWmHIXOChB7KUapE0PdJGKSIRy41J
 CXWTBi+k2jE8u/cFQL2b1EM+QEJu/jIQU5dsC83XXrIuCf5NL4M1xrLnzgvK/9VpGp
 0lFlw7NDXoq4SjbEIn96ZNluNpPQiYuz3cPKdEmlRIQudJQHUNE39e9LPi6GjaMJ00
 v9BjDdn3thsHM3OCvIrScN/zKKGJNbU/t227ZVc4FUrDP1Lia4DyfgRxTyodCfIHVH
 1Xei0WncqWb5WcAePLRDmSSLDNSV4FAo3FQFR6Q78RqO24etRNvRJCzXx/tIRPj94M
 8r5mmvtLAMauw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2E64137821B2;
 Mon, 20 May 2024 10:28:26 +0000 (UTC)
Message-ID: <08b60894-0023-4ad7-9c6b-b1e99b1b4cd8@collabora.com>
Date: Mon, 20 May 2024 12:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/16] ASoC: mediatek: mt8365: Add PCM DAI support
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
 <20240226-audio-i350-v4-9-082b22186d4c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v4-9-082b22186d4c@baylibre.com>
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
> Add Pulse Code Modulation Device Audio Interface support for MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-dai-pcm.c | 293 +++++++++++++++++++++++++++++
>   1 file changed, 293 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
> new file mode 100644
> index 000000000000..a5de47c69620
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-dai-pcm.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek 8365 ALSA SoC Audio DAI PCM Control
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + * Authors: Jia Zeng <jia.zeng@mediatek.com>
> + *          Alexandre Mergnat <amergnat@baylibre.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include "mt8365-afe-clk.h"
> +#include "mt8365-afe-common.h"
> +
> +struct mt8365_pcm_intf_data {
> +	bool slave_mode;
> +	bool lrck_inv;
> +	bool bck_inv;
> +	unsigned int format;
> +};
> +
> +/* DAI Drivers */
> +
> +static void mt8365_dai_enable_pcm1(struct mtk_base_afe *afe)
> +{
> +	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
> +			   PCM_INTF_CON1_EN, PCM_INTF_CON1_EN);
> +}
> +
> +static void mt8365_dai_disable_pcm1(struct mtk_base_afe *afe)
> +{
> +	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
> +			   PCM_INTF_CON1_EN, 0x0);
> +}
> +
> +static int mt8365_dai_configure_pcm1(struct snd_pcm_substream *substream,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8365_afe_private *afe_priv = afe->platform_priv;
> +	struct mt8365_pcm_intf_data *pcm_priv = afe_priv->dai_priv[MT8365_AFE_IO_PCM1];
> +	bool slave_mode = pcm_priv->slave_mode;
> +	bool lrck_inv = pcm_priv->lrck_inv;
> +	bool bck_inv = pcm_priv->bck_inv;
> +	unsigned int fmt = pcm_priv->format;
> +	unsigned int bit_width = dai->sample_bits;
> +	unsigned int val = 0;
> +
> +	if (!slave_mode) {
> +		val |= PCM_INTF_CON1_MASTER_MODE |
> +		       PCM_INTF_CON1_BYPASS_ASRC;
> +
> +		if (lrck_inv)
> +			val |= PCM_INTF_CON1_SYNC_OUT_INV;
> +		if (bck_inv)
> +			val |= PCM_INTF_CON1_BCLK_OUT_INV;
> +	} else {
> +		val |= PCM_INTF_CON1_SLAVE_MODE;
> +
> +		if (lrck_inv)
> +			val |= PCM_INTF_CON1_SYNC_IN_INV;
> +		if (bck_inv)
> +			val |= PCM_INTF_CON1_BCLK_IN_INV;
> +
> +		// TODO: add asrc setting

/* TODO ... */

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


