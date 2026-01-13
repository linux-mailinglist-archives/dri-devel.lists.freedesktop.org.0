Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD6D18AF6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 13:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE0610E282;
	Tue, 13 Jan 2026 12:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fBrxRzSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DEB10E282
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 12:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768306989;
 bh=pnRxY/EQjc17C4IKxtQInqRVkOlaBvQmWpjtbulXD6w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fBrxRzSy4XP0Snr6Qrrv3QFxQk5V0RldgIETdnjgWk4wMC6RlU//cWhi1V+GzWDZO
 NRVnxuOti99dkXlA5MZdLHSdz7/0ETrXWBcwXSFQ8jKRghTFIeRoUOVD26QZXL+NgK
 O9/QaDSc8g/Lb42FiqYh8MBHZybj/cVn0B1ki26m+P9BC4g9gqBooRQAmNL0Klw0FX
 fTZIhfqUYarxH4iRGMNn3gB4qAa6lTISNAb5zpdSGAF53eV4V+1Jv/FWnx4Kq87bHt
 ZYU4mcr4SjUWyX5rUMD1RlGDTn5U1Jw9Hcm3VlrSdnOLwxF4t5ozMC+1yfm+jbG7Na
 thw9GGDrUN8dw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 67B2C17E10C8;
 Tue, 13 Jan 2026 13:23:09 +0100 (CET)
Date: Tue, 13 Jan 2026 13:23:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chia-I Wu
 <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 2/4] drm/panthor: Extend IRQ helpers for mask
 modification/restoration
Message-ID: <20260113132303.0c35bb7a@fedora>
In-Reply-To: <20260112-panthor-tracepoints-v8-2-63efcb421d22@collabora.com>
References: <20260112-panthor-tracepoints-v8-0-63efcb421d22@collabora.com>
 <20260112-panthor-tracepoints-v8-2-63efcb421d22@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Mon, 12 Jan 2026 15:37:50 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> The current IRQ helpers do not guarantee mutual exclusion that covers
> the entire transaction from accessing the mask member and modifying the
> mask register.
> 
> This makes it hard, if not impossible, to implement mask modification
> helpers that may change one of these outside the normal
> suspend/resume/isr code paths.
> 
> Add a spinlock to struct panthor_irq that protects both the mask member
> and register. Acquire it in all code paths that access these, but drop
> it before processing the threaded handler function. Then, add the
> aforementioned new helpers: enable_events, and disable_events. They work
> by ORing and NANDing the mask bits.
> 
> resume is changed to no longer have a mask passed, as pirq->mask is
> supposed to be the user-requested mask now, rather than a mirror of the
> INT_MASK register contents. Users of the resume helper are adjusted
> accordingly, including a rather painful refactor in panthor_mmu.c.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h |  72 +++++++--
>  drivers/gpu/drm/panthor/panthor_fw.c     |   3 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c    |   2 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 247 ++++++++++++++++---------------
>  drivers/gpu/drm/panthor/panthor_pwr.c    |   2 +-
>  5 files changed, 187 insertions(+), 139 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 424f6cd1a814..0a29234ac58c 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -84,11 +84,14 @@ struct panthor_irq {
>  	/** @irq: IRQ number. */
>  	int irq;
>  
> -	/** @mask: Current mask being applied to xxx_INT_MASK. */
> +	/** @mask: Values to write to xxx_INT_MASK if active. */
>  	u32 mask;
>  
>  	/** @state: one of &enum panthor_irq_state reflecting the current state. */
>  	atomic_t state;
> +
> +	/** @mask_lock: protects modifications to _INT_MASK and @mask */
> +	spinlock_t mask_lock;

nit: Can we move this mask_lock right after the mask field? 

