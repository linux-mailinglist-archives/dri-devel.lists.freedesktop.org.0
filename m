Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C4B44A46C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 03:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EA089991;
	Tue,  9 Nov 2021 02:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53B78997E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 02:06:10 +0000 (UTC)
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HpB9R4QBmzVfsf;
 Tue,  9 Nov 2021 10:03:55 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 dggeme758-chm.china.huawei.com (10.3.19.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Tue, 9 Nov 2021 10:06:07 +0800
Subject: Re: [PATCH] drm: Fix wrong use of connector in vop_get_edp_connector
From: He Ying <heying24@huawei.com>
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <seanpaul@chromium.org>, <gustavo.padovan@collabora.com>
References: <20211025015550.66500-1-heying24@huawei.com>
Message-ID: <60f07638-aca2-a1c5-c80e-c5ea4de6b223@huawei.com>
Date: Tue, 9 Nov 2021 10:06:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211025015550.66500-1-heying24@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
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
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kindly ping...

ÔÚ 2021/10/25 9:55, He Ying Ð´µÀ:
> >From the comments of drm_for_each_connector_iter(), we know
> that "connector is only valid within the list body, if you
> want to use connector after calling drm_connector_list_iter_end()
> then you need to grab your own reference first using
> drm_connector_get()". So fix the wrong use of connector
> according to the comments and then call drm_connector_put()
> after using connector finishes.
>
> Signed-off-by: He Ying <heying24@huawei.com>
> Fixes: 2cbeb64f6c70 ("drm/rockchip: use drm_for_each_connector_iter()")
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index a25b98b7f5bd..469922ad29fa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1581,19 +1581,19 @@ static void vop_crtc_reset(struct drm_crtc *crtc)
>   #ifdef CONFIG_DRM_ANALOGIX_DP
>   static struct drm_connector *vop_get_edp_connector(struct vop *vop)
>   {
> -	struct drm_connector *connector;
> +	struct drm_connector *connector = NULL;
>   	struct drm_connector_list_iter conn_iter;
>   
>   	drm_connector_list_iter_begin(vop->drm_dev, &conn_iter);
>   	drm_for_each_connector_iter(connector, &conn_iter) {
>   		if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> -			drm_connector_list_iter_end(&conn_iter);
> -			return connector;
> +			drm_connector_get(connector);
> +			break;
>   		}
>   	}
>   	drm_connector_list_iter_end(&conn_iter);
>   
> -	return NULL;
> +	return connector;
>   }
>   
>   static int vop_crtc_set_crc_source(struct drm_crtc *crtc,
> @@ -1614,6 +1614,7 @@ static int vop_crtc_set_crc_source(struct drm_crtc *crtc,
>   	else
>   		ret = -EINVAL;
>   
> +	drm_connector_put(connector);
>   	return ret;
>   }
>   
