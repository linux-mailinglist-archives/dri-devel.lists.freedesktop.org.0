Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B5DA77629
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636F310E2BA;
	Tue,  1 Apr 2025 08:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BzVqf1hU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5151410E2BA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743495516;
 bh=lEfixywBR0bxI0JqTz/s7jKpjp8O1a+jX6PtN+HB+bQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BzVqf1hUA7IhbqzrwZlJSVOXUBTcVWDqazVLTTiyzJUv5nUYA7STEzt3+mH5uzWDd
 V2jt4wDmbqDiEBJxyCRwN+ZvMTn2hqdpTU/7xsRjMbu1d0Znodqio3DAJTidIn9YRx
 +2Lo1EC7vIMBCZS7WyYCqGzeiUJlnMs1PfZ+4soJc5v60iL079bJwBjoO/J0KUpOl4
 cmP2vgoKyr4EdxTcHeDx7dhQ0VqALrSHfSTXq9TGf3PNClkbHBRhtpdN5RdMEDqGTn
 F1URmk5088gdvzG4QBeT5vO46jHgKEAgb698Aqt2qD+SdA/BJxl3yaoCBz/bSJtZWF
 Woqb10VnHSu2g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E595C17E0E2D;
 Tue,  1 Apr 2025 10:18:35 +0200 (CEST)
Date: Tue, 1 Apr 2025 10:18:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 3/3] drm/panthor: Let IRQ handlers clear the interrupts
 themselves
Message-ID: <20250401101830.30aa151d@collabora.com>
In-Reply-To: <20250401075710.2638950-4-boris.brezillon@collabora.com>
References: <20250401075710.2638950-1-boris.brezillon@collabora.com>
 <20250401075710.2638950-4-boris.brezillon@collabora.com>
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

On Tue,  1 Apr 2025 09:57:10 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> MMU handler needs to be in control of the job interrupt clears because
> clearing the interrupt also unblocks the writer/reader that triggered
> the fault, and we don't want it to be unblocked until we've had a chance
> to process the IRQ.
> 
> Since clearing the clearing is just one line, let's make it explicit
> instead of doing it in the generic code path.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.h | 2 --
>  drivers/gpu/drm/panthor/panthor_fw.c     | 2 ++
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 2 ++
>  drivers/gpu/drm/panthor/panthor_mmu.c    | 2 ++
>  4 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index da6574021664..4c27b6d85f46 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -383,8 +383,6 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
>  		if (!status)									\
>  			break;									\
>  												\
> -		gpu_write(ptdev, __reg_prefix ## _INT_CLEAR, status);				\
> -												\
>  		__handler(ptdev, status);							\
>  		ret = IRQ_HANDLED;								\
>  	}											\
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 0f52766a3120..446bb377b953 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1008,6 +1008,8 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>  
>  static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
> +	gpu_write(ptdev, JOB_INT_CLEAR, status);
> +
>  	if (!ptdev->fw->booted && (status & JOB_INT_GLOBAL_IF))
>  		ptdev->fw->booted = true;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 671049020afa..32d678a0114e 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -150,6 +150,8 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
>  
>  static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
> +	gpu_write(ptdev, GPU_INT_CLEAR, status);
> +
>  	if (status & GPU_IRQ_FAULT) {
>  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
>  		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 7cca97d298ea..1ecb20bfbc92 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1669,6 +1669,8 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	bool has_unhandled_faults = false;
>  
> +	gpu_write(ptdev, MMU_INT_CLEAR, status);

Actually, this one was meant to be moved inside the loop, and be a
per-AS clear. I'll fix that in v2.

--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1710,6 +1710,11 @@ static void panthor_mmu_irq_handler(struct
panthor_device *ptdev, u32 status) access_type, access_type_name(ptdev,
fault_status), source_id);
 
+               /* We don't handle VM faults at the moment, so let's just clear the
+                * interrupt and let the writer/reader crash.
+                */
+               gpu_write(ptdev, MMU_INT_CLEAR, mask);
+
                /* Ignore MMU interrupts on this AS until it's been
                 * re-enabled.
                 */
