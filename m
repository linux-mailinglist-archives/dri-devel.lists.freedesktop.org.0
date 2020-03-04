Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD776178891
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 03:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5F16EAA3;
	Wed,  4 Mar 2020 02:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 619016EAA3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 02:41:04 +0000 (UTC)
X-UUID: 804602366f134ddfb09bf3b2940cae11-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mwCceAp0UE9DP1V1oSslAhzkGTPBm2qHepKguK+CBVs=; 
 b=b8h3XU705L8I67ozIIDv1hw4ls4Mzu6TOah08CH+8hm1iyvhZlur8ZnpypnYQQ3TNCNM50dsaSEWyy/tZzyp7zll9Ow0B96v7fAjUtx13uf+IXIWeIEF6odBi8cEqH0VkiBGcwRzl39fXCw/dI82utaIV61OdYCuR5KKspb6jGk=;
X-UUID: 804602366f134ddfb09bf3b2940cae11-20200304
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2121261097; Wed, 04 Mar 2020 10:41:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 10:39:59 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 10:40:20 +0800
Message-ID: <1583289660.32049.4.camel@mtksdaap41>
Subject: Re: [PATCH v4 10/13] soc: mediatek: cmdq: export finalize function
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Wed, 4 Mar 2020 10:41:00 +0800
In-Reply-To: <1583233125-7827-11-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-11-git-send-email-dennis-yc.hsieh@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, David
 Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dennis:

On Tue, 2020-03-03 at 18:58 +0800, Dennis YC Hsieh wrote:
> Export finalize function to client which helps append eoc and jump
> command to pkt. Let client decide call finalize or not.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 1 +
>  drivers/soc/mediatek/mtk-cmdq-helper.c  | 7 ++-----
>  include/linux/soc/mediatek/mtk-cmdq.h   | 8 ++++++++
>  3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 0dfcd1787e65..7daaabc26eb1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -490,6 +490,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
>  		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
>  		mtk_crtc_ddp_config(crtc, cmdq_handle);
> +		cmdq_pkt_finalize(cmdq_handle);
>  		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
>  	}
>  #endif
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index a9ebbabb7439..59bc1164b411 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -372,7 +372,7 @@ int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_assign);
>  
> -static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> +int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  {
>  	struct cmdq_instruction inst = { {0} };
>  	int err;
> @@ -392,6 +392,7 @@ static int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  
>  	return err;
>  }
> +EXPORT_SYMBOL(cmdq_pkt_finalize);
>  
>  static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
>  {
> @@ -426,10 +427,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>  	unsigned long flags = 0;
>  	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
>  
> -	err = cmdq_pkt_finalize(pkt);
> -	if (err < 0)
> -		return err;
> -
>  	pkt->cb.cb = cb;
>  	pkt->cb.data = data;
>  	pkt->async_cb.cb = cmdq_pkt_flush_async_cb;
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index fec292aac83c..99e77155f967 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -213,6 +213,14 @@ int cmdq_pkt_poll_mask(struct cmdq_pkt *pkt, u8 subsys,
>   */
>  int cmdq_pkt_assign(struct cmdq_pkt *pkt, u16 reg_idx, u32 value);
>  
> +/**
> + * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
> + * @pkt:	the CMDQ packet
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
> +
>  /**
>   * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
>   *                          packet and call back at the end of done packet

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
