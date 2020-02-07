Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AEA1553BF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 09:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E9D6FBB6;
	Fri,  7 Feb 2020 08:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96C026FBB6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 08:35:10 +0000 (UTC)
X-UUID: 0256c2ddcaf640b682504a0c78776d0e-20200207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hXWVZ6oSwC7pNQrHxmaSfz6HN+UgtHEL8vkKF8UU45A=; 
 b=i85HRCamkErv65eH5EQ5F4f1Uyu2I6hSbtMVf1IKSu6XRS4JO8CFSpiWBCpjm38ZVuFL54Kde34iD7s3cj6qzxmqwA3i4CVcGqwzMg+6BXlW+FBT8Z5xZygfBb9KjSJJ/74B2zVpNAx5s6efEp8nlntQPFoFjvVOWUxZzLqDDUU=;
X-UUID: 0256c2ddcaf640b682504a0c78776d0e-20200207
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 455714423; Fri, 07 Feb 2020 16:35:07 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 16:35:53 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 7 Feb 2020 16:35:28 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 7 Feb 2020 16:35:28 +0800
Message-ID: <1581064499.590.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
From: CK Hu <ck.hu@mediatek.com>
To: Evan Benn <evanbenn@chromium.org>
Date: Fri, 7 Feb 2020 16:34:59 +0800
In-Reply-To: <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
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

Hi, Evan:

On Fri, 2020-02-07 at 15:23 +1100, Evan Benn wrote:
> The cursor and primary planes were hard coded.
> Now search for them for passing to drm_crtc_init_with_planes
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> ---
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7b392d6c71cc..935652990afa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>  
>  static int mtk_drm_crtc_init(struct drm_device *drm,
>  			     struct mtk_drm_crtc *mtk_crtc,
> -			     struct drm_plane *primary,
> -			     struct drm_plane *cursor, unsigned int pipe)
> +			     unsigned int pipe)
>  {
> -	int ret;
> +	struct drm_plane *primary = NULL;
> +	struct drm_plane *cursor = NULL;
> +	int i, ret;
> +
> +	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +		if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> +			primary = &mtk_crtc->planes[i];
> +		else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> +			cursor = &mtk_crtc->planes[i];
> +	}
>  
>  	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
>  					&mtk_crtc_funcs, NULL);
> @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  			return ret;
>  	}
>  
> -	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> -				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> -				NULL, pipe);
> +	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
>  	if (ret < 0)
>  		return ret;
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
