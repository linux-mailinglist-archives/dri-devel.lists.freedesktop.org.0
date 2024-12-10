Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FF79EBDFC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 23:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAC010E17B;
	Tue, 10 Dec 2024 22:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G0KXdhbb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E85310E17B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 22:44:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 802F1A41BF3;
 Tue, 10 Dec 2024 22:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCD1C4CED6;
 Tue, 10 Dec 2024 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733870661;
 bh=HP4MsNw/hXG7nhPJ0xWXWHKylFCTW4+JsqUQHNFKB2k=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=G0KXdhbbJ5rvvoDZqYRO6wYCU/J0eN/NtedIKQgZEPd2HdA2GPfsSOitJG8EW5ruE
 DxH6lGL9Jr28NBCy+ZXrSsNn4DVjD0FvcBq1IHIi8pNEFXKvR0PCQrZT9C7+C2x+Zt
 cxr1ixqZFf4slma0NhtmDYZ3q3DJxoHTkAmgxWTDbL8Ev4br2lExKoFXnGeQAGzVOf
 HzJ+oAHkfu/VaOcs5R0EREvFKR/EWDek4d7n6ZYmLXnQjDdqPaxB/vwJBhXM+eu9jo
 EIMrcVv9FF1sRyIKhwGu/JpCsHIZIhFmBYk/dVCi+OK6hJLpBpte73ViEaZLFrwE81
 CWJLj4Z6TEJOg==
Message-ID: <fd2b473bc7c3c70ae0e85b2a6315d9e8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
From: Stephen Boyd <sboyd@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
To: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Ying Liu <victor.liu@nxp.com>
Date: Tue, 10 Dec 2024 14:44:19 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting Miquel Raynal (2024-11-21 09:41:14)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index adfc5bfb93b5a65b6f58c52ca2c432d651f7dd7d..94d93470479e77769e63e9746=
2b176261103b552 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1927,7 +1927,6 @@ long clk_get_accuracy(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_get_accuracy);
> =20
> -__maybe_unused
>  static unsigned long clk_determine(struct clk_core *core, unsigned long =
rate)
>  {
>         struct clk_rate_request req =3D {};

Please add functions in the same patch that uses them. It is hard to
review this patch when half the context is in another patch.

> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core *core)
>  {
>         struct clk_core *child;
> =20
> -       core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> +       if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
> +               core->new_rate =3D clk_determine(core, core->rate);
> +               if (!core->new_rate)
> +                       core->new_rate =3D clk_recalc(core, core->parent-=
>new_rate);
> +       } else {
> +               core->new_rate =3D clk_recalc(core, core->parent->new_rat=
e);
> +       }
> =20
>         hlist_for_each_entry(child, &core->children, child_node)
>                 clk_calc_subtree(child);
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 200135e0f6d00d48b10e843259333b9733c97f38..baef0b442ac1d36ee935cbcaa=
aa4e2d95fe7654c 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -38,6 +38,8 @@
>  #define CLK_OPS_PARENT_ENABLE  BIT(12)
>  /* duty cycle call may be forwarded to the parent clock */
>  #define CLK_DUTY_CYCLE_PARENT  BIT(13)
> +/* do not passively change this clock rate during subtree rate propagati=
on */
> +#define CLK_NO_RATE_CHANGE_DURING_PROPAGATION BIT(14)

Why doesn't rate locking work?
