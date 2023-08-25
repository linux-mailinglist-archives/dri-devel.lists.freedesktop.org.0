Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC3788C22
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 17:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0007610E6BA;
	Fri, 25 Aug 2023 15:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F5610E6CC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 15:08:13 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RXNcS5hXvz9sy4;
 Fri, 25 Aug 2023 17:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1692976088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAEOctatpX3/10zBsdBfZLy0AhwYTDuyHJC0ob0juM4=;
 b=IjIDPIFmVJawwxPDgRAAlZPbcizlZu2X0oO98CrY7GZLx1XpLW7KW6fiyGbFlWKGn7z8px
 LF8Yv+5laH7ak4UBi6248gTuwquMwszkDWa9XJG1NkJ/LtaAKl9Mef8iOsLi42PFCY54hP
 faju8xYIEdwPmuMm1IFQfz1a3knx/QWXtOScS4DmfAUPRhyrypK/LXCflX+Ed/vnSuT0p5
 X6XBeKAXaruVsPIMxm0XyjGUgjuAJF9j+0rwkBdTo48ZmcyH1FgFET4bkJ3LLQYP8K903P
 V2fUr/uVExTnT01W5FiGDxwPHaR81Xyo5OyQSHKqolrMV8L6F355X+Isvsk0sA==
References: <20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev>
 <zrjpbtf7qwaj2tjvfz2no534tmz5j4yudp45tung2w5x2zcl6y@bal3bclzze4e>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 0/3] Make Allwinner A64's pll-mipi keep its rate when
 parent rate changes
In-reply-to: <zrjpbtf7qwaj2tjvfz2no534tmz5j4yudp45tung2w5x2zcl6y@bal3bclzze4e>
Date: Fri, 25 Aug 2023 17:07:58 +0200
Message-ID: <87ledzqhwx.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4RXNcS5hXvz9sy4
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

Thank you for your feedback, Maxime!

On 2023-08-25 at 10:13:53 +0200, Maxime Ripard <mripard@kernel.org> wrote:
> [[PGP Signed Part:Undecided]]
> Hi,
>
> On Fri, Aug 25, 2023 at 07:36:36AM +0200, Frank Oltmanns wrote:
>> I would like to make the Allwinner A64's pll-mipi to keep its rate when
>> its parent's (pll-video0) rate changes. Keeping pll-mipi's rate is
>> required, to let the A64 drive both an LCD and HDMI display at the same
>> time, because both have pll-video0 as an ancestor.
>>
>> PATCH 1 adds this functionality as a feature into the clk framework (new
>> flag: CLK_KEEP_RATE).
>>
>> Cores that use this flag, store a rate as req_rate when it or one of its
>> descendants requests a new rate.
>>
>> That rate is then restored in the clk_change_rate recursion, which walks
>> through the tree. It will reach the flagged core (e.g. pll-mipi) after
>> the parent's rate (e.g. pll-video0) has already been set to the new
>> rate. It will then call determine_rate (which requests the parent's
>> current, i.e. new, rate) to determine a rate that is close to the
>> flagged core's previous rate. Afterward it will re-calculate the rates
>> for the flagged core's subtree.
>
> I don't think it's the right way forward. It makes the core logic more
> complicated, for something that is redundant with the notifiers
> mechanism that has been the go-to for that kind of things so far.

Yeah, that was my initial idea as well. But I couldn't get it to work.
See details below.

Do you have an example of a clock that restores its previous rate after
the parent rate has changed? I've looked left and right, but to me it
seems that notifiers are mainly used for setting clocks into some kind
of "safe mode" prior to the rate change. Examples:

sunxi-ng:
https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/ccu_mu=
x.c#L273
https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/sunxi-ng/ccu_co=
mmon.c#L60

but also others:
https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/at91/clk-master=
.c#L248
https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/meson/meson8b.c=
#L3755
https://elixir.bootlin.com/linux/v6.4.11/source/drivers/clk/qcom/clk-cpu-89=
96.c#L546

> It's not really obvious to me why the notifiers don't work there.
>
>> This work is inspired by an out-of-tree patchset [1] [2] [3].
>> Unfortunately, the patchset uses clk_set_rate() in a notifier callback,
>> which the following comment on clk_notifier_register() forbids: "The
>> callbacks associated with the notifier must not re-enter into the clk
>> framework by calling any top-level clk APIs." [4] Furthermore, that
>> out-of-tree patchset no longer works with the current linux-next,
>> because setting pll-mipi is now also resetting pll-video0 [5].
>
> Is it because of the "The callbacks associated with the notifier must
> not re-enter into the clk framework by calling any top-level clk APIs."
> comment?

I don't think that's the reason. I'm fairly certain that the problem is,
that pll-mipi tries to set the parent rate. Maybe it should check if the
parent is locked, before determining a rate that requires the parent
rate to change. =F0=9F=A4=94 Currently, it only calls clk_hw_can_set_rate_p=
arent()
which only checks the flag, but does not check if it is really possible
to change the parent's rate.

Regardless, please don't prematurely dismiss my proposal. It has the
advantage that it is not specific for sunxi-ng, but could be used for
other drivers as well. Maybe there other instances of exclusive locks
today where the CLK_KEEP_RATE flag might work equally well. =F0=9F=A4=B7

> If so, I think the thing we should emphasize is that it's about *any
> top-level clk API*, as in clk_set_rate() or clk_set_parent().
>
> The issue is that any consumer-facing API is taking the clk_prepare lock
> and thus we would have reentrancy. But we're a provider there, and none
> of the clk_hw_* functions are taking that lock. Neither do our own functi=
on.
>
> So we could call in that notifier our set_rate callback directly, or we
> could create a clk_hw_set_rate() function.
>
> The first one will create cache issue between the actual rate that the
> common clock framework is running and the one we actually enforced, but
> we could create a function to flush the CCF cache.
>
> The second one is probably simpler.

I'm probably missing something, because I don't think this would work.
For reference, this is our tree:

    pll-video0
       hdmi-phy-clk
       hdmi
       tcon1
       pll-mipi
          tcon0
             tcon-data-clock

When pll-video0's rate is changed (e.g. because a HDMI monitor is
plugged in), the rates of the complete subtree for pll-video0 are
recalculated, including tcon0 and tcon-data-clock. The rate of tcon0 is
based on the rate that was recalculated for pll-mipi, which - in turn -
was of course recalculated based on the pll-video0's new rate. These
values are stored by the clk framework in a private struct. They are
calculated before actually performing any rate changes.

So, if a notifier sets pll-mipi's rate to something else than was
previously recalculated, the clk framework would still try to set tcon0
to the value that it previously calculated.

So, we would have to recalculate pll-mipi's subtree after changing its
rate (that's what PATCH 1 is doing).

> Another option could be that we turn clk_set_rate_exclusive into
> something more subtle that allows to change a parent rate as long as the
> clock rate doesn't.

I don't think this would work either. Only in rare circumstances
pll-mipi can be set to the exact previous rate, normally it will be set
to a rate that is close to it's previous rate.

Note there is another option, we could analyze: pll-video0's
RRE_RATE_CHANGE notifier could be used to set pll-mipi into a mode that
lets it recalculate a rate that is close to the previous rate. A
POST_RATE_CHANGE notifier could be used to switch it back to "normal"
recalc mode. I don't know if pll-video0's notifier works or if we also
need to be notified after pll-mipi has finished setting it's rate.
However, this seems a little hacky and I haven't tried if it works at
all. I prefer the current proposal (i.e. the CLK_KEEP_RATE flag).

Best regards,
  Frank

> It would ease the requirement that
> clk_set_rate_exclusive() has on a clock subtree (which I think prevents
> its usage to some extent), but I have no issue on how that would work in
> practice.
>
> So yeah, I think adding a clk_hw_set_rate() that would be callable from
> a notifier is the right way forward there.
>
> Maxime
>
> [[End of PGP Signed Part]]
