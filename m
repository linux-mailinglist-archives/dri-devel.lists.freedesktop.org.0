Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC585A3BE49
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E20510E2F3;
	Wed, 19 Feb 2025 12:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mV2BD9Hx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0455C10E2F3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739968673;
 bh=yWQBctTmTYw2F6D0YrO+rF/Gn/2V69KKlL8m0tLUKc4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mV2BD9Hxs36pOHX9FkZKfw+gQIuDnAd4bvjf8XtdSJvkyBEam5NsrQaAQl8M6WZgC
 JYbwtlfxCcVCkQu1WD/vt4IOre8mbxHr3t6jwauve4CZr8UM6SEXmzeu9YgAOdHmHO
 BUAUTvFJgAaN0yO05kunUr334Z+pKxln4ayffgJcZFjdwZNFwWLevzZNOa96gI776B
 1iDhSr8QZGx6k+IrJNi1kQmWmcrp/OHnbUxAhpj889/coeYv0tsuI6EnNH0JeoqAcZ
 7Fw2wINiqcbO5APmPZao8MXM8aRy6T31tllsqCZ4rCcXdZmMgmhnVE0xla5gKwBIku
 1325lknngshbA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BB7C17E154A;
 Wed, 19 Feb 2025 13:37:52 +0100 (CET)
Message-ID: <c72a8643-4211-40e1-a64d-6bf3c69bcae1@collabora.com>
Date: Wed, 19 Feb 2025 13:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/mediatek: Add TDSHP component support for MT8196
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-4-jay.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250219092040.11227-4-jay.liu@mediatek.com>
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

Il 19/02/25 10:20, Jay Liu ha scritto:
> Add TDSHP component support for MT8196.
> TDSHP is a hardware module designed to enhance the sharpness and
> clarity of displayed images by analyzing and improving edges and
> fine details in frames.
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 58 +++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 +
>   3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> index d7e230bac53e..b87fde64ee49 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> @@ -57,6 +57,16 @@
>   #define POSTMASK_RELAY_MODE				BIT(0)
>   #define DISP_REG_POSTMASK_SIZE			0x0030
>   
> +#define DISP_REG_TDSHP_EN			0x0000
> +#define DISP_TDSHP_TDS_EN			BIT(31)
> +#define DISP_REG_TDSHP_CTRL			0x0100
> +#define DISP_TDSHP_CTRL_EN			BIT(0)
> +#define DISP_TDSHP_PWR_SCL_EN			BIT(2)
> +#define DISP_REG_TDSHP_CFG			0x0110

#define TDSHP_RELAY_MODE	BIT(0)

> +#define DISP_REG_TDSHP_INPUT_SIZE		0x0120
> +#define DISP_REG_TDSHP_OUTPUT_OFFSET		0x0124
> +#define DISP_REG_TDSHP_OUTPUT_SIZE		0x0128
> +
>   #define DISP_REG_UFO_START			0x0000
>   #define UFO_BYPASS				BIT(2)
>   
> @@ -261,6 +271,44 @@ static void mtk_postmask_stop(struct device *dev)
>   	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
>   }
>   
> +static void mtk_disp_tdshp_config(struct device *dev, unsigned int w,
> +				  unsigned int h, unsigned int vrefresh,
> +				  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +	u32 tdshp_ctrl = (bpc == 8) ? DISP_TDSHP_PWR_SCL_EN | DISP_TDSHP_CTRL_EN : 0;
> +
> +	mtk_ddp_write(cmdq_pkt, tdshp_ctrl, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_TDSHP_CTRL);
> +
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_TDSHP_INPUT_SIZE);
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_TDSHP_OUTPUT_SIZE);
> +	mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_TDSHP_OUTPUT_OFFSET);
> +
> +	mtk_ddp_write(cmdq_pkt, 0x1, &priv->cmdq_reg,

mtk_ddp_write(cmdq_pkt, TDSHP_RELAY_MODE, ... etc etc

> +		      priv->regs, DISP_REG_TDSHP_CFG);
> +
> +	mtk_ddp_write_mask(cmdq_pkt, DISP_TDSHP_TDS_EN, &priv->cmdq_reg, priv->regs,
> +			   DISP_REG_TDSHP_EN, DISP_TDSHP_TDS_EN);
> +}
> +
> +static void mtk_disp_tdshp_start(struct device *dev)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel(DISP_TDSHP_CTRL_EN, priv->regs + DISP_REG_TDSHP_CTRL);
> +}
> +
> +static void mtk_disp_tdshp_stop(struct device *dev)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel(0x0, priv->regs + DISP_REG_TDSHP_CTRL);

writel(0, priv->regs + DISP_REG_TDSHP_CTRL);

> +}
> +

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


