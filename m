Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318E8AFC294
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B28B10E0DE;
	Tue,  8 Jul 2025 06:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="qbvQV5GO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E66210E0DE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 06:21:43 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5686LF8g434666;
 Tue, 8 Jul 2025 01:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1751955675;
 bh=OkSWT05sAkPYcNvVGxqzgipPqYW0hlLg3aEwAB+Xfxc=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=qbvQV5GOb7kq7B8SZ4dc42Tte4zsRA7HoLDvq0GdAnBlgXNUNXew9lFe4gRa79n99
 2pW5X7OKFM0tKwDC54m4fipn8Sqh6ptWt7bc8FP6Hf15DcBz+kDbQmzYS0z9+31NMT
 gaHgCd5EIlpewjxdNdYQXcOuXrPbY2ml0Z4oLNM4=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5686LEq02117160
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 8 Jul 2025 01:21:14 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 8
 Jul 2025 01:21:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 8 Jul 2025 01:21:14 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.227.193])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5686LBQs1282310;
 Tue, 8 Jul 2025 01:21:11 -0500
Message-ID: <85c13da7-89f4-48e6-8a52-17f4df7a58b5@ti.com>
Date: Tue, 8 Jul 2025 11:51:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tidss: oldi: convert to devm_drm_bridge_alloc() API
To: Jayesh Choudhary <j-choudhary@ti.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <tomi.valkeinen@ideasonboard.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
References: <20250701055002.52336-1-j-choudhary@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250701055002.52336-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/07/25 11:20, Jayesh Choudhary wrote:
> DRM bridges now uses "devm_drm_bridge_alloc()" for allocation and

s/uses/use

> initialization. "devm_kzalloc()" is not allowed anymore and it results
> in WARNING. So convert it.
> 
> Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh

> ---
> 
> Warning log:
> <https://gist.github.com/Jayesh2000/e42c235bb57cb0f0af06c8c3bf886ef2>
> 
>   drivers/gpu/drm/tidss/tidss_oldi.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
> index 8223b8fec8ce..b0f99656e87e 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -534,11 +534,10 @@ int tidss_oldi_init(struct tidss_device *tidss)
>   			continue;
>   		}
>   
> -		oldi = devm_kzalloc(tidss->dev, sizeof(*oldi), GFP_KERNEL);
> -		if (!oldi) {
> -			ret = -ENOMEM;
> -			goto err_put_node;
> -		}
> +		oldi = devm_drm_bridge_alloc(tidss->dev, struct tidss_oldi, bridge,
> +					     &tidss_oldi_bridge_funcs);
> +		if (IS_ERR(oldi))
> +			return PTR_ERR(oldi);
>   
>   		oldi->parent_vp = parent_vp;
>   		oldi->oldi_instance = oldi_instance;
> @@ -577,7 +576,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
>   		/* Register the bridge. */
>   		oldi->bridge.of_node = child;
>   		oldi->bridge.driver_private = oldi;
> -		oldi->bridge.funcs = &tidss_oldi_bridge_funcs;
>   		oldi->bridge.timings = &default_tidss_oldi_timings;
>   
>   		tidss->oldis[tidss->num_oldis++] = oldi;
