Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4B78A6B7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 09:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1A810E221;
	Mon, 28 Aug 2023 07:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B0110E221
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 07:45:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A724060920;
 Mon, 28 Aug 2023 07:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B796FC433C7;
 Mon, 28 Aug 2023 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693208711;
 bh=ATbg9WtubVOPFMmyyOW4OG2w8jjdwGDpnS0+wpl1I8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hNNgbRb1QBII60OOY7BUSJLlEKcL4AMVcXm93OwcAUz4vC74CI4Ywg8BPP51yP2+U
 6p1uWiSiHmvfeg+6VI8Bc5WhAWoIOpQLP8QxyhMNdJkCWDtKKPWVisEQQaGNc2MNj4
 zz9QFHcpAO3xFro/d93ZcNhjXgtAq/hBMxZ/9j0H6DgHgWUYwn5i8pKg4RvPXx3CjC
 5prMVBzJDz+fmjnev6yMSmzbr/4gdTfYY1VkqfRlm2SyDZH5jbWkMBxaVj8M9E3G5a
 XDuBqbs5CazfEQIO262XFqtPgEmeeGWp7o26dmKrZEtESq/XBLB5hDJfPaStcs5Xuz
 ZZNGeXe8JoPDg==
Date: Mon, 28 Aug 2023 09:45:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [RFC PATCH 04/10] drm/panel_helper: Introduce drm_panel_helper
Message-ID: <lhd6ai7d6swlxhisjhikytguor7pptrymo3bmfwej4k7zqrnv4@hp2gvhw7mh3m>
References: <20230804210644.1862287-1-dianders@chromium.org>
 <20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid>
 <bphkopaq76imqzut7xrx7aprqybhx3veajdympqhig2wqlix6c@64ck23rc5cv7>
 <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=XiVkoCsjin4R74nkcd8vzOq9uPq+o5cRjd=YOoPXuQkg@mail.gmail.com>
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

On Fri, Aug 25, 2023 at 02:58:02PM -0700, Doug Anderson wrote:
> Maxime,
>=20
> On Sun, Aug 6, 2023 at 11:41=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > Hi Doug,
> >
> > Thanks for working on this :)
> >
> > On Fri, Aug 04, 2023 at 02:06:07PM -0700, Douglas Anderson wrote:
> > > The goal of this file is to contain helper functions for panel drivers
> > > to use. To start off with, let's add drm_panel_helper_shutdown() for
> > > use by panels that want to make sure they're powered off at
> > > shutdown/remove time if they happen to be powered on.
> > >
> > > The main goal of introducting this function is so that panel drivers
> > > don't need to track the enabled/prepared state themselves.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > It shouldn't be necessary at all: drivers should call
> > drm_atomic_helper_shutdown at removal time which will disable the
> > connector (which in turn should unprepare/disable its panel).
> >
> > If either the driver is missing drm_atomic_helper_shutdown, or if the
> > connector doesn't properly disable the panel, then I would consider that
> > a bug.
>=20
> Hmmm. I'm a bit hesitant here. I guess I'm less worried about the
> removal time and more worried about the shutdown time.
>=20
> For removal I'd be fine with just dropping the call and saying it's
> the responsibility of the driver to call drm_atomic_helper_shutdown(),
> as you suggest. I'd tend to believe that removal of DRM drivers is not
> used anywhere in "production" code (or at least not common) and I
> think it's super hard to get it right, to unregister and unbind all
> the DRM components in the right order.

It depends on the kind of devices. USB devices are very likely to be
removed, platform devices very unlikely, and PCIe cards somewhere in the
middle :)

I'm not sure the likelyhood of the device getting removed has much to do
with it though, and likely or not, it's definitely something we should
address and fix if an issue is to be found.

> Presumably anyone trying to remove a DRM panel in a generic case
> supporting lots of different hardware is used to it being a bit
> broken...

It's not. Most drivers might be broken, but it's totally something we
support and should strive for.

> Not that it's a super great situation to be in for remove() not to
> work reliably, but that's how I think it is right now.
>=20
> For shutdown, however, I'm not really OK with just blindly removing
> the code that tries to power off the panel.

I disagree with that statement. It's not "blindly removing the code",
that code is still there, in the disable hook.

> Shutdown is called any time you reboot a device. That means that if a
> DRM driver is _not_ calling drm_atomic_helper_shutdown() on the
> panel's behalf at shutdown time then the panel won't be powered off
> properly. This feels to me like something that might actually matter.

It does matter. What I disagree on is that you suggest working around
that brokenness in the core framework. What I'm saying is driver is
broken, we should keep the core framework sane and fix it in the driver.

It should be fairly easy with a coccinelle script to figure out which
panels are affected, and to add that call in remove.

> Panels tend to be one of those things that really care about their
> power sequencing and can even get damaged (or not turn on properly
> next time) if sequencing is not done properly, so just removing this
> code and putting the blame on the DRM driver seems scary to me.

Sure, it's bad. But there's no difference compared to the approach you
suggest in that patch: you created a helper, yes, but every driver will
still have to call that helper and if they don't, the panel will still
be called and it's a bug. And we would have to convert everything to
that new helper.

It's fundamentally the same discussion than what you were opposed to
above.

> Sure enough, a quick survey of DRM drivers shows that many don't call
> drm_atomic_helper_shutdown() at .shutdown time. A _very_ quick skim of
> callers to drm_atomic_helper_shutdown():
>=20
> * omapdrm/omap_drv.c - calls at remove, not shutdown
> * arm/hdlcd_drv.c - calls at unbind, not shutdown
> * arm/malidp_drv.c - calls at unbind, not shutdown
> * armada/armada_drv.c - calls at unbind, not shutdown
>=20
> ...huh, actually, there are probably too many to list that don't call
> it at shutdown. There are some that do, but also quite a few that
> don't. I'm not sure I really want to blindly add
> drm_atomic_helper_shutdown() to all those DRM driver's shutdown
> callbacks... That feels like asking for someone to flame me...

No one will flame you, and if they do, we'll take care of it. And yes,
those are bugs, so let's fix them instead of working around them?

> ...but then, what's the way forward? I think normally the panel's
> shutdown() callback would happen _before_ the DRM driver's shutdown()
> callback,

Is there such a guarantee?

> so we can't easily write logic in the panel's shutdown like "if the
> DRM panel didn't shut the panel down then print a warning and shut
> down the panel". We'd have to somehow invent and register for a "late
> shutdown" callback and have the panel use that to shut itself down if
> the DRM driver didn't. That seems like a bad idea...
>=20
> Do you have any brilliant ideas here? I could keep the function as-is
> but only have panels only call it at shutdown time if you want. I
> could add to the comments and/or the commit message some summary of
> the above and that the call is important for panels that absolutely
> need to be powered off at shutdown time even if the DRM driver doesn't
> do anything special at shutdown... Any other ideas?

Brilliant ideas to do what exactly?

I disagree that the solution to our problem is to disable the panel
resources at shutdown time and we should only do it at disable time.
Your helper does exactly that though, so I don't think the helper is a
good idea.

Maxime
