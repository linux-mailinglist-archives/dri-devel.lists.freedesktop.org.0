Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1C36CB14
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 20:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483EC6E550;
	Tue, 27 Apr 2021 18:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3144 seconds by postgrey-1.36 at gabe;
 Tue, 27 Apr 2021 18:27:48 UTC
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4676E536;
 Tue, 27 Apr 2021 18:27:48 +0000 (UTC)
Date: Tue, 27 Apr 2021 18:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1619548066;
 bh=r3dpS5guq09sujzBY9a4E5iJLt9OWrUf2QISc57Q/zc=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=mowvuIAQbGQUpr7nXawb/rfRMqv1z31OCOvGS6qs3oEAXUk+Il2qxZUBq9UxmXog0
 6i8uDFGbLQkDzp76GzhE1kHtQ84uwRWJDslyWBVxZ+Et0tk/K0qCeTL8Hd32NkR+kV
 mFaoyAcKvzbAUru3wSH4230l+ITMVSHW7VmY3LzWgX5IPcZQIW+WdgjgMaRKqnZU6y
 eShFtHDEiCufIazCAQwZDVrihGIjViBxfdweoocNjFeATJsGLXs5rgQchS5hy96cXO
 uWANgrfHoQyg+VV261JbvDMzyVuODqhuYtaP3olWTY+XfIBDSl+XINX/+HjBZ6OxGa
 VFkdAyTWnCa7Q==
To: Alex Deucher <alexdeucher@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <Z2lezWwTor_DcjuKJjjxZ1CsyzBEWodc15u50cf_VrlRvK2_X36YR4drAEJ7nSJKe7tKzA6U2b6ahbu_fLrAl6M-VtO6kZ9leecS5EvLV2Q=@emersion.fr>
In-Reply-To: <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
References: <CAAxE2A4mpapnCE7uw8GNWkaRR4jXeoz9qa9j=9XknjR3yeq3YQ@mail.gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
 <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, April 27th, 2021 at 8:01 PM, Alex Deucher <alexdeucher@gmail.com> wrote:

> It's an upcoming requirement for windows[1], so you are likely to
> start seeing this across all GPU vendors that support windows. I
> think the timing depends on how quickly the legacy hardware support
> sticks around for each vendor.

Hm, okay.

Will using the existing explicit synchronization APIs make it work
properly? (e.g. IN_FENCE_FD + OUT_FENCE_PTR in KMS, EGL_KHR_fence_sync +
EGL_ANDROID_native_fence_sync + EGL_KHR_wait_sync in EGL)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
