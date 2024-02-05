Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB0684A5F9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 21:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF0D10ECDF;
	Mon,  5 Feb 2024 20:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="R2djw1HS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAD610ECDF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 20:34:19 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4TTJ4z2JdKz9t1g;
 Mon,  5 Feb 2024 21:34:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1707165251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhbWLYxrCrQ3+gd4ivimBZHSQmaCXqHOjjg02OP3xx8=;
 b=R2djw1HS8bxFkt+EI/9CYDUBEevDM+VSAHffx73SoUKoK3bMJKRxs9VhkuAnCRK+JERH7Y
 60alGLPy+4ai9716fWUmzZ646rdY6pgoqi1ZWH1GH9iUjc+596EwHN9Y+M9PjYqv1gP0I1
 qcJfe5iGohVH86cGzU7SUJMotblba4oWxv6A0IeKoPsDdpMJj0NItuJrnukhNZ4sJaQIaR
 r1spiZSvnnbQm0XKfV+DqbIjLUMZAumVhScEj8JnzNyYsh9fX7KUCgjJe9nSr/1EUcdIVx
 5Ma4zhFbM5OTlPpPhgWzfsiCyYyrdPp27xZhdsqVzRBBQ2KjB8cZgiOUdhodOQ==
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-3-96a46a2d8c9b@oltmanns.dev>
 <4543794.LvFx2qVVIh@jernej-laptop>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team
 <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/6] clk: sunxi-ng: nkm: Support minimum and maximum
 rate
In-reply-to: <4543794.LvFx2qVVIh@jernej-laptop>
Date: Mon, 05 Feb 2024 21:34:04 +0100
Message-ID: <87eddqzm4j.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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


On 2024-02-05 at 18:56:09 +0100, Jernej =C5=A0krabec <jernej.skrabec@gmail.=
com> wrote:
> Dne ponedeljek, 05. februar 2024 ob 16:22:26 CET je Frank Oltmanns napisa=
l(a):
>> According to the Allwinner User Manual, the Allwinner A64 requires
>> PLL-MIPI to run at 500MHz-1.4GHz. Add support for that to ccu_nkm.
>>
>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> ---
>>  drivers/clk/sunxi-ng/ccu_nkm.c | 13 +++++++++++++
>>  drivers/clk/sunxi-ng/ccu_nkm.h |  2 ++
>>  2 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_n=
km.c
>> index 1168d894d636..7d135908d6e0 100644
>> --- a/drivers/clk/sunxi-ng/ccu_nkm.c
>> +++ b/drivers/clk/sunxi-ng/ccu_nkm.c
>> @@ -181,6 +181,12 @@ static unsigned long ccu_nkm_round_rate(struct ccu_=
mux_internal *mux,
>>  	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
>>  		rate *=3D nkm->fixed_post_div;
>>
>> +	if (nkm->min_rate && rate < nkm->min_rate)
>> +		rate =3D nkm->min_rate;
>> +
>> +	if (nkm->max_rate && rate > nkm->max_rate)
>> +		rate =3D nkm->max_rate;
>
> Please take a look at ccu_nm_round_rate() code. You need to consider post=
div
> and you can return immediately.

There is a difference here insofar that ccu_nm is always connected to a
fixed rate parent (at least that's my understanding). Therefore, in
ccu_nm_round_rate() we can be sure that the min or max rate can really
be set. In ccu_nkm we don't have that luxury, we actually have to find a
rate that is approximately equal to the min and max rate, based on the
parent rate. Therefore, we can't return immediately.

Also, I'm not sure what you mean about me needing to consider postdiv.
That's what I did. The check is after multiplying with the postdiv. It's
the same as in ccu_nm_round_rate() (just minus the immediate return).

>
>> +
>>  	if (!clk_hw_can_set_rate_parent(&nkm->common.hw))
>>  		rate =3D ccu_nkm_find_best(*parent_rate, rate, &_nkm, &nkm->common);
>>  	else
>> @@ -220,6 +226,13 @@ static int ccu_nkm_set_rate(struct clk_hw *hw, unsi=
gned long rate,
>>  	_nkm.min_m =3D 1;
>>  	_nkm.max_m =3D nkm->m.max ?: 1 << nkm->m.width;
>>
>> +
>> +	if (nkm->min_rate && rate < nkm->min_rate)
>> +		rate =3D nkm->min_rate;
>> +
>> +	if (nkm->max_rate && rate > nkm->max_rate)
>> +		rate =3D nkm->max_rate;
>> +
>
> No need for this, clk subsystem calls round rate before setting actual cl=
ock
> rate.

I'll remove the checks in V3.

Best regards,
  Frank

>
> Best regards,
> Jernej
>
>>  	ccu_nkm_find_best(parent_rate, rate, &_nkm, &nkm->common);
>>
>>  	spin_lock_irqsave(nkm->common.lock, flags);
>> diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_n=
km.h
>> index c409212ee40e..358a9df6b6a0 100644
>> --- a/drivers/clk/sunxi-ng/ccu_nkm.h
>> +++ b/drivers/clk/sunxi-ng/ccu_nkm.h
>> @@ -27,6 +27,8 @@ struct ccu_nkm {
>>  	struct ccu_mux_internal	mux;
>>
>>  	unsigned int		fixed_post_div;
>> +	unsigned long		min_rate;
>> +	unsigned long		max_rate;
>>  	unsigned long		max_m_n_ratio;
>>  	unsigned long		min_parent_m_ratio;
>>
>>
>>
