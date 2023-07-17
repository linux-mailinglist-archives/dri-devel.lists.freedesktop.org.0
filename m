Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD8A756590
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 15:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D79010E258;
	Mon, 17 Jul 2023 13:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90F010E258;
 Mon, 17 Jul 2023 13:54:43 +0000 (UTC)
Date: Mon, 17 Jul 2023 13:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1689602080; x=1689861280;
 bh=j+NctoV157Hl8xFcIjQ36ZakhJ/XyrxgevyeE2vj0F0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=Ly7FT9mOIPU57Y4AdvgAHVFEN90D5b39r7ZV/PTD6jCFMsR5gLGcNfKAbYRP6F+Yc
 KS2xW5oACZgigt8F0iO5+N38X+e1qRKZj/nPHN7ewYaWDYThMbTsQic/iWLqaaURlT
 gce765Fh07OZs/TzBWgsbKSrqoj/AQyAvotX0KLywXJyIhgw2Om3S4pnjzHnCl4Ce6
 kWmmQIcHRdMqe2tDCLUCupmhEQiZZRm8iYRy1OYkJfxpe3oD74NjDVgjnsSmjYleZ2
 dVPcbt806VsoT9gZ3qJdLaOH4cPqOp7feKUJgttpfHpXzapUIxMguXOjZXWKu42j6V
 ZdnmNC0mXQ8Dw==
To: Emil Velikov <emil.l.velikov@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: support up to 128 drm devices
Message-ID: <d5rv64CZ72yzMTvfnFQ78-9tKaF5IaDHx5gcEGxHvijBrmdJQX1MS7BEbOU3-fiZzoaH6ZahN5lF2zxP-pgz6qOlOgkEn2k5bVKmlSpt5L4=@emersion.fr>
In-Reply-To: <CACvgo51i9nBodn6wcxEXQ3Aty+LtHF-5=5owGKtVvbhHqGdHqw@mail.gmail.com>
References: <20230630115651.354849-1-James.Zhu@amd.com>
 <wBFta68Nq7iIaszeM9WT6v04l1DSIEs2cM-dOQ3uMWbFM2B74j43LU4Vm3VvzLrTfJRtZ8zM2c3AAxtMsqKcVlNtBuaJlITqtIRZzBuT56M=@emersion.fr>
 <CACvgo50YDLkavfidjQAmrsxHWJEtCD6QrC8duuz4F-C144RtDw@mail.gmail.com>
 <PguMcqMlRDvAT5fdpZfgyOWT8DQ1ZLXhgLD0puLL8l0ZYj0UiBvDclFp54l3ov1vH9A7whpUQhY4H65Fh3u6a4aXZzK5a_6fgSKpi4_PXx8=@emersion.fr>
 <CACvgo51i9nBodn6wcxEXQ3Aty+LtHF-5=5owGKtVvbhHqGdHqw@mail.gmail.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
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
Cc: jamesz@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Zhu <James.Zhu@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, July 17th, 2023 at 15:24, Emil Velikov <emil.l.velikov@gmail.com=
> wrote:

> > > For going forward, here is one way we can shave this yak:
> > >  - update libdrm to max 64 nodes
> > >  - roll libdrm release, nag distributions to update to it // could be
> > > folded with the next release below
> > >  - update libdrm to use name driven type detection
> > >  - roll libdrm release, nag distributions to update to it
> > >  - once ^^ release hits most distributions, merge the above proposed
> > > kernel patch
> > >    - the commit message should explain the caveats and fixed libdrm v=
ersion
> > >    - we should be prepared to revert the commit, if it causes user
> > > space regression - fix (see below) and re-introduce the kernel patch
> > > 1-2 releases later
> >
> > That sounds really scary to me. I'd really prefer to try not to break t=
he
> > kernel uAPI here.
> >
>=20
> With part in particular? Mind you I'm not particularly happy either,
> since in essence it's like a controlled explosion.

I believe there are ways to extend the uAPI to support more devices without
breaking the uAPI. Micha=C5=82 Winiarski's patch for instance tried somethi=
ng to
this effect.

> > The kernel rule is "do not break user-space".
>=20
> Yes, in a perfect world. In practice, there have been multiple kernel
> changes breaking user-space. Some got reverted, some remained.
> AFAICT the above will get us out of the sticky situation we're in with
> the least amount of explosion.
>=20
> If there is a concrete proposal, please go ahead and sorry if I've
> missed it. I'm supposed to be off, having fun with family when I saw
> this whole thing explode.
>=20
> Small note: literally all the users I've seen will stop on a missing
> node (card or render) aka if the kernel creates card0...63 and then
> card200... then (hard wavy estimate) 80% of the apps will be broken.

That's fine, because that's not a kernel regression. Supporting more than 6=
4
devices is a new kernel feature, and if some user-space ignores the new nod=
es,
that's not a kernel regression. A regression only happens when a use-case w=
hich
works with an older kernel is broken by a newer kernel.
