Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F157C954B8E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 15:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE21010E78D;
	Fri, 16 Aug 2024 13:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B9IQyqmh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F6510E783;
 Fri, 16 Aug 2024 13:59:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D3AF62122;
 Fri, 16 Aug 2024 13:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E838C32782;
 Fri, 16 Aug 2024 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723816752;
 bh=AYjyt3Zr4yYkK8EpDLsOl7+GIl2rfY/yAMJVs4wWqzE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=B9IQyqmh350p67tFsMJW4RhPtoUf9FqudC5otI9WnV1xa59NqqV1PpqbArYqhOgoj
 EeBRL4DgY8iAU/sPILsxMfXIHc69OZS+vB7CQuFwufeD/Nr/Ux0keuJJsTQ9XCHarv
 arUrZfML86yC/GNemrzAFY549WogD5FQU23OjeQGTIBEax6Cjh0gbPS4dIwEek08QI
 boVM6BlIgQqrHFqLO1oqCXOxxMNRRNk/EzzS23eHD0J2tAJR6HdQxhS9jrAg5uHg24
 1ULRAyqkNB4IwvVzBev2Vyh96FicfZIUXAeZs6DXysH5/GPG3jvuYUYgVknbuJqFLa
 yx5tetp8tG83A==
Message-ID: <d2d8ccfc-8b41-4051-a2ea-3908aa21daac@kernel.org>
Date: Fri, 16 Aug 2024 15:59:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 69/86] drm/nouveau: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-70-tzimmermann@suse.de>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20240816125408.310253-70-tzimmermann@suse.de>
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

On 8/16/24 2:23 PM, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> The nouveau driver specifies a preferred color mode depending on
> the available video memory, with a default of 32. Adapt this for
> the new client interface.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 4a9a9b9c3935..445ebedf70d6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -31,6 +31,7 @@
>   #include <linux/dynamic_debug.h>
>   
>   #include <drm/drm_aperture.h>
> +#include <drm/drm_client_setup.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_ttm.h>
>   #include <drm/drm_gem_ttm_helper.h>
> @@ -873,9 +874,9 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>   		goto fail_pci;
>   
>   	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
> -		drm_fbdev_ttm_setup(drm->dev, 8);
> +		drm_client_setup(drm->dev, drm_format_info(DRM_FORMAT_C8));
>   	else
> -		drm_fbdev_ttm_setup(drm->dev, 32);
> +		drm_client_setup(drm->dev, NULL);
>   
>   	quirk_broken_nv_runpm(pdev);
>   	return 0;
> @@ -1317,6 +1318,8 @@ driver_stub = {
>   	.dumb_create = nouveau_display_dumb_create,
>   	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
>   
> +	DRM_FBDEV_TTM_DRIVER_OPS,
> +
>   	.name = DRIVER_NAME,
>   	.desc = DRIVER_DESC,
>   #ifdef GIT_REVISION
