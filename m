Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFCE7C4D3A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378E410E238;
	Wed, 11 Oct 2023 08:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04D210E238
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697013238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NBSUHVYwZj4KmNlo/HekBOnWzf8kuUwRk15W2B1doHE=;
 b=KAY+eH4jCQ/p0S1UaD+DFRDNup3axB7cs7wZYvOZvxYgTfzxDm5HZrRHJgW41TuPOvin/Y
 TLtGMG4WBwZt6J4BiMjUcJ3KGJOfghYH05MkcsXk9kuG90OPDmuVgnz4gr4VaGvIk1oo3u
 q7kEaD3w2W5TrGZHnV6s/r5olPG35II=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-tTY6xcR7M_yrX66Wb5W_vw-1; Wed, 11 Oct 2023 04:33:57 -0400
X-MC-Unique: tTY6xcR7M_yrX66Wb5W_vw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4067f186094so42646515e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697013236; x=1697618036;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBSUHVYwZj4KmNlo/HekBOnWzf8kuUwRk15W2B1doHE=;
 b=IZ4QjcFSixujN8m1h7T5g4BN1+H7NHGQZbY/4PhR95XGe/iDP0ReoYS7GvdTn0E99C
 PXEl2Lginu13Yf4IsfESx800nml+maxo1jNxLfLazgP86RNsnWSM1kobFGx0IU7ZAm+w
 a9QQwRbLkEOPGO/+nhwnMFTe7GMdMHvrncSEfEIAxDN/NgoI9+yQg9o19fCpLu5oH/B+
 V7UCninWrsWJgKAc5pbW0vu2ZPqeqepL9kEW/enWd3V5hVfScHp2O9n1YotmNz66YgLn
 LYEbGukObtQIjtyYhtAg4wia2Ox2rJo1qzDUn0kVnObuFdr9iI+5NnzIN0mv+mSlj/DH
 jb0A==
X-Gm-Message-State: AOJu0Yz2oRK+0J7sQMHpqtErtF93/ey88NNNeXs1Fa6gt/OmUM/ZWyaS
 q02aP3wSBC1834BvksrotN37B0H0bIUKxLSVa3J8xeBwg1EfPB5KPopkA9iFeyD+HcthYq+zHKs
 d7XLBmEiQ+K6lUCutE/TSkoqEoPk4
X-Received: by 2002:a1c:f710:0:b0:401:be77:9a50 with SMTP id
 v16-20020a1cf710000000b00401be779a50mr17626450wmh.8.1697013236580; 
 Wed, 11 Oct 2023 01:33:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyRNmcOuM6kEhCJe8HBmwlRQzNEqoTa9cWmacSt1cPCBvFmG9AI8JkFBAF3LS/TIPSphIClA==
X-Received: by 2002:a1c:f710:0:b0:401:be77:9a50 with SMTP id
 v16-20020a1cf710000000b00401be779a50mr17626440wmh.8.1697013236300; 
 Wed, 11 Oct 2023 01:33:56 -0700 (PDT)
Received: from localhost ([185.124.31.160]) by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c224400b003fe2b081661sm18516317wmm.30.2023.10.11.01.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 01:33:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/8] drm/ssd13xx: Replace .page_height field in device
 info with a constant
In-Reply-To: <CAMuHMdWSOcgV-qseaidUKcJswiJzr2+JQqB=k6tasaUXiEyiHw@mail.gmail.com>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-4-javierm@redhat.com>
 <CAMuHMdWSOcgV-qseaidUKcJswiJzr2+JQqB=k6tasaUXiEyiHw@mail.gmail.com>
Date: Wed, 11 Oct 2023 10:33:54 +0200
Message-ID: <87pm1lsglp.fsf@minerva.mail-host-address-is-not-set>
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

Hello Geert,

Thanks a lot for your feedback.

> On Mon, Oct 9, 2023 at 8:36=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[...]

>>         u32 array_idx =3D 0;

[...]

>>
>>                         for (k =3D 0; k < m; k++) {
>> -                               u8 byte =3D buf[(8 * i + k) * line_lengt=
h + j / 8];
>> +                               u32 idx =3D (page_height * i + k) * line=
_length + j / 8;
>
> Nit: I would use unsigned int for idx, as that matches all other
> variables involved.
> But given array_idx is u32, too, u32 may makes sense.
>

Yes, this function logic is mostly based on ssd1307fb_update_rect() from
drivers/video/fbdev/ssd1307fb.c and that is from where the u32 array_idx
comes from.

As you said, I used u32 for idx to be consistent with that variable type.

>> +                               u8 byte =3D buf[idx];
>>                                 u8 bit =3D (byte >> (j % 8)) & 1;
>>
>>                                 data |=3D bit << k;
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

