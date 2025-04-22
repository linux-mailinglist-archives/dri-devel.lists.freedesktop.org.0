Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3F8A979C2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 23:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5D210E639;
	Tue, 22 Apr 2025 21:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JfMYrW3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D3B10E639
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 21:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745358804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HKxVbFAIC1yknAhgK3/yzjYTFKqGKsqga8pDfwFWc/Y=;
 b=JfMYrW3tbMTc5XeNkBN11Kh3GBS9udp824JZos5EFcFTHJje3FYGWvXScQj3WnkVArONop
 Eck63vPOOozUotmKgT2ZQyEAlB12NCCCt9Rg+M/MQDLYsILs6TTGVTlyyGm7/oqa/nVWoK
 TxRfsQ9oTtjsuRReJrkHW32QuiQjDOs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-MPfY5wMiOgObldtUFVF1Vg-1; Tue, 22 Apr 2025 17:53:22 -0400
X-MC-Unique: MPfY5wMiOgObldtUFVF1Vg-1
X-Mimecast-MFC-AGG-ID: MPfY5wMiOgObldtUFVF1Vg_1745358801
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d209dc2d3so29578115e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 14:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745358801; x=1745963601;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HKxVbFAIC1yknAhgK3/yzjYTFKqGKsqga8pDfwFWc/Y=;
 b=GuAYTj+c8M8CM4yKkyMlH7zr+9ebuEOQaFI5UuRVLyXrxhH4IKG9gCZ2LR9/05nsbB
 Ne0MQtm7c/eINtuvdPjNs8mpwS8vLW5DtqPMOpe6i62pd2/nxSNoQtacqZtmBGFgW7Ya
 3AEWEamrf8ETP9f5vMEWhQTPwFAUUrMYc6PTYWcokfmh1ONQqvO+0nZAu6pmkyWJTUS+
 8euOmjoOvvAvPqaPUYL1K738dD8bX1Qa3XifqFZfYL5MIGeil9OG1uMklitB7QkDS5VV
 0VOa42NqUISNim1DiyV9Frq22ZHCzZOqFGt0QhCv0NGRciGXn6QOcAEaapPf1/4R5g+S
 j44w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBGq+3A1W39ZumuhUAEZWUrq6dZsesmZamjg2E81TKgIsGKmiaHUTiii8zGsmkRvuoUMFFIGDnP9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUX3AwpY8O3m2ASlhveGjB53VL9DRb9vvh8+cZKE3IfXiAwFWC
 cblXs/6duxYfCjBDDp8W0dRpa12DbZ1BieZ6OA5kDO3FdQ91Pmy6tR0jSY4iX30Pnpzq0BhmU61
 8BmzKX7halUYTVPra+1+NbBa0sybN8VG+YIc6bDCCakQX7sWz9N0+RMG1kC4bIsnXEA==
X-Gm-Gg: ASbGncsuNkfFSpuk0pv26MmvsW6DEOAJLdEqI4An4m8P2Fz8e0mbh2AMHLgoDc8xYOr
 x4VJmDQTqaCrSnwuipY2NpX4RjXH4IP0fEmPmbYBXJCM6oVePOXJzx+BlgbPFC2wH2+iRgpgJCi
 wGoHb1ko/uFby3UfQshs80rqBVt9OdvaS8oTIiTyWAqMIxoNhTn7wPEhzQj7g9HsQc/L8PoqY51
 bfQo9BjKUqVAbWDppKSqTgvFzu+oPCEcFKIWtDFWngdZ29L6GkYuX5adeoGjaByc2Tw0QxcNW2z
 gAb0IYv2Q5PEazCtp6qKvZ3tY4HB9jS6ZH5IQQNGCFDXb88UjHQZb+aqkZffanncGchApQ==
X-Received: by 2002:a05:600c:1990:b0:43c:f8fc:f686 with SMTP id
 5b1f17b1804b1-4406ab6ce61mr150643015e9.3.1745358801545; 
 Tue, 22 Apr 2025 14:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6/idgdqte5+5OvTZ+lLVQQaqX56tOylPaDJQn0XXifg71bVlGLn6SvNsLKI5H+jbjTtpPIA==
X-Received: by 2002:a05:600c:1990:b0:43c:f8fc:f686 with SMTP id
 5b1f17b1804b1-4406ab6ce61mr150642815e9.3.1745358801185; 
 Tue, 22 Apr 2025 14:53:21 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d23099sm2637005e9.13.2025.04.22.14.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 14:53:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Fabio Estevam <festevam@gmail.com>, simona@ffwll.ch
Cc: airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, noralf@tronnes.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/tiny: panel-mipi-dbi: Use
 drm_client_setup_with_fourcc()
In-Reply-To: <20250417103458.2496790-1-festevam@gmail.com>
References: <20250417103458.2496790-1-festevam@gmail.com>
Date: Tue, 22 Apr 2025 23:53:19 +0200
Message-ID: <87cyd3c180.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Rt72tmIkz71IZmJ5lrd0W5ifqHoaZRCJuucW0Rraz0_1745358801
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

Fabio Estevam <festevam@gmail.com> writes:

Hello Fabio,

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 559358282e5b ("drm/fb-helper: Don't use the preferred depth
> for the BPP default"), RGB565 displays such as the CFAF240320X no longer
> render correctly: colors are distorted and the content is shown twice
> horizontally.
>
> This regression is due to the fbdev emulation layer defaulting to 32 bits
> per pixel, whereas the display expects 16 bpp (RGB565). As a result, the
> framebuffer data is incorrectly interpreted by the panel.
>
> Fix the issue by calling drm_client_setup_with_fourcc() with a format
> explicitly selected based on the display's bits-per-pixel value. For 16
> bpp, use DRM_FORMAT_RGB565; for other values, fall back to the previous
> behavior. This ensures that the allocated framebuffer format matches the
> hardware expectations, avoiding color and layout corruption.
>
> Tested on a CFAF240320X display with an RGB565 configuration, confirming
> correct colors and layout after applying this patch.
>
> Cc: stable@vger.kernel.org
> Fixes: 559358282e5b ("drm/fb-helper: Don't use the preferred depth for the BPP default")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

