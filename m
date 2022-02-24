Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E94C38F2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F165A10E8A4;
	Thu, 24 Feb 2022 22:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5D610E8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:44:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43905B829D3;
 Thu, 24 Feb 2022 22:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9F5C340E9;
 Thu, 24 Feb 2022 22:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645742662;
 bh=B/pu4UvmtEiJpC/lplC4L+U3yPJWpzR28r3SzwFzf7U=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LMiys3Nqw1YwjzE9EnFjtUaoznubelzLA1fiQokFi21vjHZ5bTN098fYCIt1OVqfi
 ToQZa7ezwApC648kYlBvlT6NaP0B660lBlzHXFNr4oshdLVDYSuu0FNlHVnTz+5dz5
 1Z2QPdWaZJhQWKrFSuDUdowRP/3i8ajfhBbOC7YoDdPOLIWP/W4WdtmW0aSdEIMyqI
 Jv0XuDGSK6V8BWcEzDzeelwSwcW/K0y8rGCihptyPrKFQgBtZTkwovFWceLl8d0nnE
 fGorn749YxyiK5PbWNZNYBNo8Zq9BsjbPKMZtjXK7aWP+T/vxlfWPf+sKTqN7/ZC3C
 /oDJ3mEjQcFdw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220221163001.k4nstaxtbmlxgz3j@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-4-maxime@cerno.tech>
 <20220218223422.4FA9DC340E9@smtp.kernel.org>
 <20220221163001.k4nstaxtbmlxgz3j@houat>
Subject: Re: [PATCH v4 03/10] clk: Use clamp instead of open-coding our own
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 24 Feb 2022 14:44:20 -0800
User-Agent: alot/0.10
Message-Id: <20220224224422.DA9F5C340E9@smtp.kernel.org>
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
 linux-clk@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-02-21 08:30:01)
> On Fri, Feb 18, 2022 at 02:34:20PM -0800, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2022-01-25 06:15:42)
> > > The code in clk_set_rate_range() will, if the current rate is outside=
 of
> > > the new range, will force it to the minimum or maximum. This is
> > > equivalent to using clamp, while being less readable. Let's switch to
> > > using clamp instead.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/clk/clk.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 7bb5ae0fb688..150d1bc0985b 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -2365,11 +2365,7 @@ int clk_set_rate_range(struct clk *clk, unsign=
ed long min, unsigned long max)
> > >                  *   this corner case when determining the rate
> > >                  */
> > > =20
> > > -               if (rate < min)
> > > -                       rate =3D min;
> > > -               else
> > > -                       rate =3D max;
> > > -
> > > +               rate =3D clamp(clk->core->req_rate, min, max);
> >=20
> > This isn't equivalent. The else arm is taken if rate >=3D min and rate =
is
> > set to max, whereas clamp() will leave the rate unchanged if rate >=3D =
min
> > && rate < max.
>=20
> This can't happen, since we're in an if block that is (rate < min ||
> rate > max), so at this point if rate is not less than min, it is
> greater than rate. Thus, it's equivalent to clamp.
>=20
> Still, the commit message could be better, I'll rephrase it.

Perfect! Should probably add a comment above the clamp as well just in
case someone decides to move it out of that if block.
