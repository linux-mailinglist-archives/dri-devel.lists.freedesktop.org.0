Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8751D78A703
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 10:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F19910E229;
	Mon, 28 Aug 2023 08:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DBF710E225
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 08:04:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC4FE63305;
 Mon, 28 Aug 2023 08:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39C9C433C7;
 Mon, 28 Aug 2023 08:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693209894;
 bh=21GDsKWpLyozjrrpuCacWmWY2wJcf8Nk1npOku7xMFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZFMhvoAW56IXhXLpf2nwmmhjFpUMpVqp3hE4v1bjYw8J7bwUBzfE32nEMPoin5f8C
 7jawMFhFgIzRKFE+SoBCYDSEO54cWXpWLeYC4plGzrj5ZLStJM1TvoNAwGC/mX9GbK
 2Umi4UVrPyF1XlVRHpt2njOVxGFaoJ0kc21gpDzw7C/Zosil2sSiIPIW47Gs0VKz6A
 /AsCx3COVmrRGPR6X1FOmrw5z6J/nqW1GICnLD7PO3dOvpdWbLjoneI+V8nQwmSAsU
 OPMIfgbPl76xdGBr4AnDWf1uKfUgVqbhfVCPkWWB0d348v74kdsaub1pqHgfLbUSIf
 bYw8f3ekxXPGg==
Date: Mon, 28 Aug 2023 10:04:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 0/3] Make Allwinner A64's pll-mipi keep its rate when
 parent rate changes
Message-ID: <fd4beguej6ijxpo2hri56pes25re5gdwytxkbvllq4mskffolh@uyxe4j3eorq4>
References: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
 <zrjpbtf7qwaj2tjvfz2no534tmz5j4yudp45tung2w5x2zcl6y@bal3bclzze4e>
 <87ledzqhwx.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87ledzqhwx.fsf@oltmanns.dev>
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
Cc: dri-devel@lists.freedesktop.org, Icenowy Zheng <uwu@icenowy.me>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Chen-Yu Tsai <wens@csie.org>, Ondrej Jirman <x@xnux.eu>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 05:07:58PM +0200, Frank Oltmanns wrote:
> Thank you for your feedback, Maxime!
>=20
> On 2023-08-25 at 10:13:53 +0200, Maxime Ripard <mripard@kernel.org> wrote:
> > [[PGP Signed Part:Undecided]]
> > Hi,
> >
> > On Fri, Aug 25, 2023 at 07:36:36AM +0200, Frank Oltmanns wrote:
> >> I would like to make the Allwinner A64's pll-mipi to keep its rate when
> >> its parent's (pll-video0) rate changes. Keeping pll-mipi's rate is
> >> required, to let the A64 drive both an LCD and HDMI display at the same
> >> time, because both have pll-video0 as an ancestor.
> >>
> >> PATCH 1 adds this functionality as a feature into the clk framework (n=
ew
> >> flag: CLK_KEEP_RATE).
> >>
> >> Cores that use this flag, store a rate as req_rate when it or one of i=
ts
> >> descendants requests a new rate.
> >>
> >> That rate is then restored in the clk_change_rate recursion, which wal=
ks
> >> through the tree. It will reach the flagged core (e.g. pll-mipi) after
> >> the parent's rate (e.g. pll-video0) has already been set to the new
> >> rate. It will then call determine_rate (which requests the parent's
> >> current, i.e. new, rate) to determine a rate that is close to the
> >> flagged core's previous rate. Afterward it will re-calculate the rates
> >> for the flagged core's subtree.
> >
> > I don't think it's the right way forward. It makes the core logic more
> > complicated, for something that is redundant with the notifiers
> > mechanism that has been the go-to for that kind of things so far.
>=20
> Yeah, that was my initial idea as well. But I couldn't get it to work.
> See details below.
>=20
> Do you have an example of a clock that restores its previous rate after
> the parent rate has changed? I've looked left and right, but to me it
> seems that notifiers are mainly used for setting clocks into some kind
> of "safe mode" prior to the rate change. Examples:
>=20
> sunxi-ng:
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/ccu_=
mux.c#L273
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/ccu_=
common.c#L60
>=20
> but also others:
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/at91/clk-mast=
er.c#L248
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/meson/meson8b=
=2Ec#L3755
> https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/qcom/clk-cpu-=
8996.c#L546

There's examples for phases and parents, but not for rates afaics. We
shouldn't behave any differently though.

> > It's not really obvious to me why the notifiers don't work there.
> >
> >> This work is inspired by an out-of-tree patchset [1] [2] [3].
> >> Unfortunately, the patchset uses clk_set_rate() in a notifier callback,
> >> which the following comment on clk_notifier_register() forbids: "The
> >> callbacks associated with the notifier must not re-enter into the clk
> >> framework by calling any top-level clk APIs." [4] Furthermore, that
> >> out-of-tree patchset no longer works with the current linux-next,
> >> because setting pll-mipi is now also resetting pll-video0 [5].
> >
> > Is it because of the "The callbacks associated with the notifier must
> > not re-enter into the clk framework by calling any top-level clk APIs."
> > comment?
>=20
> I don't think that's the reason.

I'm not sure I follow you there. How can we find a solution to a problem
you don't know about or can't know for sure?

> I'm fairly certain that the problem is, that pll-mipi tries to set the
> parent rate. Maybe it should check if the parent is locked, before
> determining a rate that requires the parent rate to change. =F0=9F=A4=94

Why would the clock framework documentation mention an issue that only
arises with a single clock on a single SoC?

That comment in the clock framework you linked to clearly stated that
you can't use a top-level clock function in a notifier, and that's
because of the locking.

If it's not what you're trying to fix, then I'd really like to know what
issue you're trying to fix *in the framework* (so, not on the pll-mipi
clock, or the A64).

> Currently, it only calls clk_hw_can_set_rate_parent() which only
> checks the flag, but does not check if it is really possible to change
> the parent's rate.
>=20
> Regardless, please don't prematurely dismiss my proposal. It has the
> advantage that it is not specific for sunxi-ng, but could be used for
> other drivers as well.

Just like the two solutions I provided.

> Maybe there other instances of exclusive locks today where the
> CLK_KEEP_RATE flag might work equally well. =F0=9F=A4=B7

If exclusive locks work equally well, why would we need CLK_KEEP_RATE?

> > If so, I think the thing we should emphasize is that it's about *any
> > top-level clk API*, as in clk_set_rate() or clk_set_parent().
> >
> > The issue is that any consumer-facing API is taking the clk_prepare lock
> > and thus we would have reentrancy. But we're a provider there, and none
> > of the clk_hw_* functions are taking that lock. Neither do our own func=
tion.
> >
> > So we could call in that notifier our set_rate callback directly, or we
> > could create a clk_hw_set_rate() function.
> >
> > The first one will create cache issue between the actual rate that the
> > common clock framework is running and the one we actually enforced, but
> > we could create a function to flush the CCF cache.
> >
> > The second one is probably simpler.
>=20
> I'm probably missing something, because I don't think this would work.
> For reference, this is our tree:
>=20
>     pll-video0
>        hdmi-phy-clk
>        hdmi
>        tcon1
>        pll-mipi
>           tcon0
>              tcon-data-clock
>=20
> When pll-video0's rate is changed (e.g. because a HDMI monitor is
> plugged in), the rates of the complete subtree for pll-video0 are
> recalculated, including tcon0 and tcon-data-clock. The rate of tcon0 is
> based on the rate that was recalculated for pll-mipi, which - in turn -
> was of course recalculated based on the pll-video0's new rate. These
> values are stored by the clk framework in a private struct. They are
> calculated before actually performing any rate changes.
>=20
> So, if a notifier sets pll-mipi's rate to something else than was
> previously recalculated, the clk framework would still try to set tcon0
> to the value that it previously calculated.
>
> So, we would have to recalculate pll-mipi's subtree after changing its
> rate (that's what PATCH 1 is doing).

Then we should make that function I was telling you about deal with all
this.

Maxime
