Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F678A79E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 10:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE2110E244;
	Mon, 28 Aug 2023 08:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFC610E244
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 08:25:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A9C2629B7;
 Mon, 28 Aug 2023 08:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2603FC433C8;
 Mon, 28 Aug 2023 08:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693211104;
 bh=AzIl8R+mLlfk4QDKcU1VNTjiQMbFxq1oXdZ0jzRVpyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c5+sn0c3TV9IQhaynyIaq5MGo7M/nYbuv3UH/13KyfVhu3G6XMWK48tKY5+KmEDkF
 iCt+VmtLCFAkfAn21TBAZPqDiM99YiGzPAaRfoBA72bLBOzxz1wQJYO8L0o6zd2UZ/
 g8W5QGaTbT+O8f8+kiNUZBqHJdINdYWx5fJmljJA48mmzbz4XLHwOZekwrTd5UR7Gl
 UwZQhXKYV2YdMOtNli3lypeqbPunhwhsIkzzZ5wrWaIKfb3JCIDfSMHY0EGnbyvBQ5
 tXvsjNZ8mAMGoHeO8YHywe6XbZytQw1nDK2y/FWwPeg1RMg7S7qM3J/xpFDgMJr0cQ
 6DbOonxeyzDRg==
Date: Mon, 28 Aug 2023 10:25:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 0/3] Make Allwinner A64's pll-mipi keep its rate when
 parent rate changes
Message-ID: <yblg37fisgmuveiuxsxcvls4uoxjv5wkvsztm6zpelxv7quuz5@zbsqfcn2z34v>
References: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
 <zrjpbtf7qwaj2tjvfz2no534tmz5j4yudp45tung2w5x2zcl6y@bal3bclzze4e>
 <87ledzqhwx.fsf@oltmanns.dev> <878r9yb21b.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <878r9yb21b.fsf@oltmanns.dev>
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

On Sat, Aug 26, 2023 at 11:12:16AM +0200, Frank Oltmanns wrote:
>=20
> On 2023-08-25 at 17:07:58 +0200, Frank Oltmanns <frank@oltmanns.dev> wrot=
e:
> > Thank you for your feedback, Maxime!
> >
> > On 2023-08-25 at 10:13:53 +0200, Maxime Ripard <mripard@kernel.org> wro=
te:
> >> [[PGP Signed Part:Undecided]]
> >> Hi,
> >>
> >> On Fri, Aug 25, 2023 at 07:36:36AM +0200, Frank Oltmanns wrote:
> >>> I would like to make the Allwinner A64's pll-mipi to keep its rate wh=
en
> >>> its parent's (pll-video0) rate changes. Keeping pll-mipi's rate is
> >>> required, to let the A64 drive both an LCD and HDMI display at the sa=
me
> >>> time, because both have pll-video0 as an ancestor.
> >>>
> >>> PATCH 1 adds this functionality as a feature into the clk framework (=
new
> >>> flag: CLK_KEEP_RATE).
> >>>
> >>> Cores that use this flag, store a rate as req_rate when it or one of =
its
> >>> descendants requests a new rate.
> >>>
> >>> That rate is then restored in the clk_change_rate recursion, which wa=
lks
> >>> through the tree. It will reach the flagged core (e.g. pll-mipi) after
> >>> the parent's rate (e.g. pll-video0) has already been set to the new
> >>> rate. It will then call determine_rate (which requests the parent's
> >>> current, i.e. new, rate) to determine a rate that is close to the
> >>> flagged core's previous rate. Afterward it will re-calculate the rates
> >>> for the flagged core's subtree.
> >>
> >> I don't think it's the right way forward. It makes the core logic more
> >> complicated, for something that is redundant with the notifiers
> >> mechanism that has been the go-to for that kind of things so far.
> >
> > Yeah, that was my initial idea as well. But I couldn't get it to work.
> > See details below.
> >
> > Do you have an example of a clock that restores its previous rate after
> > the parent rate has changed? I've looked left and right, but to me it
> > seems that notifiers are mainly used for setting clocks into some kind
> > of "safe mode" prior to the rate change. Examples:
> >
> > sunxi-ng:
> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/cc=
u_mux.c#L273
> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/cc=
u_common.c#L60
> >
> > but also others:
> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/at91/clk-ma=
ster.c#L248
> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/meson/meson=
8b.c#L3755
> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/qcom/clk-cp=
u-8996.c#L546
> >
> >> It's not really obvious to me why the notifiers don't work there.
> >>
> >>> This work is inspired by an out-of-tree patchset [1] [2] [3].
> >>> Unfortunately, the patchset uses clk_set_rate() in a notifier callbac=
k,
> >>> which the following comment on clk_notifier_register() forbids: "The
> >>> callbacks associated with the notifier must not re-enter into the clk
> >>> framework by calling any top-level clk APIs." [4] Furthermore, that
> >>> out-of-tree patchset no longer works with the current linux-next,
> >>> because setting pll-mipi is now also resetting pll-video0 [5].
> >>
> >> Is it because of the "The callbacks associated with the notifier must
> >> not re-enter into the clk framework by calling any top-level clk APIs."
> >> comment?
> >
> > I don't think that's the reason. I'm fairly certain that the problem is,
> > that pll-mipi tries to set the parent rate. Maybe it should check if the
> > parent is locked, before determining a rate that requires the parent
> > rate to change. =F0=9F=A4=94 Currently, it only calls clk_hw_can_set_ra=
te_parent()
> > which only checks the flag, but does not check if it is really possible
> > to change the parent's rate.
> >
> > Regardless, please don't prematurely dismiss my proposal. It has the
> > advantage that it is not specific for sunxi-ng, but could be used for
> > other drivers as well. Maybe there other instances of exclusive locks
> > today where the CLK_KEEP_RATE flag might work equally well. =F0=9F=A4=B7
> >
> >> If so, I think the thing we should emphasize is that it's about *any
> >> top-level clk API*, as in clk_set_rate() or clk_set_parent().
> >>
> >> The issue is that any consumer-facing API is taking the clk_prepare lo=
ck
> >> and thus we would have reentrancy. But we're a provider there, and none
> >> of the clk_hw_* functions are taking that lock. Neither do our own fun=
ction.
> >>
> >> So we could call in that notifier our set_rate callback directly, or we
> >> could create a clk_hw_set_rate() function.
> >>
> >> The first one will create cache issue between the actual rate that the
> >> common clock framework is running and the one we actually enforced, but
> >> we could create a function to flush the CCF cache.
> >>
> >> The second one is probably simpler.
> >
> > I'm probably missing something, because I don't think this would work.
> > For reference, this is our tree:
> >
> >     pll-video0
> >        hdmi-phy-clk
> >        hdmi
> >        tcon1
> >        pll-mipi
> >           tcon0
> >              tcon-data-clock
> >
> > When pll-video0's rate is changed (e.g. because a HDMI monitor is
> > plugged in), the rates of the complete subtree for pll-video0 are
> > recalculated, including tcon0 and tcon-data-clock. The rate of tcon0 is
> > based on the rate that was recalculated for pll-mipi, which - in turn -
> > was of course recalculated based on the pll-video0's new rate. These
> > values are stored by the clk framework in a private struct. They are
> > calculated before actually performing any rate changes.
> >
> > So, if a notifier sets pll-mipi's rate to something else than was
> > previously recalculated, the clk framework would still try to set tcon0
> > to the value that it previously calculated.
> >
> > So, we would have to recalculate pll-mipi's subtree after changing its
> > rate (that's what PATCH 1 is doing).
>=20
> Sorry, I forgot that this actually was possible by flagging pll-mipi
> with CLK_RECALC_NEW_RATES. But the real problem I was fighting with when
> trying to use the notifiers is something else.
>=20
> Initially, pll-video0 is set by the bootloader. In my case uboot sets it
> to 294 MHz. pll-mipi is set to 588 MHz.
>=20
> Afterward, there are actually two types of calls for setting pll-mipi in
> my scenario:
>  1. during boot when tcon-data-clock is set to drive the LCD panel
>  2. when the HDMI cable is plugged in

Not really. Both of those clocks can change (or not) at any point in
time. What triggers the rate set is a modeset which might never happen
(if the display driver or output is disabled, if the fbdev emulation is
disabled or if there's never a compositor starting) or possibly happen
each frame on both output for all you know.

> In the first case, the rate for pll-mipi is based on the rate that
> tcon-data-clock requests. In that case, we do not want to restore the
> previous rate.
>=20
> In the second case, pll-mipi should try to remain running at the
> previous rate (the one that was requested by tcon-data-clock). That's
> the reason for setting core->req_rate in PATCH 1.
>=20
> Unfortunately, the notifier does not provide us with enough context to
> distinguish the two cases.

I don't think any piece of code will be able to, really.

Your definition of CLK_KEEP_RATE is that it will "try to keep rate, if
parent rate changes"

What happens if it fails, possibly because of rounding like you
mentioned already?

Fundamentally, the problem is that you need different rates on two
subtrees, and we set both to have CLK_SET_RATE_PARENT and allow both to
change the parent rate if needed.

What would happen if we force pll-video0 to a known, fixed, value and
remove CLK_SET_RATE_PARENT from both the pll-mipi and hdmi clocks?

Maxime
