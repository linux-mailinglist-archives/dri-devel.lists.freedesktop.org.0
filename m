Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C614E791
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 04:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AC56E1E2;
	Fri, 31 Jan 2020 03:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80F2E6E1E2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 03:27:11 +0000 (UTC)
X-UUID: 7cb84e490a184cbc8ed08f62664eaa56-20200131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aM+4JU8dbdbMJaZA71HRgLbTyLydRZ9ekqagS3/8Hfk=; 
 b=oq1C/cr+Upfy6bCwi4U6zbj5f8qDxol4f9UmScXh3GmV1sPrONyZ1GLCMR2iQWdxDO+YNFnHXg79SLfFnfspzmZKQs2uCKcdLqD6QhBZ2nldgOQEExu9Jv80EQNZ+N82JMlKUDAmQAc5+lqlfITnEZRv9cgJ5K5/Cojm7LJpWn0=;
X-UUID: 7cb84e490a184cbc8ed08f62664eaa56-20200131
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 15410640; Fri, 31 Jan 2020 11:27:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 31 Jan 2020 11:26:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 31 Jan 2020 11:26:05 +0800
Message-ID: <1580441226.9516.1.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Ensure the cursor plane is on top of
 other overlays
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Fri, 31 Jan 2020 11:27:06 +0800
In-Reply-To: <20200130192511.81205-1-sean@poorly.run>
References: <20200130192511.81205-1-sean@poorly.run>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 810A1D44145352546047498F0C8DF1C0A427603B091BFE8EAD7B2B7BBFEFBB822000:8
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
Cc: dcastagna@chromium.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Sean:

On Thu, 2020-01-30 at 14:24 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Currently the cursor is placed on the first overlay plane, which means
> it will be at the bottom of the stack when the hw does the compositing
> with anything other than primary plane. Since mtk doesn't support plane
> zpos, change the cursor location to the top-most plane.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 0dfcd1787e651..4ac76b9613926 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -689,11 +689,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
>  }
>  
>  static inline
> -enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
> +enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
> +					    unsigned int num_planes)
>  {
>  	if (plane_idx == 0)
>  		return DRM_PLANE_TYPE_PRIMARY;
> -	else if (plane_idx == 1)
> +	else if (plane_idx == (num_planes - 1))
>  		return DRM_PLANE_TYPE_CURSOR;
>  	else
>  		return DRM_PLANE_TYPE_OVERLAY;
> @@ -712,7 +713,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
>  		ret = mtk_plane_init(drm_dev,
>  				&mtk_crtc->planes[mtk_crtc->layer_nr],
>  				BIT(pipe),
> -				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
> +				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
> +							num_planes),
>  				mtk_ddp_comp_supported_rotations(comp));
>  		if (ret)
>  			return ret;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
