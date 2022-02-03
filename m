Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1514A8D11
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 21:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073D810E4A1;
	Thu,  3 Feb 2022 20:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2DE10E4A1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 20:14:37 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 0b99a305-852e-11ec-b20b-0050568c148b;
 Thu, 03 Feb 2022 20:15:35 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 32295194B90;
 Thu,  3 Feb 2022 21:14:32 +0100 (CET)
Date: Thu, 3 Feb 2022 21:14:30 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/panel: Select DRM_DP_HELPER for DRM_PANEL_EDP
Message-ID: <Yfw3pnlLNuXBo5gD@ravnborg.org>
References: <20220203093922.20754-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203093922.20754-1-tzimmermann@suse.de>
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
Cc: arnd@arndb.de, airlied@linux.ie, rdunlap@infradead.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 naresh.kamboju@linaro.org, Linux Kernel Functional Testing <lkft@linaro.org>,
 ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 10:39:22AM +0100, Thomas Zimmermann wrote:
> As reported in [1], DRM_PANEL_EDP depends on DRM_DP_HELPER. Select
> the option to fix the build failure. The error message is shown
> below.
> 
>   arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in function
>     `panel_edp_probe': panel-edp.c:(.text+0xb74): undefined reference to
>     `drm_panel_dp_aux_backlight'
>   make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1
> 
> The issue has been reported before, when DisplayPort helpers were
> hidden behind the option CONFIG_DRM_KMS_HELPER. [2]
> 
> v2:
> 	* fix and expand commit description (Arnd)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: adb9d5a2cc77 ("drm/dp: Move DisplayPort helpers into separate helper module")
> Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simple")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Link: https://lore.kernel.org/dri-devel/CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com/ # [1]
> Link: https://lore.kernel.org/all/20211117062704.14671-1-rdunlap@infradead.org/ # [2]
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/panel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 434c2861bb40..0aec5a10b064 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -106,6 +106,7 @@ config DRM_PANEL_EDP
>  	depends on PM
>  	select VIDEOMODE_HELPERS
>  	select DRM_DP_AUX_BUS
> +	select DRM_DP_HELPER
>  	help
>  	  DRM panel driver for dumb eDP panels that need at most a regulator and
>  	  a GPIO to be powered up. Optionally a backlight can be attached so
> -- 
> 2.34.1
