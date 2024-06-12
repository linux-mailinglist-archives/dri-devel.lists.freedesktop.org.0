Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30109059CA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 19:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF2D10E1B7;
	Wed, 12 Jun 2024 17:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dKRl0eGQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0036E10E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 17:23:11 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-797f1287aa3so1728785a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 10:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718212987; x=1718817787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/eOveMBmlkJAaaoZTPiEjakaH7aRf8qPb5didjqx0C0=;
 b=dKRl0eGQ9e4HGh/aEtFC+m+Ka3UsoLu3VfXr5T0zs6wJ3Q9eDnxCEyeF3tfDrQkisW
 Op130RdrVeDngmJVFEPXGPDYsjAQHQJRMovbbPwrgmgqnLsFCo/Jb6oNN9M/9k73IHTa
 iZEZLNQSOQT1XZSr44LL3wcxT+4JTrefUoj84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718212987; x=1718817787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/eOveMBmlkJAaaoZTPiEjakaH7aRf8qPb5didjqx0C0=;
 b=ZWmS35RD/DHSQ4SQiWTiugdKqy4gGaIvGaBPjd9hTIdvF8miwnjIRBnNZ5oLT7GMWV
 VspJc5/Tpg4gkykdYvbjiXKSNIVm8BBoe/3pqoUdgpfnJeWfPIKrpBBi5RyU2VE7NNZa
 KWzDp0AzNiRatkjAAbQD4NTaDXi3MwjErY1sJkXVwbkf64ZaTsL3lZLMxOfYgtKVSON2
 zXZNeCqdwdiwzWarfo5YehZv/ihk5gXlTvDCTqPt0XxYDLTmYmf2PMGFA6jIBXgM2yeO
 yOZ5wEVEB4qVjiOrZagi2b45SIkH4zyxE8aTV2AUVeYBoXG5UmJIA8M5uLqjIJwllXxh
 CtfQ==
X-Gm-Message-State: AOJu0YyxeIZRf9dnNAHweE91bbpvQgs7i3Hz9Ut7yiUmhWX3/fZDeymb
 iwhxjp0gYmVujXKKCSVxbnr9+Sf1NkcfdgjX1l2U6rw1XY40+c+waQhWjE3CcXuk7ETrt716QoI
 =
X-Google-Smtp-Source: AGHT+IFxHVY+9eQ0RJi7hBlWzSS5GVsawa0BgEiU8y9J1xlBjTyJYuSOAWsD3By9PjaLbw0S+bugYQ==
X-Received: by 2002:a05:620a:2482:b0:797:b318:5df with SMTP id
 af79cd13be357-797f60d7b48mr247075785a.56.1718212987398; 
 Wed, 12 Jun 2024 10:23:07 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7955b8b3c9bsm368472285a.109.2024.06.12.10.23.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 10:23:07 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4400cc0dad1so35001cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 10:23:06 -0700 (PDT)
X-Received: by 2002:a05:622a:5488:b0:441:5e6c:426c with SMTP id
 d75a77b69052e-4415e6c434bmr2453591cf.17.1718212985692; Wed, 12 Jun 2024
 10:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <ZmljNHteJ9L5EdE9@phenom.ffwll.local>
 <CAD=FV=V4C1AYVqG4gig+SiQr4n_mAPVASxneDDZT1a=7AY3Hzw@mail.gmail.com>
 <Zmm6i6iQOdP613w3@phenom.ffwll.local>
 <CACRpkdbb5OdizDLSRW3bFEJJhrQ7Fs8Pb=Q2yxBog62Z1m-bOQ@mail.gmail.com>
In-Reply-To: <CACRpkdbb5OdizDLSRW3bFEJJhrQ7Fs8Pb=Q2yxBog62Z1m-bOQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Jun 2024 10:22:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vm==ngDo_bZ+xqV4Ojj0SSOO3ZWaxAbWA906h6-e8FMA@mail.gmail.com>
Message-ID: <CAD=FV=Vm==ngDo_bZ+xqV4Ojj0SSOO3ZWaxAbWA906h6-e8FMA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
To: Linus Walleij <linus.walleij@linaro.org>
Cc: dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jun 12, 2024 at 9:47=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jun 12, 2024 at 5:11=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> w=
rote:
> > On Wed, Jun 12, 2024 at 07:49:31AM -0700, Doug Anderson wrote:
> (...)
> > > The problem is that the ordering is wrong, I think. Even if the OS wa=
s
> > > calling driver shutdown functions in the perfect order (which I'm not
> > > convinced about since panels aren't always child "struct device"s of
> > > the DRM device), the OS should be calling panel shutdown _before_
> > > shutting down the DRM device. That means that with your suggestion:
> > >
> > > 1. Shutdown starts and panel is on.
> > >
> > > 2. OS calls panel shutdown call, which prints warnings because panel
> > > is still on.
> > >
> > > 3. OS calls DRM driver shutdown call, which prints warnings because
> > > someone else turned the panel off.
> >
> > Uh, that's a _much_ more fundamental issue.
> >
> > The fix for that is telling the driver core about this dependency with
> > device_link_add. Unfortuantely, despite years of me trying to push for
> > this, drm_bridge and drm_panel still don't automatically add these,
> > because the situation is a really complex mess.
> >
> > Probably need to read dri-devel archives for all the past attempts arou=
nd
> > device_link_add.
>
> I think involving Saravana Kannan in the discussions around this
> is the right thing to do, because he knows how to get devicelinks
> to do the right thing.
>
> If we can describe what devicelink needs to do to get this ordering
> right, I'm pretty sure Saravana can tell us how to do it.

I'm really not convinced that hacking with device links in order to
get the shutdown notification in the right order is correct, though.
The idea is that after we're confident that all DRM modeset drivers
are calling shutdown properly that we should _remove_ any code
handling shutdown from panel-edp and panel-simple. They should just
get disabled as part of DRM's shutdown. That means that if we messed
with devicelinks just to get a different shutdown order that it was
just for a short term thing.

That being said, one could argue that having device links between the
DRM device and the panel is the right thing long term anyway and that
may well be. I guess the issue is that it's not necessarily obvious
how the "parent/child" or "supplier/consumer" relationship works w/
DRM devices, especially panels. My instinct says that the panel
logically is a "child" or "consumer" of the DRM device and thus
inserting the correct long term device link would mean we'd get
shutdown notification in the wrong order. It would be hard to argue
that the panel is the "parent" of a DRM device, but I guess you could
call it a "supplier"? ...but it's also a "consumer" of some other
stuff, like the pixels being output and also (perhaps) the DP AUX bus.
All this complexity is why the DRM framework tends to use its own
logic for things like prepare/enable instead of using what Linux gives
you. I'm sure Saravanah can also tell you about all the crazy device
link circular dependencies that DRM has thrown him through...

In any case, I guess I'll continue asserting that I'm not going to try
to solve this problem. If folks don't like my patch and there's no
suggestion other than solving years-old problems then I'm happy to
live with the way things are and hope that someone eventually comes
along and solves it.

-Doug
