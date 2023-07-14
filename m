Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59AF753702
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 11:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC3210E842;
	Fri, 14 Jul 2023 09:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047CA10E842
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689328118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z97MyfIRibDWN3rLru1qWEoPopdMmVgdKe32TsvDViA=;
 b=eJaT95ayOIAEI7n/JVF5JZAiVFi7w/cF4Vz+QBfAASHVp9uGKsMD78VAn857GHhPJNSm0v
 EEGksbZwN6LMtkxqqEn7Z0CnDnnYP+1kwSz1EbPMFwCIjXtkY3jr/Z62mS4SRqhpP3/JnQ
 rtzWooAA3iSp0XHY8niFyVaXTeXeW20=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-4gXBXCLfP3SVCAoEAsIJGg-1; Fri, 14 Jul 2023 05:48:37 -0400
X-MC-Unique: 4gXBXCLfP3SVCAoEAsIJGg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-315a03cae87so1153811f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 02:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689328116; x=1691920116;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z97MyfIRibDWN3rLru1qWEoPopdMmVgdKe32TsvDViA=;
 b=UIho/PFeo29ppK97K/ke5D8YO8kjqW74QQBvKLI0YwOakJqC+LHULUHw58wL96gaoO
 DtufeIiH3Hh8YDN+pLEtrXqkG0HuTQRK4lMPOAdtOkRj1CSloKxR7birvKeutPPogPeW
 gSfdC4LS3QzFDrGT7FqXQ9WwjfibTUbrfjYkoSpzPgNJHJhopTjBIjzMbwqJ9Scmjhw4
 4HaSSgLXL3H9WEj7z47TpcN0+LjKPyrkADdr7YWVUbq9Ksy+jtFh0axO9NgEOsWYELLI
 NVR5Aq6sFk91Llnl7pujLlPF3d44zNvImNAfgbjs0XszN9I2YprzaZ3wllQIBn/FsM21
 AnpQ==
X-Gm-Message-State: ABy/qLblj2GyArsMS3Hdu9g73EgnM7d0Py6OxxBZOE/o/6m6bjClnZNv
 /aMCjgbxvyP7mPZzD8eK/Zrm+1tH+hXAe5499Kol9mNxI5PBKz6wacedX57JGXSLJ7MM5zMW+dT
 41hyDWOgbiAl2Op6PnxGlSzc/QQy5
X-Received: by 2002:a05:600c:4f46:b0:3fa:125c:8d65 with SMTP id
 m6-20020a05600c4f4600b003fa125c8d65mr1901776wmq.3.1689328116103; 
 Fri, 14 Jul 2023 02:48:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGWfZIJyNMIOBOjrpSYm8OGTuUPCpFBy2GQgf6h3deOqmpOOP4cjW8gyAPZVAGHfk4rYWHYVQ==
X-Received: by 2002:a05:600c:4f46:b0:3fa:125c:8d65 with SMTP id
 m6-20020a05600c4f4600b003fa125c8d65mr1901768wmq.3.1689328115848; 
 Fri, 14 Jul 2023 02:48:35 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 s8-20020a7bc388000000b003fb41491670sm1013494wmj.24.2023.07.14.02.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jul 2023 02:48:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/8] drm/ssd130x: Fix pitch calculation in
 ssd130x_fb_blit_rect()
In-Reply-To: <CAMuHMdVAXPqjSNGMrZQ2g8FNNL4f7PbdoUCi17g9YOdoqmjFpQ@mail.gmail.com>
References: <cover.1689252746.git.geert@linux-m68k.org>
 <54deec2ec533e90544faa8c60a0c2518c58f3e9c.1689252746.git.geert@linux-m68k.org>
 <87r0pau99o.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVAXPqjSNGMrZQ2g8FNNL4f7PbdoUCi17g9YOdoqmjFpQ@mail.gmail.com>
Date: Fri, 14 Jul 2023 11:48:34 +0200
Message-ID: <874jm69631.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Fri, Jul 14, 2023 at 11:34=E2=80=AFAM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
>> > The page height must be taken into account only for vertical coordinat=
es
>> > and heights, not for horizontal coordinates and widths.
>> >
>> > Fixes: 179a790aaf2a0127 ("drm/ssd130x: Set the page height value in th=
e device info data")
>> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
>> > --- a/drivers/gpu/drm/solomon/ssd130x.c
>> > +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> > @@ -596,7 +596,7 @@ static int ssd130x_fb_blit_rect(struct drm_framebu=
ffer *fb, const struct iosys_m
>> >       rect->y1 =3D round_down(rect->y1, page_height);
>> >       rect->y2 =3D min_t(unsigned int, round_up(rect->y2, page_height)=
, ssd130x->height);
>> >
>> > -     dst_pitch =3D DIV_ROUND_UP(drm_rect_width(rect), page_height);
>> > +     dst_pitch =3D DIV_ROUND_UP(drm_rect_width(rect), 8);
>> >
>>
>> That's true for ssd130x controllers that use R1, but when doing that
>> change one of my goals was to prepare the driver for supporting the
>> ssd132x family that use a 16-grayscale pixel format (R4).
>>
>> For those controllers, the pixels are encoded in 4-bit and each page
>> has two pixels. So for those controllers the dst_pitch will need to
>> be DIV_ROUND_UP(drm_rect_width(rect), 2) instead since the width is
>> not 8 in that case.
>>
>> So I would prefer to skip this patch from your set, because otherwise
>> we will need to revert it when adding support for SSD132x controllers.
>
> My point is that the 8 as used here is related to the number of bits per =
pixel,
> not to the page height.  The page height might also be impacted by the
> number of bits per pixel, but that is orthogonal.
>

Ah, I see what you mean. Yes, you are right. We can later add a
different variable when adding support for controllers using R4.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

