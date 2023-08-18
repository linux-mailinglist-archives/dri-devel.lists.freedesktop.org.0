Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F287803D6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 04:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA1510E419;
	Fri, 18 Aug 2023 02:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFAF10E419
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 02:33:49 +0000 (UTC)
Received: from [192.168.2.146] (109-252-150-127.dynamic.spd-mgts.ru
 [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C9D0A6607193;
 Fri, 18 Aug 2023 03:33:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692326028;
 bh=t8RHuAfGJADiiVN2uXmAJ3kLfvc8/IzeL5/4qT4SLgg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gxA75N+iHILGBnQJVlpux2Bcc2xxWWNoEjKhPZZxKqkNrPk73hU2VtGWXg6kze7Pk
 90s1wYhvbr+n+RPbbhTf3VInpe2UioVvlZxDzrU3KCJFcWP1t3gNX2gS831YYgzQkr
 3zFoFbCt7aMqFORwE49jjoYdI+4eArhtEOhmIo6vpj91tdT8p3hNmYm62f22DkW989
 V9YR09RzO/CzPUmrwytLyk4M0H8GuQz/TZ6OX7Qual/X8/0TtqEDQAOn3lDO80fGHf
 p5pAuLDUqRmxdFnnyyQ+NYKy+uUrMfp9kdd1bSqnIb0CzDM1ZZm9t8jPL56o/G3DVJ
 vqT/zh76/M5IA==
Message-ID: <04181690-adc2-fc30-d1b4-b6ca5b02a142@collabora.com>
Date: Fri, 18 Aug 2023 05:33:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for
 obj synchronization
Content-Language: en-US
To: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
References: <20230712224424.30158-1-dongwon.kim@intel.com>
 <20230712224424.30158-4-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230712224424.30158-4-dongwon.kim@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/13/23 01:44, Dongwon Kim wrote:
> This helper is needed for framebuffer synchronization. Old framebuffer data
> is often displayed on the guest display without this helper.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index a063f06ab6c5..e197299489ce 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  
>  #include "virtgpu_drv.h"
>  
> @@ -271,6 +272,9 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
>  	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
>  	vgplane_st = to_virtio_gpu_plane_state(new_state);
>  	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> +
> +	drm_gem_plane_helper_prepare_fb(plane, new_state);

The implicit display BO sync should happen on a host side, unless you're
rendering with Venus and then displaying with virgl. Doing it on guest
side should be a major performance hit. Please provide a complete
description of your setup: what VMM you use, config options, what tests
you're running.

-- 
Best regards,
Dmitry

