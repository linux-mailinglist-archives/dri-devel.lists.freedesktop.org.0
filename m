Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218504BC29F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 23:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029DE10ED81;
	Fri, 18 Feb 2022 22:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA83C10ED81
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 22:34:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED34561EF3;
 Fri, 18 Feb 2022 22:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA9DC340E9;
 Fri, 18 Feb 2022 22:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645223662;
 bh=q8zRuNDo3usyv30EWZxpJ56C8k9mrvz1It/LdtL0PD4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Dqf0+Jwfj2YO6EJ4Lueqn+W3DVQljJuEiTST4Wb99lQdLAcEcAXAlaagw0ND97lEP
 mBCJ5Bg1MXVqtfzAiis21+q/ZjnU9pdVvdIHWcGUODJxulwdzy9Pej+aDFS4fHIbqq
 RD00VX5AVSZSd9+rwAWGZ6bkHyqNY3MjP0/Aac/yGk7ZTBl78JkfNI+7ulNZf9uubo
 KwXKMr3zUpIBfNOHaN7SqHguk1AjC5q1k0Bt7eK1Gj1ITEYR/JDfgtGGgAF13Pxc6e
 vn0IHbEU629lfKT6pzcfQSeeehwVEGiYKM/SJhccgC0RU41gNVH+Pgixx4IePIV2fQ
 XYMocy7qSISZg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125141549.747889-4-maxime@cerno.tech>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-4-maxime@cerno.tech>
Subject: Re: [PATCH v4 03/10] clk: Use clamp instead of open-coding our own
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Mike Turquette <mturquette@baylibre.com>
Date: Fri, 18 Feb 2022 14:34:20 -0800
User-Agent: alot/0.10
Message-Id: <20220218223422.4FA9DC340E9@smtp.kernel.org>
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

Quoting Maxime Ripard (2022-01-25 06:15:42)
> The code in clk_set_rate_range() will, if the current rate is outside of
> the new range, will force it to the minimum or maximum. This is
> equivalent to using clamp, while being less readable. Let's switch to
> using clamp instead.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 7bb5ae0fb688..150d1bc0985b 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2365,11 +2365,7 @@ int clk_set_rate_range(struct clk *clk, unsigned l=
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

This isn't equivalent. The else arm is taken if rate >=3D min and rate is
set to max, whereas clamp() will leave the rate unchanged if rate >=3D min
&& rate < max.
