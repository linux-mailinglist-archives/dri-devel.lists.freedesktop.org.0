Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7168D153C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 09:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4E210E369;
	Tue, 28 May 2024 07:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MrbSDrkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8633910E364
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 07:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716880864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6Fk/w+D1tGkwzU6hq3XlU1/wNjVdws7JU17k3ts/bw=;
 b=MrbSDrkE9NFseaT2N1VkV2Bv+PHl/vhaC2GB4xtIZ1uKh4YGYAo+rqUeZ+LuXC/EiijZD/
 WzuWPlZ8Ii6hPWczaTYwLoAtR33QE9HX8UhTahe4kv+kBWWyfWeCm4WeI8ewyDfxj+iffG
 p1E6drWn97tgSthOV+4Fnv+6FONMFA0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-v0R2reF0PhGX3M1q0LnuJg-1; Tue, 28 May 2024 03:21:03 -0400
X-MC-Unique: v0R2reF0PhGX3M1q0LnuJg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3580f213373so421291f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716880862; x=1717485662;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f6Fk/w+D1tGkwzU6hq3XlU1/wNjVdws7JU17k3ts/bw=;
 b=AAAA95cmPpUsgCGnhr3VGbQFI1dme2c8z0sl7iBilEcK/O/TV7fz/OxZpgiV9iq8k3
 Zj0/o9GxnAWSgZD1V64zzCsaePS/hwceYr4zXOEORfH/l9LSk4cEhUGCztZX2UNVAvVh
 aXZWpTD3a5vm+F9MK9LxlPxIH6z2H3jc4QrVlFDLxqgbEbodMqGGr2PGqSsrwk732aSY
 QtAKeZVUxXeW9URnShsrudu6DofeqZ3cBM1k/kKbOrOgTEkZKRTsGiplYVkfN5jxr4Zy
 0bwHh+FZDEgUf78/Gt7ESyNyJ4ponygyjKp3miW0mFsS/NUmKpPcEvDjIE9/HoeTpB6p
 ONRA==
X-Gm-Message-State: AOJu0YxG03PeXHFJOITBA2gtx7wP0jmExSthALp7Ae+UC/Zne4KtvxoU
 bzTgInhV9z1DinDRvgOjkRpGfdfiw5e2XorO6+cVxP4Hhn/FfqttG8SHRhPdEvlQNuY53s71o/F
 VzWvY86ZHubKS9xCdT6KnF3c8G6IvHc77VUbLlarzyjYxbG27uyWKLgzQG6E2vip+wA==
X-Received: by 2002:a5d:6686:0:b0:354:e72f:d5d7 with SMTP id
 ffacd0b85a97d-35526c39ef7mr7616964f8f.24.1716880862103; 
 Tue, 28 May 2024 00:21:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAcFtbj8Pi786V1gkPPqQhO4i/h4C8C1moc48ObgIFjeKzqSqXk5xrqkQRh1KWGrYjtJ+C3A==
X-Received: by 2002:a5d:6686:0:b0:354:e72f:d5d7 with SMTP id
 ffacd0b85a97d-35526c39ef7mr7616953f8f.24.1716880861737; 
 Tue, 28 May 2024 00:21:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b?
 ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c931csm10850874f8f.79.2024.05.28.00.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 00:21:01 -0700 (PDT)
Message-ID: <ead7f060-b6c3-40e7-b00a-b347669d7551@redhat.com>
Date: Tue, 28 May 2024 09:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
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



On 27/05/2024 15:34, Geert Uytterhoeven wrote:
> Add support for the drm_panic module, which displays a message on
> the screen when a kernel panic occurs.

Thanks for your patch, I'm pleased that you find drm_panic useful.

That looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on Armadillo-800-EVA.
> ---
>   drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
>   	.atomic_disable = shmob_drm_plane_atomic_disable,
>   };
>   
> +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> +	.atomic_check = shmob_drm_plane_atomic_check,
> +	.atomic_update = shmob_drm_plane_atomic_update,
> +	.atomic_disable = shmob_drm_plane_atomic_disable,
> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> +};
> +
>   static const struct drm_plane_funcs shmob_drm_plane_funcs = {
>   	.update_plane = drm_atomic_helper_update_plane,
>   	.disable_plane = drm_atomic_helper_disable_plane,
> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>   
>   	splane->index = index;
>   
> -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> +	if (type == DRM_PLANE_TYPE_PRIMARY)
> +		drm_plane_helper_add(&splane->base,
> +				     &shmob_drm_primary_plane_helper_funcs);
> +	else
> +		drm_plane_helper_add(&splane->base,
> +				     &shmob_drm_plane_helper_funcs);
>   
>   	return &splane->base;
>   }

