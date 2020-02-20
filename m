Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBF216544E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 02:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EDF89B9F;
	Thu, 20 Feb 2020 01:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 25B7789B9F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 01:36:13 +0000 (UTC)
X-UUID: 8822993177144f7cae617536a7168d95-20200220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=M86BLgqozbH/Kl6AgJIXd8CaALScxACbiWE+AGXHu0M=; 
 b=Cj+GpElCDUUggrUPzXSWal+0LBXA/Js6cHOFqPE/HSfaiaFT5cQVqGJOVhIk4xx0Y8hcHvzyj1y6Q9oTXDtHHS3Uj3fqXFw9iZpkhY6n4ouBXRHWRSCrFNfZ8aENxznZvMCINcJKXhRTUIxqURVMkFU95xxb1IPgavATLujoa7g=;
X-UUID: 8822993177144f7cae617536a7168d95-20200220
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 23207877; Thu, 20 Feb 2020 09:36:09 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 20 Feb 2020 09:36:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 20 Feb 2020 09:35:31 +0800
Message-ID: <1582162568.24713.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: component type MTK_DISP_OVL_2L is not
 correctly handled
From: CK Hu <ck.hu@mediatek.com>
To: Phong LE <ple@baylibre.com>
Date: Thu, 20 Feb 2020 09:36:08 +0800
In-Reply-To: <20200219141324.29299-1-ple@baylibre.com>
References: <20200219141324.29299-1-ple@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Phong:

On Wed, 2020-02-19 at 15:13 +0100, Phong LE wrote:
> The larb device remains NULL if the type is MTK_DISP_OVL_2L.
> A kernel panic is raised when a crtc uses mtk_smi_larb_get or
> mtk_smi_larb_put.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Phong LE <ple@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 1f5a112bb034..57c88de9a329 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -471,6 +471,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
>  	/* Only DMA capable components need the LARB property */
>  	comp->larb_dev = NULL;
>  	if (type != MTK_DISP_OVL &&
> +	    type != MTK_DISP_OVL_2L &&
>  	    type != MTK_DISP_RDMA &&
>  	    type != MTK_DISP_WDMA)
>  		return 0;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
