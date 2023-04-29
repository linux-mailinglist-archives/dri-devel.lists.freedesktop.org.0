Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1436F25E1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 20:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24D710E071;
	Sat, 29 Apr 2023 18:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373E310E071
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 18:38:51 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Q7ysx06D9z9scm;
 Sat, 29 Apr 2023 20:38:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1682793525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKVXlCxV91AvQC40PaHejbx2C5FhflXVfXqbt+Wgr3s=;
 b=IhiiCZBEqOZRzOlnvV5+R34liaYcc6Xa16I+39uKaw/iDw5UdMwJoVBG2bumLqDuHZRpZI
 lAi5kIkrCwb4Q9QVZkcrl1dYEAAzJlPHtCyzIjR1nBdEYc7l8d8EuueqSLXzHKOMLWFqjJ
 4feocP9ohcqWMjbz/ImXq4qVZc/+e9UfZHNKTyl5M9HvwhvPBkXHjqK97X6tKMuRlC9/6k
 GTbj7MRFamyPKbWlraqmZiNC3c00UYjAUc5kugf2JImm7j3W2sFRdwGN2L+URUnC+DTXSS
 zVT0yw8rPjVo7+WZSNiFmupP3Hz/BGTWHZED44BNjGV++RmfxdOXjGx2du5YLA==
References: <20230427091611.99044-1-me@crly.cz>
 <20230427091611.99044-5-me@crly.cz> <4477541.LvFx2qVVIh@jernej-laptop>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v3 4/7] arm64: dts: allwinner: a64: reset pll-video0 rate
Date: Sat, 29 Apr 2023 20:28:38 +0200
In-reply-to: <4477541.LvFx2qVVIh@jernej-laptop>
Message-ID: <87wn1uleje.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4Q7ysx06D9z9scm
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
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 Roman Beranek <me@crly.cz>, Chen-Yu Tsai <wens@csie.org>,
 Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jernej,

On 2023-04-28 at 08:43:29 +0200, Jernej =C5=A0krabec <jernej.skrabec@gmail.=
com> wrote:
> Dne =C4=8Detrtek, 27. april 2023 ob 11:16:08 CEST je Roman Beranek napisa=
l(a):
>> With pll-mipi as its source clock, the exact rate to which TCON0's data
>> clock can be set to is constrained by the current rate of pll-video0.
>> Unless changed on a request of another consumer, the rate of pll-video0
>> is left as inherited from the bootloader.
>>
>> The default rate on reset is 297 MHz, a value preferable to what it is
>> later set to in u-boot (294 MHz). This happens unintentionally though,
>> as u-boot, for the sake of simplicity, rounds the rate requested by DE2
>> driver (297 MHz) to 6 MHz steps.
>>
>> Reset the PLL to its default rate of 297 MHz.
>
> Why would that be preferable? You actually dropped "clk: sunxi-ng: a64:
> propagate rate change from pll-mipi" patch which would take care for adju=
sting
> parent rate to correct value.

For me, on the pinephone, it somehow doesn't. Please see here:
https://lore.kernel.org/all/87cz3uzpx1.fsf@oltmanns.dev/

I haven't figured out yet why that is. But hopefully, I'll find time in
the coming days / weeks to look into that.

Best regards,
  Frank

> Best regards,
> Jernej
>
>>
>> Signed-off-by: Roman Beranek <me@crly.cz>
>> ---
>>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi index
>> e6a194db420d..cfc60dce80b0 100644
>> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
>> @@ -667,6 +667,9 @@ ccu: clock@1c20000 {
>>  			clock-names =3D "hosc", "losc";
>>  			#clock-cells =3D <1>;
>>  			#reset-cells =3D <1>;
>> +
>> +			assigned-clocks =3D <&ccu CLK_PLL_VIDEO0>;
>> +			assigned-clock-rates =3D <297000000>;
>>  		};
>>
>>  		pio: pinctrl@1c20800 {
