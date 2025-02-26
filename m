Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1963A45171
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 01:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A8710E81D;
	Wed, 26 Feb 2025 00:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="Vx7b+pHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F38D10E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 00:28:03 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51Q0Qj6t1485832
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 25 Feb 2025 16:26:45 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51Q0Qj6t1485832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1740529613;
 bh=/hX8/LeT9m/0VDN5crD4IR806wwsnn6QY9gkxuzs4a0=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=Vx7b+pHI31WYClRevJ90WGCmYkzsC0O4yjSFPubrFkDlFo2vpZqzZ9G40N2ZAk70A
 1cQPgYLnd5I5ey7wLfCgJ8Wa0Jqy8sY2mmwkmCFEYEUtcYkP8RXNAjd1Y+xeDCqwyy
 AVyJIpfagXD4ZTFbnWuOR5XQI14sBmquPHuWbhW+8b2Y38BEQzTU/x+sgB61KqUTHa
 KrIofANBe7vt+iRKzcTlXNAf7DT6yzoW1HRWvAy9pthuwqTbtWlxOjUH2euKtYzuHK
 KQskzKcNpxdcsPJFrGasTa7yfZ2Zs9ZcwOmb/PzgE+W9UnEKLynUNcREeGm0XPaNtx
 a3lIkp85qLD3w==
Date: Tue, 25 Feb 2025 16:26:43 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>
CC: Uros Bizjak <ubizjak@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
 mingo@kernel.org, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_03/17=5D_x86=3A_Replace_open-c?=
 =?US-ASCII?Q?oded_parity_calculation_with_parity8=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250225224623.6edaaaa9@pumpkin>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com>
 <20250225224623.6edaaaa9@pumpkin>
Message-ID: <E07B61E5-324E-4CDC-AE68-A63CDF4325F4@zytor.com>
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

On February 25, 2025 2:46:23 PM PST, David Laight <david=2Elaight=2Elinux@g=
mail=2Ecom> wrote:
>On Mon, 24 Feb 2025 13:55:28 -0800
>"H=2E Peter Anvin" <hpa@zytor=2Ecom> wrote:
>
>> On 2/24/25 07:24, Uros Bizjak wrote:
>> >=20
>> >=20
>> > On 23=2E 02=2E 25 17:42, Kuan-Wei Chiu wrote: =20
>> >> Refactor parity calculations to use the standard parity8() helper=2E=
 This
>> >> change eliminates redundant implementations and improves code
>> >> efficiency=2E =20
>=2E=2E=2E
>> Of course, on x86, parity8() and parity16() can be implemented very sim=
ply:
>>=20
>> (Also, the parity functions really ought to return bool, and be flagged=
=20
>> __attribute_const__=2E)
>>=20
>> static inline __attribute_const__ bool _arch_parity8(u8 val)
>> {
>> 	bool parity;
>> 	asm("and %0,%0" : "=3D@ccnp" (parity) : "q" (val));
>> 	return parity;
>> }
>>=20
>> static inline __attribute_const__ bool _arch_parity16(u16 val)
>> {
>> 	bool parity;
>> 	asm("xor %h0,%b0" : "=3D@ccnp" (parity), "+Q" (val));
>> 	return parity;
>> }
>
>The same (with fixes) can be done for parity64() on 32bit=2E
>
>>=20
>> In the generic algorithm, you probably should implement parity16() in=
=20
>> terms of parity8(), parity32() in terms of parity16() and so on:
>>=20
>> static inline __attribute_const__ bool parity16(u16 val)
>> {
>> #ifdef ARCH_HAS_PARITY16
>> 	if (!__builtin_const_p(val))
>> 		return _arch_parity16(val);
>> #endif
>> 	return parity8(val ^ (val >> 8));
>> }
>>=20
>> This picks up the architectural versions when available=2E
>
>Not the best way to do that=2E
>Make the name in the #ifdef the same as the function and define
>a default one if the architecture doesn't define one=2E
>So:
>
>static inline parity16(u16 val)
>{
>	return __builtin_const_p(val) ? _parity_const(val) : _parity16(val);
>}
>
>#ifndef _parity16
>static inline _parity16(u15 val)
>{
>	return _parity8(val ^ (val >> 8));
>}
>#endif
>
>You only need one _parity_const()=2E
>
>>=20
>> Furthermore, if a popcnt instruction is known to exist, then the parity=
=20
>> is simply popcnt(x) & 1=2E
>
>Beware that some popcnt instructions are slow=2E
>
>	David
>
>>=20
>> 	-hpa
>>=20
>>=20
>

Seems more verbose than just #ifdef _arch_parity8 et al since the const an=
d generic code cases are the same (which they aren't always=2E)

But that part is a good idea, especially since on at least *some* architec=
tures like x86 doing:=20

#define _arch_parity8(x) __builtin_parity(x)

=2E=2E=2E etc is entirely reasonable and lets gcc use an already available=
 parity flag should one be available=2E

The inline wrapper, of course, takes care of the type mangling=2E
