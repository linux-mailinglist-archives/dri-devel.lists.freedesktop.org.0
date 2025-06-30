Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C13AEE30D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C56010E495;
	Mon, 30 Jun 2025 15:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Jum/g7KB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1050410E495
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751298615;
 bh=OFNpuSwskHZ5cDNYtd7s1ZDhkEVY62Cgbtcf8oU9wd4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jum/g7KBXEDCMUrkBm/2+AX51VoD6/ln8Z1HUMzW1l/hkzHaZapoMESM2O9Nl8tLB
 u/p33kBj+OlYZzd8jCjZqim83y0XMvV05OYvqu2WyHI/N57hwyN5ZNVn6CQnZk8az5
 bUTeIfGU3Hwn/dhD05aSK+z3iRzE2dD7v8suodOpcCiJIQY9XBwku7iNWpBJMBmyIi
 QpDIxrpSNL9NNQ3P8h941zKNheiYu7xHcmmi+N8xkH4qhjBiTju+ZLhBXJW5WL+ja7
 xdBxszdlcvjRzZqj0rMtRYIwOXRc82IesxwoXyr+w6sJM0+5KmiO5HrLXCaP7FZoZ5
 KIluQjx8xTsvA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:16f1:973:959b:9b0c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 512C317E0391;
 Mon, 30 Jun 2025 17:50:15 +0200 (CEST)
Date: Mon, 30 Jun 2025 17:50:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Karunika Choo
 <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Wait for _READY register when powering on
Message-ID: <20250630175011.7bd395d9@fedora>
In-Reply-To: <20250630140704.432409-1-steven.price@arm.com>
References: <20250630140704.432409-1-steven.price@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Mon, 30 Jun 2025 15:07:02 +0100
Steven Price <steven.price@arm.com> wrote:

> panthor_gpu_block_power_on() takes a register offset (rdy_reg) for the
> purpose of waiting for the power transition to complete. However, a
> copy/paste error converting to use the new 64 register functions
> switched it to using the pwrtrans_reg register instead. Fix the function
> to use the correct register.
> 
> Fixes: 4d230aa209ed ("drm/panthor: Add 64-bit and poll register accessors")
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 534735518824..cb7a335e07d7 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -297,8 +297,9 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>  
>  	gpu_write64(ptdev, pwron_reg, mask);
>  
> -	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
> -					      !(mask & val), 100, timeout_us);
> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, rdy_reg, val,
> +					      (mask & val) == val,
> +					      100, timeout_us);
>  	if (ret) {
>  		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
>  			blk_name, mask);

