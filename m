Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7840A7C4D8B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE3910E5C5;
	Wed, 11 Oct 2023 08:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1928510E5C5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697014128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTr3a3ppGDhi4twhrc1i0AvUfZQFLysYuWMZiZ0XSmc=;
 b=B+cRIZp0FTsfBJSt6mZpbgXHte1sy/3D5JJLJDN0kOegiaPbdWhWvHCmJEakCD8WZPmMy7
 6z/JbXC0XanKFFIWdOhX9dMjTW6ISmv0+Yx0titKdLev/Y2W4UcSMH3aBK9T6bX65OpthT
 QxD71nJkeq+SZWjH0/NwMpFFyKGbQSg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-ZLPXFkwQNE-Lfx3rqtvdJQ-1; Wed, 11 Oct 2023 04:48:41 -0400
X-MC-Unique: ZLPXFkwQNE-Lfx3rqtvdJQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3172a94b274so4466049f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697014120; x=1697618920;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KC8w0Fq0raXD6liRw4fjPK1Tcvy7e0RKiaMGufrFBog=;
 b=onS10TL3ArND4Lh1+iIgfRWeyNsIXd3mf3wWkKe0DyZChZxFHvwBMUVq8VMCDJFRZk
 604t0YYfUhMAb74JbtqLsFqKweGhPet7o/G9EyrW7XvMWY8G+v8e/Lc35MlCOkVjn5aW
 A9G8t10MVyg+6XraxoUBJE2wFm6x1du8Lb/+Kk1UtbcpvVyx6ai6s+VtwJxJOSsLje8K
 d2WhI7YTnGtvHchRDUm9fgDuOXyV2nPsR1OcJgN3Zfu8ZHD+XCMRPG819QBTD4or9wLq
 WU4066pujm61LXZfjc9gU9DpgY/djeE0R+IPkJcE70EWUeo48A8d9eqmi3xHjWD5u/Fi
 Tc6g==
X-Gm-Message-State: AOJu0YzHD76WUUMusrcnAWUSzMPwfHPEmzpLqdedWKYxzRdyCs7fRk8a
 YN3q5iUiKOnoAMQNo2yrgfB6Vz9U9rpmsLLxeosdky74iSFjRnq3xUDtqMaGCskyApbaEok9I8p
 vBJk5fQBRZO497hN8g7e7FDSImoFl
X-Received: by 2002:a5d:4fd2:0:b0:314:15a8:7879 with SMTP id
 h18-20020a5d4fd2000000b0031415a87879mr16709913wrw.34.1697014120693; 
 Wed, 11 Oct 2023 01:48:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu7Ki2HA96j+VxEN6W2qlhAocs8VRGy4ACvoVY0BEVlpMah6SSArUaqxvpmFWqRt/6v3MMRg==
X-Received: by 2002:a5d:4fd2:0:b0:314:15a8:7879 with SMTP id
 h18-20020a5d4fd2000000b0031415a87879mr16709893wrw.34.1697014120369; 
 Wed, 11 Oct 2023 01:48:40 -0700 (PDT)
Received: from localhost ([185.124.31.160]) by smtp.gmail.com with ESMTPSA id
 j16-20020a5d6190000000b003217cbab88bsm14702622wru.16.2023.10.11.01.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 01:48:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/8] drm/ssd13xx: Add a per controller family functions
 table
In-Reply-To: <CAMuHMdX0gvW4Y5ppWi=qF6mZF00m4G-fP1-Wg+sKW43Ku5fz9A@mail.gmail.com>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-6-javierm@redhat.com>
 <CAMuHMdX0gvW4Y5ppWi=qF6mZF00m4G-fP1-Wg+sKW43Ku5fz9A@mail.gmail.com>
Date: Wed, 11 Oct 2023 10:48:38 +0200
Message-ID: <87jzrtsfx5.fsf@minerva.mail-host-address-is-not-set>
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
> On Mon, Oct 9, 2023 at 8:36=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> To allow the driver to decouple the common logic in the function callbac=
ks
>> from the behaviour that is specific of a given Solomon controller family=
.
>>
>> For this, include a chip family to the device info and add fields to the
>> driver-private device struct, to store the hardware buffer maximum size,
>> the intermediate buffer maximum size and pixel format, and a set of per
>> chip family function handlers.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thanks for your patch!
>
>> --- a/drivers/gpu/drm/solomon/ssd13xx.c
>> +++ b/drivers/gpu/drm/solomon/ssd13xx.c
>> @@ -104,6 +104,7 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] =
=3D {
>>                 .default_width =3D 132,
>>                 .default_height =3D 64,
>>                 .page_mode_only =3D 1,
>> +               .family_id =3D SSD130X_FAMILY,
>
> Why not store &ssd13xx_family_funcs[SSD130X_FAMILY]?
>

I could do that, yeah. Originally thought that could be useful besides the
per chip functions, but I don't think that it's used for anything else...

[...]

>> +       switch (family_id) {
>> +       case SSD130X_FAMILY:
>> +               unsigned int pages =3D DIV_ROUND_UP(ssd13xx->height, SSD=
130X_PAGE_HEIGHT);
>> +
>> +               ssd13xx->data_array_size =3D ssd13xx->width * pages;
>> +
>> +               fi =3D drm_format_info(DRM_FORMAT_R1);
>> +               break;
>> +       }
>
> Please don't mix ssd13xx_funcs[family_id] and switch (family_id).
> The switch() could be replaced by an extra function pointer in
> ssd13xx_funcs, and by storing fi in ssd13xx_funcs, too.
>

Yes, I didn't want to store the format info in struct ssd13xx_funcs
because the idea was for that struct to only have chip operations.

But could do that. I wonder if should rename that struct thought? to
something that better denotes is more than function handlers.

> Note that you don't really need the full drm_format_info, the number
> of bits per pixel is sufficient.  But having the drm_format_info is
> nice, as fmt_convert() will need it later when adding support for
> fbdev emulation using R1 or R4 ;-)
>

Exactly, thinking in your patches is why I stored the full format info :)

> Gr{oetje,eeting}s,

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

