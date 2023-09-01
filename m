Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C31478FD14
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 14:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E7610E7B5;
	Fri,  1 Sep 2023 12:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F3C10E7B6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 12:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693570920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WDSO/fOg6ztKSAY86/8gbRfBi06jB3m4xe8hWJisMS8=;
 b=jAJFEiotIhpiqGmHrZagus9a0QrsvpwqZg3JUqb61i6Xk8lcXZWyGtbMe3PWTtNL1iUwCQ
 MqjKOWaE+fpyA9g04AaZV+VHkbkyu9lTdeJo/FMy69vWN9Y8EPj8u/YsJA4QGUP55wM2yk
 ng4wOgdCWn4r0kd++7TtpauSvSGvDRs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-gQYkyxSkP_GK-_5yyfTo1w-1; Fri, 01 Sep 2023 08:21:59 -0400
X-MC-Unique: gQYkyxSkP_GK-_5yyfTo1w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-401c4f03b00so14456205e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 05:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693570918; x=1694175718;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UuVMQGitnRMOFdKeQWzhxvFVnOWUCQhBHlm5pT/bNEg=;
 b=g3LNyYoE/tGfDcrM75d12+z22P6CuP3MNOGgz41PgoBRoFpp/R19Fd+P0xK5dyefDI
 zUWuDZei6j6EVrJXPP529lFwdFSbM2CbrY6bYyqW6Y4TqIA8h0/8lyC7O4oUvGyZN3l8
 g6p7IP4IzzIsbq4CCKSlfQp5EaYRXSzfubS3rC0sDlh/nTNEHha02doMBhJNZ2890CmY
 r4ydW/dbs/aG3APPpM7vvoSazaYKxqMrCL0mEl7kkZ2FEtzT9NHC5FU67WJkSMyjQqbn
 n91soY/4TNEiDbwlYF9ow8Jw3d9ozgscDHft/2lyJnlrJdqphpHRkU3CWlIeRYyEAY+R
 6YmQ==
X-Gm-Message-State: AOJu0YyFFp0//w1uNPyualfYkJB4QlO3jFswjs78YLE9KIEfLKaTVvgp
 Yfmhp8vsDLOKFLebEty3jBCce44P6oooLXD0QWepKpfyD6hxG2QGzYupxWNcYckWsS9yM1WTc81
 Cvq0n5MHbuwYk0eZwDZqTfesnpSnd
X-Received: by 2002:a05:600c:2981:b0:3fe:1db2:5179 with SMTP id
 r1-20020a05600c298100b003fe1db25179mr1723390wmd.19.1693570918503; 
 Fri, 01 Sep 2023 05:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhRyQ5uHC3rJdp17mvtaP+nozvBE/5uYrDo16bs6zus7ETbY2L1dk3O+ZbcLVoFD9boPm7QA==
X-Received: by 2002:a05:600c:2981:b0:3fe:1db2:5179 with SMTP id
 r1-20020a05600c298100b003fe1db25179mr1723373wmd.19.1693570918117; 
 Fri, 01 Sep 2023 05:21:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x20-20020a05600c2a5400b00401b242e2e6sm7889960wme.47.2023.09.01.05.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 05:21:57 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
In-Reply-To: <CAMuHMdV_775mPbTgWmzCo4mKCd3kqL=vfVFrt2W=bR3uveNW_Q@mail.gmail.com>
References: <20230830062546.720679-1-javierm@redhat.com>
 <zitno3p7tbnld5auedkx5g4wey2csng4ncmtdhzinbuhblunyk@chnwsnsgq36v>
 <CAMuHMdWv_QSatDgihr8=2SXHhvp=icNxumZcZOPwT9Q_QiogNQ@mail.gmail.com>
 <4zfgmvfstyjfo5slggfmfuvnirrhrq773el52gkav2r6jxliub@7qjbyy7rkj3g>
 <CAMuHMdV_775mPbTgWmzCo4mKCd3kqL=vfVFrt2W=bR3uveNW_Q@mail.gmail.com>
Date: Fri, 01 Sep 2023 14:21:56 +0200
Message-ID: <87a5u65biz.fsf@minerva.mail-host-address-is-not-set>
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

Hello Geert,

> Hi Maxime,
>
> On Fri, Sep 1, 2023 at 2:00=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
>> On Fri, Sep 01, 2023 at 10:36:17AM +0200, Geert Uytterhoeven wrote:
>> > On Fri, Sep 1, 2023 at 10:22=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org> wrote:
>> > > On Wed, Aug 30, 2023 at 08:25:08AM +0200, Javier Martinez Canillas w=
rote:
>> > > > The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plan=
e's
>> > > > .atomic_check() callback") moved the allocation of the intermediat=
e and
>> > > > HW buffers from the encoder's .atomic_enable callback to primary p=
lane's
>> > > > .atomic_check callback.
>> > > >
>> > > > This was suggested by Maxime Ripard because drivers aren't allowed=
 to fail
>> > > > after drm_atomic_helper_swap_state() has been called, and the enco=
der's
>> > > > .atomic_enable happens after the new atomic state has been swapped=
.
>> > > >
>> > > > But that change caused a performance regression in very slow platf=
orms,
>> > > > since now the allocation happens for every plane's atomic state co=
mmit.
>> > > > For example, Geert Uytterhoeven reports that is the case on a VexR=
iscV
>> > > > softcore (RISC-V CPU implementation on an FPGA).
>> > >
>> > > I'd like to have numbers on that. It's a bit surprising to me that,
>> > > given how many objects we already allocate during a commit, two smal=
l
>> > > additional allocations affect performances so dramatically, even on =
a
>> > > slow platform.
>> >
>> > To be fair, I didn't benchmark that.  Perhaps it's just too slow due t=
o
>> > all these other allocations (and whatever else happens).
>> >
>> > I just find it extremely silly to allocate a buffer over and over agai=
n,
>> > while we know that buffer is needed for each and every display update.
>>
>> Maybe it's silly, but I guess it depends on what you want to optimize
>> for. You won't know the size of that buffer before you're in
>> atomic_check. So it's a different trade-off than you would like, but I
>> wouldn't call it extremely silly.
>
> The size of ssd130x_plane_state.data_array[] is fixed, and depends
> on the actual display connected.

Agreed.

> The size of ssd130x_plane_state.buffer[]  is also fixed, and depends
> on the plane's size (which is currently fixed to the display size).
>

Well, one could say that also depends on the format chosen. That is, if
XRGB8888 is used then its size should be the fixed display size but if R1
is used its size could be 0 (since the shadow plane will already store the
pixels in R1 format).

> Gr{oetje,eeting}s,
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

