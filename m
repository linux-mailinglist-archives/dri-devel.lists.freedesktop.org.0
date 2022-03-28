Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4544E8BBA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 03:46:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD76E10EA09;
	Mon, 28 Mar 2022 01:46:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D4510E0EB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 01:46:15 +0000 (UTC)
X-UUID: cc02df59dc6545e4b2e68572709dce71-20220328
X-UUID: cc02df59dc6545e4b2e68572709dce71-20220328
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1747605447; Mon, 28 Mar 2022 09:46:08 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 28 Mar 2022 09:46:06 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 28 Mar 2022 09:46:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 09:46:06 +0800
Message-ID: <d5f8ec6f4b35f7db71b0261c9ddbbae9ccce90d4.camel@mediatek.com>
Subject: Re: [PATCH v9 21/22] drm/mediatek: change the aux retries times
 when receiving AUX_DEFER
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, <airlied@linux.ie>,
 <angelogioacchino.delregno@collabora.com>, <chunfeng.yun@mediatek.com>,
 <chunkuang.hu@kernel.org>, <ck.hu@mediatek.com>, <daniel@ffwll.ch>,
 <deller@gmx.de>, <jitao.shi@mediatek.com>, <kishon@ti.com>,
 <krzk+dt@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <matthias.bgg@gmail.com>, <mripard@kernel.org>, <p.zabel@pengutronix.de>,
 <robh+dt@kernel.org>, <tzimmermann@suse.de>, <vkoul@kernel.org>
Date: Mon, 28 Mar 2022 09:46:06 +0800
In-Reply-To: <20220327223927.20848-22-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-22-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-03-28 at 00:39 +0200, Guillaume Ranquet wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> DP 1.4a Section 2.8.7.1.5.6.1:
> A DP Source device shall retry at least seven times upon receiving
> AUX_DEFER before giving up the AUX transaction.
> 
> Aux should retry to send msg whether how many bytes.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index e099491cc6a4..7a197c4a7143 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2016,7 +2016,7 @@ static ssize_t mtk_dp_aux_transfer(struct
> drm_dp_aux *mtk_aux,
>  	bool is_read;
>  	u8 request;
>  	size_t accessed_bytes = 0;
> -	int retry = 3, ret = 0;
> +	int retry, ret = 0;
>  
>  	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
>  
> @@ -2050,14 +2050,21 @@ static ssize_t mtk_dp_aux_transfer(struct
> drm_dp_aux *mtk_aux,
>  	}
>  
>  	if (msg->size == 0) {
> -		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
> -					     msg->address +
> accessed_bytes,
> -					     msg->buffer +
> accessed_bytes, 0);
> +		retry = 32;
> +		while (retry--) {
> +			ret = mtk_dp_aux_do_transfer(mtk_dp, is_read,
> request,
> +						     msg->address +
> accessed_bytes,
> +						     msg->buffer +
> accessed_bytes, 0);
> +			if (ret == 0)
> +				break;
> +			usleep_range(500, 600);
> +		}
>  	} else {
>  		while (accessed_bytes < msg->size) {
>  			size_t to_access =
>  				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
>  				      msg->size - accessed_bytes);
> +			retry = 32;
>  			while (retry--) {
>  				ret = mtk_dp_aux_do_transfer(mtk_dp,
>  							     is_read,
> request,
> @@ -2066,7 +2073,7 @@ static ssize_t mtk_dp_aux_transfer(struct
> drm_dp_aux *mtk_aux,
>  							     to_access)
> ;
>  				if (ret == 0)
>  					break;
> -				usleep_range(50, 100);
> +				usleep_range(500, 600);
>  			}
>  			if (!retry || ret) {
>  				drm_info(mtk_dp->drm_dev,

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

