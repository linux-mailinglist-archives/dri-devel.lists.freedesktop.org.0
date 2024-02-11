Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A69B8509E6
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 16:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8510EB92;
	Sun, 11 Feb 2024 15:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="iNacjmOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5509010EBB1
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 15:09:31 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4TXrbR1fH4z9sQm;
 Sun, 11 Feb 2024 16:09:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1707664163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUVCRZm4sMe3u++O9hyPgin+lwvmga6oGxpeS7+ujsw=;
 b=iNacjmOHnnJ7cN7BlOWZYDwt9xoKhavIzlIDQUkisuFwI/Do5r1nA5ByoqLssXMWFgfwfm
 +URrBjnBznNmzPuWYko6BWSnAuqgK+kP6z4djSYiS5bSA1f9PhH4Wk9JISqbNvT1JrqWKe
 YFABOkhChQcjji6fkK394DaHJ4S7uQZDesUmOipXbmcilPSczQPRDhwCKeKYU75fXp6KfW
 gZZllox4x/AlU22kbWcC30634jdmVWfxXplgrGQGgpJrKbjWP+utG9zTWvx90Z5HSVqxah
 KEHVjEiDshV1NHikGOd+BEKe+G56Bt4y0QhAeckFoAHqV9dWqwk8KkEmwdv0Dg==
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <jzl3mlzk4j7qvgcedvipgale5nhinznefodrnaehwsqfnseiwc@7zzlxd4dpueh>
 <bgyyemyi4shj3spo6qy4icvk56nrp5sihnzqurnozqdyktwugc@ikurx4ojoxpi>
From: Frank Oltmanns <frank@oltmanns.dev>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Guido
 =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Purism Kernel Team
 <kernel@puri.sm>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Pinephone video out fixes (flipping between two
 frames)
In-reply-to: <bgyyemyi4shj3spo6qy4icvk56nrp5sihnzqurnozqdyktwugc@ikurx4ojoxpi>
Date: Sun, 11 Feb 2024 16:09:16 +0100
Message-ID: <87wmrbxckj.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4TXrbR1fH4z9sQm
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

Hi Ond=C5=99ej,

On 2024-02-05 at 17:02:00 +0100, Ond=C5=99ej Jirman <megi@xff.cz> wrote:
> On Mon, Feb 05, 2024 at 04:54:07PM +0100, Ond=C5=99ej Jirman wrote:
>> On Mon, Feb 05, 2024 at 04:22:23PM +0100, Frank Oltmanns wrote:
>> > On some pinephones the video output sometimes freezes (flips between t=
wo
>> > frames) [1]. It seems to be that the reason for this behaviour is that
>> > PLL-MIPI, PLL-GPU and GPU are operating outside their limits.
>> >
>> > In this patch series I propose the followin changes:
>> >   1. sunxi-ng: Adhere to the following constraints given in the
>> >      Allwinner A64 Manual regarding PLL-MIPI:
>> >       * M/N <=3D 3
>> >       * (PLL_VIDEO0)/M >=3D 24MHz
>> >       * 500MHz <=3D clockrate <=3D 1400MHz
>> >
>> >   2. Choose a higher clock rate for the ST7703 based XDB599 panel, so
>> >      that the panel function well with the Allwinner A64 SOC. PLL-MIPI
>> >      must run between 500 MHz and 1.4 GHz. As PLL-MIPI runs at 6 times
>> >      the panel's clock rate, we need the panel's clock to be at least
>> >      83.333 MHz.
>> >
>> >   3. Increase the minimum frequency in the A64 DTS OPPs from 120 MHz to
>> >      192 MHz. This further reduces the issue.
>> >
>> > Unfortunately, with these patches the issue [1] is not completely gone,
>> > but becomes less likely.
>> >
>> > Note, that when pinning the GPU to 432 MHz the issue completely
>> > disappears for me. I've searched the BSP and could not find any
>> > indication that supports the idea of having the three OPPs. The only
>> > frequency I found in the BPSs for A64 is 432 MHz, that has also proven
>> > stable for me. So, while increasing the minimum frequency to 192 MHz
>> > reduces the issue, should we maybe instead set the GPU to a fixed 432
>> > MHz instead?
>>
>> Per A64 User Manual 1.1 page 81:
>>
>> (9). Clock output of PLL_GPU can be used for GPU;and dynamic frequency s=
caling is not supported;
>
> You may be able to elegantly work around this by pinning PLL_GPU to a cer=
tain
> frequency (assing it in DT and then don't decalre gpu clock as
> CLK_SET_RATE_PARENT). Say 432 MHz for PLL and then do the scaling via GPU=
_CLK_REG
> N divider between 432MHz and 216MHz and maybe 108MHz if that brings any g=
ains.
>

I really like this idea. Unfortunately, it seems that the divisor of the
GPU_CLK_REG must always be set to 1. I tried to convey this info in the
commit message for PATCH 6. If using a different divisor than 1 the bug
I'm trying to fix here occurs within minutes. Nevertheless, I gave your
proposal a quick try - it seems so elegant. Unfortunately, but not
unexpectedly, the bug occured almost immediately.

> Then you can perhaps sidestep all these potential issues with PLL_GPU and
> lack of DVFS support decalred in the manual.
>
> regards,
> 	o.
>
>> Also sunxi-ng clk driver does apply NM factors at once to PLL_GPU clock,
>> which can cause sudden frequency increase beyond intended output frequen=
cy,
>> because division is applied immediately while multiplication is reflected
>> slowly.
>>
>> Eg. if you're changing divider from 7 to 1, you can get a sudden 7x outp=
ut
>> frequency spike, before PLL VCO manages to lower the frequency through N=
 clk
>> divider feedback loop and lock on again. This can mess up whatever's con=
nected
>> to the output quite badly.
>>
>> You'd have to put logging on kernel writes to PLL_GPU register to see wh=
at
>> is written in there and if divider is lowered significantly on some GPU
>> devfreq frequency transitions.

By looking at the clocks in clk_summary in debugfs, the rate of PLL-GPU
always matches the rate of the GPU (at least at 120, 312, and 432 MHz).
This is further underlined by the fact, that none of the rates can be
achieved by integer dividing one of the other rates. sunxi-ng would
only favor a different rate for pll-gpu than the one that is requested
for the gpu, if pll-gpu is already running at a rate such that there
exists an M =E2=88=88 {1, 2, 3, 4, 5, 6, 7, 8}, where
  rate of pll-gpu / M =3D requested gpu rate
or if the requested rate could not be reached directly by pll-gpu. Both
is not the case for the rates in question (120, 192, 312, and 432 MHz).

This means that the following divisor/multipliers are used by sunxi-ng's
ccu_nm:
N =3D  5, M =3D 1 for 120 MHz (min value without PATCH 6)
N =3D  8, M =3D 1 for 192 MHz (min value after applying PATCH 6)
N =3D 13, M =3D 1 for 312 MHz
N =3D 18, M =3D 1 for 432 MHz

So, with or without PATCH 6, the divider stays constant and it's only
the multiplier that changes. This means, there should be no unexpected
frequency spikes, right?

>> It's also unclear what happens when FRAC_CLK_OUT or PLL_MODE_SEL changes.

Those are not changed once the clock is initialized. The bug however
occurs hours or days after booting. IMO, this makes it unlikely that this
could be the culprit.

>> Maybe not much because M is supposed to be set to 1, but you still need =
to
>> care when enabling fractional mode, and setting M to 1 because that's ex=
actly
>> the bad scenario if M was previously higher than 1.
>>
>> It's tricky.
>>
>> Having GPU module clock gated during PLL config changes may help! You can
>> do that without locking yourself out, unlike with the CPU PLL.
>>
>> There's a gate enable bit for it at GPU_CLK_REG.SCLK_GATING. (page 122)

The GPU should already be properly gated:
https://elixir.bootlin.com/linux/v6.7.4/source/drivers/clk/sunxi-ng/ccu-sun=
50i-a64.c#L599

Thank you for your detailed proposal! It was insightful to read. But
while those were all great ideas, they have all already been taken care
of. I'm fresh out of ideas again (except for pinning the GPU rate).

Again, thank you so much,
  Frank

>>
>> Kind regards,
>> 	o.
>>
>> > I very much appreciate your feedback!
>> >
>> > [1] https://gitlab.com/postmarketOS/pmaports/-/issues/805
>> >
>> > Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> > ---
>> > Changes in v2:
>> > - dts: Increase minimum GPU frequency to 192 MHz.
>> > - nkm and a64: Add minimum and maximum rate for PLL-MIPI.
>> > - nkm: Use the same approach for skipping invalid rates in
>> >   ccu_nkm_find_best() as in ccu_nkm_find_best_with_parent_adj().
>> > - nkm: Improve names for ratio struct members and hence get rid of
>> >   describing comments.
>> > - nkm and a64: Correct description in the commit messages: M/N <=3D 3
>> > - Remove patches for nm as they were not needed.
>> > - st7703: Rework the commit message to cover more background for the
>> >   change.
>> > - Link to v1: https://lore.kernel.org/r/20231218-pinephone-pll-fixes-v=
1-0-e238b6ed6dc1@oltmanns.dev
>> >
>> > ---
>> > Frank Oltmanns (6):
>> >       clk: sunxi-ng: nkm: Support constraints on m/n ratio and parent =
rate
>> >       clk: sunxi-ng: a64: Add constraints on PLL-MIPI's n/m ratio and =
parent rate
>> >       clk: sunxi-ng: nkm: Support minimum and maximum rate
>> >       clk: sunxi-ng: a64: Set minimum and maximum rate for PLL-MIPI
>> >       drm/panel: st7703: Drive XBD599 panel at higher clock rate
>> >       arm64: dts: allwinner: a64: Fix minimum GPU OPP rate
>> >
>> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  4 ++--
>> >  drivers/clk/sunxi-ng/ccu-sun50i-a64.c         | 14 +++++++----
>> >  drivers/clk/sunxi-ng/ccu_nkm.c                | 34 ++++++++++++++++++=
+++++++++
>> >  drivers/clk/sunxi-ng/ccu_nkm.h                |  4 ++++
>> >  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++------
>> >  5 files changed, 56 insertions(+), 14 deletions(-)
>> > ---
>> > base-commit: 059c53e877ca6e723e10490c27c1487a63e66efe
>> > change-id: 20231218-pinephone-pll-fixes-0ccdfde273e4
>> >
>> > Best regards,
>> > --
>> > Frank Oltmanns <frank@oltmanns.dev>
>> >
