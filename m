Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B783080C43E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB87C10E372;
	Mon, 11 Dec 2023 09:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id D94B010E372
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702286220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EjnP7AGvvE+8BzGpddymq+OD7K/OY1HEfmVm58sCVwc=;
 b=DPabs9F91R+Z/EDb/EelSDo7z7S6sFyONlaz6cIHYq3+NYpo+lCQ8f6ZlQBZCjv0hjgJGS
 4sQbzyQgeB5lIP7smrpFrtAgJPpz7/YDjYVUsOnMJ2zzXH0jDA4bpyaHYocjoDWqXn/+1X
 u7YFqc+gtdEBgbqNgRrAx36+wovKgoA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-nD2_lf-SO_O9zOUpVLyL4Q-1; Mon, 11 Dec 2023 04:16:58 -0500
X-MC-Unique: nD2_lf-SO_O9zOUpVLyL4Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40c1d2b1559so30830925e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702286217; x=1702891017;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lK4eeZ4sLlvlBES1M0eZxp5zHUu4nIoZgo+AmsPuvnw=;
 b=ISxKKlc+82s8NDg5sGNxgfb7r8y+zPLRB1WEvJ5c1Qcj4vYCZAuoC6UOyvwDVGG4An
 oIkW4eu20ZTawLp04btLKeiLmDtMDkaJR6DqRTAuNFxoLoSGlNBvCdj6B5SBcDmcAHRX
 N07vwWsZvM3GU4uzlFRhHm2xpLn2b1AkTrWC2dtqP4YEDeiAa9Iobn2Heq8/Y3kZD6TI
 nJ9QgJDa5y5fT3Fw58NAYqIWMsGO0QapApLW3jAr1+mUTZtZomldIrVoX0Fgli4kOC46
 PCLYLJGC0Q8KzNAN6rRO27jYU7HPJbUeFu7rQdqJK8l8/Dq323iQAAQrj7m9eDHOCAEZ
 xpKg==
X-Gm-Message-State: AOJu0Yw2iwS/I0UeVwCCH+iH340nM2lhJl+u89XoeJgjsdWkHIPewOJ+
 O2sVOplIxAR/uTSfTRYacYnufoe9xDwuCGBlHVpSecT7ebBwzLuK+C+h1zGoqvoXDLmMmrIRH3Y
 C6OOYNil6FIlE59QMlO5S7xNCXmh4
X-Received: by 2002:a05:600c:4709:b0:40c:4b43:d98c with SMTP id
 v9-20020a05600c470900b0040c4b43d98cmr247258wmo.2.1702286216974; 
 Mon, 11 Dec 2023 01:16:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXHryXprHrdGOAsChmN7NOx2F9Pxtro4A9/CFyAHmOjv9/kfsPSejtLFod+DqFPW883t758w==
X-Received: by 2002:a05:600c:4709:b0:40c:4b43:d98c with SMTP id
 v9-20020a05600c470900b0040c4b43d98cmr247252wmo.2.1702286216607; 
 Mon, 11 Dec 2023 01:16:56 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 az27-20020a05600c601b00b0040c34e763ecsm11130509wmb.44.2023.12.11.01.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 01:16:56 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
In-Reply-To: <CAAhV-H4ZBZpSUYVqvNsBqXU8xPw-=jwJLALgWHOqQNwkwKr2fg@mail.gmail.com>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <878r61gmuw.fsf@minerva.mail-host-address-is-not-set>
 <CAAhV-H4ZBZpSUYVqvNsBqXU8xPw-=jwJLALgWHOqQNwkwKr2fg@mail.gmail.com>
Date: Mon, 11 Dec 2023 10:16:55 +0100
Message-ID: <8734w9gku0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Huacai Chen <chenhuacai@kernel.org> writes:

> Hi, Javier,
>
> On Mon, Dec 11, 2023 at 4:33=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Huacai Chen <chenhuacai@kernel.org> writes:
>>
>> Hello Huacai,
>>
>> > Hi, Javier,
>> >
>> > On Wed, Nov 8, 2023 at 4:24=E2=80=AFPM Javier Martinez Canillas
>> > <javierm@redhat.com> wrote:
>> >>
>> >> Hello,
>> >>
>> >> On Wed, Nov 8, 2023 at 9:14=E2=80=AFAM Thomas Zimmermann <tzimmermann=
@suse.de> wrote:
>> >> >
>> >> > Hi,
>> >> >
>> >>
>> >> [...]
>> >>
>> >> >
>> >> > Relying on linking order is just as unreliable. The usual workaroun=
d is
>> >> > to build native drivers as modules. But first, please investigate w=
here
>> >> > the current code fails.
>> >> >
>> >>
>> >> I fully agree with Thomas here. This is just papering over the issue.
>> >>
>> >> I'll read the lengthy thread now to see if I can better understand
>> >> what's going on here.
>> > Have you understood enough now? I really don't want the original patch
>> > to be reverted.
>> >
>>
>> I discussed this with Thomas but we didn't fully understand what was goi=
ng
>> on. In theory, it should work since the native driver should disable sys=
fb
>> and remove the registered platform device. But it seems that this does n=
ot
>> happen for Jaak and others who reported the same issue.
>>
>> Something that we noticed is that PCI fixups happen in fs_initcall_sync(=
)
>> and since the sysfb_init() should happen after the PCI subsystem for EFI
>> quirks, we think that at least should be moved after that initcall level=
.
>>
>> That means rootfs_initcall() onwards, and that takes it almost at the sa=
me
>> before your patch. The safest would be to move sysfb_init() to initcall
>> device_initcall_sync() and make sure that happens after all the native D=
RM
>> drivers, since module_init() happens at device_initcall().
>>
>> I think that Thomas meant to send a patch to do that change.
> Thank you very much. I guess things may be like this:
> i915 init at first, then simpledrm init in parallel and finished
> before i915 call sysfb_disable(), so in my previous reply I provide a
> debug patch for Jaak to see what happens.
>

Yes, specially with async probing although neither i915 nor simpledrm use
it right now AFAICT.

Is still unclear to me what's going on in this particular case, although
moving it to device_initcall_sync() seems to be the correct thing to do
regardless of this issue.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

