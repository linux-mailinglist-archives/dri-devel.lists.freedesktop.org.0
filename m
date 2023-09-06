Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83694793C2C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 14:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA6810E620;
	Wed,  6 Sep 2023 12:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CAA10E622
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694001866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xzOhu8vX7kxTU1xSCJr2uZEz2c7A/GXoTKtU3HiKdkk=;
 b=DmtNN+WulfDdfubE0dvOSeJNkzUHqu9EGNVG66hJv8VhBy68YcRgsvLWfisAINSkQE52Cy
 /jdm4pdtmHve2UTtjkYY7j4JuxLCXG0lB8P1v5CU29ooyjnujrXDm6qr2KH5iR/G2Fyd6D
 gS60tC0teAXNEJePy1AlAuwGhlm4no4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-wZvzfM1YPze9IATwawnELg-1; Wed, 06 Sep 2023 08:04:25 -0400
X-MC-Unique: wZvzfM1YPze9IATwawnELg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4005f0a53c5so22803475e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 05:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694001864; x=1694606664;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vOfI0Z5MjhyLAvmIJXMu0/H7+FUMujUQo8bT5jmnZS0=;
 b=RtrsFek3/J+IeCdxIhZ6TDIsrSuQCKrdgH5DMeqUlcV4ch3OlYz5Zqv+I/ummZSY0T
 hR5xzH4ZFT0wDk3NWbS92FRX+4wodhwl+AC+0suGhJfq8slLpRzTQ5c9iRgUkkS0rZvO
 iW9zPL09MgGiaPhhghHie/jdu2m2NNQX2hlXQ2wiDYLL+biUwDBXGe7QKU1bBv5bEi16
 qIWX5d/0yO07eShpoHbNWTCXmQaL++ST3wc6CAaNKSww9L3ytpIDuPTc1b11vr1lcGGu
 AGWUp7rxL66Jepnx6RtyVUGN4s7mv83MPDineTwiRtNkHS5H9f9CMoJkmn+LNn1rJIxB
 Uopw==
X-Gm-Message-State: AOJu0Yx3lgOci/a9a8G37ERNEs2UbpT9RDHk/5USg64OdQb9KYoVoMMT
 bftnBTSo2nyrC3N8kbDEnMjrcFxx4esV6rqL4irUu8z2ELLP0uGcliQrkAJMUR4F5/zZW7srqMC
 ZFChyk5Vm5EYqBh4oNtof4mfbe0gk
X-Received: by 2002:a05:600c:253:b0:401:4417:a82d with SMTP id
 19-20020a05600c025300b004014417a82dmr2100407wmj.38.1694001863928; 
 Wed, 06 Sep 2023 05:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNZ+Dis0kcL2zRVNyKbfp8V20BhdGDTREB3kH9CFq79qQSpZoJFiutbgd3LwVFeQoDJjXsEA==
X-Received: by 2002:a05:600c:253:b0:401:4417:a82d with SMTP id
 19-20020a05600c025300b004014417a82dmr2100392wmj.38.1694001863573; 
 Wed, 06 Sep 2023 05:04:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z17-20020a7bc7d1000000b003fbdbd0a7desm22583278wmk.27.2023.09.06.05.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 05:04:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
In-Reply-To: <yvxmbpbeuis7zjqyg6yrpdfyr3oa2xstcoeb2prqvznczzhj5k@7i37gxyyqfn3>
References: <20230830062546.720679-1-javierm@redhat.com>
 <zitno3p7tbnld5auedkx5g4wey2csng4ncmtdhzinbuhblunyk@chnwsnsgq36v>
 <CAMuHMdWv_QSatDgihr8=2SXHhvp=icNxumZcZOPwT9Q_QiogNQ@mail.gmail.com>
 <4zfgmvfstyjfo5slggfmfuvnirrhrq773el52gkav2r6jxliub@7qjbyy7rkj3g>
 <CAMuHMdV_775mPbTgWmzCo4mKCd3kqL=vfVFrt2W=bR3uveNW_Q@mail.gmail.com>
 <yvxmbpbeuis7zjqyg6yrpdfyr3oa2xstcoeb2prqvznczzhj5k@7i37gxyyqfn3>
Date: Wed, 06 Sep 2023 14:04:22 +0200
Message-ID: <874jk74iex.fsf@minerva.mail-host-address-is-not-set>
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

Maxime Ripard <mripard@kernel.org> writes:

> On Fri, Sep 01, 2023 at 02:08:11PM +0200, Geert Uytterhoeven wrote:
>> Hi Maxime,
>>=20
>> On Fri, Sep 1, 2023 at 2:00=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
>> > On Fri, Sep 01, 2023 at 10:36:17AM +0200, Geert Uytterhoeven wrote:
>> > > On Fri, Sep 1, 2023 at 10:22=E2=80=AFAM Maxime Ripard <mripard@kerne=
l.org> wrote:
>> > > > On Wed, Aug 30, 2023 at 08:25:08AM +0200, Javier Martinez Canillas=
 wrote:
>> > > > > The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the pl=
ane's
>> > > > > .atomic_check() callback") moved the allocation of the intermedi=
ate and
>> > > > > HW buffers from the encoder's .atomic_enable callback to primary=
 plane's
>> > > > > .atomic_check callback.
>> > > > >
>> > > > > This was suggested by Maxime Ripard because drivers aren't allow=
ed to fail
>> > > > > after drm_atomic_helper_swap_state() has been called, and the en=
coder's
>> > > > > .atomic_enable happens after the new atomic state has been swapp=
ed.
>> > > > >
>> > > > > But that change caused a performance regression in very slow pla=
tforms,
>> > > > > since now the allocation happens for every plane's atomic state =
commit.
>> > > > > For example, Geert Uytterhoeven reports that is the case on a Ve=
xRiscV
>> > > > > softcore (RISC-V CPU implementation on an FPGA).
>> > > >
>> > > > I'd like to have numbers on that. It's a bit surprising to me that=
,
>> > > > given how many objects we already allocate during a commit, two sm=
all
>> > > > additional allocations affect performances so dramatically, even o=
n a
>> > > > slow platform.
>> > >
>> > > To be fair, I didn't benchmark that.  Perhaps it's just too slow due=
 to
>> > > all these other allocations (and whatever else happens).
>> > >
>> > > I just find it extremely silly to allocate a buffer over and over ag=
ain,
>> > > while we know that buffer is needed for each and every display updat=
e.
>> >
>> > Maybe it's silly, but I guess it depends on what you want to optimize
>> > for. You won't know the size of that buffer before you're in
>> > atomic_check. So it's a different trade-off than you would like, but I
>> > wouldn't call it extremely silly.
>>=20
>> The size of ssd130x_plane_state.data_array[] is fixed, and depends
>> on the actual display connected.
>
> That one can be tied to the CRTC state if needed. It would only be
> allocated on each modeset, so probably once for that kind of device.
>

Yes.

>> The size of ssd130x_plane_state.buffer[]  is also fixed, and depends
>> on the plane's size (which is currently fixed to the display size).
>
> Doesn't it depend on the format as well?
>

Yes and no. The buffer[] size is fixed, but whether that intermediate
buffer is needed or not will depend if the native format was chosen.

So one could say that is either 0 (not used) or the fixed size needed
to do the format conversion from XRGB8888 to R1.

> Maxime
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

