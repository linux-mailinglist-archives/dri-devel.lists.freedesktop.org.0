Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E2953403
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 16:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0445710E434;
	Thu, 15 Aug 2024 14:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="OYJVc1T2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292510E44A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fUdYMf0fIQJ6ml8nv0t9/DBiRHKMZgkMHt7sQfyC6Yo=; b=OYJVc1T2qui93MirtcLWGtxnsX
 zLjIiVVi5ZbGQV0oovmYfOsXgOZ/uIOHK6uyln/OrWfpihGSUP2PXJ+Atde2uNwZ0aC19IJ+dJy3s
 LCPdJV1+Qd/ZkLIXP4lLID7EJ5yOCRfs8YLthEIgSWVzYj/5eCWka9c+eUcZgGSYpYFU8k10c4j1q
 0qt88wmrWjDHfnuuJI+9KZbEE+eIKNnuNQI/07/co3r61Z6MmpcYNROBjwIXvALd3HkdaRf6s9HsE
 xE8rCDPF6Cv+2+jR6YR9pS+QWg8pOiR8rwQBGAeGYZUphkRdH+lIiVI33glNj0CXyBX97xIym6oDW
 dCa83ngg==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sebMF-0003fh-7S; Thu, 15 Aug 2024 16:21:43 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Mark Yao <markyao0591@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/rockchip: Unregister platform drivers in
 reverse order
Date: Thu, 15 Aug 2024 16:21:42 +0200
Message-ID: <9027071.qdD9tO9HgI@diego>
In-Reply-To: <20240808-rk-drm-fix-unreg-v1-1-c30d9a754722@collabora.com>
References: <20240808-rk-drm-fix-unreg-v1-1-c30d9a754722@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Donnerstag, 8. August 2024, 13:58:02 CEST schrieb Cristian Ciocaltea:
> Move rockchip_drm_platform_driver unregistration after its sub-drivers,
> which ensures all drivers are unregistered in the reverse order used
> when they were registered.

are you sure about that?

I.e. currently rockchip_drm_init() does 
  platform_register_drivers(rockchip_sub_drivers, ...)
to register the sub-drivers and only after that registers the main
drm-platform-driver

rockchip_drm_fini currently does the reverse of first unregistering the
main drm-platform-driver and after that unregistering the array of sub-
drivers.


So as it stands right now, rockchip_drm_fini does already do exactly the
reverse when de-registering.

> Fixes: 8820b68bd378 ("drm/rockchip: Refactor the component match logic.")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 44d769d9234d..ca7b07503fbe 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -528,10 +528,9 @@ static int __init rockchip_drm_init(void)
>  
>  static void __exit rockchip_drm_fini(void)
>  {
> -	platform_driver_unregister(&rockchip_drm_platform_driver);
> -
>  	platform_unregister_drivers(rockchip_sub_drivers,
>  				    num_rockchip_sub_drivers);
> +	platform_driver_unregister(&rockchip_drm_platform_driver);
>  }
>  
>  module_init(rockchip_drm_init);
> 
> ---
> base-commit: 1eb586a9782cde8e5091b9de74603e0a8386b09e
> change-id: 20240702-rk-drm-fix-unreg-9f3f29996a00
> 




