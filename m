Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD6FBDC907
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 07:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453F010E6F9;
	Wed, 15 Oct 2025 05:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="tVm7KNK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34EA10E6F9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 05:00:46 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59F50LLL1759383;
 Wed, 15 Oct 2025 00:00:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760504421;
 bh=N8Nr/O2p1n7vNJNen7wumkPxZE0uRF+oLmO2lZv2enw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=tVm7KNK4YGzYE8mnZYC/eI5rIVgaEKTABn9PClCCGUggS+QdNjTS9Fs1bwuonVxOM
 vbVqs5cQ5eKkwVXGjLWhE6aszantTZJ6wk7+D/EAdy3fx91CFqU350Ciq1uKHCM9tb
 HSyWt2RPaU1oSdG7kXStPAl04p4BYw26JQzpaJuY=
Received: from DLEE215.ent.ti.com (dlee215.ent.ti.com [157.170.170.118])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59F50L1o145846
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 Oct 2025 00:00:21 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 00:00:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 00:00:20 -0500
Received: from [10.249.128.221] ([10.249.128.221])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59F50DaA1332747;
 Wed, 15 Oct 2025 00:00:14 -0500
Message-ID: <7a158fa1-9a82-444c-a198-d90bf1ebf1fb@ti.com>
Date: Wed, 15 Oct 2025 10:30:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tilcdc: Fix removal actions in case of failed probe
To: Kory Maincent <kory.maincent@bootlin.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>,
 Douglas Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: Bajjuri Praneeth <praneeth@ti.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, <thomas.petazzoni@bootlin.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251014143229.559564-1-kory.maincent@bootlin.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20251014143229.559564-1-kory.maincent@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Köry,
Thanks for the patch.

On 14-10-2025 20:02, Kory Maincent wrote:
> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
> 
> The drm_kms_helper_poll_fini() and drm_atomic_helper_shutdown() helpers
> should only be called when the device has been successfully registered.
> Currently, these functions are called unconditionally in tilcdc_fini(),
> which causes warnings during probe deferral scenarios.
> 
> [    7.972317] WARNING: CPU: 0 PID: 23 at drivers/gpu/drm/drm_atomic_state_helper.c:175 drm_atomic_helper_crtc_duplicate_state+0x60/0x68
> ...
> [    8.005820]  drm_atomic_helper_crtc_duplicate_state from drm_atomic_get_crtc_state+0x68/0x108
> [    8.005858]  drm_atomic_get_crtc_state from drm_atomic_helper_disable_all+0x90/0x1c8
> [    8.005885]  drm_atomic_helper_disable_all from drm_atomic_helper_shutdown+0x90/0x144
> [    8.005911]  drm_atomic_helper_shutdown from tilcdc_fini+0x68/0xf8 [tilcdc]
> [    8.005957]  tilcdc_fini [tilcdc] from tilcdc_pdev_probe+0xb0/0x6d4 [tilcdc]
> 
> Fix this by moving both drm_kms_helper_poll_fini() and
> drm_atomic_helper_shutdown() inside the priv->is_registered conditional
> block, ensuring they only execute after successful device registration.
> 
> Fixes: 3c4babae3c4a ("drm: Call drm_atomic_helper_shutdown() at shutdown/remove time for misc drivers")
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---

I would suggest the same, as Maxime mentioned to improve the driver to 
replace the deprecated functions with better alternatives. But as you 
mentioned, you are working on improving the driver and for now to remove 
unwanted warnings it is good to have this patch in drm misc next.

Reviewed-by: Swamil Jain <s-jain1@ti.com>

---
Regards,
Swamil>   drivers/gpu/drm/tilcdc/tilcdc_drv.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 7caec4d38ddf..2031267a3490 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -172,11 +172,11 @@ static void tilcdc_fini(struct drm_device *dev)
>   	if (priv->crtc)
>   		tilcdc_crtc_shutdown(priv->crtc);
>   
> -	if (priv->is_registered)
> +	if (priv->is_registered) {
>   		drm_dev_unregister(dev);
> -
> -	drm_kms_helper_poll_fini(dev);
> -	drm_atomic_helper_shutdown(dev);
> +		drm_kms_helper_poll_fini(dev);
> +		drm_atomic_helper_shutdown(dev);
> +	}
>   	tilcdc_irq_uninstall(dev);
>   	drm_mode_config_cleanup(dev);
>   

