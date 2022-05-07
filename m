Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C742B51E4A7
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 08:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C40A1124FA;
	Sat,  7 May 2022 06:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17669.qiye.163.com (mail-m17669.qiye.163.com
 [59.111.176.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB359112583
 for <dri-devel@lists.freedesktop.org>; Sat,  7 May 2022 06:39:28 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m17669.qiye.163.com (Hmail) with ESMTPA id 363254600F5;
 Sat,  7 May 2022 14:39:26 +0800 (CST)
Message-ID: <45058759-13dd-aa43-ac88-2a7c60baa22b@rock-chips.com>
Date: Sat, 7 May 2022 14:39:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH -next] drm/rockchip: Fix Kconfig dependencies
Content-Language: en-US
To: Ren Zhijie <renzhijie2@huawei.com>, hjc@rock-chips.com, heiko@sntech.de,
 airlied@linux.ie, daniel@ffwll.ch, lyude@redhat.com, tzimmermann@suse.de
References: <20220507010039.117310-1-renzhijie2@huawei.com>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220507010039.117310-1-renzhijie2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRlKQklWS0NLHRlCQk
 4eHkoYVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nk06Izo6LD0rDA1PPzEtPgkU
 LCwwCT5VSlVKTU5KQktOTk1NQ0pKVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSE5PSjcG
X-HM-Tid: 0a809d3e971dda59kuws363254600f5
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

Hi Zhijie:

On 5/7/22 09:00, Ren Zhijie wrote:
> If CONFIG_ROCKCHIP_ANALOGIX_DP is not set, the rockchip drm driver
> will fail to link:
>
> drivers/gpu/drm/rockchip/cdn-dp-core.o: In function `cdn_dp_connector_mode_valid':
> cdn-dp-core.c:(.text+0x1e1): undefined reference to `drm_dp_bw_code_to_link_rate'
> cdn-dp-core.c:(.text+0x1f4): undefined reference to `drm_dp_bw_code_to_link_rate'
> drivers/gpu/drm/rockchip/cdn-dp-core.o: In function `cdn_dp_pd_event_work':
> cdn-dp-core.c:(.text+0x138e): undefined reference to `drm_dp_channel_eq_ok'
> drivers/gpu/drm/rockchip/cdn-dp-reg.o: In function `cdn_dp_train_link':
> cdn-dp-reg.c:(.text+0xd5a): undefined reference to `drm_dp_bw_code_to_link_rate'
>
> The problem is that the DP-helper module has been replaced by the display-helper module.
> So the driver have to select it.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 1e0f66420b13("drm/display: Introduce a DRM display-helper module")
> Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>
> ---
>   drivers/gpu/drm/rockchip/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index 5afab49dc4f2..eb9ffa9e357d 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -47,6 +47,8 @@ config ROCKCHIP_ANALOGIX_DP
>   config ROCKCHIP_CDN_DP
>   	bool "Rockchip cdn DP"
>   	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
> +	select DRM_DISPLAY_HELPER
> +	select DRM_DISPLAY_DP_HELPER


There are two dp(ANALOGIX_DP and CDN_DP) at rockchip drm mainline,

for a totally cleanup and alignment, I think it's better to remove 
"select DRM_DISPLAY_HELPER if ROCKCHIP_ANALOGIX_DP" under DRM_ROCKCHIP  
at the head,

and separately add the select for ROCKCHIP_ANALOGIX_DP and ROCKCHIP_CDN_DP.

>   	help
>   	  This selects support for Rockchip SoC specific extensions
>   	  for the cdn DP driver. If you want to enable Dp on
