Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF21E307030
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 08:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D8789CF6;
	Thu, 28 Jan 2021 07:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id C298B89CF6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 07:52:04 +0000 (UTC)
X-UUID: da41bc8928254adc8fa28c9ad673101a-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a0Hgwxh0U2dNx+VXIaMoTg0BoqJmUmGXjqMHEveUMYI=; 
 b=k7G1Do1mkH8worFAUJwK9gCf4xthpbVWgKX1XSAMwyTsqXOSp38WvQYa+84dsbDQEH9QRESVFprkwbqZsgcMSXzLlfYlf6cgLetu3a73ps4G92bxneHtuw5NCrqXPUnFRkwOnt/tlKwc9D1EqTy4YMU7tuJcK7mZUTecBhaQq9c=;
X-UUID: da41bc8928254adc8fa28c9ad673101a-20210128
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 451889016; Thu, 28 Jan 2021 15:50:57 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 15:50:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 15:50:51 +0800
Message-ID: <1611820251.16091.7.camel@mtksdaap41>
Subject: Re: [PATCH v11 3/9] drm/mediatek: add RDMA fifo size error handle
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 15:50:51 +0800
In-Reply-To: <20210128072802.830971-4-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-4-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 61BF84BE02DCD629C3988D9D0702E6990B22EBCDA46936C4F590F0B3D1E4579F2000:8
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-Yi:

On Thu, 2021-01-28 at 15:27 +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add RDMA fifo size error handle
> rdma fifo size will not always bigger than the calculated threshold
> if that case happened, we need set fifo size as the threshold
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> index b84004394970f..04b9542010b00 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -168,6 +168,10 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
>  	 * account for blanking, and with a pixel depth of 4 bytes:
>  	 */
>  	threshold = width * height * vrefresh * 4 * 7 / 1000000;
> +
> +	if (threshold > rdma_fifo_size)
> +		threshold = rdma_fifo_size;
> +

Please see the discussion in [1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com/

Regards,
CK

>  	reg = RDMA_FIFO_UNDERFLOW_EN |
>  	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
>  	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
