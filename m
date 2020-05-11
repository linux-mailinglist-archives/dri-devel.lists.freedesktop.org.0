Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758A11CD20C
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 08:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485AD6E1BE;
	Mon, 11 May 2020 06:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9569F6E1BE;
 Mon, 11 May 2020 06:47:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k1so9407635wrx.4;
 Sun, 10 May 2020 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=luOlBDEYjmS6B1luOElLyizl9Zvtw4V1+71KGKPL7KI=;
 b=gNCbgwmQfTcsdxo2d9wn7NfHwYUlJUOJcSaYKANaF2fq4swXbRQj9cr6TdpocLfJmv
 nRqS+caqorHc/TX5LWeKgglzj0yiAuLljyuXuFboUP4214hMF4Gh36eYY9NwwZyYIbL/
 8qAZ/MNq90H1qa8n9hfVAG/2p8lpSSKO8k/S7+BL+oIOYPPPU8UuJuoFH3BqhJPvEjl7
 W+s+dqc6FO7nIuAGl0fPwgMjlQskThTGEIC2jQVuBAn3Fd5sx47XOIWqF9jFuBlIshLv
 RvPZ8fyuste+uEvtCOjOT8zRWReySDqHA9Q7GFFP13L9sp+o5B79H4Mwd+KMkdWv/Afg
 RJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=luOlBDEYjmS6B1luOElLyizl9Zvtw4V1+71KGKPL7KI=;
 b=VRXxzMZb63gplMihx+IPTH2zLyOPEt5YkbCI3LavRTB8B1mkVlFwYoOIZKhTISim6P
 3shjSb2k49aiD+tykjZ2Bg2F1Yy1jeF6ueXzd5JyIIQvmJ4Kuf7bBAKZL5xaro8ar07g
 vZ1H4VvqRSoFlY/QZ6UWU5rQC2ohR2ymzGpG7eeEUMBmisNJdFAQm59Jk5jZ8+hLOmdZ
 AyM5mvS9YIm9hK3jg9C8yXihxXCMS65a0Zw6uBlIFGjEkjYCwBVMlQ5FvVfyWDuoJP81
 5S7056AXE49cq6I4/njO7UFcZl60D9zu691u5feE89xCK+zn8M84xNFyttFEkn2giM1A
 +gTw==
X-Gm-Message-State: AGi0PuY+8Ie3vy3csU1NNLLKoWpYqrNlX3FaL1DUxr1YiQeXXyjS/nmP
 Zu0ntBjej0RWSg3GGyFE4zz7c6W9
X-Google-Smtp-Source: APiQypICpd6PDWuMbtzDPYF9/qQKQyWvtIbP/HSF4aAkMQk6HMykU5TPOXUw9jOTSrFx3ywEBWPgJg==
X-Received: by 2002:adf:cd83:: with SMTP id q3mr4749954wrj.187.1589179645341; 
 Sun, 10 May 2020 23:47:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r11sm14778309wrv.14.2020.05.10.23.47.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 May 2020 23:47:24 -0700 (PDT)
Subject: Re: [PATCH 2/6] drm/amdgpu: Force unmap all user VMAs on device
 removal.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <1589050310-19666-3-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9d374ffa-40d2-d016-cd44-16c7d0505f78@gmail.com>
Date: Mon, 11 May 2020 08:47:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1589050310-19666-3-git-send-email-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.05.20 um 20:51 schrieb Andrey Grodzovsky:
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 14 ++++++++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 ++++
>   3 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e6978a2..4da52b7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1374,8 +1374,10 @@ amdgpu_device_ip_get_ip_block(struct amdgpu_device *adev,
>   			      enum amd_ip_block_type type)
>   {
>   	int i;
> -
>   	for (i = 0; i < adev->num_ip_blocks; i++)
> +
> +
> +

Unrelated whitespace change.

>   		if (adev->ip_blocks[i].version->type == type)
>   			return &adev->ip_blocks[i];
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 76a6198..ea2b47e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1130,16 +1130,22 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>   	return ret;
>   }
>   
> +static void amdgpu_force_unmap_user_space_mappings(struct drm_device *dev)
> +{
> +	struct amdgpu_device *adev = dev->dev_private;
> +
> +	ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
> +}
> +

If we really add a function for this we should probably put it into 
amdgpu_ttm.c

>   static void
>   amdgpu_pci_remove(struct pci_dev *pdev)
>   {
>   	struct drm_device *dev = pci_get_drvdata(pdev);
>   
> -#ifdef MODULE
> -	if (THIS_MODULE->state != MODULE_STATE_GOING)
> -#endif
> -		DRM_ERROR("Hotplug removal is not supported\n");

Keep the warning for now, there is a lot of stuff we need to fix first 
before removing that one.

Christian.

>   	drm_dev_unplug(dev);
> +
> +	amdgpu_force_unmap_user_space_mappings(dev);
> +
>   	amdgpu_driver_unload_kms(dev);
>   	pci_disable_device(pdev);
>   	pci_set_drvdata(pdev, NULL);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 3d822eb..22afd11 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -35,6 +35,7 @@
>   
>   #include <drm/amdgpu_drm.h>
>   #include <drm/drm_cache.h>
> +#include <drm/drm_drv.h>
>   #include "amdgpu.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
> @@ -1361,6 +1362,9 @@ int amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	if (!amdgpu_bo_is_amdgpu_bo(bo))
>   		return 0;
>   
> +	if (drm_dev_is_unplugged(adev->ddev))
> +		return -ENODEV;
> +
>   	abo = ttm_to_amdgpu_bo(bo);
>   
>   	/* Remember that this BO was accessed by the CPU */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
