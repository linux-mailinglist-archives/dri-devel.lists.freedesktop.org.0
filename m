Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C207A5FBEE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A7910E8EB;
	Thu, 13 Mar 2025 16:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.b="TAd1C3YU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325BE10E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:37:19 +0000 (UTC)
Received: from [127.0.0.1] ([76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52DGaDdt3043136
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Thu, 13 Mar 2025 09:36:13 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52DGaDdt3043136
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2025021701; t=1741883777;
 bh=SaFIw7UgTgo6VXgT9++j90cTZypncDuuppnQ2OyQAgc=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=TAd1C3YUnz1/m04KvWprrt25c59hDoEqP/HObNA2f0Bp4rp+Nb9PEJCNVXCw14Iiu
 q9Abs6+zDLtcCpZhdLC2JCZczf1qLTKYIQIMECs16cttjTwMK/9bSrYGHwOie5HClz
 /jcP+3xeKGlwUu0aUrtIeDMZT1ZuV3Y4f2fDZOzvoKjLs6qNj/nOaMpj13f7/0wDQR
 FTgUDEoLrytWaP9YL4WrPdL93XJwGvTwIwSUgo+vtkpLhxBsY0ibsq0svVoyhEkaAa
 CHnCGjith9nzaUr6Ath+5dakagWjzMXxHAYsyl+rXq8ZXPjgmXLSW6QTYUQphTnOMM
 hLTpcEZzd0lKw==
Date: Thu, 13 Mar 2025 09:36:11 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Yury Norov <yury.norov@gmail.com>
CC: Jacob Keller <jacob.e.keller@intel.com>,
 David Laight <david.laight.linux@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 akpm@linux-foundation.org, alistair@popple.id.au,
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
In-Reply-To: <Z9MGxknjluvbX19w@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <20250307193643.28065d2d@pumpkin>
 <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
 <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com> <Z9MGxknjluvbX19w@thinkpad>
Message-ID: <795281B1-9B8A-477F-8012-DECD14CB53E5@zytor.com>
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

On March 13, 2025 9:24:38 AM PDT, Yury Norov <yury=2Enorov@gmail=2Ecom> wro=
te:
>On Wed, Mar 12, 2025 at 05:09:16PM -0700, H=2E Peter Anvin wrote:
>> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob=2Ee=2Ekeller@inte=
l=2Ecom> wrote:
>
>[=2E=2E=2E]
>
>> >This is really a question of whether you expect odd or even parity as
>> >the "true" value=2E I think that would depend on context, and we may n=
ot
>> >reach a good consensus=2E
>> >
>> >I do agree that my brain would jump to "true is even, false is odd"=2E
>> >However, I also agree returning the value as 0 for even and 1 for odd
>> >kind of made sense before, and updating this to be a bool and then
>> >requiring to switch all the callers is a bit obnoxious=2E=2E=2E
>>=20
>> Odd =3D 1 =3D true is the only same definition=2E It is a bitwise XOR, =
or sum mod 1=2E
>
>The x86 implementation will be "popcnt(val) & 1", right? So if we
>choose to go with odd =3D=3D false, we'll have to add an extra negation=
=2E
>So because it's a purely conventional thing, let's just pick a simpler
>one?
>
>Compiler's builtin parity() returns 1 for odd=2E
>
>Thanks,
>Yury

The x86 implementation, no, but there will be plenty of others having that=
 exact definition=2E
