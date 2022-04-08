Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9DB4F8BD8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 03:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71BC10E085;
	Fri,  8 Apr 2022 01:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED6E10E085
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 01:36:32 +0000 (UTC)
X-UUID: d52a4ffa836f408aa4a8bd25f04c60d3-20220408
X-UUID: d52a4ffa836f408aa4a8bd25f04c60d3-20220408
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2074834216; Fri, 08 Apr 2022 09:36:19 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 8 Apr 2022 09:36:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 09:36:17 +0800
Message-ID: <6afe7366ceffb77674d34c48f84aa85b1c088bc3.camel@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: dpi: Use mt8183 output formats for mt8192
From: CK Hu <ck.hu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <jitao.shi@mediatek.com>,
 <rex-bc.chen@mediatek.com>
Date: Fri, 8 Apr 2022 09:36:17 +0800
In-Reply-To: <20220408011907.672120-1-nfraprado@collabora.com>
References: <20220408011907.672120-1-nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Jitao & Rex:

Please help to comment on this patch.

On Thu, 2022-04-07 at 21:19 -0400, Nícolas F. R. A. Prado wrote:
> The configuration for mt8192 was incorrectly using the output formats
> from mt8173. Since the output formats for mt8192 are instead the same
> ones as for mt8183, which require two bus samples per pixel, the
> pixelclock and DDR edge setting were misconfigured. This made
> external
> displays unable to show the image.
> 
> Fix the issue by correcting the output format for mt8192 to be the
> same
> as for mt8183, fixing the usage of external displays for mt8192.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 4554e2de1430..e61cd67b978f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -819,8 +819,8 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.cal_factor = mt8183_calculate_factor,
>  	.reg_h_fre_con = 0xe0,
>  	.max_clock_khz = 150000,
> -	.output_fmts = mt8173_output_fmts,
> -	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> +	.output_fmts = mt8183_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>  };
>  
>  static int mtk_dpi_probe(struct platform_device *pdev)

