Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2023880C34B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 09:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026A610E056;
	Mon, 11 Dec 2023 08:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66E1A10E056
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702283595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y0a3LUBOegqKcWyUqYG6QmlAEbnmm6TDs6whX9uCkvM=;
 b=bxaoP3Ae4Yo9rZMkWxCkGVTBpDULiEJR40gBlgS9RzuXMWvbNOGsv0WCj93FKmHFfZoyI6
 +r/Sb3YtQlq5VHT5d8yII8hiqtV95xPku+z0iiHrJCu3IezQ7pDcKvl6SWxL9j5/BT1aIf
 VXxxtQfDq9lZ7ZAGgjQI2R79wGrcHW8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-ME36E5JWMkeA1SFtrY35qQ-1; Mon, 11 Dec 2023 03:33:13 -0500
X-MC-Unique: ME36E5JWMkeA1SFtrY35qQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40a4c765d3bso20513045e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 00:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702283592; x=1702888392;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6ju2ixJkBYos05/iiXUSkYvDYJh2v2jMREXfGJP2FE=;
 b=Zhlfl3EslIDJ/QU9qX+1yq6wgYScxWXSBdrY7PgwSkNlPNds9uz1AWb3+Hb5fMaQjF
 GvGU06YzHIdimjj/xEf6XdiVK85L5VN63ifO5Kc0Qg3mrNI/POq4lCj5jDau4m4G8ZB6
 2koDY3wagandsPZlAoO9qET07ox0mRGOGj/lpPlErqEujrLV1BkFseBwkevMCc8BXFor
 Tp7WwIM5z82kh6S6h+Syx06n6YnLABOW4fkBSk31ZBMQDFwjIUYACqbqXpJtSfxaEHyJ
 y0GXPC1DuIQ1z9TekFtsgUpjYliCudoK3uo8vZFobL0Rx5QpqGKJhYWdtBzMWJMH4QmU
 2BWQ==
X-Gm-Message-State: AOJu0Yy+rO1ttOSOSeKgO2i0Wk/iTp05+f2J4E8HmwvmNYVND9EDmmlt
 c59QC/DxenXymdua33WAAnoOd3RuXrHfYzxojySMNsszAYFnBTAlElPGUmbdlaZ2bdDn42xV1k4
 b3thFqhUNv8t5dlPOYp+DHj2U0GE3
X-Received: by 2002:a05:600c:2d47:b0:40c:4378:f122 with SMTP id
 a7-20020a05600c2d4700b0040c4378f122mr1087892wmg.7.1702283592751; 
 Mon, 11 Dec 2023 00:33:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGleFxnn3Yoo6LxwlbQcsHBp1u8+y+pmqEgb/+Q5tyfUf+Y67uLFaH291j81IXlxQyJ6dQmpg==
X-Received: by 2002:a05:600c:2d47:b0:40c:4378:f122 with SMTP id
 a7-20020a05600c2d4700b0040c4378f122mr1087884wmg.7.1702283592371; 
 Mon, 11 Dec 2023 00:33:12 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bh15-20020a05600c3d0f00b0040b4ccdcffbsm12370732wmb.2.2023.12.11.00.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 00:33:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
In-Reply-To: <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
Date: Mon, 11 Dec 2023 09:33:11 +0100
Message-ID: <878r61gmuw.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Huacai Chen <chenhuacai@kernel.org> writes:

Hello Huacai,

> Hi, Javier,
>
> On Wed, Nov 8, 2023 at 4:24=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Hello,
>>
>> On Wed, Nov 8, 2023 at 9:14=E2=80=AFAM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
>> >
>> > Hi,
>> >
>>
>> [...]
>>
>> >
>> > Relying on linking order is just as unreliable. The usual workaround i=
s
>> > to build native drivers as modules. But first, please investigate wher=
e
>> > the current code fails.
>> >
>>
>> I fully agree with Thomas here. This is just papering over the issue.
>>
>> I'll read the lengthy thread now to see if I can better understand
>> what's going on here.
> Have you understood enough now? I really don't want the original patch
> to be reverted.
>

I discussed this with Thomas but we didn't fully understand what was going
on. In theory, it should work since the native driver should disable sysfb
and remove the registered platform device. But it seems that this does not
happen for Jaak and others who reported the same issue.

Something that we noticed is that PCI fixups happen in fs_initcall_sync()
and since the sysfb_init() should happen after the PCI subsystem for EFI
quirks, we think that at least should be moved after that initcall level.

That means rootfs_initcall() onwards, and that takes it almost at the same
before your patch. The safest would be to move sysfb_init() to initcall
device_initcall_sync() and make sure that happens after all the native DRM
drivers, since module_init() happens at device_initcall().

I think that Thomas meant to send a patch to do that change.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

