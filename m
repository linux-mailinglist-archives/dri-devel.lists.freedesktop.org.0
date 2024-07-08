Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A092A254
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 14:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9A010E315;
	Mon,  8 Jul 2024 12:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gPVi8qPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E6310E315
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 12:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720440878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRMfw+qaCxmTAg6eK+xJwcVIzOlq5KUoSfKFCL1U530=;
 b=gPVi8qPjeyRlf4isdwmLr9EEEXbypaqmwPuYBhxvcoyzegL5YiMNge6RM6R1qAHcPHjr2f
 Krn2Unx3Eydol9tawEFbaZnKC7Db3zxIJ33O+SVDpnYMNVmGWR+hjJeYI7hVnDxroGHuIr
 3imxN4VonlLXb4tyQaH1RbPl7ESnn/w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-EQuDXavOMRqsuVy6FG5N3Q-1; Mon, 08 Jul 2024 08:14:36 -0400
X-MC-Unique: EQuDXavOMRqsuVy6FG5N3Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-426697b9cafso7115615e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 05:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720440875; x=1721045675;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rRMfw+qaCxmTAg6eK+xJwcVIzOlq5KUoSfKFCL1U530=;
 b=tyGd+LaEda3EwPrjGfZ/dTjv6WEPnZf3jevbZ8le8wiPUVMs1Q8DqKr5ARwySstmpe
 DLhYoDxT8wRyu6DDb2Dbq12KfDYvhhPQePqcvFRoWUORGFdatR9RlOPav7HlExx+p557
 5OdjU7qh6JOb7Wa8z5LmPs2NGzDV1f0JXRX5R8ERednYq9qu9BYcFAaF1RcG5iJDqF1B
 196ICnBAOAD+ZCuUeG5I2x/RCVjx6aGNJObm6xNz1VPbU4qScsBKUl0Ac8E5KzWCgVY1
 8BVXYDXMUFVM8bG45PREOCP7TJLEc5ZiU3lQIDLTwkJKcvI7LxphslkePtxw2t+O9a8r
 aFaQ==
X-Gm-Message-State: AOJu0YzqvqmSniMMysMQ+01l/fBOJD/VPbcN3u4Km9zrwQopCpOVYvjZ
 /oKaEip1I/kRSpCTsHL4uKC8h7IjIUCgk3k7hQcispV842T0/yQ+nrco56ieYMT0TFyqNXxEB5D
 2BNBpkKh1SmPGOtQ25qKxYXU0OpapHDtHHHIFG17Al+O+4UfQg10xpFjTPvlH93qAmA==
X-Received: by 2002:a7b:cbd0:0:b0:426:6e8b:3dc5 with SMTP id
 5b1f17b1804b1-4266e8b3df6mr4772725e9.32.1720440875518; 
 Mon, 08 Jul 2024 05:14:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXAl0M91ZE20gSmdULljjREWLxzJzdJnoH16R0gzn9oSl9NRBWWTAICx1cPZpHDLBZZzJAkg==
X-Received: by 2002:a7b:cbd0:0:b0:426:6e8b:3dc5 with SMTP id
 5b1f17b1804b1-4266e8b3df6mr4772625e9.32.1720440875148; 
 Mon, 08 Jul 2024 05:14:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a25b5edsm163468895e9.37.2024.07.08.05.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 05:14:34 -0700 (PDT)
Message-ID: <7119551a-4604-43c2-a8e5-c30b72197237@redhat.com>
Date: Mon, 8 Jul 2024 14:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/mgag200: Use hexadecimal register indeces
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sam@ravnborg.org, emil.l.velikov@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240705114900.572-1-tzimmermann@suse.de>
 <20240705114900.572-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240705114900.572-2-tzimmermann@suse.de>
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



On 05/07/2024 13:47, Thomas Zimmermann wrote:
> In mgag200_set_mode_regs(), use hexadecimal indices for accessing
> registers. Aligns the code with the register indices in the Matrox
> programming manuals. Also convert to lower-case hexadecimal values.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 50 +++++++++++++-------------
>   1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index d4550e4b3b01..4ceaa33e8d42 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -249,31 +249,31 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
>   		   ((vdisplay & 0x400) >> 3);
>   	crtcext5 = 0x00;
>   
> -	WREG_CRT(0, htotal - 4);
> -	WREG_CRT(1, hdisplay);
> -	WREG_CRT(2, hdisplay);
> -	WREG_CRT(3, (htotal & 0x1F) | 0x80);
> -	WREG_CRT(4, hsyncstart);
> -	WREG_CRT(5, ((htotal & 0x20) << 2) | (hsyncend & 0x1F));
> -	WREG_CRT(6, vtotal & 0xFF);
> -	WREG_CRT(7, ((vtotal & 0x100) >> 8) |
> -		 ((vdisplay & 0x100) >> 7) |
> -		 ((vsyncstart & 0x100) >> 6) |
> -		 ((vdisplay & 0x100) >> 5) |
> -		 ((vdisplay & 0x100) >> 4) | /* linecomp */
> -		 ((vtotal & 0x200) >> 4) |
> -		 ((vdisplay & 0x200) >> 3) |
> -		 ((vsyncstart & 0x200) >> 2));
> -	WREG_CRT(9, ((vdisplay & 0x200) >> 4) |
> -		 ((vdisplay & 0x200) >> 3));
> -	WREG_CRT(16, vsyncstart & 0xFF);
> -	WREG_CRT(17, (vsyncend & 0x0F) | 0x20);
> -	WREG_CRT(18, vdisplay & 0xFF);
> -	WREG_CRT(20, 0);
> -	WREG_CRT(21, vdisplay & 0xFF);
> -	WREG_CRT(22, (vtotal + 1) & 0xFF);
> -	WREG_CRT(23, 0xc3);
> -	WREG_CRT(24, vdisplay & 0xFF);
> +	WREG_CRT(0x00, htotal - 4);
> +	WREG_CRT(0x01, hdisplay);
> +	WREG_CRT(0x02, hdisplay);
> +	WREG_CRT(0x03, (htotal & 0x1f) | 0x80);
> +	WREG_CRT(0x04, hsyncstart);
> +	WREG_CRT(0x05, ((htotal & 0x20) << 2) | (hsyncend & 0x1f));
> +	WREG_CRT(0x06, vtotal & 0xff);
> +	WREG_CRT(0x07, ((vtotal & 0x100) >> 8) |
> +		       ((vdisplay & 0x100) >> 7) |
> +		       ((vsyncstart & 0x100) >> 6) |
> +		       ((vdisplay & 0x100) >> 5) |
> +		       ((vdisplay & 0x100) >> 4) | /* linecomp */
> +		       ((vtotal & 0x200) >> 4) |
> +		       ((vdisplay & 0x200) >> 3) |
> +		       ((vsyncstart & 0x200) >> 2));
> +	WREG_CRT(0x09, ((vdisplay & 0x200) >> 4) |
> +		       ((vdisplay & 0x200) >> 3));
> +	WREG_CRT(0x10, vsyncstart & 0xff);
> +	WREG_CRT(0x11, (vsyncend & 0x0f) | 0x20);
> +	WREG_CRT(0x12, vdisplay & 0xff);
> +	WREG_CRT(0x14, 0);
> +	WREG_CRT(0x15, vdisplay & 0xff);
> +	WREG_CRT(0x16, (vtotal + 1) & 0xff);
> +	WREG_CRT(0x17, 0xc3);
> +	WREG_CRT(0x18, vdisplay & 0xff);
>   
>   	WREG_ECRT(0x01, crtcext1);
>   	WREG_ECRT(0x02, crtcext2);

