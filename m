Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37392793BDE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36ABE10E612;
	Wed,  6 Sep 2023 11:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F2210E612
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 11:55:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5F5FECE149E;
 Wed,  6 Sep 2023 11:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457DFC433C7;
 Wed,  6 Sep 2023 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694001326;
 bh=Lr1hk8T14jyQD38Co71l4i6tLkHZSpTmtLre5Xwotpw=;
 h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
 b=F1TQMwP7zK7EbTFHLI/A+Q9F0qlDYSwYUD6m0/owxKcqalTaALjoE1bG5L9g3HXdC
 k5NHYRX5MyPfxpODxMasofmqxRhUUR3xbGmCoJXyq0G5hmal6Wh0fv1eh9A3BpNXn2
 Ar/U5uEuA6fmtbqkRirgjcEvZ01sOTphBx6/ywhYzbPVTFZLyCF1/noLsuGwmGzzbO
 U2GHwtvWXkgNbo0HO9DP394lgBIZsQaZPMmB0DHPTVZ073VA8/hVCJiaAmhEbJN4sj
 /KFuzhZR6qP5Wsl4aeImzGwoYQNSaO9xEEnK66HlLw365VUEwvB5vUg+sCVXTC76Sk
 9Kqn4oeuFmWvQ==
Date: Mon, 4 Sep 2023 10:04:29 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
Message-ID: <yvxmbpbeuis7zjqyg6yrpdfyr3oa2xstcoeb2prqvznczzhj5k@7i37gxyyqfn3>
From: Maxime Ripard <mripard@kernel.org>
References: <20230830062546.720679-1-javierm@redhat.com>
 <zitno3p7tbnld5auedkx5g4wey2csng4ncmtdhzinbuhblunyk@chnwsnsgq36v>
 <CAMuHMdWv_QSatDgihr8=2SXHhvp=icNxumZcZOPwT9Q_QiogNQ@mail.gmail.com>
 <4zfgmvfstyjfo5slggfmfuvnirrhrq773el52gkav2r6jxliub@7qjbyy7rkj3g>
 <CAMuHMdV_775mPbTgWmzCo4mKCd3kqL=vfVFrt2W=bR3uveNW_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdV_775mPbTgWmzCo4mKCd3kqL=vfVFrt2W=bR3uveNW_Q@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 01, 2023 at 02:08:11PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Fri, Sep 1, 2023 at 2:00=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> > On Fri, Sep 01, 2023 at 10:36:17AM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Sep 1, 2023 at 10:22=E2=80=AFAM Maxime Ripard <mripard@kernel=
=2Eorg> wrote:
> > > > On Wed, Aug 30, 2023 at 08:25:08AM +0200, Javier Martinez Canillas =
wrote:
> > > > > The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the pla=
ne's
> > > > > .atomic_check() callback") moved the allocation of the intermedia=
te and
> > > > > HW buffers from the encoder's .atomic_enable callback to primary =
plane's
> > > > > .atomic_check callback.
> > > > >
> > > > > This was suggested by Maxime Ripard because drivers aren't allowe=
d to fail
> > > > > after drm_atomic_helper_swap_state() has been called, and the enc=
oder's
> > > > > .atomic_enable happens after the new atomic state has been swappe=
d.
> > > > >
> > > > > But that change caused a performance regression in very slow plat=
forms,
> > > > > since now the allocation happens for every plane's atomic state c=
ommit.
> > > > > For example, Geert Uytterhoeven reports that is the case on a Vex=
RiscV
> > > > > softcore (RISC-V CPU implementation on an FPGA).
> > > >
> > > > I'd like to have numbers on that. It's a bit surprising to me that,
> > > > given how many objects we already allocate during a commit, two sma=
ll
> > > > additional allocations affect performances so dramatically, even on=
 a
> > > > slow platform.
> > >
> > > To be fair, I didn't benchmark that.  Perhaps it's just too slow due =
to
> > > all these other allocations (and whatever else happens).
> > >
> > > I just find it extremely silly to allocate a buffer over and over aga=
in,
> > > while we know that buffer is needed for each and every display update.
> >
> > Maybe it's silly, but I guess it depends on what you want to optimize
> > for. You won't know the size of that buffer before you're in
> > atomic_check. So it's a different trade-off than you would like, but I
> > wouldn't call it extremely silly.
>=20
> The size of ssd130x_plane_state.data_array[] is fixed, and depends
> on the actual display connected.

That one can be tied to the CRTC state if needed. It would only be
allocated on each modeset, so probably once for that kind of device.

> The size of ssd130x_plane_state.buffer[]  is also fixed, and depends
> on the plane's size (which is currently fixed to the display size).

Doesn't it depend on the format as well?

Maxime
