Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8768A917E4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735B610EA70;
	Thu, 17 Apr 2025 09:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YJwmaojl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8916C10EA70
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744882273;
 bh=DlIrohWcvWqLhQVq5MOG18JAKUR4+Dg0MjxkUDFHnCo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YJwmaojlRo6vtQWKypUk5+jdXjmFSZuvNwxso9vvNdlZUNzm/aLnPaK68t9uccF4Y
 kAegUUORBR2KcNpYql94CbZBXQy88dn7TQt+w8SzF4K38NtN6+CKcyOFvHC5izC0JU
 Pc1Ndk7U5L/nINgPOeVxG9SITLdAfK/BVDLnH0TKCJc0s3FAC6NRosPIugdKLlSzf4
 PpIqfLZJk+Ae1RmK+sWMjaeKyFL/5dII82uWlzmMSsX+Q70GHi925ATfIXihxYgQlM
 7OvuhQ5EOJwn02qBq1gN6WxclsMkt181SjGw7Xka30r4PpVo6b3lx7t+kfQVF5NyVp
 rDEtpSkpdb2cw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A24BD17E00A3;
 Thu, 17 Apr 2025 11:31:12 +0200 (CEST)
Date: Thu, 17 Apr 2025 11:31:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, Dan Carpenter
 <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/panthor: Fix the panthor_gpu_coherency_init() error
 path
Message-ID: <20250417113107.6aabeced@collabora.com>
In-Reply-To: <20250414130120.581274-1-boris.brezillon@collabora.com>
References: <20250414130120.581274-1-boris.brezillon@collabora.com>
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

On Mon, 14 Apr 2025 15:01:20 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> The panthor_gpu_coherency_init() call has been moved around, but the
> error path hasn't been adjusted accordingly. Make sure we undo what
> has been done before this call in case of failure.
> 
> Fixes: 7d5a3b22f5b5 ("drm/panthor: Call panthor_gpu_coherency_init() after PM resume()")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/4da470aa-4f84-460e-aff8-dabc8cc4da15@stanley.mountain/T/#t
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Queued to drm-misc-next.

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index c73c1608d6e6..1e8811c6716d 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -245,7 +245,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>  
>  	ret = panthor_gpu_coherency_init(ptdev);
>  	if (ret)
> -		return ret;
> +		goto err_unplug_gpu;
>  
>  	ret = panthor_mmu_init(ptdev);
>  	if (ret)

