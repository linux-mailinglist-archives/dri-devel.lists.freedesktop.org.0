Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D11CD7FEA7B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 09:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D0510E22E;
	Thu, 30 Nov 2023 08:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C667F10E22E;
 Thu, 30 Nov 2023 08:27:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 57E1EB841F6;
 Thu, 30 Nov 2023 08:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496A1C433C7;
 Thu, 30 Nov 2023 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701332827;
 bh=AVPr5QEXIbplSm1/AOQkNsZ7+EYuGbAVBfNp5Jit/NU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aqeemkyzYxzUb4DFNt2IWN1M7NTo6NHpsb6fmEMKF5RNEs0zSQcWF0XuIsKeh8rBN
 uX2c9fmeIj8te8eqWuWR87eu1mui3sw39O8gOFlPJjRNSfEbJE3ySBHYB9CoYRgwtj
 dDe8W3JSB/jjeceJ3IrgsKqG3zEwdcgM+7T1bGSr+5Jz5BZh9AvqS7p5P8PmK2dYIF
 kOK8KVyqmFHSfHN8AmqlLEWbTCZQHBKNgVT/FMwbRut6xPw2cvS3M3chktTgBgGII+
 nBte7sYXta9WJo/pI8UpDWysdPpiMiTXDN5wuVdbp/YAzJFH55HzFwYAq0bYThrUDW
 GS9CbVx35kW+w==
Date: Thu, 30 Nov 2023 08:27:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231130-pellet-parted-4c3854bda573@spud>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="skPAiwM3XKXsb30B"
Content-Disposition: inline
In-Reply-To: <20231130004224.GE2513828@dev-arch.thelio-3990X>
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
Cc: llvm@lists.linux.dev, arnd@arndb.de, Leo Li <sunpeng.li@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-riscv@lists.infradead.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--skPAiwM3XKXsb30B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 05:42:24PM -0700, Nathan Chancellor wrote:
> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
> > On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> > > RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> > > architectures. Enabling hardware FP requires overriding the ISA string
> > > for the relevant compilation units.
> >=20
> > Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
> > ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_=
32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than]
>=20
> :(
>=20
> > Nathan, have you given up on these being sorted out?
>=20
> Does your configuration have KASAN (I don't think RISC-V supports
> KCSAN)? It is possible that dml/dcn32 needs something similar to commit
> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
> or KCSAN in dml2")?

It's from allmodconfig, so yes, I think so.


--skPAiwM3XKXsb30B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWhHVQAKCRB4tDGHoIJi
0ktTAP4zJtbMBMKEDeq0u/9g0c5SQ8z5cOnNzWWYN7sZHhwFyAEA8RLHzYprTbaE
YZSEx6U8yszQOIViwBKWPBZ/OyRTWAo=
=98lz
-----END PGP SIGNATURE-----

--skPAiwM3XKXsb30B--
