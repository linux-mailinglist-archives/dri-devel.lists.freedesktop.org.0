Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB7B3E477
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56B310E45D;
	Mon,  1 Sep 2025 13:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NehNTax9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389BE10E45D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 13:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756732652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LZO/bK69jUlRIeMZwS/vG5/0W+8gIUMGxQyNC0dZPbA=;
 b=NehNTax99btPQCZqelHUy5JQ+EVON5ciXip9t2ls5yebvt+sNQdg0LcfJau+AUCRkIxJIg
 brDBsEfRM/W4k/7ggvzcpAqZ7hSsbrUJaFqbm/0dvLwnUyS/V4krvzrQhL0Q/u4rwl6WD/
 966ZkqUQqDQCyW7z0h60puNot2XWGqw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-E8VPfyfUOZ-ZCaNgqUP6_g-1; Mon, 01 Sep 2025 09:17:30 -0400
X-MC-Unique: E8VPfyfUOZ-ZCaNgqUP6_g-1
X-Mimecast-MFC-AGG-ID: E8VPfyfUOZ-ZCaNgqUP6_g_1756732650
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45b828bed3fso10829565e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 06:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756732649; x=1757337449;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LZO/bK69jUlRIeMZwS/vG5/0W+8gIUMGxQyNC0dZPbA=;
 b=iT/aO67wUQSMo/aO0+bJ0pWrvIPa0Jr8seNBHDhwoT0HlJrY2w/OPFXxA3OuN+bvhy
 XqzUu+mJzDBnO3HvJxj7b9qLfbi0/l4CpRCK2y4kZJZXSdJxvMBiTWAoIHA9J9h9uHmV
 3ER81ZqvR/LRD/vGDTjVHebLZARNv8xfnlLky1vY9/SCskq0GG/WnuL/ieMp7y7FnOC0
 3g+z+KCkTBwRu8frAKDxq9LF1WYbc9zPdkxFi2VGcklBIO6LblWyBx8gf1aPiGhEAviz
 NE9cZGXc5BYMkrICR1V96DD1PUSdGMpU82rnWLu68xy8h+aZuXViVcmJIJ0XCtPl9Mt6
 bVBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDJfjPenkv2YdhnJcqHoPGLC3CRyDDpFinrgfGQV471NQ/9FT5iexCdS4woOMyJ5lywwj5Lgs3iBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa0jSVWR4sn1YWAMdRHLpSgQyZZG/CXKJqCzhnWAsE2PJDOhz4
 +Wa7dHCTctfXagGQJNw1Ri9XRKPWIVCwHeLO8BWoBGqMuIq9tuNkjHRVt+eQRdezgLo9e/5ZoqC
 XsSXe+E3wdHiRISJeH9WFLese5VEHa/4UXBC8AX222iQkey3lK+exWpw1hDR5BVK1wl2GgA==
X-Gm-Gg: ASbGncvgpgqwe4BVj6lKDd9psAsF7r2xbz1GmRsrRVt1EnRIWKvFhf8OUSweyBAJOhQ
 BOF4ZLNeXxsXTmcAwv1eJqOPJFEr9DR5kQRmDQQf9fNMnay+ZeLvHHELAQXVeuxAsyGwn2THG9f
 zYxwPdeWCAuBJuIq8ZttgNED+MmORgtLxGs4xATLnjvvKO6UdoF9+mseBY6bdCjQqO7Ogpnpv0R
 Xz913sx14mrH6OGb5WuXsYQHNQU2Wu6wMCOFERl/gyvCqdbiHByi6STovhJt+4j7RetKlFGU8B6
 hTRid6OpDqWaX8op/O2mwkiOv327ee/hMMMufNI5dBLnfbb36IDALY7x2vgaC/iRUg==
X-Received: by 2002:a05:600c:8b42:b0:45b:7e86:7378 with SMTP id
 5b1f17b1804b1-45b8558be6emr57766885e9.34.1756732649592; 
 Mon, 01 Sep 2025 06:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhXOtsZRDLW2l3J+Wn9wiLXesejOPTq/Wp1Kxm7t60DSLp7i1mtWhQUMZ8vc4tXh5zVbs2Hw==
X-Received: by 2002:a05:600c:8b42:b0:45b:7e86:7378 with SMTP id
 5b1f17b1804b1-45b8558be6emr57766575e9.34.1756732649152; 
 Mon, 01 Sep 2025 06:17:29 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f4aa8a0sm238572925e9.12.2025.09.01.06.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 06:17:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] MAINTAINERS: Add entry for Sitronix ST7920 driver
In-Reply-To: <20250901-industrious-rooster-from-mars-85e3cc@houat>
References: <20250806-st7920-v1-0-64ab5a34f9a0@gmail.com>
 <20250806-st7920-v1-3-64ab5a34f9a0@gmail.com>
 <24a5ac33-945b-4861-ac0b-94eaa647e893@kernel.org>
 <CABdCQ=Mysc3a5JNe7te0nRAOzB2n9vQcEz+hZmE3B3vmDYNt2A@mail.gmail.com>
 <083588db-10a5-48ff-80da-55c5b79e843b@kernel.org>
 <20250901-industrious-rooster-from-mars-85e3cc@houat>
Date: Mon, 01 Sep 2025 15:17:26 +0200
Message-ID: <87y0qyfh21.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hwt4aC6_GcJg8eJQrsccSEZeX6wqWkn3aRPkujEm2Ys_1756732650
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

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> On Wed, Aug 20, 2025 at 03:10:16PM +0200, Krzysztof Kozlowski wrote:
>> On 20/08/2025 14:23, Iker Pedrosa wrote:
>> >>>
>> >>> +DRM DRIVER FOR SITRONIX ST7920 LCD DISPLAYS
>> >>> +M:   Iker Pedrosa <ikerpedrosam@gmail.com>
>> >>> +S:   Maintained
>> >>> +T:   git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> >>
>> >>
>> >> Drop, unless you have commit rights there. Parent entry already covers
>> >> this, doesn't it?
>> >>
>> > 
>> > I don't have them, but I'm working with Javier and I think he does have
>> > permissions. Let me ask him when he gets back.
>> 
>> Javier is not mentioned here. You are adding redundant and useless
>> information. T: is for subsystem maintainers, not for individual drivers.
>
> Kinda. I mean, you're absolutely right for pretty that it's implicit in
> most places in the kernel.
>
> However, it's not here. The drm-misc tree is meant to collect the
> patches for all those small drivers, and we don't have a folder to put
> these drivers under.
>
> It was pretty confusing to differentiate a driver maintained through its
> own tree, and one maintained through drm-misc, so at least explicitly
> having the git tree set to drm-misc is how we show that's where the
> patches are going to land.
>

Thanks a lot for the clarification.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

