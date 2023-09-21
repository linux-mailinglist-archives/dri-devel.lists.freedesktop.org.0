Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D89F7A928F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF8C10E04A;
	Thu, 21 Sep 2023 08:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3EE10E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695284626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zydY4Tk9xl3IfKPf9FskqQOwb6j4myF6A9udZr+Bd94=;
 b=Tgpwm2bpMf142M5011b5TB6uX5gUwrvaFUNAh/QLpHCRB47ucbR4KdhLmDm8Q7/2VwqnTw
 40ArhDNQP0PMFLhgc4N3jxk0KHXVejrobrfbRnHL7NDKfggJSxurSUXBU1j935D9bgC4/d
 I9BE850MyObO7UE/5g9Zye1hwGqsqXQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-HqLDi_MLMzuSnzI08FRpmA-1; Thu, 21 Sep 2023 04:23:45 -0400
X-MC-Unique: HqLDi_MLMzuSnzI08FRpmA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4030ae94fedso5499075e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 01:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695284624; x=1695889424;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2a24TVSLI/ISUJje8TKidtXyBUQe4xENgDvq1thGRYk=;
 b=aCtCyFhzTlGQvus0hPLmy4ULlh7Ok36MubhMA8iT7R7vwPNm35E12hxYlB1J313dOy
 awTOFYaX+5R9i9Dxe7swyW0P8xgFF/nW+DrMDKbQXQaRDmUltKia7S/Yh9LachlSiMjz
 13+C3AQyL7Yz64n3Y41Y9IsHc1zOYG5Lwt8N4cghAW/M74crNAZRZvuPtgFeAlBaAr7p
 6OnW/K2PU8oDWAosGWWelnlw48JD5Dc8heTJi5zBw7aFrehUT0kxOwTOZpP3Che+07bo
 TDxOJGwiYUQLfxD7Ew2smKWef4GYV4dVAQtKMZp443nf2klObKXPuAnV0w0nP63vxZfC
 KAKg==
X-Gm-Message-State: AOJu0YzIOeYDBQPkWDceB5hwU3FvWglL/U27D7wolLDKwnDgqnBIaGWf
 d1PefNIojC/jJdP0GyuWxzWkg9y+rllD2abA6EI73fE/p6D+/nnrJVqrPN99vacZ7VKvxwWmEQD
 Bnf6bBCkZuiARWmSBL9qKhLICdBFQ
X-Received: by 2002:a05:600c:20c1:b0:3fe:1679:ba7b with SMTP id
 y1-20020a05600c20c100b003fe1679ba7bmr4939537wmm.24.1695284624100; 
 Thu, 21 Sep 2023 01:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGlPOfVc6+NVtnxGMl+uEHFTePMh01hmYsAi7mZMUCQ5GxvG/QCdlDyActQ6KVS/yLXVCyzQ==
X-Received: by 2002:a05:600c:20c1:b0:3fe:1679:ba7b with SMTP id
 y1-20020a05600c20c100b003fe1679ba7bmr4939520wmm.24.1695284623713; 
 Thu, 21 Sep 2023 01:23:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c23-20020a7bc857000000b003fefca26c72sm1247813wml.23.2023.09.21.01.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 01:23:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
In-Reply-To: <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
 <CAMuHMdUGVgj6V+N865QZaAusqD7O2f1askE544Z4MF0h4zBERg@mail.gmail.com>
Date: Thu, 21 Sep 2023 10:23:42 +0200
Message-ID: <878r90kk8h.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert and Maxime,

> Hi Maxime,
>
> On Thu, Sep 21, 2023 at 9:44=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
>> On Mon, Sep 18, 2023 at 09:19:07AM +0200, Javier Martinez Canillas wrote=
:
>> > Thomas Zimmermann <tzimmermann@suse.de> writes:
>> > > Am 14.09.23 um 21:51 schrieb Javier Martinez Canillas:
>> > >> The driver uses a naming convention where functions for struct drm_=
*_funcs
>> > >> callbacks are named ssd130x_$object_$operation, while the callbacks=
 for
>> > >> struct drm_*_helper_funcs are named ssd130x_$object_helper_$operati=
on.
>> > >>
>> > >> The idea is that this helper_ prefix in the function names denote t=
hat are
>> > >> for struct drm_*_helper_funcs callbacks. This convention was copied=
 from
>> > >> other drivers, when ssd130x was written but Maxime pointed out that=
 is the
>> > >> exception rather than the norm.
>> > >
>> > > I guess you found this in my code. I want to point out that I use th=
e
>> > > _helper infix to signal that these are callback for
>> > > drm_primary_plane_helper_funcs and *not* drm_primary_plane_funcs. Th=
e
>> > > naming is intentional.
>> >
>> > Yes, that's what tried to say in the commit message and indeed I got t=
he
>> > convention from drivers in drivers/gpu/drm/tiny. In fact I believe the=
se
>> > function names are since first iteration of the driver, when was meant=
 to
>> > be a tiny driver.
>> >
>> > According to Maxime it's the exception rather than the rule and sugges=
ted
>> > to change it, I don't really have a strong opinion on either naming TB=
H.
>>
>> Maybe that's just me, but the helper in the name indeed throws me off. I=
n my
>> mind, it's supposed to be used only for helpers, not functions implement=
ing the
>> helpers hooks.

I agree with your definition of helpers. But more importantly for me is
what you mentioned, that most DRM drivers aren't using this convention
of concatenating  the driver name + struct type name + callback name.

>
> With several callbacks using the same (field) name, it is very helpful
> to name the actual implementation by combining the struct type name
> and the field name.  Anything else confuses the casual reader.

Both options have cons and pros (e.g: quickly figuring out to what struct
callback is associated as you said), but the reason I posted this patch is
to attempt making the driver more consistent with the rest of the drivers.

> Perhaps the real question is whether the structures should have "helper"
> in their name in the first place?
>

Indeed. I never fully understood why the DRM/KMS objects callbacks are
split in drm_$object_funcs and drm_$object_helper_funcs structs. AFAIU
is because the former is the minimum required and the latter is to add
additional custom behavior ?

I read this section of the documentation but still isn't clear to me:

https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html

> Just my 2=E2=82=ACc as a DRM novice...
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

