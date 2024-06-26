Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63704918826
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 19:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE4910E972;
	Wed, 26 Jun 2024 17:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="VEgcI4vv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFF210E972
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 17:07:35 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4W8Smx29Hwz9sTk;
 Wed, 26 Jun 2024 19:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1719421649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMmpUeG6AgeBLdnpM+s0li9NSssKRCHhHc2Ibal07EQ=;
 b=VEgcI4vveCe7PzZUbnLJjFgOYUrCLf+1Xz+DL5HQC+/XDt9dQMmvtgL0MMXOzTk8NUgFrx
 BkpaB1W5uFUHQCty/47PffMM72gdJ3aH9kikvegJEiBe7IlUzkUjusb6R+hMS0NOEPthgx
 nkasDb1OBBjtH7Ptna1yU+2yPj7jOYFXLcwPE+JxiyNDQcKchLIpvv9/6S3OcHOdmJ0v4Z
 h+bzjYiiGqUxLv3Xu5ocpyraPN4DN2EyeJk5QAB0jPMEgt9l3M1hvW2bO834nqBH4pcKfZ
 7r7qZRlQURbkLVHtTbcbHZYJAm2AZ2jqhjfcQ86bQl8gnVFrfS3b5JM8F19neQ==
Date: Wed, 26 Jun 2024 19:07:19 +0200 (GMT+02:00)
From: Frank Oltmanns <frank@oltmanns.dev>
To: "Pafford, Robert J." <pafford.9@buckeyemail.osu.edu>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
Message-ID: <1b359d7e-fe85-48ca-87aa-37ab7e34aaf6@oltmanns.dev>
In-Reply-To: <DM6PR01MB58043A518B836D1CC3509554F7D62@DM6PR01MB5804.prod.exchangelabs.com>
References: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
 <DM6PR01MB58047C810DDD5D0AE397CADFF7C22@DM6PR01MB5804.prod.exchangelabs.com>
 <87wmmjfxcj.fsf@oltmanns.dev>
 <DM6PR01MB58043A518B836D1CC3509554F7D62@DM6PR01MB5804.prod.exchangelabs.com>
Subject: Re: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and
 maximum rate
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <1b359d7e-fe85-48ca-87aa-37ab7e34aaf6@oltmanns.dev>
X-Rspamd-Queue-Id: 4W8Smx29Hwz9sTk
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

Hi Robert,

26.06.2024 18:03:24 Pafford, Robert J. <pafford.9@buckeyemail.osu.edu>:

> Hi Frank,
>
> Moving to a new for loop makes sense. Let me know when you have a patch

The patch is here, strange you didn't receive it:
https://lore.kernel.org/all/20240623-sunxi-ng_fix_common_probe-v1-1-7c97e32=
824a1@oltmanns.dev/


> and I'll be glad to test it on my board. I do also wonder if this may
> have contributed to some of the HDMI issues seen in the other thread.

My thought's exactly!

Best regards,
=C2=A0 Frank

>
> Best,
> Robert
>
>> Hi Robert,
>>
>> I'm truly sorry for the trouble the patch has caused you and for my late
>> reply!
>>
>> On 2024-06-14 at 23:52:08 +0000, "Pafford, Robert J." <pafford.9@buckeye=
mail.osu.edu> wrote:
>>>> The Allwinner SoC's typically have an upper and lower limit for their
>>>> clocks' rates. Up until now, support for that has been implemented
>>>> separately for each clock type.
>>>>
>>>> Implement that functionality in the sunxi-ng's common part making use =
of
>>>> the CCF rate liming capabilities, so that it is available for all cloc=
k
>>>> types.
>>>>
>>>> Suggested-by: Maxime Ripard <mripard@kernel.org>
>>>> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
>>>> Cc: stable@vger.kernel.org
>>>> ---
>>>> =C2=A0 drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++
>>>> =C2=A0 drivers/clk/sunxi-ng/ccu_common.h |=C2=A0 3 +++
>>>> =C2=A0 2 files changed, 22 insertions(+)
>>>
>>> This patch appears to cause a buffer under-read bug due to the call to =
'hw_to_ccu_common', which assumes all entries
>>> in the desc->hw_clocks->hws array are contained in ccu_common structs.
>>>
>>> However, not all clocks in the array are contained in ccu_common struct=
s. For example, as part
>>> of the "sun20i-d1-ccu" driver, the "pll-video0" clock holds the 'clk_hw=
' struct inside of a 'clk_fixed_factor' struct,
>>> as it is a fixed factor clock based on the "pll-video0-4x" clock, creat=
ed with the CLK_FIXED_FACTOR_HWS macro.
>>> This results in undefined behavior as the hw_to_ccu_common returns an i=
nvalid pointer referencing memory before the
>>> 'clk_fixed_factor' struct.
>>>
>>
>> Great catch! At first glance, it seems to me that calling
>> clk_hw_set_rate_range() in sunxi_ccu_probe() should not have happenend
>> in the loop that iterates over the hw_clks.
>>
>> Instead we should add one more loop that iterates over the ccu_clks.
>> Note, that there is already one such loop but, unfortunately, we can't
>> use that as it happens before the hw_clks loop and we can only call
>> clk_hw_set_rate_range() after the hw_clk has been registered.
>>
>> Hence, I propose to move the offending code to a new loop:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < desc->num_c=
cu_clks; i++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct ccu_common *cclk =3D desc->ccu_clks[i];
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!cclk)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue=
;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (cclk->max_rate)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_hw_s=
et_rate_range(&cclk->hw, common->min_rate,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 common->max_rate);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN(ccl=
k->min_rate,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "No max_rate, ignoring min_rate of clock %d - %s\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 i, cclk->hw.init->name);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> I haven't tested (or even compiled) the above, but I'll test and send a
>> patch within the next few days for you to test.
>>
>> Thanks again,
>> =C2=A0 Frank
>>
>>>
>>> I have attached kernel warnings from a system based on the "sun8i-t113s=
.dtsi" device tree, where the memory contains
>>> a non-zero value for the min-rate but a zero value for the max-rate, tr=
iggering the "No max_rate, ignoring min_rate"
>>> warning in the 'sunxi_ccu_probe' function.
>>>
>>> [...]

