Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7188A44443
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F200789F27;
	Tue, 25 Feb 2025 15:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="gFS3Qbg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A253210E71A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 15:25:06 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51PFOHRf1324298
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 25 Feb 2025 07:24:17 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51PFOHRf1324298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1740497060;
 bh=WwBGNG5GOM5EDBRYNhpg1dowM06WZaFYwprnE0ohGQo=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=gFS3Qbg9090zqrxMgWpV3QU2nlXkwzE0x821QukbyGIMgBkSQpuzxodk+NhODEkKN
 5h6k3fzgqnVQszi++Fm0zAWkcXoyd9Xkym/XQkMSrQQkzB32FJgavtpnoFmVqMt5+b
 Ut+jJOF2NsSesEP0cpHx79zg+1Hhp0iTas+P77VsgeosF4jA4YmppCVoZ6lUr/TsQ7
 y4TM2oB0LvUl/CGxwpwp0kGuvR8IUIGcaH+wHv+nRaIl2wg+GbRlNP1tQskp4yCPjq
 ++07dWpeKgWMhBWMggv61l0UzN3t+dVy4CTbKFqF+E15aNijxWhLEtzbDpNrb3YhKe
 U8ZjPhiVMLIiw==
Date: Tue, 25 Feb 2025 07:24:16 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
CC: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 yury.norov@gmail.com, akpm@linux-foundation.org, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
User-Agent: K-9 Mail for Android
In-Reply-To: <20250224133431.2c38213f@pumpkin>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
 <20250224133431.2c38213f@pumpkin>
Message-ID: <3BC57C78-1DFF-4B83-85AA-A908DBF2B958@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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

On February 24, 2025 5:34:31 AM PST, David Laight <david=2Elaight=2Elinux@g=
mail=2Ecom> wrote:
>On Mon, 24 Feb 2025 08:09:43 +0100
>Jiri Slaby <jirislaby@kernel=2Eorg> wrote:
>
>> On 23=2E 02=2E 25, 17:42, Kuan-Wei Chiu wrote:
>> > Several parts of the kernel open-code parity calculations using
>> > different methods=2E Add a generic parity64() helper implemented with=
 the
>> > same efficient approach as parity8()=2E
>> >=20
>> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail=2Ecom>
>> > ---
>> >   include/linux/bitops=2Eh | 22 ++++++++++++++++++++++
>> >   1 file changed, 22 insertions(+)
>> >=20
>> > diff --git a/include/linux/bitops=2Eh b/include/linux/bitops=2Eh
>> > index fb13dedad7aa=2E=2E67677057f5e2 100644
>> > --- a/include/linux/bitops=2Eh
>> > +++ b/include/linux/bitops=2Eh
>> > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
>> >   	return (0x6996 >> (val & 0xf)) & 1;
>> >   }
>> >  =20
>> > +/**
>> > + * parity64 - get the parity of an u64 value
>> > + * @value: the value to be examined
>> > + *
>> > + * Determine the parity of the u64 argument=2E
>> > + *
>> > + * Returns:
>> > + * 0 for even parity, 1 for odd parity
>> > + */
>> > +static inline int parity64(u64 val)
>> > +{
>> > +	/*
>> > +	 * One explanation of this algorithm:
>> > +	 * https://funloop=2Eorg/codex/problem/parity/README=2Ehtml
>> > +	 */
>> > +	val ^=3D val >> 32; =20
>>=20
>> Do we need all these implementations? Can't we simply use parity64() fo=
r=20
>> any 8, 16 and 32-bit values too? I=2Ee=2E have one parity()=2E
>
>I'm not sure you can guarantee that the compiler will optimise away
>the unnecessary operations=2E
>
>But:
>static inline int parity64(u64 val)
>{
>	return parity32(val ^ (val >> 32))
>}
>
>should be ok=2E
>It will also work on x86-32 where parity32() can just check the parity fl=
ag=2E
>Although you are unlikely to manage to use the the PF the xor sets=2E
>
>	David
>
>>=20
>> > +	val ^=3D val >> 16;
>> > +	val ^=3D val >> 8;
>> > +	val ^=3D val >> 4;
>> > +	return (0x6996 >> (val & 0xf)) & 1;
>> > +}
>> > +
>> >   /**
>> >    * __ffs64 - find first set bit in a 64 bit word
>> >    * @word: The 64 bit word =20
>>=20
>>=20
>

Incidentally, in all of this, didn't anyone notice __builtin_parity()?
