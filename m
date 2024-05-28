Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C28D1545
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 09:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B80D10E0B0;
	Tue, 28 May 2024 07:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a6jNkMtg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7109410E0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716881009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIKabPGyTRiuw7RJzrHvb3kyiYNdSlXoTWM2TmzKlL4=;
 b=a6jNkMtgK7NeLxvNr1xBOfr3MzdxYmyF3voBJ16jxSmAmsjS9+Fgo/nCtkqN2oVuzU5nJv
 f/F7ZEDeBzGOiJRWB7OvXfdz4DWjob0zQ4Zl1u+9O1MIxvhRylkA4DMgXdDTARy/ZDfraE
 l5gihXr3iELOgpE10w7w7Vg5S/jH7cE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-PPTBg_IsORiczhLHnKOYTQ-1; Tue, 28 May 2024 03:23:27 -0400
X-MC-Unique: PPTBg_IsORiczhLHnKOYTQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-35808073fbfso283910f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716881006; x=1717485806;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VIKabPGyTRiuw7RJzrHvb3kyiYNdSlXoTWM2TmzKlL4=;
 b=PLzT/LE8hw0bqk1/XbB2fhlexcGP2el7nJDnLdcZsUaCcFqViknV5c1QgRlOONi/k6
 wIo17VhEXD5eVPu9qrM5/vmkPkb/aP+dqPQwqpx9li/sfkYDyfyYhpMe2FIm49R4MgZj
 xFT97bMOG34k8rdp0uIk1iRw52yanv5cfXW3uqyAc7vX8YlYMQloBDgD/PFZ58eB+nDd
 h4taGg/n/CuOPQ0siUoqZfhD0J0lNkBoIxXI8Iv6kskstTycAtjBAiO3G6aW460hQMQG
 A6R2svWk/O2LFBbMDEoLo5Qek9DrfQQqWHVP9W33aLsMJQqfzOJ8ETLdeRNEQy4kes9A
 8xxA==
X-Gm-Message-State: AOJu0YzBUzpRx8yMtJbZBP2m+MluOr7jTO9uQM7er472GVjOpC+GVpWl
 Vrp+voVSYQNHpHBeS9E0LvlvHiFf0oYmJ7pUcqvUxNH/XHUznSw4YLt0FflXO6I6Hv0RAb0YfYq
 axOaO+k3kgmIXMXo4ARH3qeyCFaS5dAPvQQp7YiaivNIjDy2V88Cbdh+0fpDPMxtYBg==
X-Received: by 2002:a5d:6aca:0:b0:354:fa6e:7ae2 with SMTP id
 ffacd0b85a97d-3552219cfa0mr6921535f8f.36.1716881006335; 
 Tue, 28 May 2024 00:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPOdJrgdiOdMG05jUeF5M+1HEpNSRnZCKxZ19O3et6QfkQ3lRcWUM/ROnB5RsVv06HhEQfGg==
X-Received: by 2002:a5d:6aca:0:b0:354:fa6e:7ae2 with SMTP id
 ffacd0b85a97d-3552219cfa0mr6921516f8f.36.1716881005889; 
 Tue, 28 May 2024 00:23:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b?
 ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-359b3675c6csm3846786f8f.71.2024.05.28.00.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 00:23:25 -0700 (PDT)
Message-ID: <ad904183-3070-4c24-b28a-53d477813785@redhat.com>
Date: Tue, 28 May 2024 09:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: renesas: rcar-du: Add drm_panic support for non-vsp
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

Hi,

On 27/05/2024 15:35, Geert Uytterhoeven wrote:
> Add support for the drm_panic module for DU variants not using the
> VSP-compositor, to display a message on the screen when a kernel panic
> occurs.

Thanks for your patch, I'm pleased that you find drm_panic useful.

That looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on Koelsch (R-Car M2-W).
> 
> Support for DU variants using the VSP-compositor is more convoluted,
> and left to the DU experts.
> ---
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> index e445fac8e0b46c21..c546ab0805d656f6 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> @@ -680,6 +680,12 @@ static const struct drm_plane_helper_funcs rcar_du_plane_helper_funcs = {
>   	.atomic_update = rcar_du_plane_atomic_update,
>   };
>   
> +static const struct drm_plane_helper_funcs rcar_du_primary_plane_helper_funcs = {
> +	.atomic_check = rcar_du_plane_atomic_check,
> +	.atomic_update = rcar_du_plane_atomic_update,
> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> +};
> +
>   static struct drm_plane_state *
>   rcar_du_plane_atomic_duplicate_state(struct drm_plane *plane)
>   {
> @@ -812,8 +818,12 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>   		if (ret < 0)
>   			return ret;
>   
> -		drm_plane_helper_add(&plane->plane,
> -				     &rcar_du_plane_helper_funcs);
> +		if (type == DRM_PLANE_TYPE_PRIMARY)
> +			drm_plane_helper_add(&plane->plane,
> +					     &rcar_du_primary_plane_helper_funcs);
> +		else
> +			drm_plane_helper_add(&plane->plane,
> +					     &rcar_du_plane_helper_funcs);
>   
>   		drm_plane_create_alpha_property(&plane->plane);
>   

