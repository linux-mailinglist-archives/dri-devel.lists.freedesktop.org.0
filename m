Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11AEB7EF9E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056CF10E643;
	Wed, 17 Sep 2025 09:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G5Jc4ucT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7C10E643
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 09:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758101535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qMU7f5iBz5K45j+BD1XBiW5zCA3C9jGtl56Dq/WVh4Q=;
 b=G5Jc4ucTlVqL3f4YOfp8APsj56aj/Rm7UJXLAMg2NurVIlA7rnAsdJj+RpGUjDc0VlB260
 dGQlKXZsyyBAOpoJnLvoAIflNPYLcxakApAUNJ0KL+dLqgS25NJQNJPhhSMtQNKVwM2uZK
 +aEP5u2VEIewckh3I57PjC6ABi2h1gM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-sso1E4vvNpyFoJZESXsrsA-1; Wed, 17 Sep 2025 05:32:08 -0400
X-MC-Unique: sso1E4vvNpyFoJZESXsrsA-1
X-Mimecast-MFC-AGG-ID: sso1E4vvNpyFoJZESXsrsA_1758101528
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3ecdc9dbc5fso601075f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 02:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758101527; x=1758706327;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qMU7f5iBz5K45j+BD1XBiW5zCA3C9jGtl56Dq/WVh4Q=;
 b=pLaloclsk1kLEAgtQ1WJffZVwKORlH5TcJwWwFrKOgvPrTLTsPDfAN4rzFJaKuFS4j
 XZlRLuMvASjBKBUBFCcJ6Hc++UWSaR/YwrRcuc50+7mUH2JkOdRR3PoRdHvwRP4w/61b
 Q6/SU/Bc2HsHe8Vcdq+w3BesyNZ9qnMA8vMKGQej4qZzywLoybVcbce2fbt6uKrD/VQn
 ZeH27Kd5YamCDTcq/tKOEixPw+eTiuvQKgUTkwZibMUEw3Zjm8H7Q6wMVf+Whwa6wCPp
 yEVL4wZESFZQwtdqxO6TKmA8EL888Ckt6HrRPFrG+Yhxjjd0OpK0iwmvX1LaTHaWcaZ0
 6QrQ==
X-Gm-Message-State: AOJu0Yxp5Yvgi/SRHu50FmSPHXJvBLI3OXlNSZdPMiCUOu/Aa93xzDwN
 iImQVsbMDI4ssbvYF9Fuoc7hYO0WImQrdaLpb/BlhyGdKbhYydWdnjZrWDaOAKX7tYF7Wta9Wse
 L3kSGj5Ca3pEuxvC7VuLYyFM+r8VnHfI/LAfu0izK8kmCZEQJr0DIyobIrcYLhaYArXxRcaSlrl
 au+Q==
X-Gm-Gg: ASbGnctdPuncN/dbJFYMP2xizuQyY8UVrmDZ/fsFIAKkg+a7B6H/QIiSCabTri/1hfQ
 pTid5yaJxyVvvIJ8vhtTj7vwBphmfa3ALzzNpVQQT+7/LKlgzdadmMdChp0YBTjldi1/fXdZgPn
 iFk2PnPe+nkAoDzgnQGo0ne0otGd4V4xU0fHnX2+hvowtr9G8B5fiQkZqemSwqJMBnlGmHwmkKY
 Z9k093Q9PlVV1KZL59ClwJkE3VifkyTIJMqxKuzYSEE3w5N321GUHz4xr/YXl9812F0erqeuUvu
 fyf5kDQMeUTmbDIOzKVjksp8j1ggIEQte1P72jDQOb1ZAaL9tkcKaF7Km5sus8R+/HwRMJHvqlS
 VXNq2fWno2rbHYVGhyHfa/A==
X-Received: by 2002:a05:6000:2586:b0:3e5:50:e070 with SMTP id
 ffacd0b85a97d-3ecdfa1e728mr1358758f8f.50.1758101527077; 
 Wed, 17 Sep 2025 02:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj8eN4uCa/vX/w5u/vFN0kesAWhlaiYJrlSPVnSoQWxMdPV0K93YZt9GqXMbVeVga460fdBw==
X-Received: by 2002:a05:6000:2586:b0:3e5:50:e070 with SMTP id
 ffacd0b85a97d-3ecdfa1e728mr1358725f8f.50.1758101526684; 
 Wed, 17 Sep 2025 02:32:06 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e911188fb9sm15728642f8f.28.2025.09.17.02.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 02:32:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH] drm/sitronix/st7571-i2c: reset position before clearing
 display
In-Reply-To: <20250913-st7571-reset-v1-1-ae5f58acdf8d@gmail.com>
References: <20250913-st7571-reset-v1-1-ae5f58acdf8d@gmail.com>
Date: Wed, 17 Sep 2025 11:32:05 +0200
Message-ID: <87o6r9o25m.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GlxGliw8aqlSsTe15WC0IJ10j9fJx8BvYfppGpmjbis_1758101528
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

> We cannot know where the write pointer is, always reset position to
> (0,0) before clearing display.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Marcus, do you already have commit rights in drm-misc or do you want me to
apply this patch ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

