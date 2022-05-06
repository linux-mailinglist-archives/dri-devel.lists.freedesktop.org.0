Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759C051D450
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 11:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F56710F3C1;
	Fri,  6 May 2022 09:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6491A10E91B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 09:25:26 +0000 (UTC)
X-UUID: 688f16e3e7ce450caa638f2f752d7331-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:ae87eca7-1d53-429e-b0c1-b7b473cea55d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:54
X-CID-INFO: VERSION:1.1.4, REQID:ae87eca7-1d53-429e-b0c1-b7b473cea55d, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:54,FILE:0,RULE:Release_HamU,ACTI
 ON:release,TS:54
X-CID-META: VersionHash:faefae9, CLOUDID:3aced3b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:adb1611c2d41,Recheck:0,SF:28|16|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 688f16e3e7ce450caa638f2f752d7331-20220506
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 911729712; Fri, 06 May 2022 17:25:20 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 6 May 2022 17:25:18 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 17:25:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 17:25:17 +0800
Message-ID: <18560bd9efbcf77bc6b2dc6d2956d7993fcdde85.camel@mediatek.com>
Subject: Re: [PATCH v10, 16/17] media: mediatek: vcodec: support stateless
 VP9 decoding
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Fri, 6 May 2022 17:25:17 +0800
In-Reply-To: <20220505222034.fxw6y7wdf7wy3qi4@notapiano>
References: <20220426100828.13429-1-yunfei.dong@mediatek.com>
 <20220426100828.13429-17-yunfei.dong@mediatek.com>
 <20220505222034.fxw6y7wdf7wy3qi4@notapiano>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

Thanks for your suggestion.

On Thu, 2022-05-05 at 18:20 -0400, Nícolas F. R. A. Prado wrote:
> On Tue, Apr 26, 2022 at 06:08:27PM +0800, Yunfei Dong wrote:
> > Add support for VP9 decoding using the stateless API,
> > as supported by MT8192. And the drivers is lat and core
> > architecture.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Signed-off-by: George Sun <george.sun@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  .../media/platform/mediatek/vcodec/Makefile   |    1 +
> >  .../vcodec/mtk_vcodec_dec_stateless.c         |   26 +-
> >  .../platform/mediatek/vcodec/mtk_vcodec_drv.h |    1 +
> >  .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 2031
> > +++++++++++++++++
> >  .../platform/mediatek/vcodec/vdec_drv_if.c    |    4 +
> >  .../platform/mediatek/vcodec/vdec_drv_if.h    |    1 +
> >  6 files changed, 2061 insertions(+), 3 deletions(-)
> >  create mode 100644
> > drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
> > 
> 
> ...
> 
> > +		use_128 = !frame_is_intra && !vsi-
> > >frame.uh.last_frame_type;
> > +		v4l2_vp9_adapt_coef_probs(pre_frame_ctx_helper,
> > +					  counts_helper,
> > +					  use_128,
> > +					  frame_is_intra);
> 
> Hi Yunfei,
> 
> I'm getting
> 
> ERROR: modpost: "v4l2_vp9_adapt_noncoef_probs"
> [drivers/media/platform/mediatek/vcodec/mtk-vcodec-dec.ko] undefined!
> ERROR: modpost: "v4l2_vp9_adapt_coef_probs"
> [drivers/media/platform/mediatek/vcodec/mtk-vcodec-dec.ko] undefined!
> 
> when building this series.
> 
> Adding
> 	select V4L2_VP9
> to
> 	config VIDEO_MEDIATEK_VCODEC
> solved the issue.
> 
> Thanks,
> Nícolas
I will fix it in next patch

Best Regards,
Yunfei Dong

