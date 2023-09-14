Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A977C7A01BC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 12:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C2C10E0EC;
	Thu, 14 Sep 2023 10:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0270D10E0EC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 10:33:02 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E26AF6607268;
 Thu, 14 Sep 2023 11:32:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694687580;
 bh=xOPOFCSTLWONSaEqKeJKgUn6Me6AMdatcI9b6/BlVZI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KjqtjvbF2VeHrkkMS0rQpntlmhDD2zU0lzLN0GGmIcT10qaOg9riOlDKuprHOvM7j
 j4wJEehMk9GI/uYcSB8Qw6CW0qOB3HPHqANpmrZgFMghrRapPuQW747wMens0Y0pLk
 eRbLGe+UhCgN/RdLzzP8HjqkUl0qewsJskx2MMZf9NVdB3X5RqR1zDczWiY0cLAy2T
 R7/gd0Gu028hB2t2VMkETQrSCwg2AVzzFOoiRwlHcepsXJusGLw+fB0eK8z/12pYDo
 Y9SMl3ndiXgQtdM8ZsOD4RZ2NAcq235hH49BVQGsqXpZN5fxphfgXJ4BktRxqcbPqA
 Q3EcHhcS0nm8Q==
Message-ID: <223a5636-d399-afc6-748a-06835e7bf54d@collabora.com>
Date: Thu, 14 Sep 2023 12:32:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v10 11/16] drm/mediatek: gamma: Add support for 12-bit LUT
 and MT8195
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-12-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Hw2QqRVCqxZ+P96uM4hcm3qSQESA8Kh5b6RyJDQLFqQQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Hw2QqRVCqxZ+P96uM4hcm3qSQESA8Kh5b6RyJDQLFqQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: chunkuang.hu@kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/08/23 09:57, Chen-Yu Tsai ha scritto:
> On Fri, Aug 4, 2023 at 3:29 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add support for 12-bit gamma lookup tables and introduce the first
>> user for it: MT8195.
>> While at it, also reorder the variables in mtk_gamma_set_common()
>> and rename `lut_base` to `lut0_base` to improve readability.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 74 +++++++++++++++++++----
>>   1 file changed, 62 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> index 3f1c6815ea5a..7d2f8042ace0 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>> @@ -26,12 +26,20 @@
>>   #define DISP_GAMMA_SIZE_VSIZE                          GENMASK(12, 0)
>>   #define DISP_GAMMA_BANK                                0x0100
>>   #define DISP_GAMMA_BANK_BANK                           GENMASK(1, 0)
>> +#define DISP_GAMMA_BANK_DATA_MODE                      BIT(2)
>>   #define DISP_GAMMA_LUT                         0x0700
>> +#define DISP_GAMMA_LUT1                                0x0b00
>>
>> +/* For 10 bit LUT layout, R/G/B are in the same register */
>>   #define DISP_GAMMA_LUT_10BIT_R                 GENMASK(29, 20)
>>   #define DISP_GAMMA_LUT_10BIT_G                 GENMASK(19, 10)
>>   #define DISP_GAMMA_LUT_10BIT_B                 GENMASK(9, 0)
>>
>> +/* For 12 bit LUT layout, R/G are in LUT, B is in LUT1 */
>> +#define DISP_GAMMA_LUT_12BIT_R                 GENMASK(11, 0)
>> +#define DISP_GAMMA_LUT_12BIT_G                 GENMASK(23, 12)
>> +#define DISP_GAMMA_LUT_12BIT_B                 GENMASK(11, 0)
>> +
>>   #define LUT_10BIT_MASK                         0x03ff
>>   #define LUT_BITS_DEFAULT                       10
>>   #define LUT_SIZE_DEFAULT                       512
>> @@ -77,14 +85,30 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
>>          return LUT_SIZE_DEFAULT;
>>   }
>>
>> +/*
>> + * SoCs supporting 12-bits LUTs are using a new register layout that does
>> + * always support (by HW) both 12-bits and 10-bits LUT but, on those, we
>> + * ignore the support for 10-bits in this driver and always use 12-bits.
>> + *
>> + * Summarizing:
>> + * - SoC HW support 9/10-bits LUT only
>> + *   - Old register layout
>> + *     - 10-bits LUT supported
>> + *     - 9-bits LUT not supported
>> + * - SoC HW support both 10/12bits LUT
>> + *   - New register layout
>> + *     - 12-bits LUT supported
>> + *     - 10-its LUT not supported
>> + */
>>   void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>>   {
>>          struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
>> -       unsigned int i;
>> -       struct drm_color_lut *lut;
>> -       void __iomem *lut_base;
>> -       u32 cfg_val, lbank_val, word;
>> +       void __iomem *lut0_base = gamma->regs + DISP_GAMMA_LUT;
>> +       void __iomem *lut1_base = gamma->regs + DISP_GAMMA_LUT1;
>> +       u32 cfg_val, data_mode, lbank_val, word[2];
>>          int cur_bank, num_lut_banks;
>> +       struct drm_color_lut *lut;
>> +       unsigned int i;
>>
>>          /* If there's no gamma lut there's nothing to do here. */
>>          if (!state->gamma_lut)
>> @@ -92,14 +116,17 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>>
>>          num_lut_banks = gamma->data->lut_size / gamma->data->lut_bank_size;
>>          cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
>> -       lut_base = gamma->regs + DISP_GAMMA_LUT;
>>          lut = (struct drm_color_lut *)state->gamma_lut->data;
>>
>> +       /* Switch to 12 bits data mode if supported */
>> +       data_mode = FIELD_PREP(DISP_GAMMA_BANK_DATA_MODE, !!(gamma->data->lut_bits == 12));
>> +
>>          for (cur_bank = 0; cur_bank < num_lut_banks; cur_bank++) {
>>
>>                  /* Switch gamma bank and set data mode before writing LUT */
>>                  if (num_lut_banks > 1) {
>>                          lbank_val = FIELD_PREP(DISP_GAMMA_BANK_BANK, cur_bank);
>> +                       lbank_val |= data_mode;
>>                          writel(lbank_val, gamma->regs + DISP_GAMMA_BANK);
>>                  }
>>
>> @@ -112,9 +139,15 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>>                          hwlut.blue = drm_color_lut_extract(lut[n].blue, gamma->data->lut_bits);
>>
>>                          if (!gamma->data->lut_diff || (i % 2 == 0)) {
>> -                               word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
>> -                               word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
>> -                               word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
>> +                               if (gamma->data->lut_bits == 12) {
>> +                                       word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, hwlut.red);
>> +                                       word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, hwlut.green);
>> +                                       word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, hwlut.blue);
>> +                               } else {
>> +                                       word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
>> +                                       word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
>> +                                       word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
>> +                               }
>>                          } else {
>>                                  diff.red = lut[n].red - lut[n - 1].red;
>>                                  diff.red = drm_color_lut_extract(diff.red, gamma->data->lut_bits);
>> @@ -125,11 +158,19 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
>>                                  diff.blue = lut[n].blue - lut[n - 1].blue;
>>                                  diff.blue = drm_color_lut_extract(diff.blue, gamma->data->lut_bits);
>>
>> -                               word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
>> -                               word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
>> -                               word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
>> +                               if (gamma->data->lut_bits == 12) {
>> +                                       word[0] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_R, diff.red);
>> +                                       word[0] |= FIELD_PREP(DISP_GAMMA_LUT_12BIT_G, diff.green);
>> +                                       word[1] = FIELD_PREP(DISP_GAMMA_LUT_12BIT_B, diff.blue);
>> +                               } else {
>> +                                       word[0] = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
>> +                                       word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
>> +                                       word[0] |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
>> +                               }
>>                          }
>> -                       writel(word, (lut_base + i * 4));
>> +                       writel(word[0], (lut0_base + i * 4));
>> +                       if (gamma->data->lut_bits == 12)
>> +                               writel(word[1], (lut1_base + i * 4));
>>                  }
>>          }
>>
>> @@ -246,11 +287,20 @@ static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
>>          .lut_size = 512,
>>   };
>>
>> +static const struct mtk_disp_gamma_data mt8195_gamma_driver_data = {
>> +       .lut_bank_size = 256,
>> +       .lut_bits = 12,
>> +       .lut_diff = true,
>> +       .lut_size = 1024,
>> +};
>> +
>>   static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
>>          { .compatible = "mediatek,mt8173-disp-gamma",
>>            .data = &mt8173_gamma_driver_data},
>>          { .compatible = "mediatek,mt8183-disp-gamma",
>>            .data = &mt8183_gamma_driver_data},
>> +       { .compatible = "mediatek,mt8195-disp-gamma",
>> +         .data = &mt8195_gamma_driver_data},
> 
> I assume we need matching changes for the DT binding and to the DT?
> 

Sorry for the late reply; no, we don't need any bindings/dt changes for this,
as the bindings are matching the current devicetree node in mt8195.dtsi, and
the node has

compatible = "mediatek,mt8195-disp-gamma", "mediatek,mt8183-disp-gamma";

so, no devicetree and/or bindings modification is needed.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/mediatek/mt8195.dtsi?h=next-20230914#n2724

Regards,
Angelo

> ChenYu
> 
>>          {},
>>   };
>>   MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
>> --
>> 2.41.0
>>

