Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0229297797A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9E010ECA1;
	Fri, 13 Sep 2024 07:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WpEQ9ISO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0410ECA1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726212170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ezrAtS0ZVZbGW949ONNYwIZzLcJMYqLxPpzY4tCRl0=;
 b=WpEQ9ISOWwFW/Uw1KQorejBF3l094RUm1VwrlnqvGT0eFHQpj3Nat65SP/jqy/ZH3mlL9j
 QcB+boCgSBru3wpkKaV264w8fx64T/P+w09e8363xCZnZQisBqJxNwkRa+Z1HxRRB3ddou
 0cnIF6L1vFvVK8nUzcI/kAiBbLtkJDU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-oPrZFyBnPQa6ZLwmi-JLAw-1; Fri, 13 Sep 2024 03:22:49 -0400
X-MC-Unique: oPrZFyBnPQa6ZLwmi-JLAw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374ba33b2d2so813215f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726212168; x=1726816968;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2ezrAtS0ZVZbGW949ONNYwIZzLcJMYqLxPpzY4tCRl0=;
 b=HQ/7uAQEflDiHFhk6TXsy3ej3+DICKwYOVbU6VyGOc7+88dyu5ukvIVXqEE0C2BRAm
 HpYuVmINu83aJd6kxpHda7uDPqxIXNd3uMo/4fiyT1HmZXVBvcjvxycXhQn5uxswNuW2
 rAqjsn2W0C0/csjadP2clzobJJ0nXsGTu6R9XPZYdGeek04zMlfhPi2fpKw+KRzGSkUS
 XYYPLfCtQlAAcHNTtBnvBKZ/gXVY3a8NTsMdkN+4GgWSXeNcZyN6VtMh6AUjr6t37luh
 gL9qeddB+NYA+gcKxI9/iqw8p2d73Vn6zCT7o8d0S0ZOo7z0gRrKaQCOmg+ppPvei75i
 HBIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWysw6AMO/Ls2U2nanKNTS8r8OK4qIMLm0dv/EX2tofMY2ZQiady6LwbhwH6VPuwwbEfF+1dLhYPmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdMd3el0wT0RMdf64vu7TJgCr4WO3nEG+YxqhpFGrugUEcdpZG
 jfCjAW369nVaMYnkzd1+lFpEb+IKIFPoakTGEq5WQldE9r9WdyXGut+DPyg3h7WD1NVD33nZ83a
 BU3K67VEGu5yaGPYu6WPEEzMz8WYmJ+Ta7sUUuloDw5J/5mXfRDOf1s3+SZMYN6yc2Q==
X-Received: by 2002:adf:e28d:0:b0:374:b6f2:5f30 with SMTP id
 ffacd0b85a97d-378c2d1246emr3016526f8f.27.1726212168045; 
 Fri, 13 Sep 2024 00:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZMWrlEzJh0WOtOStc18L8IoLgcwnmnI0DTnyObNM8d+Al8nGf4oKzPzWbtBSgLCYnV/aMrw==
X-Received: by 2002:adf:e28d:0:b0:374:b6f2:5f30 with SMTP id
 ffacd0b85a97d-378c2d1246emr3016512f8f.27.1726212167531; 
 Fri, 13 Sep 2024 00:22:47 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3789567609esm16025263f8f.59.2024.09.13.00.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:22:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Ilia Mirkin
 <imirkin@alum.mit.edu>, James Jones <jajones@nvidia.com>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v3 1/2] drm/panic: Add ABGR2101010 support
In-Reply-To: <20240913071036.574782-2-jfalempe@redhat.com>
References: <20240913071036.574782-1-jfalempe@redhat.com>
 <20240913071036.574782-2-jfalempe@redhat.com>
Date: Fri, 13 Sep 2024 09:22:46 +0200
Message-ID: <87h6akyq49.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> Add support for ABGR2101010, used by the nouveau driver.
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 74412b7bf936..0a9ecc1380d2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -209,6 +209,14 @@ static u32 convert_xrgb8888_to_argb2101010(u32 pix)
>  	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
>  }
>  
> +static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
> +{
> +	pix = ((pix & 0x00FF0000) >> 14) |
> +	      ((pix & 0x0000FF00) << 4) |
> +	      ((pix & 0x000000FF) << 22);
> +	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
> +}

Maybe we can move this format conversion helper and the others in the
driver to drivers/gpu/drm/drm_format_helper.c ?

> +
>  /*
>   * convert_from_xrgb8888 - convert one pixel from xrgb8888 to the desired format
>   * @color: input color, in xrgb8888 format
> @@ -242,6 +250,8 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
>  		return convert_xrgb8888_to_xrgb2101010(color);
>  	case DRM_FORMAT_ARGB2101010:
>  		return convert_xrgb8888_to_argb2101010(color);
> +	case DRM_FORMAT_ABGR2101010:
> +		return convert_xrgb8888_to_abgr2101010(color);
>  	default:
>  		WARN_ONCE(1, "Can't convert to %p4cc\n", &format);
>  		return 0;
> -- 
> 2.46.0
>


The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

