Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4CC7537F8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143CB10E09C;
	Fri, 14 Jul 2023 10:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C897810E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689330312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=99CCQV0ZC6Z3v4KeeI3589CkCiweHnTBxIfE2i437hQ=;
 b=PrJeDlOn4gJDmf2noGW/SY5i8Ya/XVpbllPabksLcE5XAcXXz2y5y4b9P+gCQv8DjT0rLI
 5O4ohNYnm3cXWsSu3AHH1sk6z+rOj+jwv9noD6iI9TY9rhof1nYU7jPhI+GSDVrEM0mqsy
 K2HkvOcv34IKuh+Y403wMYRWdCXOBiM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-G5r-8PZcP-ugFxTllFHjYg-1; Fri, 14 Jul 2023 06:25:11 -0400
X-MC-Unique: G5r-8PZcP-ugFxTllFHjYg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fa96b67ac1so10156295e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 03:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689330310; x=1691922310;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=99CCQV0ZC6Z3v4KeeI3589CkCiweHnTBxIfE2i437hQ=;
 b=CeAbiavbH7tGm52aqhiuFpeDSlNC4ymgrsRcZKKXgIt6iwAnv+yisMjGPzlsCP9mpB
 36zCKuHn+JCKAIuYOcjF/uyCGjoeH2NNalEaTQLKhlOSoWAbHATmzOX76Nemw5/UakX9
 vqzrrm793q1OxORfM0qxXXNJQBskuy8Ox0efYCk44RdmXUX/4Q/L0NGFy5rFZSN/XTXV
 ZabJXBBxZpttAsu71FYHb+F2IWaaftUdNUMfD32sB27S+YE+oVo+a1Dfn7rJ9kgziUGG
 SbTd/OGDNzgzk5YUxF8fJXobx0ajN2Ktn8S/XWnZRh26N+6VyofwZUygmBm9F3rzjhfD
 ZYOA==
X-Gm-Message-State: ABy/qLYF0OFTqjg+BbVCI2w2wLCgYPgW1pYXPLDhUlCy9DK+H+L2D6iA
 vvFnboDf0Jepk228QJxL6mRk/Lwv/aak/T+QMjuH8rr+3SlHxpk6w8svlmJ6R4z6Ndza/52gP0Y
 QK+k6rkrxdIOZMLd54pe67ssN3qc2
X-Received: by 2002:a1c:f704:0:b0:3f5:fff8:d4f3 with SMTP id
 v4-20020a1cf704000000b003f5fff8d4f3mr4492218wmh.7.1689330310670; 
 Fri, 14 Jul 2023 03:25:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGcKXPZt/8xOGKWRtDHFsQt08ITixr5RAQtfS/O8OJsznodQIIOTbvwv/Fuw2cdRvp5PQbbpg==
X-Received: by 2002:a1c:f704:0:b0:3f5:fff8:d4f3 with SMTP id
 v4-20020a1cf704000000b003f5fff8d4f3mr4492201wmh.7.1689330310365; 
 Fri, 14 Jul 2023 03:25:10 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 o4-20020a05600c378400b003fc3b03e41dsm917198wmr.0.2023.07.14.03.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 03:25:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 6/8] drm/fb-helper: Pass buffer format via
 drm_fb_helper_surface_size
In-Reply-To: <00790d022752b672a28256db7b9393eca0801b99.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <00790d022752b672a28256db7b9393eca0801b99.1689252746.git.geert@linux-m68k.org>
Date: Fri, 14 Jul 2023 12:25:09 +0200
Message-ID: <87cz0uu6wq.fsf@minerva.mail-host-address-is-not-set>
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

> drm_fb_helper_single_fb_probe() first calls drm_fb_helper_find_sizes(),
> followed by drm_fbdev_generic_helper_fb_probe():
>   - The former tries to find a suitable buffer format, taking into
>     account limitations of the whole display pipeline,
>   - The latter just calls drm_mode_legacy_fb_format() again.
>
> Simplify this by passing the buffer format between these functions
> via a new buffer format member in the drm_fb_helper_surface_size
> structure.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

[...]

> -	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
> +	drm_info(dev, "surface width(%d), height(%d), bpp(%d) and format(%p4cc)\n",

You are promoting a debug printout here to info but that change is not
mentioned in the commit message. If you think this will be useful, maybe
do it as a separate patch ?

The rest of the patch looks good to me though.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

