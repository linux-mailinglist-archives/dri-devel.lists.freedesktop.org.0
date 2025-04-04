Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25054A7BC76
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 14:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FEA10EBDB;
	Fri,  4 Apr 2025 12:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZEFtbJhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F0810E128;
 Fri,  4 Apr 2025 12:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743769046;
 bh=davIGDkdg8VNjfo6+KI2+Fl/WDS2qOtv6hTPqrPGLLg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZEFtbJhYa8DQbnMD5yBGO7AArYwW5Dkt3KZtpnwagknukvvJ6EE7Rid5HuhxlLaDn
 +EQO+XHUaIqkzoRvTmp/GeiW/OqmT48bOEn+f/J6l8RFPuCtmMc0Q/Kh0P6fhA5uFK
 3glOVSf7gHN1rqF8LfRRgB4agmYlcWZ5f0pmzzBmolK5rCB/fB95rBXwinMfNNdWC0
 bFQYrJLcmKGSthuNHfRaOUBm0Y0FaKQ7gK/7PVoQaFm3RTsAN/c7TW/wFi7tIW6fVD
 PI3/oCr/IgBTdh/k+q80mui4HTE95fziN+gaFyKaPHHGIWsSxIjHZF4rD5vUQDfj+h
 B621HlVATWCXQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3450D17E0C50;
 Fri,  4 Apr 2025 14:17:26 +0200 (CEST)
Date: Fri, 4 Apr 2025 14:17:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v3 4/8] drm/panthor: Add support for alloc-on-fault buffers
Message-ID: <20250404141720.49d2709e@collabora.com>
In-Reply-To: <20250404092634.2968115-5-boris.brezillon@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250404092634.2968115-5-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri,  4 Apr 2025 11:26:30 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 97e2c4510e69..8071f1c438e2 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -615,6 +615,16 @@ struct drm_panthor_vm_get_state {
>  enum drm_panthor_bo_flags {
>  	/** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-mapped in userspace. */
>  	DRM_PANTHOR_BO_NO_MMAP = (1 << 0),
> +
> +	/**
> +	 * @DRM_PANTHOR_BO_ALLOC_ON_FAULT: The buffer sections will be allocated on-demand.
> +	 *
> +	 * When alloc-on-faut is used, the user should expect job failures, because the
> +	 * allocation happens in a path where waiting is not allowed, meaning the allocation
> +	 * can fail and there's nothing the kernel will do to mitigate that. The group will
> +	 * be unusable after such a failure.
> +	 */
> +	DRM_PANTHOR_BO_ALLOC_ON_FAULT = (1 << 1),

I forgot to increment the driver version to reflect those uAPI changes.
Will fix that in v2.

>  };
>  
>  /**
> @@ -649,8 +659,13 @@ struct drm_panthor_bo_create {
>  	 */
>  	__u32 handle;
>  
> -	/** @pad: MBZ. */
> -	__u32 pad;
> +	/**
> +	 * @alloc_on_fault_granularity: Granularity of the alloc-on-fault behavior.
> +	 *
> +	 * Must be zero when DRM_PANTHOR_BO_ALLOC_ON_FAULT is not set.
> +	 * Must be a power-of-two, at least a page size, and less or equal to @size.
> +	 */
> +	__u32 alloc_on_faut_granularity;
>  };
>  
>  /**

