Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDA7CBD24E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:20:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4EE10E3BC;
	Mon, 15 Dec 2025 09:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R98w6RW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D912610E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765790434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WyS2wtMm86K2QmM92fEgEjH1DhzS3jqIgmhFp0Oh+og=;
 b=R98w6RW2Q8D9PCDZPkVI2hJ5Pe9Tp7HJrtcRUZMyOQ/4hcl1LrMiYG5qJsladm24VMRf9f
 v8Sq9im2y7R3CzjZVSBVtRxJ7yYtEH4MifWrEYWXYtAPs93Zm4gte9NYb+tP/MA0u7dasE
 qbnNKjI4n4cY69mYtFWmMBEL7iKczlo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-ZNvsLzwONM2LU-QQkzf3DQ-1; Mon, 15 Dec 2025 04:20:33 -0500
X-MC-Unique: ZNvsLzwONM2LU-QQkzf3DQ-1
X-Mimecast-MFC-AGG-ID: ZNvsLzwONM2LU-QQkzf3DQ_1765790432
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-29f8e6a5de4so25852385ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765790432; x=1766395232;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WyS2wtMm86K2QmM92fEgEjH1DhzS3jqIgmhFp0Oh+og=;
 b=qQKAg5kZyCQ3guGunnVPhWs/C8EMstr6ZTly8iTw5NBk1rEmY9v8q2tjTyT5e/mGvk
 AOlrcXF0xtVbhW1HFi1D/fE1qg7vpRX++ZvDFNQi/MLBYKkCsLGs5lAMaSLjHkxBAOSd
 5UdLMhOaOShqgw4UyoNODqaMluQUgdTC41e32cZ6x4RbE2jAXoZP4Fu6n4NWinqSFMae
 88UBhbcx7CTV8fEb5WReJ81RWCHUBU9dijZEZuYkm0jSSEY9EHlsDqvBaBe+N6fu5nu4
 U+YeI3Z7URBaLJ02Ew1SrOmFzcdl7cV9wwXOWSJCQkpMPC20ALfGqJc9KahTFdKyHFxq
 VKGA==
X-Gm-Message-State: AOJu0YzrvjyKBG/G1RYQ+z97JoSlHMadnufL0DBjRr1pxtJRyXenSa8E
 RkKLBcUWdORX+xt4UDdkFPEVHh1p4qf1pmQjuoeybuiVkK/EV6XNKFXAcO4cDCsOnW8iWIsaeIM
 OpYgmtJB1N/nktfWKREgdc7YujSYxXowxXCuOLhYTaiwIu9t7XL4ValC7tF8orFhGyNx33A==
X-Gm-Gg: AY/fxX5fjwmu6EFYXEDZwut+JKUAf1+sDbkdXkov/UzJfBc+vhEr++Hh9fIsKZ5OqMs
 zJy4N3Nj2x3BOtij2hB6qefE3PYxDrLEJ+r9Xo4M6EQ5UAWPRTDvR4y6lhEevRFHFR1SENNy14Q
 2VMLU8FRY8tos5NOjAszSNQRNpHavngnqNt9x1cy7vlHjjKwZnpEDufL4Q3vMyb4TYWxgHx4cwx
 stSyHqnEebMySHkcVT4a99lvQfxqLafne2Mn/w2JmU77ulL0gkIg8xxIvwJFZsF9Szh2D72ML68
 Qq4SdOVUJ0uIsSR//p2SSMstnCFrICjkz9qWazE3WjaPMpAcRyW9bfgJe5jJAl3tuCe5QymRORQ
 dHajJM/aF7e7PmG82juLQlERkunVYeYbZD4t8EQ36
X-Received: by 2002:a17:902:d50a:b0:2a0:9b4f:5ebd with SMTP id
 d9443c01a7336-2a09b4f609cmr65070875ad.15.1765790432163; 
 Mon, 15 Dec 2025 01:20:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz6WqTcHxWwZfEy6jGh9LowPObaXr3jjMT5WrYNHrYFoQFvixv0eBMBCvIB2riTd977VScRQ==
X-Received: by 2002:a17:902:d50a:b0:2a0:9b4f:5ebd with SMTP id
 d9443c01a7336-2a09b4f609cmr65070525ad.15.1765790431766; 
 Mon, 15 Dec 2025 01:20:31 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a110f6374asm11533545ad.63.2025.12.15.01.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:20:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH RESEND v2 6/6] drm/sitronix/st7571-spi: add support for
 SPI interface
In-Reply-To: <20251202-st7571-split-v2-6-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
 <20251202-st7571-split-v2-6-1e537a09e92f@gmail.com>
Date: Mon, 15 Dec 2025 10:20:26 +0100
Message-ID: <87zf7kje3p.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PC8zrf7wA1qCz9x6vGvjGeKKY5ACceAvoagqzXHkbtI_1765790432
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Add support for ST7561/ST7571 connected to SPI bus.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/gpu/drm/sitronix/Kconfig      | 12 ++++++
>  drivers/gpu/drm/sitronix/Makefile     |  1 +
>  drivers/gpu/drm/sitronix/st7571-spi.c | 76 +++++++++++++++++++++++++++++++++++
>  4 files changed, 90 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 66e9ffb757c8..c89e521cafa1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8083,6 +8083,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/sitronix,st7567.yaml
>  F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml

I would add SPI examples to the DT binding docs.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

