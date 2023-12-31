Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7273820AA7
	for <lists+dri-devel@lfdr.de>; Sun, 31 Dec 2023 10:11:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346D910E044;
	Sun, 31 Dec 2023 09:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0683E10E044
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Dec 2023 09:10:52 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4T2td25K4fz9sc6;
 Sun, 31 Dec 2023 10:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1704013846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hlVujKA1PeQa8EJSC4InM714qJCCxj/rjMUfrSS3bfw=;
 b=r1cTud9M3wVC9jFHCOg36Lt+//kfqLq90rmJ/bB54sN/mMd80lSOW/e5APEc8e/w0SQHOA
 W0XVmqtTOgXzFhNW+LB6KpSTy7ap6356EBmoXrVWGux9v5vjEG2RoJ/hu2YGK3E77g6u5H
 hDWGnAi69NcrqulMRrynDdB8jYN/OI8FBxgoIIGHHxGdY7hGIaLihyJjlBxqhHIaHpKmXd
 9pRylo1kYGLy8et8nYpNN99xwKMpnaBllrmeZPUtQ3MDwi4dgrAzoIxCzTBSqia78qTUUM
 pPZSq2e2oYF0XhqMZAXNx60BHaU7OXdUljURCJUxhSHtGQM0Y4zjXUR+E3tNrw==
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-4-e238b6ed6dc1@oltmanns.dev>
 <13411739.uLZWGnKmhe@jernej-laptop>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 4/5] clk: sunxi-ng: a64: Add constraints on PLL-VIDEO0's
 n/m ratio
In-reply-to: <13411739.uLZWGnKmhe@jernej-laptop>
Date: Sun, 31 Dec 2023 10:10:40 +0100
Message-ID: <87jzoug2jz.fsf@oltmanns.dev>
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

I just realized that adding the whole ratio limits for ccu_nm is
superfluous as you could just as well express them in for of a minimum
and maximum range:
Since 8 <=3D N/M <=3D 25 and parent_rate =3D 24 MHz, therefore
  192 MHz <=3D rate <=3D 600 MHz.

These absolute limits are also listed in Allwinner's A64 manual.

BUT, here the upper limit was raised to 1008 MHz:
5de39acaf34604bd04834f092479cf4dcc946dd "clk: sunxi-ng: a64: Add max.
rate constraint to video PLL"

With this upper limit the ratio limitation is effectively:
8 <=3D N/M <=3D 42

Icenowy Zheng (added to CC) had the reasonable explanation that this was
used in the BSP kernel, so we should probably stick to that and ditch
the two PLL-VIDEO0 related patches. What are your thoughts on that?

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
