Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A005981992A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 08:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B173010E32E;
	Wed, 20 Dec 2023 07:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990110E50F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 07:14:07 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Sw4YS2tHnz9sp6;
 Wed, 20 Dec 2023 08:14:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1703056444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JWAYPuW2w1S4QldNPnKh0l/fjpe1uHU+1lOR2wMdU0=;
 b=aqewHPPWceld/vN8dMOtuujW1lrzIuiuwJzKUDlrCm/5bgQUqYB3yB3wupaAbprIDdvT3S
 E0Z4gggq86mbLA9q8ui0llGLXNLQ47UXkdP9lx3NOVL0/k/J9PPq2Q5d+p58OsnUZoADD1
 s5FlKWcrSAR0b6vJMSPqWd/Ne/RLgf/FdJyB9G+h9CrsLz1FwWTIGxt+x7kQnTQekWAVBw
 z5+ACiE/uFS20YhQPE2IsU6qq1kBInaD5p1wvFr+QVkbU5K0FIqhlPAK88oVeTaakhkHaZ
 bKquYn0TEz46x3Kf3Dwt0d/v03zuyUVCqkL4QucIBwA+dpgdra82zMhkl7P4tg==
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-4-e238b6ed6dc1@oltmanns.dev>
 <13411739.uLZWGnKmhe@jernej-laptop>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: a64: Add constraints on PLL-VIDEO0's
 n/m ratio
Date: Wed, 20 Dec 2023 08:09:28 +0100
In-reply-to: <13411739.uLZWGnKmhe@jernej-laptop>
Message-ID: <87il4t9wi1.fsf@oltmanns.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
 Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-12-19 at 17:54:19 +0100, Jernej =C5=A0krabec <jernej.skrabec@gmail.=
com> wrote:
> Dne ponedeljek, 18. december 2023 ob 14:35:22 CET je Frank Oltmanns napis=
al(a):
>> The Allwinner A64 manual lists the following constraint for the
>> PLL-VIDEO0 clock: 8 <=3D N/M <=3D 25
>>
>> Use this constraint.
>>
>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>> ---
>>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-a64.c
>> index c034ac027d1c..75d839da446c 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> @@ -68,7 +68,8 @@ static SUNXI_CCU_NM_WITH_SDM_GATE_LOCK(pll_audio_base_=
clk, "pll-audio-base",
>>  				       BIT(28),	/* lock */
>>  				       CLK_SET_RATE_UNGATE);
>>
>> -static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST(pll_video0_clk,=
 "pll-video0",
>> +static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(pll_video=
0_clk,
>> +						"pll-video0",
>>  						"osc24M", 0x010,
>>  						192000000,	/* Minimum rate */
>>  						1008000000,	/* Maximum rate */
>> @@ -80,7 +81,10 @@ static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSE=
ST(pll_video0_clk, "pll-vid
>>  						297000000,	/* frac rate 1 */
>>  						BIT(31),	/* gate */
>>  						BIT(28),	/* lock */
>> -						CLK_SET_RATE_UNGATE);
>> +						CLK_SET_RATE_UNGATE,
>> +						CCU_FEATURE_FRACTIONAL |
>> +						CCU_FEATURE_CLOSEST_RATE,
>
> Above flags are unrelated change, put them in new patch if needed.

You might notice that I am using a new macro for initializing the
pll_video0_clk struct:
New: SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO
Old: SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_CLOSEST

Setting the two CCU_FEATURE flags is part of the old initialization
macro.

I'll add SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_NM_RATIO_CLOSEST which
hopefully resolves the confusion.

Thanks,
  Frank

>
> Best regards,
> Jernej
>
>> +						8, 25);		/* min/max nm ratio */
>>
>>  static SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK(pll_ve_clk, "pll-ve",
>>  					"osc24M", 0x018,
>>
>>
