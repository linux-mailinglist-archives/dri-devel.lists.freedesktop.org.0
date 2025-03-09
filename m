Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5CEA585B7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 17:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A69D10E1E0;
	Sun,  9 Mar 2025 16:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="AM2/bmW6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E3D10E1E0
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 16:08:49 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 529G7ORJ1263742
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sun, 9 Mar 2025 09:07:25 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 529G7ORJ1263742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1741536453;
 bh=seT44xgoWZ5mbi6YMs1X0xb2oeGYrNPZX+/U1qdQGTg=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=AM2/bmW6qzoT4YywJnfg+kFnRXlll5tS36arYnqSjApIypQlKimmdfCt9YyV+hD5i
 dwEfkCUr9AtGwtNwd8jvLKVyhS9+DVOhMt0UxbaU8XLll4G1zqhZUN5wna9XCG0iyW
 78qL6sdm7Dmrl0dpbYygV8vUvwurgNltciei2+BotvHSOlc5nLcyRz7FcLa20sqElN
 aaLYBYPsfdON+oOvyxzkWw0OSqmFW0xR+GLH1tZOAogct9w6ii64Fkp372iR+MOFjL
 L/PbfQo7+FF9HFkiZXRXnx5Nau5yXjNHZfL42nnEtecfgu8tqCoFLf4g4XN6869eDo
 eXA4gSO7d9tjA==
Date: Sun, 09 Mar 2025 09:00:58 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
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
 vigneshr@ti.com, x86@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
User-Agent: K-9 Mail for Android
In-Reply-To: <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
References: <4732F6F6-1D41-4E3F-BE24-E54489BC699C@zytor.com>
 <efc2ee9d-5382-457f-b471-f3c44b81a190@citrix.com>
 <5A790652-1B22-4D13-AAC5-5D9931E90903@zytor.com>
 <20250307195310.58abff8c@pumpkin>
 <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
Message-ID: <EF4335E0-F8EB-4642-BD09-B16BCCF23F95@zytor.com>
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

On March 9, 2025 8:48:26 AM PDT, Kuan-Wei Chiu <visitorckw@gmail=2Ecom> wro=
te:
>On Fri, Mar 07, 2025 at 12:07:02PM -0800, H=2E Peter Anvin wrote:
>> On March 7, 2025 11:53:10 AM PST, David Laight <david=2Elaight=2Elinux@=
gmail=2Ecom> wrote:
>> >On Fri, 07 Mar 2025 11:30:35 -0800
>> >"H=2E Peter Anvin" <hpa@zytor=2Ecom> wrote:
>> >
>> >> On March 7, 2025 10:49:56 AM PST, Andrew Cooper <andrew=2Ecooper3@ci=
trix=2Ecom> wrote:
>> >> >> (int)true most definitely is guaranteed to be 1=2E =20
>> >> >
>> >> >That's not technically correct any more=2E
>> >> >
>> >> >GCC has introduced hardened bools that intentionally have bit patte=
rns
>> >> >other than 0 and 1=2E
>> >> >
>> >> >https://gcc=2Egnu=2Eorg/gcc-14/changes=2Ehtml
>> >> >
>> >> >~Andrew =20
>> >>=20
>> >> Bit patterns in memory maybe (not that I can see the Linux kernel us=
ing them) but
>> >> for compiler-generated conversations that's still a given, or the ma=
nager isn't C
>> >> or anything even remotely like it=2E
>> >>=20
>> >
>> >The whole idea of 'bool' is pretty much broken by design=2E
>> >The underlying problem is that values other than 'true' and 'false' ca=
n
>> >always get into 'bool' variables=2E
>> >
>> >Once that has happened it is all fubar=2E
>> >
>> >Trying to sanitise a value with (say):
>> >int f(bool v)
>> >{
>> >	return (int)v & 1;
>> >}   =20
>> >just doesn't work (see https://www=2Egodbolt=2Eorg/z/MEndP3q9j)
>> >
>> >I really don't see how using (say) 0xaa and 0x55 helps=2E
>> >What happens if the value is wrong? a trap or exception?, good luck re=
covering
>> >from that=2E
>> >
>> >	David
>>=20
>> Did you just discover GIGO?
>
>Thanks for all the suggestions=2E
>
>I don't have a strong opinion on the naming or return type=2E I'm still a
>bit confused about whether I can assume that casting bool to int always
>results in 0 or 1=2E
>
>If that's the case, since most people prefer bool over int as the
>return type and some are against introducing u1, my current plan is to
>use the following in the next version:
>
>bool parity_odd(u64 val);
>
>This keeps the bool return type, renames the function for better
>clarity, and avoids extra maintenance burden by having just one
>function=2E
>
>If I can't assume that casting bool to int always results in 0 or 1,
>would it be acceptable to keep the return type as int?
>
>Would this work for everyone?
>
>Regards,
>Kuan-Wei

You *CAN* safely assume that bool is an integer type which always has the =
value 0 or 1=2E
