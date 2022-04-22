Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B10950AD08
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 03:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA4310E0FD;
	Fri, 22 Apr 2022 01:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962C610E0FD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 01:04:07 +0000 (UTC)
X-UUID: f4f2c7ee9c0648b988c8140a9e814dfb-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d3796ba4-d536-49cf-8b2d-761a0bbb9a81, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:2c3c88f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f4f2c7ee9c0648b988c8140a9e814dfb-20220422
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 574791216; Fri, 22 Apr 2022 09:04:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 09:03:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 09:03:59 +0800
Message-ID: <675df530698d609c8cf6df666017f36533a9663a.camel@mediatek.com>
Subject: Re: [PATCH v2] drm/mediatek: dpi: Use mt8183 output formats for mt8192
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, "=?ISO-8859-1?Q?N=EDcolas?= F. R.
 A. Prado" <nfraprado@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 22 Apr 2022 09:03:59 +0800
In-Reply-To: <91c52b76872e6339cce3bd671f4ae1143251e2c3.camel@mediatek.com>
References: <20220408013950.674477-1-nfraprado@collabora.com>
 <91c52b76872e6339cce3bd671f4ae1143251e2c3.camel@mediatek.com>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, 2022-04-20 at 20:23 +0800, Rex-BC Chen wrote:
> On Thu, 2022-04-07 at 21:39 -0400, Nícolas F. R. A. Prado wrote:
> > The configuration for mt8192 was incorrectly using the output
> > formats
> > from mt8173. Since the output formats for mt8192 are instead the
> > same
> > ones as for mt8183, which require two bus samples per pixel, the
> > pixelclock and DDR edge setting were misconfigured. This made
> > external
> > displays unable to show the image.
> > 
> > Fix the issue by correcting the output format for mt8192 to be the
> > same
> > as for mt8183, fixing the usage of external displays for mt8192.
> > 
> > Fixes: be63f6e8601f ("drm/mediatek: dpi: Add output bus formats to
> > driver data")
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> > 
> > Changes in v2:
> > - Added Fixes tag
> > 
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4554e2de1430..e61cd67b978f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -819,8 +819,8 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >  	.cal_factor = mt8183_calculate_factor,
> >  	.reg_h_fre_con = 0xe0,
> >  	.max_clock_khz = 150000,
> > -	.output_fmts = mt8173_output_fmts,
> > -	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +	.output_fmts = mt8183_output_fmts,
> > +	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> >  };
> >  
> >  static int mtk_dpi_probe(struct platform_device *pdev)
> 
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Hello CK,
> 
> Gentle ping for this patch.
> This patch is confirmed by Xinlei and Jitao.

Applied to mediatek-drm-next [1].

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> BRs,
> Rex
> 

