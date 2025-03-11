Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ACDA5D27F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 23:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEF010E042;
	Tue, 11 Mar 2025 22:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="QWEZWp44";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3419310E042
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 22:25:51 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52BMOF3B2275039
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 11 Mar 2025 15:24:15 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52BMOF3B2275039
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1741731862;
 bh=GFDhiFKvtRD+W2XGLJDNjRiea0qe1W3j0iK0xY8JZL8=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=QWEZWp44Cu/zN1UIDmdWXY6QcwrSH2LoTB7gxC/oODFA2E5hnyx87scqetv/EJqaq
 W3NGSD2lutyv9Jcq8m20s075mr19ouosvjSfuoByKOZE3mQ3jwMuLYAfFD7NHXFjMu
 PSNQMtgdMv8Ylzz6iTK9sKEdCddWc+fBTUdrnEKWu4ZtGPAVnloe7NrgEcViX9/54l
 wN7/sR5ozYXyi5j6Ocpn7dIVIj/aVN6iIt0U8c7AYlRPFAXzs4Zww/v+elJgd/PqhB
 MqAlIlffCnFmITyc2l4ZgqDCwWd5yt6Lw5IBPI6hlmBqX3gG06MBm8zXyyFfILZebk
 u/gMoXml+mBPw==
Date: Tue, 11 Mar 2025 15:24:14 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Yury Norov <yury.norov@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>
CC: David Laight <david.laight.linux@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au,
 andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
 arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
 bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
 davem@davemloft.net, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
 edumazet@google.com, eleanor15x@gmail.com, gregkh@linuxfoundation.org,
 hverkuil@xs4all.nl, jernej.skrabec@gmail.com, jirislaby@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, johannes@sipsolutions.net,
 jonas@kwiboo.se, jserv@ccns.ncku.edu.tw, kuba@kernel.org,
 linux-fsi@lists.ozlabs.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux@rasmusvillemoes.dk,
 louis.peens@corigine.com, maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mingo@redhat.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, neil.armstrong@linaro.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de,
 vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
User-Agent: K-9 Mail for Android
In-Reply-To: <Z9CyuowYsZyez36c@thinkpad>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name> <Z9CyuowYsZyez36c@thinkpad>
Message-ID: <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
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

On March 11, 2025 3:01:30 PM PDT, Yury Norov <yury=2Enorov@gmail=2Ecom> wro=
te:
>On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
>> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H=2E Peter Anvin wrote:
>> > On March 7, 2025 11:53:10 AM PST, David Laight <david=2Elaight=2Elinu=
x@gmail=2Ecom> wrote:
>> > >On Fri, 07 Mar 2025 11:30:35 -0800
>> > >"H=2E Peter Anvin" <hpa@zytor=2Ecom> wrote:
>> > >
>> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew=2Ecooper3@=
citrix=2Ecom> wrote:
>> > >> >> (int)true most definitely is guaranteed to be 1=2E =20
>> > >> >
>> > >> >That's not technically correct any more=2E
>> > >> >
>> > >> >GCC has introduced hardened bools that intentionally have bit pat=
terns
>> > >> >other than 0 and 1=2E
>> > >> >
>> > >> >https://gcc=2Egnu=2Eorg/gcc-14/changes=2Ehtml
>> > >> >
>> > >> >~Andrew =20
>> > >>=20
>> > >> Bit patterns in memory maybe (not that I can see the Linux kernel =
using them) but
>> > >> for compiler-generated conversations that's still a given, or the =
manager isn't C
>> > >> or anything even remotely like it=2E
>> > >>=20
>> > >
>> > >The whole idea of 'bool' is pretty much broken by design=2E
>> > >The underlying problem is that values other than 'true' and 'false' =
can
>> > >always get into 'bool' variables=2E
>> > >
>> > >Once that has happened it is all fubar=2E
>> > >
>> > >Trying to sanitise a value with (say):
>> > >int f(bool v)
>> > >{
>> > >	return (int)v & 1;
>> > >}   =20
>> > >just doesn't work (see https://www=2Egodbolt=2Eorg/z/MEndP3q9j)
>> > >
>> > >I really don't see how using (say) 0xaa and 0x55 helps=2E
>> > >What happens if the value is wrong? a trap or exception?, good luck =
recovering
>> > >from that=2E
>> > >
>> > >	David
>> >=20
>> > Did you just discover GIGO?
>>=20
>> Thanks for all the suggestions=2E
>>=20
>> I don't have a strong opinion on the naming or return type=2E I'm still=
 a
>> bit confused about whether I can assume that casting bool to int always
>> results in 0 or 1=2E
>>=20
>> If that's the case, since most people prefer bool over int as the
>> return type and some are against introducing u1, my current plan is to
>> use the following in the next version:
>>=20
>> bool parity_odd(u64 val);
>>=20
>> This keeps the bool return type, renames the function for better
>> clarity, and avoids extra maintenance burden by having just one
>> function=2E
>>=20
>> If I can't assume that casting bool to int always results in 0 or 1,
>> would it be acceptable to keep the return type as int?
>>=20
>> Would this work for everyone?
>
>Alright, it's clearly a split opinion=2E So what I would do myself in
>such case is to look at existing code and see what people who really
>need parity invent in their drivers:
>
>                                     bool      parity_odd
>static inline int parity8(u8 val)       -               -
>static u8 calc_parity(u8 val)           -               -
>static int odd_parity(u8 c)             -               +
>static int saa711x_odd_parity           -               +
>static int max3100_do_parity            -               -
>static inline int parity(unsigned x)    -               -
>static int bit_parity(u32 pkt)          -               -
>static int oa_tc6_get_parity(u32 p)     -               -
>static u32 parity32(__le32 data)        -               -
>static u32 parity(u32 sample)           -               -
>static int get_parity(int number,       -               -
>                      int size)
>static bool i2cr_check_parity32(u32 v,  +               -
>                        bool parity)
>static bool i2cr_check_parity64(u64 v)  +               -
>static int sw_parity(__u64 t)           -               -
>static bool parity(u64 value)           +               -
>
>Now you can refer to that table say that int parity(uXX) is what
>people want to see in their drivers=2E
>
>Whichever interface you choose, please discuss it's pros and cons=2E
>What bloat-o-meter says for each option? What's maintenance burden?
>Perf test? Look at generated code?
>
>I personally for a macro returning boolean, something like I
>proposed at the very beginning=2E
>
>Thanks,
>Yury

Also, please at least provide a way for an arch to opt in to using the bui=
ltins, which seem to produce as good results or better at least on some arc=
hitectures like x86 and probably with CPU options that imply fast popcnt is=
 available=2E
