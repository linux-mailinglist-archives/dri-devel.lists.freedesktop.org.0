Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942D61E466F
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 16:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E0E6E317;
	Wed, 27 May 2020 14:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C986E317
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 14:52:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 41D0780512;
 Wed, 27 May 2020 16:52:28 +0200 (CEST)
Date: Wed, 27 May 2020 16:52:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm: pl111: add CONFIG_VEXPRESS_CONFIG dependency
Message-ID: <20200527145226.GA91560@ravnborg.org>
References: <20200527133158.462057-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527133158.462057-1-arnd@arndb.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=6kCPPG7m61ZZewUP65gA:9 a=CjuIK1q_8ugA:10
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd.

On Wed, May 27, 2020 at 03:31:42PM +0200, Arnd Bergmann wrote:
> The vexpress_config code fails to link in some configurations:
> 
> drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_versatile_init':
> (.text+0x1f0): undefined reference to `devm_regmap_init_vexpress_config'
> 
> Add a dependency that links to this only if the dependency is there,
> and prevent the configuration where the drm driver is built-in but
> the config is a loadable module.
> 
> Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Could this be another way to fix it:

diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
index 64f01a4e6767..1c38d3bd2e84 100644
--- a/drivers/gpu/drm/pl111/pl111_versatile.c
+++ b/drivers/gpu/drm/pl111/pl111_versatile.c
@@ -379,7 +379,7 @@ static int pl111_vexpress_clcd_init(struct device *dev, struct device_node *np,
        u32 val;
        int ret;

-       if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
+       if (!IS_REACHABLE(CONFIG_VEXPRESS_CONFIG))
                return -ENODEV;

        /*


Then we no longer have the whole driver depending on
the value of VEXPRESS_CONFIG.
Not that I like IS_REACHABLE() but we already had
IS_ENABLED() to cover up here, and that was not enough.

With your patch would we then need the IS_ENABLED()
check?

	Sam

> ---
>  drivers/gpu/drm/pl111/Kconfig           | 1 +
>  drivers/gpu/drm/pl111/pl111_versatile.c | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index 80f6748055e3..33a005816fdd 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -3,6 +3,7 @@ config DRM_PL111
>  	tristate "DRM Support for PL111 CLCD Controller"
>  	depends on DRM
>  	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on VEXPRESS_CONFIG || !VEXPRESS_CONFIG
>  	depends on COMMON_CLK
>  	select DRM_KMS_HELPER
>  	select DRM_KMS_CMA_HELPER
> diff --git a/drivers/gpu/drm/pl111/pl111_versatile.c b/drivers/gpu/drm/pl111/pl111_versatile.c
> index 64f01a4e6767..451d74205108 100644
> --- a/drivers/gpu/drm/pl111/pl111_versatile.c
> +++ b/drivers/gpu/drm/pl111/pl111_versatile.c
> @@ -476,7 +476,8 @@ int pl111_versatile_init(struct device *dev, struct pl111_drm_dev_private *priv)
>  	versatile_clcd_type = (enum versatile_clcd)clcd_id->data;
>  
>  	/* Versatile Express special handling */
> -	if (versatile_clcd_type == VEXPRESS_CLCD_V2M) {
> +	if (IS_ENABLED(CONFIG_VEXPRESS_CONFIG) &&
> +	    versatile_clcd_type == VEXPRESS_CLCD_V2M) {
>  		int ret = pl111_vexpress_clcd_init(dev, np, priv);
>  		of_node_put(np);
>  		if (ret)
> -- 
> 2.26.2
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
