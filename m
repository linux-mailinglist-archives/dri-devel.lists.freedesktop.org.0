Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4DE753711
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE27A10E848;
	Fri, 14 Jul 2023 09:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D912610E848
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689328216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tBjp82gLLLlocN70gzT39Xi/h+/6LoHEroJf4qpzUyQ=;
 b=M4I9f96jr9jjFQw6Z20/wfjlP9w3DXqHW5PFZYEP9LDbXHCx7leksFJJWYJE4CVGyJkq77
 wUY/ooo3a73PVUvLd3ZbHPUVS3T7eirYzfwhUj+RCNFPg/12Oa2xu/7kuv5BwDwmNnCasJ
 Y8UlE5Z47ZCflDA9EtNdbT8QwmN+YUA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-We3tCet4PEmff_rXQdagmw-1; Fri, 14 Jul 2023 05:50:14 -0400
X-MC-Unique: We3tCet4PEmff_rXQdagmw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fc08d6a40cso9258715e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 02:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689328213; x=1691920213;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tBjp82gLLLlocN70gzT39Xi/h+/6LoHEroJf4qpzUyQ=;
 b=QGUYkg1frnr/fFeY8UfCYA+1IO1P8xZE7iYkmFnRPlIVYzBwvalj92bJxLAQ2vvRnK
 L0C47euEKuRB1Fl3s2cNtOYupOERwumeaDh9ZjLb6iOpDQ72rKMLAbRPrBi+5mMX/45o
 tR1rhjHoR6jwhCEdvzfY7U7LqFuT0Z5IduQnePnQZZtDx4eF64YzVvEqxsk2Fi6mIaMT
 eiR/ej/4IltLZxLNr3n9XhSWznrWQDEiQGaFYaoqEMIDNnx7qzZovcoG2zJlqu/BJ4tR
 TLZ+6oSxuQC13e3DNPXufvgFWi534/4Cmia9J4RFTaVsVtYLIVQ9kFkaBoF/DosaSf3G
 71VQ==
X-Gm-Message-State: ABy/qLa8O/jfbYp0UDziMnWgFnBMoar34+73yUFrSyN9DCdkd1jA5dUa
 BBIlDwILlLAgG20gQoNUPBkq90VeZd7RUJD3iiRObMo3tVHyUWpa82IPGJlOKV61bWJ2u2p5a3p
 oex4DGowH7YwwO5z7RMSEuAa28GYP
X-Received: by 2002:adf:ea10:0:b0:314:35ce:a0e7 with SMTP id
 q16-20020adfea10000000b0031435cea0e7mr3545417wrm.16.1689328213582; 
 Fri, 14 Jul 2023 02:50:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFh1wPKblkmTBw8OQ1NLIUngbHtYwtP+MmS66mPVwKsVEsfrpflPboxtBmMk3of1k+PN6KJlg==
X-Received: by 2002:adf:ea10:0:b0:314:35ce:a0e7 with SMTP id
 q16-20020adfea10000000b0031435cea0e7mr3545397wrm.16.1689328213266; 
 Fri, 14 Jul 2023 02:50:13 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 g12-20020a5d46cc000000b0031455482d1fsm10372260wrs.47.2023.07.14.02.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 02:50:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/8] drm/dumb-buffers: Fix drm_mode_create_dumb() for
 bpp < 8
In-Reply-To: <5ba8ac5e465121b646a59487dc75b27017e0c769.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <5ba8ac5e465121b646a59487dc75b27017e0c769.1689252746.git.geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 11:50:11 +0200
Message-ID: <87o7keu8j0.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> drm_mode_create_dumb() calculates the number of characters per pixel
> from the number of bits per pixel by rounding up, which is not correct
> as the actual value of cpp may be non-integer.  While we do not need to
> care here about complex formats like YUV, bpp < 8 is a valid use case.
>
>   - The overflow check for the buffer width is not correct if bpp < 8.
>     However, it doesn't hurt, as widths larger than U32_MAX / 8 should
>     not happen for real anyway.  Add a comment to clarify.
>   - Calculating the stride from the number of characters per pixel is
>     not correct.  Fix this by calculating it from the number of bits per
>     pixel instead.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Why is drm_mode_create_dumb.size __u64?  The test for "args->height >

I don't think can be changed since is a DRM_IOCTL_MODE_CREATE_DUMB uAPI ?

> U32_MAX / stride" rejects all sizes not fitting in __u32 anyway.

Hmm, wonder if should be U64_MAX instead ?

> ---
>  drivers/gpu/drm/drm_dumb_buffers.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
> index 70032bba1c97e787..21a04c32a5e3d785 100644
> --- a/drivers/gpu/drm/drm_dumb_buffers.c
> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
> @@ -71,10 +71,11 @@ int drm_mode_create_dumb(struct drm_device *dev,
>  	/* overflow checks for 32bit size calculations */
>  	if (args->bpp > U32_MAX - 8)
>  		return -EINVAL;
> +	/* Incorrect (especially if bpp < 8), but doesn't hurt much */
>  	cpp = DIV_ROUND_UP(args->bpp, 8);
>  	if (cpp > U32_MAX / args->width)
>  		return -EINVAL;
> -	stride = cpp * args->width;
> +	stride = DIV_ROUND_UP(args->bpp * args->width, 8);
>  	if (args->height > U32_MAX / stride)
>  		return -EINVAL;
>  

Good catch.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

