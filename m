Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471BA567A0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 13:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9378810E17B;
	Fri,  7 Mar 2025 12:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="Be5SaSGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8969110E17B
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 12:15:38 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 527CEaSZ216144
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 7 Mar 2025 04:14:36 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 527CEaSZ216144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1741349679;
 bh=jpHguGFzA2ESTQPvqJoIr0NmAS1zWgolyOTrgBL62N8=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=Be5SaSGgmsWvlkd2HRqfzArk9nnQa/gbB2kCd/vi2QEK8XF7tn7E007LPGCySYBmv
 IBe4UFr66OEmtiNpObBgvlVSM3dsVFMAmcCg1qk0KnpRrF+aipL4y7W2YaKWxosfjg
 cWf5lVQ4b9ZseS/T4Ejdb1zr76nvhUjdua5R2Pch5YNHmdUnn4vc+zzlh64uFhK6vb
 WTkqjjxZYMKmKvVthPXAaIt6oPShwbOs2Gi2goJSFgvNUhGes6srmI4eDqrLD0uLkC
 /B3MuqYu4V3A5+3QHFJOLT2DdF/UOScSb+vcFfW82sFlWlX0qiCgDEt2HYcKJg4NnR
 6SqqnMn8wULdA==
Date: Fri, 07 Mar 2025 04:14:34 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>
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
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
User-Agent: K-9 Mail for Android
In-Reply-To: <Z8ri5h-nvNXNp6NB@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <Z8ri5h-nvNXNp6NB@gmail.com>
Message-ID: <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
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

On March 7, 2025 4:13:26 AM PST, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Jiri Slaby <jirislaby@kernel=2Eorg> wrote:
>
>> On 07=2E 03=2E 25, 12:38, Ingo Molnar wrote:
>> >=20
>> > * Jiri Slaby <jirislaby@kernel=2Eorg> wrote:
>> >=20
>> > > On 06=2E 03=2E 25, 17:25, Kuan-Wei Chiu wrote:
>> > > > Change return type to bool for better clarity=2E Update the kerne=
l doc
>> > > > comment accordingly, including fixing "@value" to "@val" and adju=
sting
>> > > > examples=2E Also mark the function with __attribute_const__ to al=
low
>> > > > potential compiler optimizations=2E
>> > > >=20
>> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail=2Ecom>
>> > > > ---
>> > > >    include/linux/bitops=2Eh | 10 +++++-----
>> > > >    1 file changed, 5 insertions(+), 5 deletions(-)
>> > > >=20
>> > > > diff --git a/include/linux/bitops=2Eh b/include/linux/bitops=2Eh
>> > > > index c1cb53cf2f0f=2E=2E44e5765b8bec 100644
>> > > > --- a/include/linux/bitops=2Eh
>> > > > +++ b/include/linux/bitops=2Eh
>> > > > @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsi=
gned long l)
>> > > >    /**
>> > > >     * parity8 - get the parity of an u8 value
>> > > > - * @value: the value to be examined
>> > > > + * @val: the value to be examined
>> > > >     *
>> > > >     * Determine the parity of the u8 argument=2E
>> > > >     *
>> > > >     * Returns:
>> > > > - * 0 for even parity, 1 for odd parity
>> > > > + * false for even parity, true for odd parity
>> > >=20
>> > > This occurs somehow inverted to me=2E When something is in parity m=
eans that
>> > > it has equal number of 1s and 0s=2E I=2Ee=2E return true for even d=
istribution=2E
>> > > Dunno what others think? Or perhaps this should be dubbed odd_parit=
y() when
>> > > bool is returned? Then you'd return true for odd=2E
>> >=20
>> > OTOH:
>> >=20
>> >   - '0' is an even number and is returned for even parity,
>> >   - '1' is an odd  number and is returned for odd  parity=2E
>>=20
>> Yes, that used to make sense for me=2E For bool/true/false, it no longe=
r does=2E
>> But as I wrote, it might be only me=2E=2E=2E
>
>No strong opinion on this from me either, I'd guess existing practice=20
>with other parity functions should probably control=2E (If a coherent=20
>praxis exists=2E)=2E
>
>Thanks,
>
>	Ingo

Instead of "bool" think of it as "bit" and it makes more sense 
