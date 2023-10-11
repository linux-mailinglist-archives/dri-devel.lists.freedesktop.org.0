Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D77C4D97
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED14E10E5F1;
	Wed, 11 Oct 2023 08:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5FA10E5D1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697014182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v7p+gT1BFGsm9JpR0WAEA6fS7XL44+MjD9PCU+IXIk8=;
 b=OPQWE13cYAc4q01+FGjkBTJIncxSGeYU8UybIpgALbU+zrbVmsC3SVld5YAvHaPjwlJpPW
 QbO6tJ/5OfJdZy7Ui8jY43iziMMm4trlt1Fcof0/zBi8Ko2XWvOVx5LJaev7VWNlmv4+Jl
 c9gp9PCgqUqhenB0nfxEGOimkEpdWDQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-gmEKif3vO_CTMm5TzpooCQ-1; Wed, 11 Oct 2023 04:49:41 -0400
X-MC-Unique: gmEKif3vO_CTMm5TzpooCQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4075a573035so7860285e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697014180; x=1697618980;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7p+gT1BFGsm9JpR0WAEA6fS7XL44+MjD9PCU+IXIk8=;
 b=G2KKCxXC1wSdR/LBFXfws6NUMDXoaOlCnhcFpMMeKLFY/wMzeyxQG6MqeTJN3YxzGu
 mHTBlr+RghexUsISIPUPY0bxb8uSEAIKkboEf3Zb/gDNxTw/TNOsqFcyfWT6DkLgsRzU
 s22sCzuuO2WaNFzigCbZHu8o6LAIjo+ITNidiyrD3D4NeXFawuh29mkkoMnpVJ10j1pG
 nmP9FiLXq86Iou4abVz8cD0Fj3znqYodqxjeI5mtTpO6scLqNkLmMiiOjMUxQjk+xQK8
 WSqTFMWR7eJYjcPcZbHJAXVL9kI8OckPSfceqF95XMqnYr6MLQf6dbDRNV9NfLB5MdK3
 y3GQ==
X-Gm-Message-State: AOJu0Yy8p1pODdjQQbmecI3cAztoyQGKN4YiBlJRj4cAf66SPbhkAYFb
 V3zfbXuX/0FSNAby6woWmu6Vs1cPXQ0kaUlM/6FGHnINWrbFVhJh/ZcaFjZ523oz9RtW8jUstSf
 HlnqhW64TVa872SavB0KBuUdVE5QA
X-Received: by 2002:a05:600c:3b89:b0:406:478e:9e2d with SMTP id
 n9-20020a05600c3b8900b00406478e9e2dmr17266870wms.26.1697014180238; 
 Wed, 11 Oct 2023 01:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMk/WfgoVRBsAcpGEPEZXx8KzMpE03uuKB/MMWvjPxgBJOuXw+ZzUoM4SqRqGjbIVG7/sI1g==
X-Received: by 2002:a05:600c:3b89:b0:406:478e:9e2d with SMTP id
 n9-20020a05600c3b8900b00406478e9e2dmr17266861wms.26.1697014179892; 
 Wed, 11 Oct 2023 01:49:39 -0700 (PDT)
Received: from localhost ([185.124.31.160]) by smtp.gmail.com with ESMTPSA id
 n16-20020a1c7210000000b00406725f27e1sm16090936wmc.42.2023.10.11.01.49.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 01:49:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/8] drm/ssd13xx: Add support for the SSD132x OLED
 controller family
In-Reply-To: <CAMuHMdVnJPBfcaPSpeONuz0dPsWUD69_GnWXwbs9VPgN+fhmtw@mail.gmail.com>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-8-javierm@redhat.com>
 <CAMuHMdVnJPBfcaPSpeONuz0dPsWUD69_GnWXwbs9VPgN+fhmtw@mail.gmail.com>
Date: Wed, 11 Oct 2023 10:49:38 +0200
Message-ID: <87h6mxsfvh.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,
>
> On Mon, Oct 9, 2023 at 8:36=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> The Solomon SSD132x controllers (such as the SSD1322, SSD1325 and SSD132=
7)
>> are used by 16 grayscale dot matrix OLED panels, extend the driver to al=
so
>> support this chip family.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thanks for your patch!
>
>> --- a/drivers/gpu/drm/solomon/ssd13xx.c
>> +++ b/drivers/gpu/drm/solomon/ssd13xx.c
>
>> @@ -631,9 +821,12 @@ static int ssd13xx_fb_blit_rect(struct drm_framebuf=
fer *fb,
>>         unsigned int dst_pitch;
>>         int ret =3D 0;
>>
>> -       /* Align y to display page boundaries */
>> -       rect->y1 =3D round_down(rect->y1, SSD130X_PAGE_HEIGHT);
>> -       rect->y2 =3D min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE=
_HEIGHT), ssd13xx->height);
>> +       if (ssd13xx->device_info->family_id =3D=3D SSD130X_FAMILY) {
>> +               /* Align y to display page boundaries */
>> +               rect->y1 =3D round_down(rect->y1, SSD130X_PAGE_HEIGHT);
>> +               rect->y2 =3D min_t(unsigned int, round_up(rect->y2, SSD1=
30X_PAGE_HEIGHT),
>> +                                ssd13xx->height);
>> +       }
>
> Don't you need to align to page boundaries (2 pixels per page)
> on SSD132X?
>

I guess so, yes. I'll add that to v2 as well.

> This should be handled through ssd13xx_funcs instead of a family check.
>

Agreed.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

