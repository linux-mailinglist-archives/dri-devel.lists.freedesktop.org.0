Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37099496944
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 02:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB1A10E4E0;
	Sat, 22 Jan 2022 01:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29FC10E4E0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 01:51:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DE0E8B82104;
 Sat, 22 Jan 2022 01:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE5CC340E1;
 Sat, 22 Jan 2022 01:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642816288;
 bh=dwqSmHbgQBbdmi7kXp2atdyOFk+xExYfoELE799mcYU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=MCPDaSOV7Cd7TZjUNR8+vw/y5a4+m5JcRc5F11dgo/ngYoiKjm/IAqW2HBp0KLYH6
 xCDRgIsFdAs1fLelnHO2PBIXpP46VLF3lGsItrppkBEp3FypMlGP096tetHuN8qsek
 pzp818rl1sJKkxwFqeRVk/lDweMsmPaY/ZDjlWfH+CVwnmCByLiLaRfhPBvLjZt8Mv
 N9ZlKNyooGvJKx58Jwcl861MH3CbUwKcZsXZNZ42iTlEGRdSWRvjoSFEw0ZSLriszD
 hg8tZANVfZgB0RLUgsggVCKmJHwPhGT4POkzOTB5Sha57uytuHUts/gq2nXhY4Eqj1
 3TnXO5JLApBzQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGS_qxpHuN5nyn8V7LGeZ1VTzboCgDwrz=p3TFPi73tZ0pWOBQ@mail.gmail.com>
References: <20220120143417.543744-1-maxime@cerno.tech>
 <20220120143417.543744-2-maxime@cerno.tech>
 <20220120213118.40F0AC340E3@smtp.kernel.org>
 <CAGS_qxq9qFjx+Su_E5sQF5tsgPCyhzGMFEMZbVqPN=N6U+s+9g@mail.gmail.com>
 <20220121043408.6C186C340E1@smtp.kernel.org>
 <CAGS_qxpHuN5nyn8V7LGeZ1VTzboCgDwrz=p3TFPi73tZ0pWOBQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] clk: Add Kunit tests for rate
From: Stephen Boyd <sboyd@kernel.org>
To: Daniel Latypov <dlatypov@google.com>
Date: Fri, 21 Jan 2022 17:51:26 -0800
User-Agent: alot/0.10
Message-Id: <20220122015128.6AE5CC340E1@smtp.kernel.org>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Latypov (2022-01-20 21:25:03)
> On Thu, Jan 20, 2022 at 8:34 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Daniel Latypov (2022-01-20 13:56:39)
> > > On Thu, Jan 20, 2022 at 1:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > KUnit doesn't have hard technical limitations in this regard.
> > >
> > > You could have something like this
> > >
> > > static void my_optional_kunit_test(struct kunit *test)
> > > {
> > > #ifdef CONFIG_OPTIONAL_FEATURE
> > >
> > > # else
> > >   kunit_skip(test, "CONFIG_OPTIONAL_FEATURE is not enabled");
> > > #endif
> > > }
> > >
> > > I think it's just a matter of what's least confusing to users.
> >
> > Ok, I see. Is there some way to have multiple configs checked into the
> > tree so we can test different kernel configuration code paths? This
>=20
> Multiple kunitconfigs?
> There's no restrictions on those
>=20
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/clk
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/clk/kunitcon=
fig.foo
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/clk/kunitcon=
fig.bar
>=20
> The first one will assume drivers/clk/.kunitconfig.
> But there's no reason you need to have a file called that.
> One could just have multiple standalone kunitconfigs, named however they =
like.
>=20
> --kunitconfig is new enough (5.12+) that there's no real conventions yet.
>=20
> Another option is
> $ ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/clk \
>    --kconfig_add=3DCONFIG_RARELY_USED=3Dy
>=20
> This is another case where we can do whatever is least confusing.

Got it, thanks.

>=20
> > discussion isn't really relevant to this patch so we can take this up in
> > another thread if you like.
> >
> > >
> > > >
> > > > Maybe kunit should check that there was an EXPECT on return from the
> > > > test. Daniel?
> > >
> > > Sorry, I'm not sure I understand the question.
> > >
> > > Are you saying you want kunit to flag cases like
> > >   static void empty_test(struct kunit *) {}
> > > ?
> >
> > Yes. I'd like kunit to enforce that all tests have at least one
> > EXPECT_*() in them.
>=20
> I totally understand the rationale.
> It's a bit misleading to say PASSED if no expectation/assertion passed.
> One might want a NO_STATUS (or maybe SKIPPED) result instead.
>=20
> But other unit test frameworks act the way KUnit does here, so there's
> an argument for consistency with others so users don't have to have a
> whole new mental model.

Ok if other test frameworks don't care then there's nothing to do.
