Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7D94EC45
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 14:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F102210E1C1;
	Mon, 12 Aug 2024 12:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QPuY86sN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0003B10E1C0;
 Mon, 12 Aug 2024 12:02:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 42A1761196;
 Mon, 12 Aug 2024 12:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 598B2C32782;
 Mon, 12 Aug 2024 12:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723464159;
 bh=Z+VpxmtJ6Ay2K7lgWzWOGcfgRQEq44k3n4aLrp2yIu8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QPuY86sNRAcKCSRCmGm0nFXD9Mo/pc1JPZO3SFUQze+oH1on3povG4IErk86G/1C8
 VzkbYMy+7thPmNkt2UQegAfazOl1Y5n0c4sOqJIXq0LMoH9IGcKTELBCoxLGS/8tIX
 qIx+j79L8349uzbCcHLSSsbz2zmuLsl8bh/eM7plxfiltpitcXphyWXZGomx+zNeyL
 Q23DmyWmuqQD97HLs6AiHwhUWs/+uIJsU7Q57Jz0QYXbA1KIA7Eniui8Akh6mm/otT
 nGggfhx1+xzGW94LA7/DghQu2xJCjb51+HyNJeP944uaWmYr/JTxVw6H+K2ug3WT8p
 V3UfjOptVkWHg==
Message-ID: <4e6f3c7b-d296-4985-81cd-4caaba5c04eb@kernel.org>
Date: Mon, 12 Aug 2024 14:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] drm/nouveau: Do not set struct drm_driver.lastclose
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, alexander.deucher@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, kherbst@redhat.com,
 lyude@redhat.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-4-tzimmermann@suse.de>
Content-Language: en-US
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20240812083000.337744-4-tzimmermann@suse.de>
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

On 8/12/24 10:28 AM, Thomas Zimmermann wrote:
> Remove the implementation of struct drm_driver.lastclose. The hook
> was only necessary before in-kernel DRM clients existed, but is now
> obsolete. The code in nouveau_vga_lastclose() is performed by
> drm_lastclose().
> 
> v2:
> - update commit description
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
>   drivers/gpu/drm/nouveau/nouveau_vga.c | 7 -------
>   drivers/gpu/drm/nouveau/nouveau_vga.h | 1 -
>   3 files changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index ac7c60fb14d3..4a9a9b9c3935 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1303,7 +1303,6 @@ driver_stub = {
>   			   DRIVER_RENDER,
>   	.open = nouveau_drm_open,
>   	.postclose = nouveau_drm_postclose,
> -	.lastclose = nouveau_vga_lastclose,
>   
>   #if defined(CONFIG_DEBUG_FS)
>   	.debugfs_init = nouveau_drm_debugfs_init,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
> index 2525e08938b3..ee637f1fe03d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -127,10 +127,3 @@ nouveau_vga_fini(struct nouveau_drm *drm)
>   	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
>   		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
>   }
> -
> -
> -void
> -nouveau_vga_lastclose(struct drm_device *dev)
> -{
> -	vga_switcheroo_process_delayed_switch();
> -}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.h b/drivers/gpu/drm/nouveau/nouveau_vga.h
> index 951a83f984dd..63be415d2a44 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.h
> @@ -4,6 +4,5 @@
>   
>   void nouveau_vga_init(struct nouveau_drm *);
>   void nouveau_vga_fini(struct nouveau_drm *);
> -void nouveau_vga_lastclose(struct drm_device *dev);
>   
>   #endif
