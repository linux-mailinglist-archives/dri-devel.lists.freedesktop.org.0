Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30B54C3931
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:51:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE7B10E91D;
	Thu, 24 Feb 2022 22:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C372F10E91D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:51:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73F52B829B0;
 Thu, 24 Feb 2022 22:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C688C340E9;
 Thu, 24 Feb 2022 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645743062;
 bh=miZQIOaNjDKs+B9YS4Zo2kAtM8uvsD5UsWevRUafv5Y=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=WbiACK5upH9WET6LVVmRpPOb9JDzPjB5ThQFjmj/zaZMqWmVfC2zXrYjv+zyzcw6B
 btwk9Wpz/c8OyQMPGD85dUWauHBIe1UjfSGYyNkczm6q7l2BpBQUix+HpjMTvd2hn+
 /fD7ZCkWKXbtZ93OEdTVVuClcQGVNSy4nP+e+BMCY7Rai0xcyBLLPXtj4mgqsO5vWv
 0GP2gJz5sUP2aWuUMwEI5chnugTpx7SOmK3LVyCOblR+KIpTRg/jCeHsuH1JzqdKr+
 w6noE1gs8zX7rFJKToe1RbO2kO6JA89kLrmseX7ZV4FRrX7SEUGAff0dgbmTe6yqnX
 an2fE2PQL5EaQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220223105600.1132593-6-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-6-maxime@cerno.tech>
Subject: Re: [PATCH v6 05/12] clk: Use clamp instead of open-coding our own
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Mike Turquette <mturquette@baylibre.com>
Date: Thu, 24 Feb 2022 14:51:00 -0800
User-Agent: alot/0.10
Message-Id: <20220224225102.1C688C340E9@smtp.kernel.org>
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
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-02-23 02:55:53)
> The code in clk_set_rate_range() will, if the current rate is outside of
> the new range, will force it to the minimum or maximum.

s/will//

>=20
> Since it's running under the condition that the rate is either lower
> than the minimum, or higher than the maximum, this is equivalent to
> using clamp, while being less readable. Let's switch to using clamp
> instead.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 6c4e10209568..c15ee5070f52 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2388,11 +2388,7 @@ int clk_set_rate_range(struct clk *clk, unsigned l=
ong min, unsigned long max)
>                  *   this corner case when determining the rate
>                  */
> =20
> -               if (rate < min)
> -                       rate =3D min;
> -               else
> -                       rate =3D max;
> -
> +               rate =3D clamp(clk->core->req_rate, min, max);
>                 ret =3D clk_core_set_rate_nolock(clk->core, rate);
>                 if (ret) {
