Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F437D9135
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 10:21:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D86710E057;
	Fri, 27 Oct 2023 08:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8117210E057
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698394906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZxpY1vjsc4zx7bmsbIUQXSJpyxKql+2tTnnsraEizo=;
 b=eaZ3rmFZ1FfqVVNwgJvmIHKcQwaTPAQGPdk1JA7kPBjg3qrZJuSGog9E7go1eF+5rZ57l8
 e0Ixuu7sJxIaNiNMLSxx7XwC4WxMmhGT28v1hSsKD/08e+nAB0s1HemZSvKa6j9wt9kn8/
 qpGGBb3L6FdPWxnrcDmy+T3plmBX73Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-6nz7ZB0VNhK9rFc3bdmVXg-1; Fri, 27 Oct 2023 04:21:45 -0400
X-MC-Unique: 6nz7ZB0VNhK9rFc3bdmVXg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32f7384d5a2so92877f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 01:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698394904; x=1698999704;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ZxpY1vjsc4zx7bmsbIUQXSJpyxKql+2tTnnsraEizo=;
 b=jFnB2g0OlF6iHS3UcSUzOuW9PMrQ0zuyeGH73z34c/qAmi82LTt4LNmw3LcAVFv4KG
 WfbOunXjfrWddGRUhTxLkg8OdHsLBSdHxCBO2FE5bFsEUU0xO/bj9G2XFfJZYyrb9SVM
 LhSqU+S3nJIKMG5YM0Yya3+rLSTlqZ32bb4JAM3lTGimjoud6tH53TuLuGHY31bfeSvP
 doYZ1l9+47ZK3AT0za55KGQe5ZC0/SUttLBdv8cPeSmiGkw17ha+rVcQIP5zFkvtnvCO
 vajfdhvzLOEIiVM2rSDZfgEHmdrDbJlIHAhuxJVLSCQBho1enBwCGlFzCeohI6LEeGGd
 o0DQ==
X-Gm-Message-State: AOJu0YxC6GqqgYa2wmdYKFs7VH4INukSFg/k2/ZsKitkV2sL31ZXe7hs
 tFGgbtRnavrLm+rC22BtOEEQ/itpciB8Vsd3VmTVmP13veZ8q+n0vVDagfOWJ+yK4kKWO1r0i+K
 suGpCi+9tcePKswzGPO0tCr9h5Z4i
X-Received: by 2002:a5d:6782:0:b0:319:867e:97d7 with SMTP id
 v2-20020a5d6782000000b00319867e97d7mr1431771wru.52.1698394904065; 
 Fri, 27 Oct 2023 01:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX4cZTcYTSS67ZvwWwFIoRNz9zHlbzA9ZwiQnl0+H47D3MNXP0EvI2yIjN6m1nwZEWfpVEdw==
X-Received: by 2002:a5d:6782:0:b0:319:867e:97d7 with SMTP id
 v2-20020a5d6782000000b00319867e97d7mr1431763wru.52.1698394903737; 
 Fri, 27 Oct 2023 01:21:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 h16-20020adfe990000000b0032dc24ae625sm1225357wrm.12.2023.10.27.01.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 01:21:43 -0700 (PDT)
Message-ID: <b048247c-75e9-488e-a4f3-b227a38bca5e@redhat.com>
Date: Fri, 27 Oct 2023 10:21:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ssd130x: Fix possible uninitialized usage of
 crtc_state variable
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20231020225338.1686974-1-javierm@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20231020225338.1686974-1-javierm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 21/10/2023 00:52, Javier Martinez Canillas wrote:
> Avoid a possible uninitialized use of the crtc_state variable in function
> ssd132x_primary_plane_atomic_check() and avoid the following Smatch warn:
> 
>      drivers/gpu/drm/solomon/ssd130x.c:921 ssd132x_primary_plane_atomic_check()
>      error: uninitialized symbol 'crtc_state'.

That looks trivial, so you can add:

Acked-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: fdd591e00a9c ("drm/ssd130x: Add support for the SSD132x OLED controller family")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/7dd6ca45-8263-44fe-a318-2fd9d761425d@moroto.mountain/
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>   drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 32f0857aec9f..e0174f82e353 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -910,7 +910,7 @@ static int ssd132x_primary_plane_atomic_check(struct drm_plane *plane,
>   	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>   	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
>   	struct drm_crtc *crtc = plane_state->crtc;
> -	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc_state *crtc_state = NULL;
>   	const struct drm_format_info *fi;
>   	unsigned int pitch;
>   	int ret;

