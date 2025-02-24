Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FD4A42FFC
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 23:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F3C10E05B;
	Mon, 24 Feb 2025 22:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="ozIDGTPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537ED10E05B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 22:22:00 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51OMLFn9936187
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 24 Feb 2025 14:21:15 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51OMLFn9936187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1740435678;
 bh=5y6QG8ugMZ9OSeEQQS3XKHClehNKu6IU395FCDCL8FQ=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=ozIDGTPsS/eMemS9AsjAyI4wW35RmD+flU4K02cgRllCs1/EXoq/zU8D0Tj+XR7s7
 MZg8YLCegaqa2yDyfMJvQGv6t1kOvN+0q04sz5ZxYB9YM677zH/ZIZY6vdUkX4NcwW
 oWm3ILA+YRJqBweAX9swGouBRul9ocwk3Q4qIuvrww8+7C/Rb1K/Ta0mh5A75CR1rh
 llGqPQI+Pf0RG87x37cpP0mls9qUS/4UTdrDt6e6zhpWuYAFbE/uu9ouHgosTRW+LS
 bO/GR8jYaz6trMtVFpY/lvVshl8fmlaN9/CCCKUp5lafSOK9eftKm/xvIxMal4//D3
 SjMlyohWFvQfg==
Date: Mon, 24 Feb 2025 14:21:13 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Yury Norov <yury.norov@gmail.com>
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
 jirislaby@kernel.org, akpm@linux-foundation.org, mingo@kernel.org,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
In-Reply-To: <Z7zv-c4A76jeMAKf@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-4-visitorckw@gmail.com>
 <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com>
 <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com> <Z7zv-c4A76jeMAKf@thinkpad>
Message-ID: <68F1ED19-B0C2-4E78-B504-2F7C040ACC0A@zytor.com>
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

On February 24, 2025 2:17:29 PM PST, Yury Norov <yury=2Enorov@gmail=2Ecom> =
wrote:
>On Mon, Feb 24, 2025 at 01:55:28PM -0800, H=2E Peter Anvin wrote:
>> On 2/24/25 07:24, Uros Bizjak wrote:
>> >=20
>> >=20
>> > On 23=2E 02=2E 25 17:42, Kuan-Wei Chiu wrote:
>> > > Refactor parity calculations to use the standard parity8() helper=
=2E This
>> > > change eliminates redundant implementations and improves code
>> > > efficiency=2E
>> >=20
>> > The patch improves parity assembly code in bootflag=2Eo from:
>> >=20
>> >  =C2=A0 58:=C2=A0=C2=A0=C2=A0 89 de=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 mov=C2=A0=C2=A0=C2=A0 %ebx,%esi
>> >  =C2=A0 5a:=C2=A0=C2=A0=C2=A0 b9 08 00 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x8,%ecx
>> >  =C2=A0 5f:=C2=A0=C2=A0=C2=A0 31 d2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 xor=C2=A0=C2=A0=C2=A0 %edx,%edx
>> >  =C2=A0 61:=C2=A0=C2=A0=C2=A0 89 f0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 mov=C2=A0=C2=A0=C2=A0 %esi,%eax
>> >  =C2=A0 63:=C2=A0=C2=A0=C2=A0 89 d7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 mov=C2=A0=C2=A0=C2=A0 %edx,%edi
>> >  =C2=A0 65:=C2=A0=C2=A0=C2=A0 40 d0 ee=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shr=C2=
=A0=C2=A0=C2=A0 %sil
>> >  =C2=A0 68:=C2=A0=C2=A0=C2=A0 83 e0 01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and=C2=
=A0=C2=A0=C2=A0 $0x1,%eax
>> >  =C2=A0 6b:=C2=A0=C2=A0=C2=A0 31 c2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 xor=C2=A0=C2=A0=C2=A0 %eax,%edx
>> >  =C2=A0 6d:=C2=A0=C2=A0=C2=A0 83 e9 01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sub=C2=
=A0=C2=A0=C2=A0 $0x1,%ecx
>> >  =C2=A0 70:=C2=A0=C2=A0=C2=A0 75 ef=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 jne=C2=A0=C2=A0=C2=A0 61 <sbf_init+0x51>
>> >  =C2=A0 72:=C2=A0=C2=A0=C2=A0 39 c7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cmp=C2=A0=C2=A0=C2=A0 %eax,%edi
>> >  =C2=A0 74:=C2=A0=C2=A0=C2=A0 74 7f=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 f5 <sbf_init+0xe5>
>> >  =C2=A0 76:
>> >=20
>> > to:
>> >=20
>> >  =C2=A0 54:=C2=A0=C2=A0=C2=A0 89 d8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 mov=C2=A0=C2=A0=C2=A0 %ebx,%eax
>> >  =C2=A0 56:=C2=A0=C2=A0=C2=A0 ba 96 69 00 00=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x6996,%edx
>> >  =C2=A0 5b:=C2=A0=C2=A0=C2=A0 c0 e8 04=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shr=C2=
=A0=C2=A0=C2=A0 $0x4,%al
>> >  =C2=A0 5e:=C2=A0=C2=A0=C2=A0 31 d8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 xor=C2=A0=C2=A0=C2=A0 %ebx,%eax
>> >  =C2=A0 60:=C2=A0=C2=A0=C2=A0 83 e0 0f=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and=C2=
=A0=C2=A0=C2=A0 $0xf,%eax
>> >  =C2=A0 63:=C2=A0=C2=A0=C2=A0 0f a3 c2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bt=C2=A0=
=C2=A0=C2=A0=C2=A0 %eax,%edx
>> >  =C2=A0 66:=C2=A0=C2=A0=C2=A0 73 64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 jae=C2=A0=C2=A0=C2=A0 cc <sbf_init+0xbc>
>> >  =C2=A0 68:
>> >=20
>> > which is faster and smaller (-10 bytes) code=2E
>> >=20
>>=20
>> Of course, on x86, parity8() and parity16() can be implemented very sim=
ply:
>>=20
>> (Also, the parity functions really ought to return bool, and be flagged
>> __attribute_const__=2E)
>
>There was a discussion regarding return type when parity8() was added=2E
>The integer type was taken over bool with a sort of consideration that
>bool should be returned as an answer to some question, like parity_odd()=
=2E
>
>To me it's not a big deal=2E We can switch to boolean and describe in
>comment what the 'true' means for the parity() function=2E

Bool is really the single-bit type, and gives the compiler more informatio=
n=2E You could argue that the function really should be called parity_odd*(=
) in general, but that's kind of excessive IMO=2E
