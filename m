Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF17593F63E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 15:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C39410E3CA;
	Mon, 29 Jul 2024 13:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WfWXu/iI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20F710E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 13:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722258518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VmYHVyxqtgOdGESGhPMUnVohEWLqGLapB3L59puzfyI=;
 b=WfWXu/iIqEAIkUlYshpDw7t3HAe3xel2HJYAdbolDDZN6zht4o7KP3m6QBAq4wCGQ0u1rn
 Com8hqf5zQFaZeRg7+H8asTU2IQEeR8sL1G4aE83izYRFvuJn/ilZUNCT2s1Xu2iVSKV6c
 u/ryGULg1l8vbJaiOxfYrgSxvnYJLOM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-iZzlKe-AO5-4QxxDwRI7pQ-1; Mon, 29 Jul 2024 09:08:37 -0400
X-MC-Unique: iZzlKe-AO5-4QxxDwRI7pQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3684ea1537fso1471561f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 06:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722258516; x=1722863316;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VmYHVyxqtgOdGESGhPMUnVohEWLqGLapB3L59puzfyI=;
 b=SSgSeUDHdNtbR+WukXMQK4YdQs1BPefaP81OiOSKuoNuMf6xnCOcLHrcDpk8nqM6qy
 0HkHcvscc4y7na17j9KF+UWtzjCzX/lg/KmtP94h7HqYtJ/5QRnhbkk3BHRyxzVJFJw/
 Oogq9mwOUuQ3rr/Qa8grNxTd5ygCjiDENFeqg/ITWD5l36V79ayKlqrnQdt04rRqdB/P
 fKNfBizqskWsXJJW59cPm9UTKMBfU6WPqqBtZPDPcnmp2EEdausaX2j02JMhJHrEYdvA
 IDTHixl4kChsslh/hzQYrMdAHEsuGrmI32XbPpX6SFNsvwni1d4CWmR1Ucr0UfXBlGrt
 O4bA==
X-Gm-Message-State: AOJu0YxrTdG5prxAVl9z3okZeMEx4N4ayijRZsrkxH+tCavm/nDEug9j
 njt7XO9/dvnbhJtgcQON68n+h0+3zCwOqnLipj46rtolH7WhiEfZS8aLzBOLFz1HFIxBuwKwrqj
 nxkjSjilMVqrRPUFQKrfnzZvdLoO94pbff0ADSceKrxdpnOQ6PtB/9Y5nExgPZVmYTQ==
X-Received: by 2002:a05:6000:1f8f:b0:367:f054:7a94 with SMTP id
 ffacd0b85a97d-36b5d0b0a01mr6478737f8f.5.1722258516222; 
 Mon, 29 Jul 2024 06:08:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExynfP4xB7u3Ac+dxPudSP8v5SSxemv8gaxnyetlJ167at1Trpy6ZAtolKOYQPLT2lVLmwPA==
X-Received: by 2002:a05:6000:1f8f:b0:367:f054:7a94 with SMTP id
 ffacd0b85a97d-36b5d0b0a01mr6478716f8f.5.1722258515880; 
 Mon, 29 Jul 2024 06:08:35 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281a26e1bcsm53496355e9.34.2024.07.29.06.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 06:08:35 -0700 (PDT)
Date: Mon, 29 Jul 2024 15:08:33 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH] drm/nouveau: remove unused variable ret
Message-ID: <ZqeUUea0pL7vKKPr@pollux>
References: <20240729123624.868907-1-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20240729123624.868907-1-jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hi Jani,

On Mon, Jul 29, 2024 at 03:36:24PM +0300, Jani Nikula wrote:
> Fix build with CONFIG_NOUVEAU_PLATFORM_DRIVER enabled:
> 
> ../drivers/gpu/drm/nouveau/nouveau_platform.c: In function ‘nouveau_platform_probe’:
> ../drivers/gpu/drm/nouveau/nouveau_platform.c:29:13: error: unused variable ‘ret’ [-Werror=unused-variable]
>    29 |         int ret;
>       |             ^~~
> 
> Fixes: 961ae5f9807b ("drm/nouveau: handle pci/tegra drm_dev_{alloc, register} from common code")
> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Thanks for fixing this, applied to drm-misc-next.

> 
> ---
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_platform.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
> index 3194b110eff8..829fdc6e4031 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_platform.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
> @@ -26,7 +26,6 @@ static int nouveau_platform_probe(struct platform_device *pdev)
>  	const struct nvkm_device_tegra_func *func;
>  	struct nvkm_device *device = NULL;
>  	struct drm_device *drm;
> -	int ret;
>  
>  	func = of_device_get_match_data(&pdev->dev);
>  
> -- 
> 2.39.2
> 

