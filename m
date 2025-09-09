Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53D2B50135
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 17:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D36A10E79B;
	Tue,  9 Sep 2025 15:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.b="mwh+wD9p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xry111.site (xry111.site [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D978210E0DB;
 Tue,  9 Sep 2025 02:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
 s=default; t=1757383337;
 bh=zcmpcw0mekrXcR6rkLebx4OWUdSHyk73nm9XQs6nR5E=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=mwh+wD9pqb74xXaSeUW0Fy4iOx+0uACLhjsiWm+anmJ9h85Kmbz1NMEAHsXYtQWVH
 IKCeXHS5cncmv/E1+oAd3eDpkO9aoc2Y8jSca6um59hYQNYspm8As1xpC5954/PgYA
 KeT3BBkec8hgk7HOa9qB4WdsDrAXR/HxCoq9GuRQ=
Received: from [127.0.0.1]
 (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com
 [IPv6:2607:8700:5500:e873::1001])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (Client did not present a certificate)
 (Authenticated sender: xry111@xry111.site)
 by xry111.site (Postfix) with ESMTPSA id 18F2866983;
 Mon,  8 Sep 2025 22:02:13 -0400 (EDT)
Message-ID: <6f0857ec48e7d1aab55f5e1cc923d9b5086af6c2.camel@xry111.site>
Subject: Re: [PATCH] drm/amd/display/dml2: Guard
 dml21_map_dc_state_into_dml_display_cfg with DC_FP_START
From: Xi Ruoyao <xry111@xry111.site>
To: Alex Hung <alex.hung@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Mingcong Bai <jeffbai@aosc.io>,
 dri-devel@lists.freedesktop.org, 	loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Asiacn <710187964@qq.com>,  Austin Zheng
 <Austin.Zheng@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, Wenjing
 Liu	 <wenjing.liu@amd.com>
Date: Tue, 09 Sep 2025 10:02:12 +0800
In-Reply-To: <25fcd3b5c1a415deb8358714279a7d532e26ed47.camel@xry111.site>
References: <20250825085211.34396-1-xry111@xry111.site>
 <0f6b54fa-720f-43b7-ad74-91c2c5700dad@amd.com>
 <25fcd3b5c1a415deb8358714279a7d532e26ed47.camel@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Sep 2025 15:29:21 +0000
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

On Tue, 2025-09-09 at 09:47 +0800, Xi Ruoyao wrote:
> On Mon, 2025-09-08 at 14:18 -0600, Alex Hung wrote:
> >=20
> >=20
> > On 8/25/25 02:52, Xi Ruoyao wrote:
> > > dml21_map_dc_state_into_dml_display_cfg calls (the call is usually
> > > inlined by the compiler) populate_dml21_surface_config_from_plane_sta=
te
> > > and populate_dml21_plane_config_from_plane_state which may use FPU.=
=C2=A0 In
> > > a x86-64 build:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0 $ objdump --disassemble=3Ddml21_map_dc_state=
_into_dml_display_cfg \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 > drivers/gpu/drm/amd/display/dc/dml2/dml21/=
dml21_translation_helper.o |
> > > =C2=A0=C2=A0=C2=A0=C2=A0 > grep %xmm -c
> > > =C2=A0=C2=A0=C2=A0=C2=A0 63
> > >=20
> > > Thus it needs to be guarded with DC_FP_START.=C2=A0 But we must note =
that the
> > > current code quality of the in-kernel FPU use in AMD dml2 is very muc=
h
> > > problematic: we are actually calling DC_FP_START in dml21_wrapper.c
> > > here, and this translation unit is built with CC_FLAGS_FPU.=C2=A0 Str=
ictly
> > > speaking this does not make any sense: with CC_FLAGS_FPU the compiler=
 is
> > > allowed to generate FPU uses anywhere in the translated code, perhaps
> > > out of the DC_FP_START guard.=C2=A0 This problematic pattern also occ=
urs in
> > > at least dml2_wrapper.c, dcn35_fpu.c, and dcn351_fpu.c.=C2=A0 Thus we=
 really
> >=20
> > Let me share Austin's comments below:
> >=20
> > "
> > Both CC_FLAGS_FPU and DC_FP_START are required for FPU usage.
> >=20
> > CC_FLAGS_FPU allows the compiler to generate FPU code whereas=20
> > DC_FP_START ensures that the FPU registers don't get tainted during run=
time.
>=20
> But the correct pattern would be: isolating the code using FPU into its
> own translation unit, say xxx_fp.c, then call DC_FP_START in another
> translation unit (for which CC_FLAGS_FPU is NOT used) before calling the
> routines in xxx_fp.c.
>=20
> It's because there's generally no way to guarantee the compiler only
> generate FP code in the range of DC_FP_START ... DC_FP_END if
> CC_FLAGS_FPU is used.=C2=A0 The compiler can generate FPU code in situati=
ons
> we don't intend to use (and don't anticipate) FPU, for example if a
> "counting number of ones in a word" pattern is detected when the code is
> built for LoongArch, the compiler can invoke FPU to use a popcount
> instruction with CC_FLAGS_FPU.=C2=A0 (That doesn't really happen now but =
it
> may happen in the future.)
>=20
> And the correct pattern is already used by, for example
> dcn10_resource.c:
>=20
> =C2=A0=C2=A0=C2=A0 DC_FP_START();
> =C2=A0=C2=A0=C2=A0 voltage_supported =3D dcn_validate_bandwidth(dc, conte=
xt, validate_mode);
> =C2=A0=C2=A0=C2=A0 DC_FP_END();
>=20
> Here dcn_validate_bandwidth is in dcn_calcs.c where CC_FLAGS_FPU is in-
> effect, but dcn10_resource.c itself is not built with CC_FLAGS_FPU.

And the correct pattern is already documented and explained in
dcn20_fpu.c:

 * 4. Developers **must not** use DC_FP_START/END in this file, but they ne=
ed
 *    to ensure that the caller invokes it before access any function avail=
able
 *    in this file. For this reason, public functions in this file must inv=
oke
 *    dc_assert_fp_enabled();
 *
 * Let's expand a little bit more the idea in the code pattern. To fully
 * isolate FPU operations in a single place, we must avoid situations where
 * compilers spill FP values to registers due to FP enable in a specific C
 * file. Note that even if we isolate all FPU functions in a single file an=
d
 * call its interface from other files, the compiler might enable the use o=
f
 * FPU before we call DC_FP_START. Nevertheless, it is the programmer's
 * responsibility to invoke DC_FP_START/END in the correct place. To highli=
ght
 * situations where developers forgot to use the FP protection before calli=
ng
 * the DC FPU interface functions, we introduce a helper that checks if the
 * function is invoked under FP protection. If not, it will trigger a kerne=
l
 * warning.

--=20
Xi Ruoyao <xry111@xry111.site>
