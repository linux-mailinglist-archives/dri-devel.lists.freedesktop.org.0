Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB6A5722C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 20:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F3910EC30;
	Fri,  7 Mar 2025 19:40:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="fHPdtiOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFF610EC27
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 19:40:29 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 527Jde7i398116
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 7 Mar 2025 11:39:40 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 527Jde7i398116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1741376383;
 bh=cO+5YT2XMi/UzC8lhZJSeth7x72+w0kQRpcBJNMS6Ts=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=fHPdtiOSVjdSykmi/mB1spB73R3ivN6H0Ulf7jwPVmevYxtXxnBZr3Iv/Wjl6gu4Q
 c2aJ3CtYbosOgfw1LhpaWEy9x7CJcqVCiL9oM6u+leV+apE+5D069ypMUoYQ+sy/Wf
 91fo2MFzx6M5FaNHwq7sbvJjzCJXZOHyDCg2kmIZjZe8FjGw9L/KmFoCj72SQTFf65
 vhldOnPwe3Hsizp8OwyJMh+1CqfBV3DirGTtBEspDqzU4yHuiPHpZYfUsH3ckbSyXB
 HxsUkTpIVyzS0USApyUo2Bt1yuCyHQBjoti6HCBTdRqQsLdFflChYlrMEVTIJaAxv3
 YZBS8e8ebrsPA==
Date: Fri, 07 Mar 2025 11:39:38 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
In-Reply-To: <20250307193643.28065d2d@pumpkin>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <20250307193643.28065d2d@pumpkin>
Message-ID: <20B9425B-E824-4FB0-9D91-42FDB04EC3C9@zytor.com>
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

On March 7, 2025 11:36:43 AM PST, David Laight <david=2Elaight=2Elinux@gmai=
l=2Ecom> wrote:
>On Fri, 7 Mar 2025 12:42:41 +0100
>Jiri Slaby <jirislaby@kernel=2Eorg> wrote:
>
>> On 07=2E 03=2E 25, 12:38, Ingo Molnar wrote:
>> >=20
>> > * Jiri Slaby <jirislaby@kernel=2Eorg> wrote:
>> >  =20
>> >> On 06=2E 03=2E 25, 17:25, Kuan-Wei Chiu wrote: =20
>> >>> Change return type to bool for better clarity=2E Update the kernel =
doc
>> >>> comment accordingly, including fixing "@value" to "@val" and adjust=
ing
>> >>> examples=2E Also mark the function with __attribute_const__ to allo=
w
>> >>> potential compiler optimizations=2E
>> >>>
>> >>> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>> >>> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail=2Ecom>
>> >>> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail=2Ecom>
>> >>> ---
>> >>>    include/linux/bitops=2Eh | 10 +++++-----
>> >>>    1 file changed, 5 insertions(+), 5 deletions(-)
>> >>>
>> >>> diff --git a/include/linux/bitops=2Eh b/include/linux/bitops=2Eh
>> >>> index c1cb53cf2f0f=2E=2E44e5765b8bec 100644
>> >>> --- a/include/linux/bitops=2Eh
>> >>> +++ b/include/linux/bitops=2Eh
>> >>> @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsign=
ed long l)
>> >>>    /**
>> >>>     * parity8 - get the parity of an u8 value
>> >>> - * @value: the value to be examined
>> >>> + * @val: the value to be examined
>> >>>     *
>> >>>     * Determine the parity of the u8 argument=2E
>> >>>     *
>> >>>     * Returns:
>> >>> - * 0 for even parity, 1 for odd parity
>> >>> + * false for even parity, true for odd parity =20
>> >>
>> >> This occurs somehow inverted to me=2E When something is in parity me=
ans that
>> >> it has equal number of 1s and 0s=2E I=2Ee=2E return true for even di=
stribution=2E
>> >> Dunno what others think? Or perhaps this should be dubbed odd_parity=
() when
>> >> bool is returned? Then you'd return true for odd=2E =20
>> >=20
>> > OTOH:
>> >=20
>> >   - '0' is an even number and is returned for even parity,
>> >   - '1' is an odd  number and is returned for odd  parity=2E =20
>>=20
>> Yes, that used to make sense for me=2E For bool/true/false, it no longe=
r=20
>> does=2E But as I wrote, it might be only me=2E=2E=2E
>
>No me as well, I've made the same comment before=2E
>When reading code I don't want to have to look up a function definition=
=2E
>There is even scope for having parity_odd() and parity_even()=2E
>And, with the version that shifts a constant right you want to invert
>the constant!
>
>	David
>
>
>
>

Of course, for me, if I saw "parity_odd()" I would think of it as a functi=
on that caused the parity to become odd, i=2Ee=2E

if (!parity(x))
  x ^=3D 1 << 7;
