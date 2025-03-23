Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00EAA6D1FF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 23:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E2610E194;
	Sun, 23 Mar 2025 22:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="gpzvbk1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4830B10E194
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 22:41:51 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52NMeKdo3968387
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sun, 23 Mar 2025 15:40:20 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52NMeKdo3968387
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025032001; t=1742769629;
 bh=jX8qvOcg5sHOYMzS8O1ZeFoLDzr4b9fAXnawD1sDsAQ=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=gpzvbk1/xbueYaRDkNUQItniaCPabNWQpBYkbzyWYtmr70CkFDr1QjiA+EEsvKZvw
 x+NlI2wYpRq9XIxDM3W6qyI4muMLrm74m6hk9SQZhj6u/678GeAxC2aHNwRAd8Fz02
 eaUD2juyAsarROcyXcOXSBJeY7WSazHhunwmvS0uaYtHesKXlr5cVrOSTOXia+d9ur
 x0GW78E2/YRSCfLq+CgCW5Ss3gdvaEyZxBcb+3QJlbHUizJ8HRUBm+f0VKsMTTNTOb
 biBm8UgyfdkV3Cldwh9ks4o9ztz33Hpie/nEjLEaxfg2nLmHMgLWNzA/75tuDFoxiX
 JvvTdqoR1VRZA==
Date: Sun, 23 Mar 2025 15:40:20 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, Yury Norov <yury.norov@gmail.com>
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
In-Reply-To: <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
References: <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name> <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com> <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
Message-ID: <05F7AC70-E8E7-4D14-A4EB-880D92A96534@zytor.com>
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

On March 23, 2025 8:16:24 AM PDT, Kuan-Wei Chiu <visitorckw@gmail=2Ecom> wr=
ote:
>On Thu, Mar 13, 2025 at 03:41:49PM +0800, Kuan-Wei Chiu wrote:
>> On Thu, Mar 13, 2025 at 12:29:13AM +0800, Kuan-Wei Chiu wrote:
>> > On Wed, Mar 12, 2025 at 11:51:12AM -0400, Yury Norov wrote:
>> > > On Tue, Mar 11, 2025 at 03:24:14PM -0700, H=2E Peter Anvin wrote:
>> > > > On March 11, 2025 3:01:30 PM PDT, Yury Norov <yury=2Enorov@gmail=
=2Ecom> wrote:
>> > > > >On Sun, Mar 09, 2025 at 11:48:26PM +0800, Kuan-Wei Chiu wrote:
>> > > > >> On Fri, Mar 07, 2025 at 12:07:02PM -0800, H=2E Peter Anvin wro=
te:
>> > > > >> > On March 7, 2025 11:53:10 AM PST, David Laight <david=2Elaig=
ht=2Elinux@gmail=2Ecom> wrote:
>> > > > >> > >On Fri, 07 Mar 2025 11:30:35 -0800
>> > > > >> > >"H=2E Peter Anvin" <hpa@zytor=2Ecom> wrote:
>> > > > >> > >
>> > > > >> > >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew=
=2Ecooper3@citrix=2Ecom> wrote:
>> > > > >> > >> >> (int)true most definitely is guaranteed to be 1=2E =20
>> > > > >> > >> >
>> > > > >> > >> >That's not technically correct any more=2E
>> > > > >> > >> >
>> > > > >> > >> >GCC has introduced hardened bools that intentionally hav=
e bit patterns
>> > > > >> > >> >other than 0 and 1=2E
>> > > > >> > >> >
>> > > > >> > >> >https://gcc=2Egnu=2Eorg/gcc-14/changes=2Ehtml
>> > > > >> > >> >
>> > > > >> > >> >~Andrew =20
>> > > > >> > >>=20
>> > > > >> > >> Bit patterns in memory maybe (not that I can see the Linu=
x kernel using them) but
>> > > > >> > >> for compiler-generated conversations that's still a given=
, or the manager isn't C
>> > > > >> > >> or anything even remotely like it=2E
>> > > > >> > >>=20
>> > > > >> > >
>> > > > >> > >The whole idea of 'bool' is pretty much broken by design=2E
>> > > > >> > >The underlying problem is that values other than 'true' and=
 'false' can
>> > > > >> > >always get into 'bool' variables=2E
>> > > > >> > >
>> > > > >> > >Once that has happened it is all fubar=2E
>> > > > >> > >
>> > > > >> > >Trying to sanitise a value with (say):
>> > > > >> > >int f(bool v)
>> > > > >> > >{
>> > > > >> > >	return (int)v & 1;
>> > > > >> > >}   =20
>> > > > >> > >just doesn't work (see https://www=2Egodbolt=2Eorg/z/MEndP3=
q9j)
>> > > > >> > >
>> > > > >> > >I really don't see how using (say) 0xaa and 0x55 helps=2E
>> > > > >> > >What happens if the value is wrong? a trap or exception?, g=
ood luck recovering
>> > > > >> > >from that=2E
>> > > > >> > >
>> > > > >> > >	David
>> > > > >> >=20
>> > > > >> > Did you just discover GIGO?
>> > > > >>=20
>> > > > >> Thanks for all the suggestions=2E
>> > > > >>=20
>> > > > >> I don't have a strong opinion on the naming or return type=2E =
I'm still a
>> > > > >> bit confused about whether I can assume that casting bool to i=
nt always
>> > > > >> results in 0 or 1=2E
>> > > > >>=20
>> > > > >> If that's the case, since most people prefer bool over int as =
the
>> > > > >> return type and some are against introducing u1, my current pl=
an is to
>> > > > >> use the following in the next version:
>> > > > >>=20
>> > > > >> bool parity_odd(u64 val);
>> > > > >>=20
>> > > > >> This keeps the bool return type, renames the function for bett=
er
>> > > > >> clarity, and avoids extra maintenance burden by having just on=
e
>> > > > >> function=2E
>> > > > >>=20
>> > > > >> If I can't assume that casting bool to int always results in 0=
 or 1,
>> > > > >> would it be acceptable to keep the return type as int?
>> > > > >>=20
>> > > > >> Would this work for everyone?
>> > > > >
>> > > > >Alright, it's clearly a split opinion=2E So what I would do myse=
lf in
>> > > > >such case is to look at existing code and see what people who re=
ally
>> > > > >need parity invent in their drivers:
>> > > > >
>> > > > >                                     bool      parity_odd
>> > > > >static inline int parity8(u8 val)       -               -
>> > > > >static u8 calc_parity(u8 val)           -               -
>> > > > >static int odd_parity(u8 c)             -               +
>> > > > >static int saa711x_odd_parity           -               +
>> > > > >static int max3100_do_parity            -               -
>> > > > >static inline int parity(unsigned x)    -               -
>> > > > >static int bit_parity(u32 pkt)          -               -
>> > > > >static int oa_tc6_get_parity(u32 p)     -               -
>> > > > >static u32 parity32(__le32 data)        -               -
>> > > > >static u32 parity(u32 sample)           -               -
>> > > > >static int get_parity(int number,       -               -
>> > > > >                      int size)
>> > > > >static bool i2cr_check_parity32(u32 v,  +               -
>> > > > >                        bool parity)
>> > > > >static bool i2cr_check_parity64(u64 v)  +               -
>> > > > >static int sw_parity(__u64 t)           -               -
>> > > > >static bool parity(u64 value)           +               -
>> > > > >
>> > > > >Now you can refer to that table say that int parity(uXX) is what
>> > > > >people want to see in their drivers=2E
>> > > > >
>> > > > >Whichever interface you choose, please discuss it's pros and con=
s=2E
>> > > > >What bloat-o-meter says for each option? What's maintenance burd=
en?
>> > > > >Perf test? Look at generated code?
>> > > > >
>> > > > >I personally for a macro returning boolean, something like I
>> > > > >proposed at the very beginning=2E
>> > > > >
>> > > > >Thanks,
>> > > > >Yury
>> > > >=20
>> > > > Also, please at least provide a way for an arch to opt in to usin=
g the builtins, which seem to produce as good results or better at least on=
 some architectures like x86 and probably with CPU options that imply fast =
popcnt is available=2E
>> > >=20
>> > > Yeah=2E And because linux/bitops=2Eh already includes asm/bitops=2E=
h
>> > > the simplest way would be wrapping generic implementation with
>> > > the #ifndef parity, similarly to how we handle find_next_bit case=
=2E
>> > >=20
>> > > So:
>> > > 1=2E Kuan-Wei, please don't invent something like ARCH_HAS_PARITY;
>> > > 2=2E This may, and probably should, be a separate follow-up series,
>> > >    likely created by corresponding arch experts=2E
>> > >=20
>> > I saw discussions in the previous email thread about both
>> > __builtin_parity and x86-specific implementations=2E However, from th=
e
>> > discussion, I learned that before considering any optimization, we
>> > should first ask: which driver or subsystem actually cares about pari=
ty
>> > efficiency? If someone does, I can help with a micro-benchmark to
>> > provide performance numbers, but I don't have enough domain knowledge
>> > to identify hot paths where parity efficiency matters=2E
>> >=20
>> IMHO,
>>=20
>> If parity is never used in any hot path and we don't care about parity:
>>=20
>> Then benchmarking its performance seems meaningless=2E In this case, a
>> function with a u64 argument would suffice, and we might not even need
>> a macro to optimize for different types=E2=80=94especially since the ma=
cro
>> requires special hacks to avoid compiler warnings=2E Also, I don't thin=
k
>> code size matters here=2E If it does, we should first consider making
>> parity a non-inline function in a =2Ec file rather than an inline
>> function/macro in a header=2E
>>=20
>> If parity is used in a hot path:
>>=20
>> We need different handling for different type sizes=2E As previously
>> discussed, x86 assembly might use different instructions for u8 and
>> u16=2E This may sound stubborn, but I want to ask again: should we
>> consider using parity8/16/32/64 interfaces? Like in the i3c driver
>> example, if we only have a single parity macro that selects an
>> implementation based on type size, users must explicitly cast types=2E
>> If future users also need parity in a hot path, they might not be aware
>> of this requirement and end up generating suboptimal code=2E Since we
>> care about efficiency and generated code, why not follow hweight() and
>> provide separate implementations for different sizes?
>>=20
>It seems no one will reply to my two emails=2E So, I have summarized
>different interface approaches=2E If there is a next version, I will send
>it after the merge window closes=2E
>
>Interface 1: Single Function
>Description: bool parity_odd(u64)
>Pros: Minimal maintenance cost
>Cons: Difficult to integrate with architecture-specific implementations
>      due to the inability to optimize for different argument sizes
>Opinions: Jiri supports this approach
>
>Interface 2: Single Macro
>Description: parity_odd() macro
>Pros: Allows type-specific implementation
>Cons: Requires hacks to avoid warnings; users may need explicit
>      casting; potential sub-optimal code on 32-bit x86
>Opinions: Yury supports this approach
>
>Interface 3: Multiple Functions
>Description: bool parity_odd8/16/32/64()
>Pros: No need for explicit casting; easy to integrate
>      architecture-specific optimizations; except for parity8(), all
>      functions are one-liners with no significant code duplication
>Cons: More functions may increase maintenance burden
>Opinions: Only I support this approach
>
>Regards,
>Kuan-Wei

You can add me to the final option=2E I think it makes most sense 
