Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6894B12C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2331F10E5C5;
	Wed,  7 Aug 2024 20:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="INxzaSiC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCE710E542;
 Wed,  7 Aug 2024 13:56:42 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20240807135640euoutp0286ea7eef83e03aad6a6e04a6315089c5~pdtd0h6d11803118031euoutp02B;
 Wed,  7 Aug 2024 13:56:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20240807135640euoutp0286ea7eef83e03aad6a6e04a6315089c5~pdtd0h6d11803118031euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723039000;
 bh=RD4VCR8zcAhpzCYoVdHahIWyW9KGCB3RFPi11K81luc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=INxzaSiC9Ycwbv2GeiH7lCELe5ljbafikAZ0+PPTR+7EcplhZqubD2H69a5+/xfq9
 pD5YZoX8NfqTrpFw4oYeUNKUdRgTTk2qaO+cm+qPVVkSyvuiC3M3TK/pE3O9kLqP9R
 k5pmPh3ih1oDv6e09n1Y5MJ6V6IorNlnVv6VzuYs=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240807135639eucas1p18cf775d2f2cbfdbf5b7bf2a57b7f73c9~pdtdYaf-32629426294eucas1p1f;
 Wed,  7 Aug 2024 13:56:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 30.CE.09875.71D73B66; Wed,  7
 Aug 2024 14:56:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20240807135639eucas1p19f1d9712d29bdbfcc447308db0353327~pdtc6WloT2647726477eucas1p1l;
 Wed,  7 Aug 2024 13:56:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20240807135639eusmtrp1b67e1514abe665307a794aba282fcbd9~pdtc4_DFi2631226312eusmtrp1z;
 Wed,  7 Aug 2024 13:56:39 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-ca-66b37d178b2b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 30.62.08810.71D73B66; Wed,  7
 Aug 2024 14:56:39 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240807135638eusmtip2ef9530a5bc066906498e2d25e05ce525~pdtcnQ5_c0435104351eusmtip2O;
 Wed,  7 Aug 2024 13:56:38 +0000 (GMT)
Received: from CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) by
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 7 Aug 2024 14:56:38 +0100
Received: from CAMSVWEXC02.scsc.local ([::1]) by CAMSVWEXC02.scsc.local
 ([fe80::3c08:6c51:fa0a:6384%13]) with mapi id 15.00.1497.012; Wed, 7 Aug
 2024 14:56:38 +0100
From: Daniel Gomez <da.gomez@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, William Hubbs
 <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser
 <kirk@reisers.ca>, Samuel Thibault <samuel.thibault@ens-lyon.org>, Paul
 Moore <paul@paul-moore.com>, Stephen Smalley
 <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, James
 Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Jiri Slaby <jirislaby@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
 <linux-kbuild@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "speakup@linux-speakup.org"
 <speakup@linux-speakup.org>, "selinux@vger.kernel.org"
 <selinux@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
 <kvmarm@lists.linux.dev>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, Finn Behrens <me@kloenk.dev>, "Daniel Gomez
 (Samsung)" <d+samsung@kruces.com>, "gost.dev@samsung.com"
 <gost.dev@samsung.com>, Nick Desaulniers <nick.desaulniers@gmail.com>
Subject: Re: [PATCH 00/12] Enable build system on macOS hosts
Thread-Topic: [PATCH 00/12] Enable build system on macOS hosts
Thread-Index: AQHa6FXa2qO1hDUbAkeBhFl865k4bbIbkMYAgAAxCIA=
Date: Wed, 7 Aug 2024 13:56:38 +0000
Message-ID: <3jnp6tnkjpvnisefomxagazu2u3uzzt7rcon3r5jssraxzwegb@gsxc7c5sfh7v>
In-Reply-To: <2024080753-debug-roulette-8cb1@gregkh>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [106.110.32.67]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D2FE3BDA1F1CEC4DBF273ECDE479024B@scsc.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ta0yTVxzGPe+1EDpfEeFMXdwYfhggujn0jE0zEp3vl+ncwpaYqHTjBRvu
 LaBzWUDAKhcHKIitXFspF1nAcglUroUVKnbIZSggK2iZDGGFAAoT6SjtDN9+5zz/8zzP/8Ph
 4Y5Z9FaeMCyKE4UJQlwpe6JWu/T7LpefqwL31PS5oc6HcgyZlKkAacsmcHTXPIIjc20GjvoX
 TBRKUFRQaLFqAkOGpmIM/ZO7HV2/raBQXo+OQJPVbQRSPR0g0bK6DkN96hwK3VdcoZExs5lC
 40+VFCqcrSHQ2OgjEtXn6EjUWNFHIVXfHIkkSUoSXSodp9BMuhlD6uYlAv3V2EmirKUpCk2n
 /0aj4avZBGqWDdCoZDEboO4OLY1q6/QAPeu+BpB0eBig53WrztVTGSSSS/ajxMfeaLCokv7c
 gy3PKwdsg1ZPsY0vCghWrami2HrZCM0WqKLZxPZpklU0/I2xqrIkis1LysNY85VRkm03y2m2
 MC4LZ/N0x9nm3HKaNaR0YF/BE/afBXAhwhhOtPugv/2ZrlePqQgFea6isBSPA9lEMuDxIPMx
 TMw+lgzseY5MCYCJxiIqGditHuYBHFd7WoU5ACX6l4RFsDwwTM1jVqEYwF7pLezNVPuNCcp6
 6AKwuV0O3hinplxcM6aYD2CTTkVb2InZC9P0MtoyhDMPNkJDjha3CJuZA3CiuIGyDh2EPWaN
 jX2g9OIyaWGCcYOX+yvXjPjMl7Ak6eravd1qwTsTGszCgHkHPin9d20GZ1zgkDEfsy6xCcpv
 NuBWdoYr6jHKyp5Q/9AIrLwH1hQ12ZZ+D17WDlJWHy/4KCvTxp/Am89GbP4eUFn4HLf22QR1
 UiNhWQwyEgeo7fnFFnAIKluKbSU2w8mOajodeMrW9ZOty5Cty5Cty5CtyygAZBlw4aLFoUGc
 +KMw7qyXWBAqjg4L8vohPFQFVn9O10rHfB0onpz10gCMBzQA8nBXJ37Cd6pAR36A4MfznCj8
 tCg6hBNrwDYe4erC3xmwg3NkggRRXDDHRXCi/1WMZ7c1DtuXKzzetTB2KP7skQv5MYp7kcEO
 U10d5Mn507t9Q6VkLz3q98WW6Nqoyvrgolu8vD6nJ2HuL6f9NgyZvk478WnOr9sz4etMX9HO
 Pz3294i9DwsrNk6ld294rRe3NCx27go/PJOR4jh0yuOG/21XTUar/UDbgV7/VCpCki8MVbqt
 8Fqb+QvyfZ3c4ivp2/J7pjHjthjDN8HuR4diIvyS0qTO4w8KL5QWLasMe3dIXqSH3z2ypcBn
 LqEtMrLS+aRD2Uhs/x8rg54e46g6+dt47wTfenhde2rEFKg6JpyVv+vS872PPvbScmuBU/xR
 n4E7sUMz597v1N0Xnmf4ppafKOeBt2hXQnxG8KE7LhIL/gNsQvf1qAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0yTVxjO+a6FpNk3LnJGWDY7zIJKodw8ZYozi8tnIlEz54xMWSMFjEBZ
 W9hwLGGBAUXB4kDWDsqlcpWBlEu4s1UpMERgRS4DBhOYRWBCwAUGowPKEv49b85zOc+bvBzc
 Jpd25FyLkIulEaIwHmVNdG92/O7q8HV1sPvKKoE6hwow9LLoFkCGMhOOmszjODLXpeNo4NVL
 CsVrKym0Wm3C0ERrMYb+ynFCd+9rKaTp7yLQi5qHBNJNDZJoo7EeQ8bGbAo91qbSaDqjjUIz
 U0UUyl+qJdAfk8MkasjuIlFLpZFCOuMyiRIVRSRKKp2h0KLSjKHGtjUC/dnSSaLMtXkKLSjb
 aTR6J4tAbepBGpWsZgHU22GgUV19D0DPe78DSDU6CtBc/ZZzzXw6iQoSj6CEMW80UviAfv8Q
 W64pB2yzoYdiW/7OI9hGfTXFNqjHaTZPF8UmPFogWW3zLMbqyhQUq1FoMNacOkmyj8wFNJsf
 l4mzmq5zbFtOOc1O3OzAzsJL/KNSSZRc/HaoRCY/xgsQIA++QIj4Hl5CvsDzyGVfD2+em9/R
 IHHYtWix1M3vM35o9/oYFaklv6zML8XjQBaRAqw4kPGCE/MrWAqw5tgwhQA+HUoDlgcnWLXy
 lLRgW7gxmEJZSEsA9vdVAMvQDWBFajdhGUoAzDYrqG0JxbjA1i4dvY3tGE94u0dNb5Nwpu81
 uDw4vpNhyxyDpuJmykLyg/1m/S72hapvN3ayCcYZJg882DHiMv6wRHGHtKQZAJz9uWnHyGqr
 RZVJj21jwLwJn5X+syPAGQf423QuZinBwHvNvbgF28PZqc3dcodhz9D0bml3WFvYuruZ/TDZ
 MEJZfPhwODNjFwvhD8/Hd/0PwaL8Odzyuddhl2qaUAIn9Z5o9R65eo9cvUeu3iPPA2QZsBNH
 ycJDwmUCvkwULouKCOFflYTrwNal1BnWquuB5sUSXw8wDtADyMF5dtz4T3TBNtwgUcwNsVQS
 KI0KE8v0wHtreem4o/1VydapRcgDBT7u3gIvH6G7t9DHk+fAPRWZLLJhQkRy8XWxOFIs/V+H
 cawc47C2D/+tuh65dkMX/XA9OmkjueLUoqGs3jTmmHog8dzGbIbtV1B9RvIBrnOJqEkNdRVZ
 n77y45x85Hy8dbtNeoJKl7VwOy0hgCMs6ryf9mvzcIje9XM89iRT2XPe5WbDwZJB00/KyxHx
 HrX640EnL8QY+xoPq0xXnsXdU16q+0gVO7Phceb42jv7ueGrvcaPvyjZ1Dz5dOzEKyXXPVeh
 9VkM7r87kipyzAzmD+E5xY+dRB302cwyX+KE6OK66pt+qaQl5pb/AaVU8ktSlfNbdYFF3dDR
 fXT9+2XbnoA3QpwbJt+LbaqlB4z78nP8RYtdF+vs9/kuGC6UNr3bnvkkSKNwKynmEbJQkeAg
 LpWJ/gO+4EoXsgQAAA==
X-CMS-MailID: 20240807135639eucas1p19f1d9712d29bdbfcc447308db0353327
X-Msg-Generator: CA
X-RootMTR: 20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4
References: <20240807-macos-build-support-v1-0-4cd1ded85694@samsung.com>
 <CGME20240807110114eucas1p2e1ca4cbd352c6cd9d60688b1570df8d4@eucas1p2.samsung.com>
 <2024080753-debug-roulette-8cb1@gregkh>
X-Mailman-Approved-At: Wed, 07 Aug 2024 20:21:51 +0000
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

On Wed, Aug 07, 2024 at 01:01:08PM GMT, Greg Kroah-Hartman wrote:
> On Wed, Aug 07, 2024 at 01:09:14AM +0200, Daniel Gomez via B4 Relay wrote=
:
> > This patch set allows for building the Linux kernel for arm64 in macOS =
with
> > LLVM.
>=20
> Is this a requirement somewhere that this must work?  It seems like an
> odd request, what workflows require cross-operating-system builds like
> this?

This isn't a requirement, but it would, for example, support workflows for =
QEMU
users and developers on macOS. They could build/compile the kernel natively=
 and
use it to launch QEMU instances, simplifying their process.

>=20
> thanks,
>=20
> greg k-h=
