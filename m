Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCBA8FFECE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 11:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F6C10E261;
	Fri,  7 Jun 2024 09:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OUbcuCFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CE610E261
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 09:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717751289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/xDuNuMEH+lWTdBbvokBrU8yMnUvbRuM1+T1ertuu5U=;
 b=OUbcuCFfHqQiZrnZnvDNav07ADU/bSmL27tdququLF0iNGuL6XQGzMM4TDuYCbEKOhzow+
 AFSBYsMIj9zQcWSHAUjpRi1Io51i0ET8JXJfByRjnxvdtAa8wsaUYy+4bpYovOpd0CNVcf
 sfqPJBnv5bcltXvav0qz0ee6t2mG8wU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-NLO9afaDO3CJkDSpsMAN4A-1; Fri, 07 Jun 2024 05:08:07 -0400
X-MC-Unique: NLO9afaDO3CJkDSpsMAN4A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4215ecc3a29so10008765e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2024 02:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717751286; x=1718356086;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/xDuNuMEH+lWTdBbvokBrU8yMnUvbRuM1+T1ertuu5U=;
 b=nsb5D4MFmObxS74r/9CUNjSmZ8gJ4omqR9OfWFycrwPGurRlamulsjqhfK+JZo++mY
 kkoG6pM2t92F5bFpnQBZ8lrEZAmR/QPAOUUeppvrNBtiLtGxLLc1+FNE/cvdVRkGm/ep
 VDUgdYZmrFDJEvutVfKkj/CgTMnue5b3DFViLLMpfzPNVUVBVvJaaBFSh7De4ymGnuXX
 A96u72LMHwa5OJRy5H8E26T/T8YfqSDMospt0bSq107v4+c1GzU4Qdmut7Vky5r+RDCL
 RQuzXV7ivMkd2iYkpISU630rsGZhjaRS3R23UuUrknSRMy2Zg7Tku9jtTj2ms0TsVUST
 Uvqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3E8zyBBVYyb2v51u3REsmIY/xrrYUSsp7dQS3T27axOoafB1mjS2V5gwVfX2CT/xG/5BpxNGwfKSrVDN2ryZIXvpPGhjchSM3OWI4YoGn
X-Gm-Message-State: AOJu0Yx26GJs+EfBZ9QNL19wKrIsHp0+BXRUvndwazd+Yel+uHhZMGjE
 cGq27cV8i+mm+FDDiEAb2ilYfPeHlfLy2EpiCBBHu4qPG3lOU59Ztp6exCxmCGnw6RxJuLe0zDH
 gQOBE3L+iveHJb1m60ZCm9jyJbDKdiQJJ4aBwldnURwYrS+ww1omdgiO/SN41D6nBJw==
X-Received: by 2002:a05:600c:444b:b0:420:29a8:ff5e with SMTP id
 5b1f17b1804b1-42164a0c1c9mr17768305e9.19.1717751286505; 
 Fri, 07 Jun 2024 02:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDzedec2BFHBSMbm9/SW+exjr8g5bw0rRbja9c6OHOl+s47XY44ysURo8AhvrHdlSlTHwwfw==
X-Received: by 2002:a05:600c:444b:b0:420:29a8:ff5e with SMTP id
 5b1f17b1804b1-42164a0c1c9mr17768165e9.19.1717751286116; 
 Fri, 07 Jun 2024 02:08:06 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149008sm80183085e9.29.2024.06.07.02.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 02:08:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2 1/3] drm/panic: only draw the foreground color in
 drm_panic_blit()
In-Reply-To: <20240603095343.39588-2-jfalempe@redhat.com>
References: <20240603095343.39588-1-jfalempe@redhat.com>
 <20240603095343.39588-2-jfalempe@redhat.com>
Date: Fri, 07 Jun 2024 11:08:04 +0200
Message-ID: <8734ppktmz.fsf@minerva.mail-host-address-is-not-set>
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

> The whole framebuffer is cleared, so it's useless to rewrite the
> background colored pixels. It allows to simplify the drawing
> functions, and prepare the work for the set_pixel() callback.
>
> v2:
>  * keep fg16/fg24/fg32 as variable name for the blit function.
>  * add drm_panic_is_pixel_fg() to avoid code duplication.
>  both suggested by Javier Martinez Canillas
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 67 +++++++++++++++++--------------------
>  1 file changed, 31 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 7ece67086cec..056494ae1ede 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -194,40 +194,42 @@ static u32 convert_from_xrgb8888(u32 color, u32 format)
>  /*
>   * Blit & Fill
>   */
> +/* check if the pixel at coord x,y is 1 (foreground) or 0 (background) */
> +static bool drm_panic_is_pixel_fg(const u8 *sbuf8, unsigned int spitch, int x, int y)
> +{
> +	return (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) != 0;
> +}

Thanks for doing this! The code is much easier to follow now IMO.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

