Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BA31DCCB2
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 14:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C696E931;
	Thu, 21 May 2020 12:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A3016E931
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gvJWdKaj3S05W2yN3BJbNwWxtQau3b26iVcMFuLyF38=; b=nxhB+g00QYbOy9OIaJrHkvUH2+
 8mmKFmVya9fOsa4xkQCdKwrhqCVpsFMILq3AAQ0P4El9KNxIicoHSa7mF+6JH63lr+wkVPIPaqGPq
 C0xTjKTthlLV4uF3qUbWOsjuyaqdqCPnzGlA84pEEKWqWISVo+o9fXdh3cd3Sk93rjeBMWaL16/L9
 3Sf+VK1ec66B2XHP3cd8lNIEkWRps/emqwnJuOQg2XMYnA6XuIgXPr4+Y4xizDdXKdWeobK16KWLi
 GO7piOFXYN1b4f7OSpvfYtq+GZAm3YGYb+az9p3tnqyWzFmc/frwHlWmgBZOkP6/0rSSQ4E1Z2onB
 57AP8PZw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51195
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jbk8K-0003BJ-3a; Thu, 21 May 2020 14:17:08 +0200
Subject: Re: [PATCH v2 2/2] drm/udl: Use GEM vmap/mmap function from SHMEM
 helpers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sean@poorly.run, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org
References: <20200519080423.21695-1-tzimmermann@suse.de>
 <20200519080423.21695-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f38af8ba-e9fc-368b-4650-0feb4c7acb08@tronnes.org>
Date: Thu, 21 May 2020 14:17:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519080423.21695-3-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 19.05.2020 10.04, skrev Thomas Zimmermann:
> The udl driver contains an implementation of GEM vmap and mmap
> operations that is identical to the common SHMEM helper; except
> that udl's code uses cached pages by default.
> 
> Convert udl to regular SHMEM helper functions. There's no reason
> to have udl behave differently from all other SHMEM drivers. The
> udl driver uses the SHMEM helper to enable caching.
> 
> v2:
> 	* implement .gem_create_object with SHMEM helper
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index d1aa50fd6d65a..96d4317a2c1bd 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -37,8 +37,8 @@ DEFINE_DRM_GEM_FOPS(udl_driver_fops);
>  static struct drm_driver driver = {
>  	.driver_features = DRIVER_ATOMIC | DRIVER_GEM | DRIVER_MODESET,
>  
> -	/* gem hooks */
> -	.gem_create_object = udl_driver_gem_create_object,
> +	/* GEM hooks */
> +	.gem_create_object = drm_gem_shmem_create_object_cached,
>  
>  	.fops = &udl_driver_fops,
>  	DRM_GEM_SHMEM_DRIVER_OPS,

You could add a DRM_GEM_SHMEM_CACHED_DRIVER_OPS macro and use that instead.

Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
