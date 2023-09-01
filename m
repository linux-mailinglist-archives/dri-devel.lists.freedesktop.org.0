Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF40678FE7C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 15:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064D510E7CE;
	Fri,  1 Sep 2023 13:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552F910E7CE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 13:43:04 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bcc4347d2dso32760951fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693575781; x=1694180581;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UL5BjwRyGlAOU7e/CVQ6R12cRk3HAxoys/ZzOGvHYPc=;
 b=ZLL+rEku6SzXbhQapeLC/LH8plmoXSePvQJr+uhmw0qWkf/i4TF8YLT94Lx2HjswuY
 dGyTZHcbClypoKxzCgWRPGx7v4FIGNeWPp/6MlttdXefeqzZBY5B8k3hF+FTBKy0MmlM
 omRx8FkJPwdLYksizCSTDExF8ATjjMmvvQFBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693575781; x=1694180581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UL5BjwRyGlAOU7e/CVQ6R12cRk3HAxoys/ZzOGvHYPc=;
 b=Ea9U5Qz/0qPocvZKppiO+RCQaUXDP6tJFCy2eaexCgm8df05vapujYHbNH4V4NGbUf
 hL+zA3zdcefukaazDlIZzEJYtCMQOlaV2FFsHqzFviXsg0cFYfiaexn9hoknJOFLWx7s
 rc1UODZv/n0PTA3N9f5ZbrCbc0QCDWB3+7LV5XeZZScxk4ahiB54yUU+3OWKBLho1shU
 sen+Y/oWClVVXdUN9QzubgbkcjnasHXkpdCKIogJ+CpfmrrXsI5RfEwBNEZA4T4b4gvS
 YrLDAPcJHBzuSss7jQD90jjHpoP5c8ONwvKhEmDcg0BbfEBDOb+ukk/RtDKS8HfMaWHY
 OurQ==
X-Gm-Message-State: AOJu0Yzuzi3XKK10bLYQiIIfqEZsLNylBl8/ls2pw0XhNtHxeXuheVpD
 gY6TeB+dXBjYxGOsvoTy30Q8bUk/cMN9X7WLCRAmAFRT
X-Google-Smtp-Source: AGHT+IGxUPOSKFhu5uAPDaovWJeYwnOrs5sJ8z95Fnid4xUptf53XeMD0YDapEKkU2fA0f8KxR9MvA==
X-Received: by 2002:a05:6512:53b:b0:500:9a45:638 with SMTP id
 o27-20020a056512053b00b005009a450638mr1440803lfc.2.1693575780885; 
 Fri, 01 Sep 2023 06:43:00 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b004ff9bfda9d6sm645810lfq.212.2023.09.01.06.43.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 06:43:00 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5009687f822so2427e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 06:43:00 -0700 (PDT)
X-Received: by 2002:a19:ac05:0:b0:4ff:d0c0:5d72 with SMTP id
 g5-20020a19ac05000000b004ffd0c05d72mr109392lfc.0.1693575779560; Fri, 01 Sep
 2023 06:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
 <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
 <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
 <CAD=FV=XUhzguFCC=aKzHFMV0bBnZzkHXP_tx+P=PNkVr=8SnTA@mail.gmail.com>
 <mumiep5q7x7qj7k64h3cyodxrgk737iy5rum5keguquwymf2gy@3qruwfrqjgy7>
 <CAD=FV=VEene+nr1us87iA+bomxzQ039r-E+wqvizvFGbxXjDvA@mail.gmail.com>
 <wwzbd7dt5qyimshnd7sbgkf5gxk7tq5dxtrerz76uw5p6s7tzt@cbiezkfeuqqn>
 <CAD=FV=XcUVvg5Om__dD=i9zu7ZtQmvWicms9yN7w0c2nWGhqYg@mail.gmail.com>
 <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
In-Reply-To: <p7okuysh442hulqls3ekbaar2bguqv67fum3gsb2cj75kjvdpx@uebwlgvf46sy>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Sep 2023 06:42:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
Message-ID: <CAD=FV=Xr4nZUeHY-FdiedcV=BuP5szNBEHPKjdRnA7c+3MADqg@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Sep 1, 2023 at 1:15=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> On Thu, Aug 31, 2023 at 11:18:49AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Aug 31, 2023 at 12:38=E2=80=AFAM Maxime Ripard <mripard@kernel.=
org> wrote:
> > >
> > > If so, then I think we can implement everything by doing something li=
ke:
> > >
> > >   - Implement enable and disable refcounting in panels.
> > >     drm_panel_prepare and drm_panel_enable would increase it,
> > >     drm_panel_unprepare and drm_panel_disable would decrease it.
> > >
> > >   - Only actually call the disable and unprepare functions when that
> > >     refcount goes to 0 in the normal case.
> >
> > Just to be clear: by refcounting do you mean switching this to actual
> > refcount?
>
> Yes
>
> > Today this is explicitly _not_ refcounting, right? It is simply
> > treating double-enables as no-ops and double-disables as no-ops. With
> > our current understanding, the only thing we actually need to guard
> > against is double-disable but at the moment we do guard against both.
> > Specifically we believe the cases that are issues:
> >
> > a) At shutdown/remove time we want to disable the panel, but only if
> > it was enabled (we wouldn't want to call disable if the panel was
> > already off because userspace turned it off).
>
> Yeah, and that's doable with refcounting too.

I don't understand the benefit of switching to refcounting, though. We
don't ever expect the "prepare" or "enable" function to be called more
than once and all we're guarding against is a double-unprepare and a
double-enable. Switching this to refcounting would make the reader
think that there was a legitimate case for things to be prepared or
enabled twice. As far as I know, there isn't.

In any case, I don't think there's any need to switch this to
refcounting as part of this effort. Someone could, in theory, do it as
a separate patch series.


> > The above solves the problem with panels wanting to power sequence
> > themselves at remove() time, but not at shutdown() time. Thus we'd
> > still have a dependency on having all drivers use
> > drm_atomic_helper_shutdown() so that work becomes a dependency.
>
> Does it? I think it can be done in parallel?

I don't think it can be in parallel. While it makes sense for panels
to call drm_panel_remove() at remove time, it doesn't make sense for
them to call it at shutdown time. That means that the trick of having
the panel get powered off in drm_panel_remove() won't help for
shutdown. For shutdown, which IMO is the more important case, we need
to wait until all drm drivers call drm_atomic_helper_shutdown()
properly.

-Doug
