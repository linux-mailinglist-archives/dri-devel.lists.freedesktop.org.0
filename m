Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D9795ADB1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD2710E75E;
	Thu, 22 Aug 2024 06:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EBFEx5fD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8911A10E760
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 06:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724308701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVK+E7JqYfOnyi2qxxThORJHDOH0o5y8KPH+1hrP+CM=;
 b=EBFEx5fDOLmPd3N9Z08Mgpr8Wt1ykcN0dvJPplpnGMZfNjJ4uZYVU46MADU3RIlSRXpfGK
 QqMMQI8+Rq95sf+kpZrGBw1oxmHMe5uh4i0VWu2seaNV7+Brm4lrPaFT78o9qf1Y/Xuvd2
 Wc1fDoZICcQm1h/KSatalhvz0uQLg0k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-z5SDwL5INB6iEQgxeweikA-1; Thu, 22 Aug 2024 02:38:18 -0400
X-MC-Unique: z5SDwL5INB6iEQgxeweikA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42808efc688so3000965e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 23:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724308697; x=1724913497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uVK+E7JqYfOnyi2qxxThORJHDOH0o5y8KPH+1hrP+CM=;
 b=I2wSrrsNedwsi2ioxij4vbbA7SNPR8FCEqctTBLHzE70Jn8cINyuMou4EVFEM9jmWv
 VnwEplnrdydECSMm88tp7hGgqSLYy3mh2x/xXtJSfC+fl9ndipXWEQ2m494k6O3FEkRM
 VtqYGuOenNwHUSEwkyGqQiiV7TnPC+kNGFAZ7qGV2uaN78917k9nmFzC6+hmggMV8RC8
 keBJZES0PqNHwTTO27yIJi0A9IclDUcad0kKa618xnQUuZcaw/IvTTGlfLEG4/zVDoFD
 xxz+HIb/PBcpSTH/rvN4axnibBUcbJ5gmY6AUCNo1svq1oEdVBPhW5L+Du+LfWPoAwZ2
 sqsA==
X-Gm-Message-State: AOJu0YwdWXZC8NnRjOwxC/3xqk+a6NVBY720+RlOrxCaa6SH1apfRcZ/
 VCeVBYG95JoDg+7Vyj/0FmzDw/LDWpC3aNiIXDJyAyn+r6+SaeD6wy34j3ov9viPrYbXVRllC6M
 7jLJ+Nza7EeDJTO2qJxAW/Qfj6o8qjEHqPah71rr2rJ3XyPZIVnCRP2iU+lDrLoJM9g==
X-Received: by 2002:a05:600c:4fd4:b0:428:14b6:ce32 with SMTP id
 5b1f17b1804b1-42abf0501d4mr31534705e9.9.1724308697168; 
 Wed, 21 Aug 2024 23:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtwr4J0UTN675vbekRIcSUyus2pt7CRqEPmib2mC53f4VOYV3N82LxJmexwiSKPt5QN5iXcg==
X-Received: by 2002:a05:600c:4fd4:b0:428:14b6:ce32 with SMTP id
 5b1f17b1804b1-42abf0501d4mr31534485e9.9.1724308696580; 
 Wed, 21 Aug 2024 23:38:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac51802a8sm12865735e9.40.2024.08.21.23.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 23:38:15 -0700 (PDT)
Message-ID: <43c7fcf5-d6e6-4188-bf3b-91951fac8e7a@redhat.com>
Date: Thu, 22 Aug 2024 08:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 51/86] drm/ast: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-52-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240821130348.73038-52-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/08/2024 14:59, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> The ast driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.

Thanks for this whole series.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/ast/ast_drv.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 225817087b4d..debdfd0e197e 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -32,6 +32,7 @@
>   
>   #include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_shmem.h>
>   #include <drm/drm_gem_shmem_helper.h>
> @@ -64,7 +65,8 @@ static const struct drm_driver ast_driver = {
>   	.minor = DRIVER_MINOR,
>   	.patchlevel = DRIVER_PATCHLEVEL,
>   
> -	DRM_GEM_SHMEM_DRIVER_OPS
> +	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_FBDEV_SHMEM_DRIVER_OPS,
>   };
>   
>   /*
> @@ -360,7 +362,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (ret)
>   		return ret;
>   
> -	drm_fbdev_shmem_setup(drm, 32);
> +	drm_client_setup(drm, NULL);
>   
>   	return 0;
>   }

