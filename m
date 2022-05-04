Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1641519F75
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 14:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D8710F666;
	Wed,  4 May 2022 12:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C6610F666
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651667503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTm2uOTxmBteY1gnOLxw5h1fpo8drl8r8Wv2846ij5Y=;
 b=Fz27ANwcwh3jhRGC0dAP8RkQMEiccWr+SuNQRUImMWVi0pL+m7O97sIiaMX+mRhLA+vFxG
 pQsa8gopryN5pHYSYbA5txW1zwTH4pYhs4whKZ5GL33x3JKbwJSvMfKksaH5v7Eov1ixYJ
 ErMkq8z4vueXdVGPSMJcyRg9CRBLVVk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-7-lQ3UxcG4PFGu2G_YaaFdLw-1; Wed, 04 May 2022 08:31:42 -0400
X-MC-Unique: lQ3UxcG4PFGu2G_YaaFdLw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so2947519wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 05:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MTm2uOTxmBteY1gnOLxw5h1fpo8drl8r8Wv2846ij5Y=;
 b=zCImb9MDdYEVc7qPSwEXMlNGy/vf8ALUySeZuNA6crMopf1vIfToJe85JGpAyVyta+
 WV1eNABIXVRkTyWvmb+1c3cZKPy7XDUTkxnyaBvzmFiVjGtZeZcTkznuSbQWJ2riizfB
 tRQLzDTKGgjlfMajjsI41cMIavSvGMKkAbc0bYfmXM+nEBb0EItfmRqEg9J52WrqHuAx
 aLUDyUEqYBbxUBWLGm1Pr1fDh5W1hhP1vIj+1oveHigLsauV35NlrKscSCAdUwz2SNGL
 ouD5dIq7Bg/SRyEc0eMOnzQFcmqUwG8Gj612LsDNbdWYgDxDnVNEOA3Mq6H1EVK0cFKs
 JaKw==
X-Gm-Message-State: AOAM531/uyQwJ0sphf/AlPcjKai+vzOS7oNshDQ54/jlwU+P2zPsgo0y
 qSHLRR6ylhZMh7I5tsry81alRk7m2r7A2iXHgV8sP5zLqPahXIu49Lqv0AaddFEX44Q/vgfnQNy
 uERErEo6JA/F7NEYNU19fXvSsc4kg
X-Received: by 2002:a1c:19c1:0:b0:393:a19f:8f95 with SMTP id
 184-20020a1c19c1000000b00393a19f8f95mr7476270wmz.149.1651667501087; 
 Wed, 04 May 2022 05:31:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzapcWQ56N2N8q6oqg0k82m2GgWMt8HKXiQj2vvklDe/4CCU6STOhC+BfwdJF3g6s07KUXieQ==
X-Received: by 2002:a1c:19c1:0:b0:393:a19f:8f95 with SMTP id
 184-20020a1c19c1000000b00393a19f8f95mr7476246wmz.149.1651667500792; 
 Wed, 04 May 2022 05:31:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:a765:79fb:b5ef:c480?
 ([2a01:e0a:d5:a000:a765:79fb:b5ef:c480])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c028200b003942a244f49sm3694651wmk.34.2022.05.04.05.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 05:31:40 -0700 (PDT)
Message-ID: <81e175da-74f3-dd70-b2b5-c06e023bd935@redhat.com>
Date: Wed, 4 May 2022 14:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/3] drm/mgag200: Protect concurrent access to I/O
 registers with lock
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20220502142514.2174-1-tzimmermann@suse.de>
 <20220502142514.2174-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220502142514.2174-4-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 02/05/2022 16:25, Thomas Zimmermann wrote:
> Add a mutex lock to protect concurrent access to I/O registers
> against each other. This happens between invokataion of commit-

Typo in commit message, invokataion => invocation

> tail functions and get-mode operations. Both with use the CRTC
> index registers MGA1064_GEN_IO_DATA and MGA1064_GEN_IO_CTL.
> Concurrent access can lead to failed mode-setting operations.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

There is a trivial conflict with 
https://lists.freedesktop.org/archives/dri-devel/2022-April/352966.html
But I will need to send a v2 for it anyway.

It looks good to me,
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.c  |  6 ++++++
>   drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 +
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 14 ++++++++++++++
>   3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 217844d71ab5c..08839460606fe 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -14,6 +14,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_ioctl.h>
> +#include <drm/drm_managed.h>
>   #include <drm/drm_module.h>
>   #include <drm/drm_pciids.h>
>   
> @@ -65,6 +66,11 @@ static int mgag200_regs_init(struct mga_device *mdev)
>   	struct pci_dev *pdev = to_pci_dev(dev->dev);
>   	u32 option, option2;
>   	u8 crtcext3;
> +	int ret;
> +
> +	ret = drmm_mutex_init(dev, &mdev->rmmio_lock);
> +	if (ret)
> +		return ret;
>   
>   	switch (mdev->type) {
>   	case G200_PCI:
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 4368112023f7c..18829eb8398a0 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -213,6 +213,7 @@ struct mga_device {
>   	struct drm_device		base;
>   	unsigned long			flags;
>   
> +	struct mutex			rmmio_lock;
>   	resource_size_t			rmmio_base;
>   	resource_size_t			rmmio_size;
>   	void __iomem			*rmmio;
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 6e18d3bbd7207..abde7655477db 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -881,6 +881,14 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
>   		.y2 = fb->height,
>   	};
>   
> +	/*
> +	 * Concurrent operations could possibly trigger a call to
> +	 * drm_connector_helper_funcs.get_modes by trying to read the
> +	 * display modes. Protect access to I/O registers by acquiring
> +	 * the I/O-register lock.
> +	 */
> +	mutex_lock(&mdev->rmmio_lock);
> +
>   	if (mdev->type == G200_WB || mdev->type == G200_EW3)
>   		mgag200_g200wb_hold_bmc(mdev);
>   
> @@ -904,6 +912,8 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
>   	mgag200_enable_display(mdev);
>   
>   	mgag200_handle_damage(mdev, fb, &fullscreen, &shadow_plane_state->data[0]);
> +
> +	mutex_unlock(&mdev->rmmio_lock);
>   }
>   
>   static void
> @@ -963,8 +973,12 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
>   	if (!fb)
>   		return;
>   
> +	mutex_lock(&mdev->rmmio_lock);
> +
>   	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
>   		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->data[0]);
> +
> +	mutex_unlock(&mdev->rmmio_lock);
>   }
>   
>   static struct drm_crtc_state *

