Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA524E7ACE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 22:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F62610E117;
	Fri, 25 Mar 2022 21:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F7710E117
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 21:19:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C33960BBC;
 Fri, 25 Mar 2022 21:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77643C004DD;
 Fri, 25 Mar 2022 21:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648243189;
 bh=vCo4mYlUupqPyE1ULrxig99asXmCqYLMb9eSjJgivtQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=rDAttaxDMqvsmCFSZtSoqUdSKvwcPqZFJlJiIjIB8uv+gttSVokcaqQynIqLfcTJl
 N0bsQ7tJBgkH7x3xkO5c9Z+vGdI2UTh88G7/oOpcG19Tvm4CMMCl9grK5fMWUjw8v0
 lJnQ5cHa3qHj/6deoIcN7wq6BfblLDp+ph5GYspAhGvxVL9BpS6OGBo+csV7uJm92y
 lkDesHTgEDbKUzpqFBpWhnpLDFx++FwwRzpFAXc+t0vEDZXOpgoDJyg6Fj+0Vawox3
 zxsIq6tOWBYGqtxGpbjeGLlnStKsx93Oi2T3OY4qEuTEk1KA+6B/im8MYZKy/Ik1H6
 RmPbHhaA3quQA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAGS_qxrDs5RYa4nxNR2ghsyBhgVyMHApi+GJKzGxF7FvNHe9dQ@mail.gmail.com>
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220224225422.98298C340E9@smtp.kernel.org>
 <CAGS_qxrDs5RYa4nxNR2ghsyBhgVyMHApi+GJKzGxF7FvNHe9dQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
From: Stephen Boyd <sboyd@kernel.org>
To: Daniel Latypov <dlatypov@google.com>
Date: Fri, 25 Mar 2022 14:19:47 -0700
User-Agent: alot/0.10
Message-Id: <20220325211949.77643C004DD@smtp.kernel.org>
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

Quoting Daniel Latypov (2022-02-24 15:21:57)
> On Thu, Feb 24, 2022 at 2:54 PM Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Daniel Latypov (2022-02-23 14:50:59)
> > > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > >
> > > > Let's test various parts of the rate-related clock API with the kun=
it
> > > > testing framework.
> > > >
> > > > Cc: kunit-dev@googlegroups.com
> > > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >
> > > Tested-by: Daniel Latypov <dlatypov@google.com>
> > >
> > > Looks good to me on the KUnit side.
> > > Two small nits below.
> > >
> > > FYI, I computed the incremental coverage for this series, i.e.:
> > > 1) applied the full series
> > > 2) computed the absolute coverage
> > >
> > > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=3Ddrivers/clk
> > > --make_options=3DCC=3D/usr/bin/gcc-6 --kconfig_add=3DCONFIG_DEBUG_KER=
NEL=3Dy
> > > --kconfig_add=3DCONFIG_DEBUG_INFO=3Dy --kconfig_add=3DCONFIG_GCOV=3Dy
> > > $ lcov -t "clk_tests" -o coverage.info -c -d .kunit/ --gcov-tool=3D/u=
sr/bin/gcov-6
> >
> > This is cool. Thanks! Is it possible to add some 'coverage' command to
> > kunit so we don't have to recall this invocation?
>=20
> This is documented at
> https://www.kernel.org/doc/html/latest/dev-tools/kunit/running_tips.html#=
generating-code-coverage-reports-under-uml
> It also includes pointers on how to use lcov to process the .gcda files.
> I wrote it before --kconfig_add existed, so it just looks a bit different.
>=20
> The main blockers to directly supporting this in kunit.py are
> 1.) this only works on UML
> 2.) it needs gcc-6 or lower (and the kernel's min version is 5.1, iirc)...
> 3.) in kernels older than 5.14, this requires some more hacks to get
> working. So for the large portion of us stuck dealing with somewhat
> older kernels, we'd have to do stuff manually anyway.
>=20
> For #1, we'd need different kconfig options and kunit.py's QEMU would
> need some sort of userspace (busybox should be sufficient).
> For #2, I don't recall what the precise issues were anymore. But I
> think there were some more issues in gcc 8 or 9... :(
>=20
> >
> > >
> > > 3) intersected that with the total diff
> >
> > This would also be cool to do automatically with a revision range.
>=20
> Hmm, can you elaborate?
> I assume you mean other revision ranges beyond this patch set?

I mean somehow to tell kunit.py that I want incremental coverage
information for a git revision range so that I can say something like

	kunit.py incremental HEAD~3..HEAD

and have it tell me the line coverage.
