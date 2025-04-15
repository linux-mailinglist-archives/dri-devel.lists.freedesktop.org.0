Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B55AA89BDC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB47610E733;
	Tue, 15 Apr 2025 11:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Jd3Kwp5s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CCB10E051
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744715929;
 bh=PzeVNojLN0VWbLXMYNgkx11qPGQ2I2ZvHwogcSpv50k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jd3Kwp5smFzcvLDwXbhwKzkUkJ23AjUmDXcvvHov+zuDnt6DE3OtzpuZjmHU/Jajo
 X5RYhYv1FQ8d8Q7eKeuz1hFRc8BKeQeLrrmyRQTXab+Dm/RTr7ekI5NWS0/VP2L8RJ
 yrK/xzrLn6nIkpVFIYT2k2ASekxkgIUu4Z6yT7HypWKARe7gl65JBjF/3adkprTJod
 fvRXptOrqCDtKmVMQ/9zKyN99pwODbp70aR7vFvNkn3/aR/sUh/M/jJnqgt0mH4ppl
 0M0eAJ5xh/5bLv1wgWHy8LlB8bbdYXE/4fkZULXCuXagGy9XshXri7dNcqj/5Q4zNi
 i4MUEUdoH1r6w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A1F6217E0B2D;
 Tue, 15 Apr 2025 13:18:49 +0200 (CEST)
Date: Tue, 15 Apr 2025 13:18:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Enforce DRM_PANTHOR_BO_NO_MMAP
Message-ID: <20250415131842.1f678004@collabora.com>
In-Reply-To: <20250415105710.1490623-1-boris.brezillon@collabora.com>
References: <20250415105710.1490623-1-boris.brezillon@collabora.com>
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

On Tue, 15 Apr 2025 12:57:10 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Right now the DRM_PANTHOR_BO_NO_MMAP flag is ignored by
> panthor_ioctl_bo_mmap_offset(), meaning BOs with this flag set can
> still be mmap-ed.
> 
> Fortunately, this bug only impacts user BOs, because kernel BOs are not
> exposed to userspace (they don't have a BO handle), so they can't
> be mmap-ed anyway. Given all user BOs setting this flag are private
> anyway (not shareable), there's no potential data leak.
> 
> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 15d8e2bcf6ad..1499df07f512 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -940,6 +940,7 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  					struct drm_file *file)
>  {
>  	struct drm_panthor_bo_mmap_offset *args = data;
> +	struct panthor_gem_object *bo;
>  	struct drm_gem_object *obj;
>  	int ret;
>  
> @@ -950,6 +951,10 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>  	if (!obj)
>  		return -ENOENT;
>  
> +	bo = to_panthor_bo(obj);
> +	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> +		return -EINVAL;

Maybe it should be EPERM instead of EINVAL here.

> +
>  	ret = drm_gem_create_mmap_offset(obj);
>  	if (ret)
>  		goto out;

