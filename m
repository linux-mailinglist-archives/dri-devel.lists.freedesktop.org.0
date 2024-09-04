Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF4196B20B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 08:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5477E10E400;
	Wed,  4 Sep 2024 06:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="ANVsBlFL";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="sqm09y4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D6A10E400
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1725432225; x=1756968225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oZ9nwWS0YNp+mLVTCNW4ilThXDRVNQPwZwdjxyjZJOI=;
 b=ANVsBlFLhmrI26R/QL9BoftvmwRgkMZ2k/Qhnlt1huS5nsi6Rx5gotDi
 lrFK9ChNsh/WDDWY6zsQ6YyhGe0M+14DwMFR+hbh7R+4lV+XhxuR0cNqw
 5by94ytKj0sNdL/R0koyHZhwroI1aKCROFtsQ3P9kKdPq/e6oLr2h3Zdr
 LqKA/Dh8DFZn6y614XColmkXgTP0NxHuFtIL9mVDFc0H5NcpQzo6k1E6u
 e1ktsdJtfQVrqYD+d9I8FuoXjP3rgDhENrr0YzyMEI+vqU8fLmzt613oo
 j4SJDhiqh3SEVLm/g0nw8SPHEfOPTRh1GHlJs14IbLXhq0+FxeXz3r5TW A==;
X-CSE-ConnectionGUID: 22/jB1P2RaugFwhcH9Cz1w==
X-CSE-MsgGUID: XrJmGhVAQpOOxVKlTo+xmg==
X-IronPort-AV: E=Sophos;i="6.10,201,1719871200"; d="scan'208";a="38751339"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Sep 2024 08:43:43 +0200
X-CheckPoint: {66D8019F-1D-6568578B-E2E34638}
X-MAIL-CPID: 86606A6CE1EDE36F4DC495A0162270C5_3
X-Control-Analysis: str=0001.0A782F1C.66D801A0.001F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 871F716532F; Wed,  4 Sep 2024 08:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1725432219;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oZ9nwWS0YNp+mLVTCNW4ilThXDRVNQPwZwdjxyjZJOI=;
 b=sqm09y4xUTNuMAKS9iPLDLbyeU++muVKRGmAFKz4ma2XrogufJCdKCnOuUo5ZRsAQDjERb
 KuiPJjVLU+7tt+n7DBbxOD8y21IQaq59iIixYqVCsGo5veZjsJxyKhJmJi5ScDNO+7ohDk
 Nmtl96N2q7+0UrJOn21wDBrcCU5TdWNcTdE8ITkg85wgk4xiBB8hMI3v10wad07BiQt4g4
 srP9a+B9TEWUXUCl2xap0Perx53GQcEXC1W1gy0BV0qSINTi4sH/3THUsk4qJtJpMxSDpq
 Acj4U1Y+2MArPvLzt2irRe9GoZwFqTbjcVbYEOnNcGVD7GiLM1dodhLuBvpyDw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 21/43] drm/fbdev-dma: Implement damage handling and
 deferred I/O
Date: Wed, 04 Sep 2024 08:43:37 +0200
Message-ID: <4596037.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CACRpkdbJEv7pV_LOZO_2s_otSth9EYM7=fH9VPgxUyPom_BZ4Q@mail.gmail.com>
References: <20240419083331.7761-1-tzimmermann@suse.de>
 <12510239.O9o76ZdvQC@steina-w>
 <CACRpkdbJEv7pV_LOZO_2s_otSth9EYM7=fH9VPgxUyPom_BZ4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Linus,

Am Mittwoch, 4. September 2024, 08:36:46 CEST schrieb Linus Walleij:
> On Wed, Sep 4, 2024 at 8:09=E2=80=AFAM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
>=20
> > Can you please check in which memory zone this VRAM is located. In my c=
ase
> > it's important CMA is located in Normal zone to trigger this problem.
>=20
> dmesg says this:
>=20
> Reserved memory: created DMA memory pool at 0x18000000, size 8 MiB
> OF: reserved mem: initialized node vram@18000000, compatible id shared-dm=
a-pool
> OF: reserved mem: 0x18000000..0x187fffff (8192 KiB) nomap non-reusable
> vram@18000000
> cma: Reserved 16 MiB at 0xef000000 on node -1
> Zone ranges:
>   Normal   [mem 0x0000000080000000-0x00000000efffffff]
> Movable zone start for each node
> Early memory node ranges
>   node   0: [mem 0x0000000080000000-0x00000000efffffff]
> Initmem setup node 0 [mem 0x0000000080000000-0x00000000efffffff]
> percpu: Embedded 15 pages/cpu s39052 r0 d22388 u61440
>=20
> So at the top of the normal zone at 0xef000000 as I read it.

Okay, so it is the same as for me. It seems you don't have any HighMem.
On a different model having more memory there is also HighMem available:

[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000010000000-0x000000003fffffff]
[    0.000000]   HighMem  [mem 0x0000000040000000-0x000000004fffffff]

If I explicitly configure CMA in HighMem I don't have any issues.
But the 512MiB models don't have enough memory for fixed allocation in High=
Mem.

I was about to send a revert myself as I didn't get any feedback yet.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


