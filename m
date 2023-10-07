Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374FE7BC851
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 16:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1507E10E032;
	Sat,  7 Oct 2023 14:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8F610E032
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 14:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kw1C+v/evicFHLJez3Kxt6vWUW+YpTt9MOCyr0IkQLk=; b=FWKD78XVKTN/aKL9EKyyFzX9KE
 PIIMWe/kz2pAOqifarTXXUCcTUuPCUM+pt6IHQz/FcuIw9pTFzQMWNSpnzy5QTrIxok2OAiQCbblu
 0gHodfR4Rz3MTGfTko8r8y6eCu6o0jghivZLYEasZHpZpEgLqsBC+D6f+q3R0t/Xn7VB+XsWiTfye
 IzUoij2dnI9FQIam8Du2BNEx+qGePs84VS0kEx+5hAP33Iuo9c9FFSZVJxUiOHpjFWWIv9z4Y7ZYo
 g4JfF1ml6KCr55FOWqUAw5k3REAv9ZFshs0x/VD/xwwu5y/t9SJjdy75MSdOMUH8AagEuVU3sk59l
 IHdpdDNg==;
Received: from [2a01:799:95f:2800:2fb5:c6db:11b1:a10f] (port=50008)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1qp8K4-003Xd1-MS;
 Sat, 07 Oct 2023 16:30:28 +0200
Message-ID: <b010433e-ab8f-44b4-b3db-23966f5e6526@tronnes.org>
Date: Sat, 7 Oct 2023 16:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/mgag200: Add drm_panic support
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-5-jfalempe@redhat.com>
From: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
In-Reply-To: <20231003142508.190246-5-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: gpiccoli@igalia.com, noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/3/23 16:22, Jocelyn Falempe wrote:
> Add support for the drm_panic module, which displays a message to
> the screen when a kernel panic occurs.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 976f0ab2006b..229d9c116b42 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -12,10 +12,12 @@
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_framebuffer.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_module.h>
> +#include <drm/drm_panic.h>
>  #include <drm/drm_pciids.h>
>  
>  #include "mgag200_drv.h"
> @@ -83,6 +85,27 @@ resource_size_t mgag200_probe_vram(void __iomem *mem, resource_size_t size)
>  	return offset - 65536;
>  }
>  
> +static int mgag200_get_scanout_buffer(struct drm_device *dev,
> +				      struct drm_scanout_buffer *sb)
> +{
> +	struct drm_plane *plane;
> +	struct mga_device *mdev = to_mga_device(dev);
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(mdev->vram);
> +
> +	/* mgag200 has only one plane */
> +	drm_for_each_plane(plane, dev) {

In my first 2016 attempt on a panic handler I was told to trylock crtc
and plane and skip if it wasn't possible:

- We need locking. One of the biggest problems with the old oops handling
  was that it was very good at trampling over driver state, causing more
  (unrelated) oopses in kms code and making sure the original oops was no
  longer visible. I think the shared code must take care of all the
  locking needs to avoid fragile code in drivers. ww_mutex_trylock on the
  drm_crtc and drm_plane should be enough (we need both for drivers where
  planes can be reassigned between drivers).

See [1] for a list of other things to consider.

Noralf.

[1]
https://lore.kernel.org/dri-devel/20160810091529.GQ6232@phenom.ffwll.local/

> +		if (!plane->state || !plane->state->fb)
> +			return -ENODEV;
> +		sb->format = plane->state->fb->format;
> +		sb->width = plane->state->fb->width;
> +		sb->height = plane->state->fb->height;
> +		sb->pitch = plane->state->fb->pitches[0];
> +		sb->map = map;
> +		return 0;
> +	}
> +	return -ENODEV;
> +}
> +
>  /*
>   * DRM driver
>   */
> @@ -98,6 +121,7 @@ static const struct drm_driver mgag200_driver = {
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> +	.get_scanout_buffer = mgag200_get_scanout_buffer,
>  	DRM_GEM_SHMEM_DRIVER_OPS,
>  };
>  
