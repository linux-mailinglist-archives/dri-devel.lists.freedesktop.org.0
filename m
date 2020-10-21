Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D60294914
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3346E9B2;
	Wed, 21 Oct 2020 07:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1726B6E9BB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 07:47:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09L7lZjt067740;
 Wed, 21 Oct 2020 02:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1603266455;
 bh=f+MvARHnO7fvedsDmnwEPUrROFEMQRAKmSUnYaW2Phs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PZT5lq3WuQn5LIkzTv7u+CJQuvdfzKLHWMaNEvsZeLBVD4sFkwEn/HUyUF0vWYdQI
 w+sYnOP1Mh437yRafI8JyvyUUJZMztb3P6uRGhF+XsfuX68m2jQTSmg78/lsz2RDA/
 iC1l/Vislog8DgluXQ16YWNelf4Dc/oB3DUBigS4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09L7lYsu122473
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Oct 2020 02:47:34 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 02:47:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 02:47:34 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09L7lXgw098065;
 Wed, 21 Oct 2020 02:47:33 -0500
Subject: Re: [PATCH 1/5] drm/tidss: Move to newer connector model
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <dri-devel@lists.freedesktop.org>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-2-nikhil.nd@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <17124389-948e-35c8-b7c1-5e419ea462cb@ti.com>
Date: Wed, 21 Oct 2020 10:47:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016103917.26838-2-nikhil.nd@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/10/2020 13:39, Nikhil Devshatwar wrote:
> To be able to support connector operations across multiple
> bridges, it is recommended that the connector should be
> created by the SoC driver instead of the bridges.
> 
> Modify the tidss modesetting initialization sequence to
> create the connector and attach bridges with flag
> DRM_BRIDGE_ATTACH_NO_CONNECTOR
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.h |  3 +++
>  drivers/gpu/drm/tidss/tidss_kms.c | 15 ++++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index 7de4bba52e6f..cfbf85a4d92b 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -27,6 +27,9 @@ struct tidss_device {
>  	unsigned int num_planes;
>  	struct drm_plane *planes[TIDSS_MAX_PLANES];
>  
> +	unsigned int num_connectors;
> +	struct drm_connector *connectors[TIDSS_MAX_PORTS];
> +
>  	spinlock_t wait_lock;	/* protects the irq masks */
>  	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
>  };
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index 09485c7f0d6f..51c24b4a6a21 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -7,6 +7,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
> @@ -192,6 +193,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>  	for (i = 0; i < num_pipes; ++i) {
>  		struct tidss_plane *tplane;
>  		struct tidss_crtc *tcrtc;
> +		struct drm_connector *connector;
>  		struct drm_encoder *enc;
>  		u32 hw_plane_id = feat->vid_order[tidss->num_planes];
>  		int ret;
> @@ -222,11 +224,22 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
>  			return PTR_ERR(enc);
>  		}
>  
> -		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL, 0);
> +		ret = drm_bridge_attach(enc, pipes[i].bridge, NULL,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>  		if (ret) {
>  			dev_err(tidss->dev, "bridge attach failed: %d\n", ret);
>  			return ret;
>  		}
> +
> +		connector = drm_bridge_connector_init(&tidss->ddev, enc);
> +		if (IS_ERR(connector)) {
> +			dev_err(tidss->dev, "bridge_connector create failed\n");
> +			return PTR_ERR(connector);
> +		}
> +
> +		tidss->connectors[tidss->num_connectors++] = connector;
> +
> +		drm_connector_attach_encoder(connector, enc);

This call may return an error.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
