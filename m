Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF066D0480
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D4210E2C5;
	Thu, 30 Mar 2023 12:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1DD7D10E2C5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:21:11 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:34720.414984776
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 465A210029D;
 Thu, 30 Mar 2023 20:21:05 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-ljp89 with ESMTP id
 e209bfaa51c7405ea15022759e90a9ca for tzimmermann@suse.de; 
 Thu, 30 Mar 2023 20:21:07 CST
X-Transaction-ID: e209bfaa51c7405ea15022759e90a9ca
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <007bc1f7-7f9a-f62a-e3fa-a851208ffd19@189.cn>
Date: Thu, 30 Mar 2023 20:21:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [2/4] drm/armada: Hide fbdev support behind config option
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, linux@armlinux.org.uk,
 javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230330073046.7150-3-tzimmermann@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20230330073046.7150-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>

On 2023/3/30 15:30, Thomas Zimmermann wrote:
> Only build armada's fbdev emulation if CONFIG_DRM_FBDEV_EMULATION
> has been enabled. No functional changes, but allows to build armada
> without fbdev.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/armada/Makefile     |  3 ++-
>   drivers/gpu/drm/armada/armada_drm.h | 14 ++++++++++++--
>   2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/armada/Makefile b/drivers/gpu/drm/armada/Makefile
> index 9bc3c3213724..dc75a7db9ed3 100644
> --- a/drivers/gpu/drm/armada/Makefile
> +++ b/drivers/gpu/drm/armada/Makefile
> @@ -1,7 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0
> -armada-y	:= armada_crtc.o armada_drv.o armada_fb.o armada_fbdev.o \
> +armada-y	:= armada_crtc.o armada_drv.o armada_fb.o \
>   		   armada_gem.o armada_overlay.o armada_plane.o armada_trace.o
>   armada-y	+= armada_510.o
>   armada-$(CONFIG_DEBUG_FS) += armada_debugfs.o
> +armada-$(CONFIG_DRM_FBDEV_EMULATION) += armada_fbdev.o
>   
>   obj-$(CONFIG_DRM_ARMADA) := armada.o
> diff --git a/drivers/gpu/drm/armada/armada_drm.h b/drivers/gpu/drm/armada/armada_drm.h
> index 6a5a87932576..1475146b1c47 100644
> --- a/drivers/gpu/drm/armada/armada_drm.h
> +++ b/drivers/gpu/drm/armada/armada_drm.h
> @@ -75,8 +75,18 @@ struct armada_private {
>   
>   #define drm_to_armada_dev(dev) container_of(dev, struct armada_private, drm)
>   
> -int armada_fbdev_init(struct drm_device *);
> -void armada_fbdev_fini(struct drm_device *);
> +#if defined(CONFIG_DRM_FBDEV_EMULATION)
> +int armada_fbdev_init(struct drm_device *dev);
> +void armada_fbdev_fini(struct drm_device *dev);
> +#else
> +static inline int armada_fbdev_init(struct drm_device *dev)
> +{
> +	return 0;
> +}
> +
> +static inline void armada_fbdev_fini(struct drm_device *dev)
> +{ }
> +#endif
>   
>   int armada_overlay_plane_create(struct drm_device *, unsigned long);
>   
