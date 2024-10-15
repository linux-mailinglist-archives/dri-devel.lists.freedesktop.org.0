Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C9899DFB6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 09:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B9F10E525;
	Tue, 15 Oct 2024 07:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C47310E531
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 07:52:13 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XSR640dfQz1HKpS;
 Tue, 15 Oct 2024 15:47:56 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 318021402CA;
 Tue, 15 Oct 2024 15:52:08 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Oct 2024 15:52:07 +0800
Message-ID: <d32b15fa-3b4b-d0ef-ade3-dda44e4abc4d@huawei.com>
Date: Tue, 15 Oct 2024 15:52:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/panel: s6e3ha8: select CONFIG_DRM_DISPLAY_DSC_HELPER
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dzmitry Sankouski <dsankouski@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241015073115.4128727-1-arnd@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20241015073115.4128727-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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



On 2024/10/15 15:30, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The new driver needs the dsc helper code to be available:
> 
> x86_64-linux-ld: vmlinux.o: in function `s6e3ha8_amb577px01_wqhd_prepare':
> panel-samsung-s6e3ha8.c:(.text+0x16b1e65): undefined reference to `drm_dsc_pps_payload_pack'
> 
> Select it from Kconfig as we do for other similar drivers.
> 
> Fixes: 779679d3c164 ("drm/panel: Add support for S6E3HA8 panel driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/panel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index ddfaa99ea9dd..ffe7eff71496 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -626,6 +626,7 @@ config DRM_PANEL_SAMSUNG_AMS639RQ08
>  config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
>  	tristate "Samsung AMS452EF01 panel with S6E88A0 DSI video mode controller"
>  	depends on OF
> +	select DRM_DISPLAY_DSC_HELPER

It seems that it uses DRM_DISPLAY_DP_HELPER in mainline but use
DRM_DISPLAY_DSC_HELPER in next.

>  	select DRM_MIPI_DSI
>  	select VIDEOMODE_HELPERS
>  
