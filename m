Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA60771D60
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 11:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A331F10E1E2;
	Mon,  7 Aug 2023 09:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC04110E1E2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 09:48:36 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4RKBN155C9z9sp8;
 Mon,  7 Aug 2023 11:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1691401713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1B79+KBG34SGF//XHBOMdbF/A19TnEhV+JnMWsE31d8=;
 b=H6q/Vg4tk4gp7jB7T1Kuvhk4FfexVdmZEvwcE5k2evQomf7rsQ9xEQUQ8ZSYhZ8sq7aceV
 4S6fwTl3CMe8ZMplvYTFbmCGQpNjHDKCpEIr1ukYCq+KOwfWT5gcQ+rRFAjJfNuZsePN+5
 aUpkvMvC3AaSPP0Nf608Lzcctl0KvJ3HdsIxNUNH0gHbfV0nA5p9CKRk8DhDoFvb6TJlMf
 DD9FbAZ448+U0Ie1krJGYkPGEztFf1eopfUKKsE+TKxLGXK8JuqNCW+qy4IToZNg/Hj/px
 uReValAXedyLkPgvQ+d8snsxrgTnInOqX3mFYLk+JKpMz8TkMUgdr1aSPRniwA==
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
 <20230807-a64_pll_video0_notifier-v1-2-8a7ccdc14c79@oltmanns.dev>
 <16a690b357f34db0ba852a63d86ba13b9ded5924.camel@icenowy.me>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH 2/3] clk: sunxi-ng: a64: keep tcon0 clock rate when
 pll-video0's rate changes
In-reply-to: <16a690b357f34db0ba852a63d86ba13b9ded5924.camel@icenowy.me>
Date: Mon, 07 Aug 2023 11:48:17 +0200
Message-ID: <87il9rtc7y.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4RKBN155C9z9sp8
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
Cc: dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Ond?0?0ej Jirman <x@xnux.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-08-07 at 17:43:52 +0800, Icenowy Zheng <uwu@icenowy.me> wrote:
> =E5=9C=A8 2023-08-07=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 11:36 +0200=EF=
=BC=8CFrank Oltmanns=E5=86=99=E9=81=93=EF=BC=9A
>> From: Icenowy Zheng <icenowy@aosc.io>
>>
>> Notify TCON0 clock (and in consequence PLL-MIPI by
>> CLK_SET_RATE_PARENT)
>> to reset when PLL-Video0 changes (because of HDMI PHY clk which is a
>> child of PLL-Video0 and has CLK_SET_RATE_PARENT set). In this way we
>> can
>> get clock tree to satisfy both pipelines.
>
> Well for fixing one's patch that contains SoB, use the following
> format:
>
> Signed-off-by: A <a@a.local>
> [B: fixed something]
> Signed-off-by: B <b@b.local>

Ah, okay. Will do. But I keep A in the "From: " line, correct?

Thanks,
  Frank

>> ---
>> =C2=A0drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 15 +++++++++++++++
>> =C2=A01 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> index ef567775fc95..93beedb0428e 100644
>> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
>> @@ -943,6 +943,17 @@ static struct ccu_mux_nb sun50i_a64_cpu_nb =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.bypass_index=C2=A0=C2=
=A0=C2=A0=3D 1, /* index of 24 MHz oscillator */
>> =C2=A0};
>> =C2=A0
>> +/*
>> + * Since PLL-Video0 is an ancestor of both tcon0 and HDMI PYH, tcon0
>> clock will
>> + * conflict with HDMI PHY clock which is on another display
>> pipeline.
>> + *
>> + * Therefore, a notifier is required to restore the rate of TCON0
>> when the rate
>> + * of PLL-Video0 changed.
>> + */
>> +static struct ccu_rate_reset_nb sun50i_a64_pll_video0_reset_tcon0_nb
>> =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.common=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D &pll_video0_clk.common,
>> +};
>> +
>> =C2=A0static int sun50i_a64_ccu_probe(struct platform_device *pdev)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void __iomem *reg;
>> @@ -978,6 +989,10 @@ static int sun50i_a64_ccu_probe(struct
>> platform_device *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ccu_mux_notifier_registe=
r(pll_cpux_clk.common.hw.clk,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &sun50i_a64_cpu_nb);
>> =C2=A0
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Reset the rate of TCON0 cl=
ock when PLL-VIDEO0 is changed
>> */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sun50i_a64_pll_video0_reset_t=
con0_nb.target_clk =3D
>> tcon0_clk.common.hw.clk;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ccu_rate_reset_notifier_regis=
ter(&sun50i_a64_pll_video0_reset
>> _tcon0_nb);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
>> =C2=A0}
>> =C2=A0
>>
