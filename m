Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D1F768144
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007D610E215;
	Sat, 29 Jul 2023 19:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5EB10E215
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690658107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bKZ/m4E32pk0OxOiOqNXBVn4dQjxooPCr2VH/BSIu+M=;
 b=Z0FyGXwvwd36RVZNzM2owIXk4UQ5pSk1NrwqHQXjMR+MgJRTOI83rd0Ff9JvXl40qMNoRE
 u0HhRgPeCFVC0v2BN2FOpyqyK+vuEOGO1Sbfy7tgoNNu6Q5Fw8j132LNedHh+/zNocnmdo
 i+scpd8elugXkIW4n7RxAZeq9mLha5o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-9btOtdDlPFWpCUi0IAtUtA-1; Sat, 29 Jul 2023 15:15:02 -0400
X-MC-Unique: 9btOtdDlPFWpCUi0IAtUtA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fe1cdf2024so441925e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 12:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690658101; x=1691262901;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKZ/m4E32pk0OxOiOqNXBVn4dQjxooPCr2VH/BSIu+M=;
 b=Qbt4DQmLdUt7ZN5ADPfAJlEu8beFt+I0Abn+cQFrVB9WS2WuA/8fJFIuruO/GoMwLc
 jtkKa4GG2ZjKSOLoQRjqiQXLan8U3S3vQgPxS3s2udr9hXJEdNf3LEh3EoE4y3+u9ExA
 fXXhrwu03ao/KC2hf2u/mG6PIoJmwmNGkVjWnd/bl3Wo+MH+A45fsaNpsaYKNHm/9gHC
 XbhvIf3s4YciwGWoHwuyhLtul7GfBMNuARHijxKwG71WRWesln23thDLA62HWH0SOweQ
 AYTw60LXumYzucCZS9wY+v0OeqS44fvicBiR1hlOMelCIxVd8HLR7HQ5l2ir6TmonaUT
 T5Mg==
X-Gm-Message-State: ABy/qLYKALdJh+w196ld2mKcv2XxTk08Bhn+1qKrjIBHMG0PXAXsKXm6
 Fbafg08ssoaPYa87aWJY3NKtZW8YAgKCgd7bnxwWxDVYffdKb2xt3czEbpWioPJUWVjGqpvweGQ
 5uv9Xu0/3FFcXrsvORttvRkLXjLrd
X-Received: by 2002:a05:600c:2109:b0:3fa:97ad:2ba5 with SMTP id
 u9-20020a05600c210900b003fa97ad2ba5mr2065637wml.31.1690658101111; 
 Sat, 29 Jul 2023 12:15:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHLZUj9UpcJLJhL8ZYAVAlut578FF7QHxlwqAv3EfIOrRcqB9xm3wue0QZcrC5Ib1KR/6X0hA==
X-Received: by 2002:a05:600c:2109:b0:3fa:97ad:2ba5 with SMTP id
 u9-20020a05600c210900b003fa97ad2ba5mr2065633wml.31.1690658100845; 
 Sat, 29 Jul 2023 12:15:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l7-20020adfe587000000b00314172ba213sm8122621wrm.108.2023.07.29.12.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 12:15:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Russell King
 <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH v2 resend 2] drm/armada: Fix off-by-one error in
 armada_overlay_get_property()
In-Reply-To: <a4d779d954a7515ddbbf31cb0f0d8184c0e7c879.1689600265.git.geert+renesas@glider.be>
References: <a4d779d954a7515ddbbf31cb0f0d8184c0e7c879.1689600265.git.geert+renesas@glider.be>
Date: Sat, 29 Jul 2023 21:14:59 +0200
Message-ID: <871qgqy1fw.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> As ffs() returns one more than the index of the first bit set (zero
> means no bits set), the color key mode value is shifted one position too
> much.
>
> Fix this by using FIELD_GET() instead.
>
> Fixes: c96103b6c49ff9a8 ("drm/armada: move colorkey properties into overlay plane state")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Compile-tested only.
>
> v2:
>   - Add Reviewed-by.
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

