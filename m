Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BDE8CDA4C
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 20:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9398310EA6C;
	Thu, 23 May 2024 18:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2EF10EA6C
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 18:58:03 +0000 (UTC)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
 by unicorn.mansr.com (Postfix) with ESMTPS id DA6A515364;
 Thu, 23 May 2024 19:58:00 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id CACE3219FCA; Thu, 23 May 2024 19:58:00 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Guido
 =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Purism Kernel Team
 <kernel@puri.sm>, Ondrej
 Jirman <megi@xff.cz>, Neil Armstrong <neil.armstrong@linaro.org>, Jessica
 Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and
 maximum rate
In-Reply-To: <yw1x4jap90va.fsf@mansr.com> (=?iso-8859-1?Q?=22M=E5ns_Rullg?=
 =?iso-8859-1?Q?=E5rd=22's?= message of "Wed,
 22 May 2024 19:07:21 +0100")
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
 <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
 <yw1xo78z8ez0.fsf@mansr.com>
 <c4c1229c-1ed3-4b6e-a53a-e1ace2502ded@oltmanns.dev>
 <yw1x4jap90va.fsf@mansr.com>
Date: Thu, 23 May 2024 19:58:00 +0100
Message-ID: <yw1xo78w73uv.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
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

M=E5ns Rullg=E5rd <mans@mansr.com> writes:

> Frank Oltmanns <frank@oltmanns.dev> writes:
>
>> Hi M=E5ns,
>>
>> 21.05.2024 15:43:10 M=E5ns Rullg=E5rd <mans@mansr.com>:
>>
>>> Frank Oltmanns <frank@oltmanns.dev> writes:
>>>
>>>> The Allwinner SoC's typically have an upper and lower limit for their
>>>> clocks' rates. Up until now, support for that has been implemented
>>>> separately for each clock type.
>>>>
>>>> Implement that functionality in the sunxi-ng's common part making use =
of
>>>> the CCF rate liming capabilities, so that it is available for all clock
>>>> types.
>>>>
>>>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>>>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>>>> Cc: stable@vger.kernel.org
>>>> ---
>>>> drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++
>>>> drivers/clk/sunxi-ng/ccu_common.h |=A0 3 +++
>>>> 2 files changed, 22 insertions(+)
>>>
>>> This just landed in 6.6 stable, and it broke HDMI output on an A20 based
>>> device, the clocks ending up all wrong as seen in this diff of
>>> /sys/kernel/debug/clk/clk_summary:

[...]

>>> Reverting this commit makes it work again.
>>
>> Thank you for your detailed report!
>>
>> I've had a first look at hdmi-tmds and hdmi-ddc, and neither seems to
>> be calling ccu_is_better_rate() in their determine_rate()
>> functions. Their parents have the exact same rates in your diff, so,
>> my current working assumption is that they can't be the cause either.
>>
>> I'll have a more detailed look over the weekend. Until then, if anyone
>> has some ideas where I should have a look next, please share your
>> thoughts.
>
> In case it's relevant, this system doesn't use the HDMI DDC, the
> physical DDC pins being connected to a different I2C adapter for
> various reasons.
>
> From the clk_summary diff, I see a few things:
>
> 1. hdmi-tmds has changed parent from pll-video1-2x to pll-video0-2x.
> 2. The ratio of hdmi-tmds to its parent has changed from 1/8 to 1.
> 3. The resulting rate bears no relation to the pixel clock from EDID.
>
> I tried kernel 6.9.1 as well, and that doesn't work either.  I'll keep
> digging and try to narrow it down.

It turns out HDMI output is broken in v6.9 for a different reason.
However, this commit (b914ec33b391 clk: sunxi-ng: common: Support
minimum and maximum rate) requires two others as well in order not
to break things on the A20:

cedb7dd193f6 drm/sun4i: hdmi: Convert encoder to atomic
9ca6bc246035 drm/sun4i: hdmi: Move mode_set into enable

With those two (the second depends on the first) cherry-picked on top of
v6.6.31, the HDMI output is working again.  Likewise on v6.8.10.

--=20
M=E5ns Rullg=E5rd
