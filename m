Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083477FD144
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 09:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815A510E0A1;
	Wed, 29 Nov 2023 08:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C503610E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 08:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701247549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCGY15jJn4zGLKzXjYF0FeVJbihFVMXJYug90Dm9ni8=;
 b=csdkclNnJWS6SIUD1QOqIT7Dhhbtn06XlU6uovOeUyJC5kUut0ZRTUQy9X070x0WZlOSSI
 uKVYGjSJBlullwrS/5cLKDfyHxarVjnxv05nWAms75JCoh5h5uvL6T8wqG952vz/uOeLHU
 tk6b7m7Yf41bofjD9Huhfi+j+TuTGwA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-1RKaycxdP3qBTLXhnxeyWg-1; Wed, 29 Nov 2023 03:45:48 -0500
X-MC-Unique: 1RKaycxdP3qBTLXhnxeyWg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-332ee20a3f0so3964406f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701247547; x=1701852347;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7oAAA15rOVCfVDFVia+LTQgyeo/WyMzRo1xULkvSRA=;
 b=waP1njrjnmcP/7xDEwNmrLZM4YUdvDXiMz456sw49Sb0jzfvkVtVEgq9i3cbOxANk8
 is897SXoDoQK8mXb/SRHOoVq34/mNPbItjVbN42wkUCJCZgEEzAU7+/0HBqdTE8/iMSB
 TYcaeT0Tv6Em9nrNONJDTHoSJHO39c34R9T2CWVlm+mRYAXWrDqRrRgKEDZRGQRp2TOf
 vTa1BGrMD3bkdocmGaOJXyMdU7AJAQBiyucTsy4JRkhwzQdhpM+BUUT2fwBhMTQ/H34q
 1S8w+zoWMAl9t0W9uYndEq+wCaobymaq8chCsbEwZJddUyhTjhTgqy/aPHgiDV65oOPq
 6lUw==
X-Gm-Message-State: AOJu0YwlPEMyP/IRLZl27XtVkpCo4GvYFDNWW+0U6OcI+CjPijjYHyto
 Gy5pIVcGJt+ElWsI5dxNf0jBIrshc3T/isE2q+YSFRF09tSmr3hu1ORn8oZs80VV5/oXwltQcnl
 hSAHFOlOyYuPrbT+P9RoT0ycHHGPC
X-Received: by 2002:a05:600c:4ec7:b0:40b:4b2d:8d0f with SMTP id
 g7-20020a05600c4ec700b0040b4b2d8d0fmr3468029wmq.31.1701247547353; 
 Wed, 29 Nov 2023 00:45:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUZa9CF5ktLhl2smtnYSsgYgs9e/fhsqdBDOEDAnezf8nhgh6VesIGyD9zauK/BmCgBx8Ohg==
X-Received: by 2002:a05:600c:4ec7:b0:40b:4b2d:8d0f with SMTP id
 g7-20020a05600c4ec700b0040b4b2d8d0fmr3468008wmq.31.1701247546986; 
 Wed, 29 Nov 2023 00:45:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i5-20020adfe485000000b0033300a0b444sm8028033wrm.66.2023.11.29.00.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 00:45:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
In-Reply-To: <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
 <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
Date: Wed, 29 Nov 2023 09:45:45 +0100
Message-ID: <87fs0paqx2.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Nishanth Menon <nm@ti.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> Hi,
>
> On Tue, Nov 28, 2023 at 08:16:18PM +0100, Geert Uytterhoeven wrote:
>> On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canillas
>> <javierm@redhat.com> wrote:
>> > Geert Uytterhoeven <geert+renesas@glider.be> writes:
>> > > The Imagination Technologies PowerVR Series 6 GPU is currently only
>> > > supported on Texas Instruments K3 AM62x SoCs.  Hence add a dependenc=
y on
>> > > ARCH_K3, to prevent asking the user about this driver when configuri=
ng a
>> > > kernel without Texas Instruments K3 Multicore SoC support.
>> > >
>> > > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR driv=
er")
>> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > > ---
>> >
>> > Indeed. Although I wonder what is the supposed policy since for exampl=
e
>> > the DRM_PANFROST symbol only depends on ARM || ARM64 and others such a=
s
>>=20
>> I think ARM Mali is sufficiently ubiquitous on ARM/ARM64 systems to
>> have just an ARM/ARM64 dependency...
>>=20
>> > DRM_ETNAVIV don't even have an SoC or architecture dependency.
>>=20
>> Vivante GPUs are found in DTS files on at least 4 architectures.
>> Might be worthwhile to add some dependencies, though...
>>=20
>> > In any case, I agree with you that restricting to only K3 makes sense.
>>=20
>> I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS || ...,
>> eventually ;-)
>
> I disagree. This is to handle a generic IP, just like panfrost, lima, or
> etnaviv, and we certaintly don't want to maintain the Kconfig list of
> every possible architecture and SoC family it might or might not be
> found.
>

Thanks for the clarification. Then the policy is to have a depends on
ARCH_$FOO if the IP block is tied to a particular SoC or SoC family ?

For example, DRM_V3D has:

depends on ARCH_BCM || ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST

If the IP block is generic and could be integrated with any SoC, then it
should not have a dependency as you said.

> GPUs supposed to be handled are spread across 4 architectures (x86,
> riscv, arm, arm64, mips?), and in arm/arm64 alone we have at least 5
> platforms that might use it (allwinner, ti, mediatek, renesas, rockchip)
>
> It didn't make sense for panfrost, or etnaviv. It doesn't make sense for
> that driver either. Especially for something that olddefconfig can
> handle just fine.
>

I think then that we should drop the arch and SoC dependency for these GPU
drivers and just leave the symbols they really depend on (e.g: DRM, MMU) ?

> Maxime

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

