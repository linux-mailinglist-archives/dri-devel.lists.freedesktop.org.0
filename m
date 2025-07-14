Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE233B044DD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F3510E4D2;
	Mon, 14 Jul 2025 15:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F91D10E4E5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:58:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8C081BC0;
 Mon, 14 Jul 2025 08:58:48 -0700 (PDT)
Received: from [10.57.83.29] (unknown [10.57.83.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99AC23F694;
 Mon, 14 Jul 2025 08:58:55 -0700 (PDT)
Message-ID: <9bcdf08d-eede-4bad-9445-fe0724eb7356@arm.com>
Date: Mon, 14 Jul 2025 16:58:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Remove dead VM flushing code
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250711154557.739326-1-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250711154557.739326-1-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/07/2025 16:45, Adrián Larumbe wrote:
> Commit ec62d37d2c0d("drm/panthor: Fix the fast-reset logic") did away
> with the only reference to panthor_vm_flush_all(), so let's get rid
> of the orphaned definition.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push this to drm-misc-next.

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 11 -----------
>  drivers/gpu/drm/panthor/panthor_mmu.h |  1 -
>  2 files changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index b39ea6acc6a9..ed3712f8d6a9 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -885,17 +885,6 @@ static int panthor_vm_flush_range(struct panthor_vm *vm, u64 iova, u64 size)
>  	return ret;
>  }
>  
> -/**
> - * panthor_vm_flush_all() - Flush L2 caches for the entirety of a VM's AS
> - * @vm: VM whose cache to flush
> - *
> - * Return: 0 on success, a negative error code if flush failed.
> - */
> -int panthor_vm_flush_all(struct panthor_vm *vm)
> -{
> -	return panthor_vm_flush_range(vm, vm->base.mm_start, vm->base.mm_range);
> -}
> -
>  static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
>  {
>  	struct panthor_device *ptdev = vm->ptdev;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index fc274637114e..0e268fdfdb2f 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -33,7 +33,6 @@ int panthor_vm_active(struct panthor_vm *vm);
>  void panthor_vm_idle(struct panthor_vm *vm);
>  u32 panthor_vm_page_size(struct panthor_vm *vm);
>  int panthor_vm_as(struct panthor_vm *vm);
> -int panthor_vm_flush_all(struct panthor_vm *vm);
>  
>  struct panthor_heap_pool *
>  panthor_vm_get_heap_pool(struct panthor_vm *vm, bool create);

