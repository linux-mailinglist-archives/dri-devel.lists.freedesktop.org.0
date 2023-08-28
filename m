Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C9A78B2BC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 16:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D2710E2EA;
	Mon, 28 Aug 2023 14:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CAC10E2EA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 14:14:17 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RZCGv27R1z9sr6;
 Mon, 28 Aug 2023 16:14:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1693232055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DO/l19fra2OrFIuBGZ5yUwxn75lwFHs9VDz/dQrv/o=;
 b=imCfI3Fl0CU6sxkurcZarAexLBD/sw/LLM0LSo6Esc/GeST0+FK1cfygO5a2HcEnwfkNEi
 hFwUwk0hHFU8cRjeVEUbZod44/7kwx3HpCnFxomHJr4m85AjXX/n6epx5B0tpt5BJ0xgn+
 Nl8g6jnmVlh/+fv+SDKCHzlokI+qZ9h9C7dex3HUj2m6lNc44py+pyb83qvsXyxQXXimvd
 f+Nl52q9f0wtYeJodZ1dlzpuxG6QVt7T+8KmtC/tg2NORSKJVJb6okvtDbhwqDuxF6X8ak
 uztQy/lOw4qVyus8nZN/wV+MOcXO7Dk2Ls/Kf1IPjUUmj+9qoMM6vX99TPj1Uw==
References: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
 <zrjpbtf7qwaj2tjvfz2no534tmz5j4yudp45tung2w5x2zcl6y@bal3bclzze4e>
 <87ledzqhwx.fsf@oltmanns.dev> <878r9yb21b.fsf@oltmanns.dev>
 <yblg37fisgmuveiuxsxcvls4uoxjv5wkvsztm6zpelxv7quuz5@zbsqfcn2z34v>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/3] Make Allwinner A64's pll-mipi keep its rate when
 parent rate changes
In-reply-to: <yblg37fisgmuveiuxsxcvls4uoxjv5wkvsztm6zpelxv7quuz5@zbsqfcn2z34v>
Date: Mon, 28 Aug 2023 16:14:06 +0200
Message-ID: <87msybuudt.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4RZCGv27R1z9sr6
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


On 2023-08-28 at 10:25:01 +0200, Maxime Ripard <mripard@kernel.org> wrote:
> On Sat, Aug 26, 2023 at 11:12:16AM +0200, Frank Oltmanns wrote:
>>
>> On 2023-08-25 at 17:07:58 +0200, Frank Oltmanns <frank@oltmanns.dev> wro=
te:
>> > Thank you for your feedback, Maxime!
>> >
>> > On 2023-08-25 at 10:13:53 +0200, Maxime Ripard <mripard@kernel.org> wr=
ote:
>> >> [[PGP Signed Part:Undecided]]
>> >> Hi,
>> >>
>> >> On Fri, Aug 25, 2023 at 07:36:36AM +0200, Frank Oltmanns wrote:
>> >>> I would like to make the Allwinner A64's pll-mipi to keep its rate w=
hen
>> >>> its parent's (pll-video0) rate changes. Keeping pll-mipi's rate is
>> >>> required, to let the A64 drive both an LCD and HDMI display at the s=
ame
>> >>> time, because both have pll-video0 as an ancestor.
>> >>>
>> >>> PATCH 1 adds this functionality as a feature into the clk framework =
(new
>> >>> flag: CLK_KEEP_RATE).
>> >>>
>> >>> Cores that use this flag, store a rate as req_rate when it or one of=
 its
>> >>> descendants requests a new rate.
>> >>>
>> >>> That rate is then restored in the clk_change_rate recursion, which w=
alks
>> >>> through the tree. It will reach the flagged core (e.g. pll-mipi) aft=
er
>> >>> the parent's rate (e.g. pll-video0) has already been set to the new
>> >>> rate. It will then call determine_rate (which requests the parent's
>> >>> current, i.e. new, rate) to determine a rate that is close to the
>> >>> flagged core's previous rate. Afterward it will re-calculate the rat=
es
>> >>> for the flagged core's subtree.
>> >>
>> >> I don't think it's the right way forward. It makes the core logic more
>> >> complicated, for something that is redundant with the notifiers
>> >> mechanism that has been the go-to for that kind of things so far.
>> >
>> > Yeah, that was my initial idea as well. But I couldn't get it to work.
>> > See details below.
>> >
>> > Do you have an example of a clock that restores its previous rate after
>> > the parent rate has changed? I've looked left and right, but to me it
>> > seems that notifiers are mainly used for setting clocks into some kind
>> > of "safe mode" prior to the rate change. Examples:
>> >
>> > sunxi-ng:
>> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/c=
cu_mux.c#L273
>> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/c=
cu_common.c#L60
>> >
>> > but also others:
>> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/at91/clk-m=
aster.c#L248
>> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/meson/meso=
n8b.c#L3755
>> > https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/qcom/clk-c=
pu-8996.c#L546
>> >
>> >> It's not really obvious to me why the notifiers don't work there.
>> >>
>> >>> This work is inspired by an out-of-tree patchset [1] [2] [3].
>> >>> Unfortunately, the patchset uses clk_set_rate() in a notifier callba=
ck,
>> >>> which the following comment on clk_notifier_register() forbids: "The
>> >>> callbacks associated with the notifier must not re-enter into the clk
>> >>> framework by calling any top-level clk APIs." [4] Furthermore, that
>> >>> out-of-tree patchset no longer works with the current linux-next,
>> >>> because setting pll-mipi is now also resetting pll-video0 [5].
>> >>
>> >> Is it because of the "The callbacks associated with the notifier must
>> >> not re-enter into the clk framework by calling any top-level clk APIs=
."
>> >> comment?
>> >
>> > I don't think that's the reason. I'm fairly certain that the problem i=
s,
>> > that pll-mipi tries to set the parent rate. Maybe it should check if t=
he
>> > parent is locked, before determining a rate that requires the parent
>> > rate to change. =F0=9F=A4=94 Currently, it only calls clk_hw_can_set_r=
ate_parent()
>> > which only checks the flag, but does not check if it is really possible
>> > to change the parent's rate.
>> >
>> > Regardless, please don't prematurely dismiss my proposal. It has the
>> > advantage that it is not specific for sunxi-ng, but could be used for
>> > other drivers as well. Maybe there other instances of exclusive locks
>> > today where the CLK_KEEP_RATE flag might work equally well. =F0=9F=A4=
=B7
>> >
>> >> If so, I think the thing we should emphasize is that it's about *any
>> >> top-level clk API*, as in clk_set_rate() or clk_set_parent().
>> >>
>> >> The issue is that any consumer-facing API is taking the clk_prepare l=
ock
>> >> and thus we would have reentrancy. But we're a provider there, and no=
ne
>> >> of the clk_hw_* functions are taking that lock. Neither do our own fu=
nction.
>> >>
>> >> So we could call in that notifier our set_rate callback directly, or =
we
>> >> could create a clk_hw_set_rate() function.
>> >>
>> >> The first one will create cache issue between the actual rate that the
>> >> common clock framework is running and the one we actually enforced, b=
ut
>> >> we could create a function to flush the CCF cache.
>> >>
>> >> The second one is probably simpler.
>> >
>> > I'm probably missing something, because I don't think this would work.
>> > For reference, this is our tree:
>> >
>> >     pll-video0
>> >        hdmi-phy-clk
>> >        hdmi
>> >        tcon1
>> >        pll-mipi
>> >           tcon0
>> >              tcon-data-clock
>> >
>> > When pll-video0's rate is changed (e.g. because a HDMI monitor is
>> > plugged in), the rates of the complete subtree for pll-video0 are
>> > recalculated, including tcon0 and tcon-data-clock. The rate of tcon0 is
>> > based on the rate that was recalculated for pll-mipi, which - in turn -
>> > was of course recalculated based on the pll-video0's new rate. These
>> > values are stored by the clk framework in a private struct. They are
>> > calculated before actually performing any rate changes.
>> >
>> > So, if a notifier sets pll-mipi's rate to something else than was
>> > previously recalculated, the clk framework would still try to set tcon0
>> > to the value that it previously calculated.
>> >
>> > So, we would have to recalculate pll-mipi's subtree after changing its
>> > rate (that's what PATCH 1 is doing).
>>
>> Sorry, I forgot that this actually was possible by flagging pll-mipi
>> with CLK_RECALC_NEW_RATES. But the real problem I was fighting with when
>> trying to use the notifiers is something else.
>>
>> Initially, pll-video0 is set by the bootloader. In my case uboot sets it
>> to 294 MHz. pll-mipi is set to 588 MHz.
>>
>> Afterward, there are actually two types of calls for setting pll-mipi in
>> my scenario:
>>  1. during boot when tcon-data-clock is set to drive the LCD panel
>>  2. when the HDMI cable is plugged in
>
> Not really. Both of those clocks can change (or not) at any point in
> time. What triggers the rate set is a modeset which might never happen
> (if the display driver or output is disabled, if the fbdev emulation is
> disabled or if there's never a compositor starting) or possibly happen
> each frame on both output for all you know.

Ok, thank you for the explanation and I apologize for not having the
terminology straight. This would mean that in my description above there
are two modesets that trigger the rate set
 1. for the tcon-data-clock on boot when the internal display is
    activated and
 2. for hdmi when the external monitor is activated.

For reference: In my scenario I'm using a pinephone which has an
internal LCD display and an HDMI connector (not supported in mainline).

I understand that there could be more. Let's put a pin in that, because
my understandig is, that this is not the relevant part here.

>> In the first case, the rate for pll-mipi is based on the rate that
>> tcon-data-clock requests. In that case, we do not want to restore the
>> previous rate.
>>
>> In the second case, pll-mipi should try to remain running at the
>> previous rate (the one that was requested by tcon-data-clock). That's
>> the reason for setting core->req_rate in PATCH 1.
>>
>> Unfortunately, the notifier does not provide us with enough context to
>> distinguish the two cases.
>
> I don't think any piece of code will be able to, really.

In the first case, setting the pll-mipi clock starts from the bottom
(tcon-data-clock) and uses clk_calc_new_rates() to get to the top-most
clock that needs and can be changed. On it's way up to pll-video0 it
passes pll-mipi. My proposal (PATCH 1) is to use that moment to store
the rate in req_rate.

In contrast, in the second case, setting the pll-mipi clock starts from
the top. pll-video0's rate is changed and therefore a new rate is
propagate for the whole subtree where, on its way down, it passes
pll-mipi. My proposal (PATCH 1) is to use that moment to restore the
rate from req_rate that was previously (see pragraph above) set.

Since I did not see a way to achieve this using notifiers (and you seem
to agree), I chose to propose a different path.

> Your definition of CLK_KEEP_RATE is that it will "try to keep rate, if
> parent rate changes"
>
> What happens if it fails, possibly because of rounding like you
> mentioned already?

Maybe "keep" is too strong of a word. I'm sorry for the confusion my
poor choice of wording has caused.

What I would like if for a clock to go back as closely as possible to
the previous rate. And this is what PATCH 1 does by using the clocks
determine_rate (or round_rate) operation.

> Fundamentally, the problem is that you need different rates on two
> subtrees, and we set both to have CLK_SET_RATE_PARENT and allow both to
> change the parent rate if needed.

This reads to me as if you are emphasizing the word "both" here. I'm
aware that you know, but I state it here for the benefit of others: Up
until kernel 6.5 only hdmi resets pll-video0. pll-mipi does not set
pll-video0. This has changed in clk-next. Now also pll-mipi sets the
parent rate.

Icenowy's patches are aimed at (and work for) up to kernel 6.5. They
restore pll-mipi's rate after pll-video0 has been changed by hdmi.

> What would happen if we force pll-video0 to a known, fixed, value and
> remove CLK_SET_RATE_PARENT from both the pll-mipi and hdmi clocks?

Approximately three months ago, I wrote "one could argue that pll-video0
should be set to 297MHz at boot", to which Jernej responded: "Ideally,
clock rate setting code should be immune on "initial" values, set by
bootloader or default values. If it's not, then it should be improved in
the way that it is.":
https://lore.kernel.org/linux-clk/4831731.31r3eYUQgx@jernej-laptop/#t

That's what got me startet on the whole process of allowing pll-mipi to
set it's parent instead of simply setting it to a known rate of 297 MHz.

Should I resume the other (297MHz) investigation?

I had another idea, but don't know how/if that's possible: Maybe we
could use a notifier to notify pll-mipi (or even better:
tcon-data-clock) and use some mechanism to defer calling clk_set_rate()
to a point in time when the whole process of setting the clocks is
complete.

Best regards,
  Frank


>
> Maxime
