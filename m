Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC17CED25
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 03:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FDD10E462;
	Thu, 19 Oct 2023 01:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C380310E462
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 01:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1697677581;
 bh=qI3z6q1s/kcUv15ANbLLzybgRpzqS1ETuO7M0rX3Iio=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fdt7OpZBljd3Ar+Ua73JJ1Y4YjomRhBDuWkHlkCY93T/79skv0r+CTckcHeY+HB4m
 bvBX/B104RcWfA9d6he+rng9Su4W2wQxyC1vr83WEBczIHP0rWd2elQfMjDmhl0iuH
 nO4bV99CwSqaK8zwlV7VBdWh21xQgK5tIkFed+AnyS3KDWVGaw8mF1KqHKq2WxJ2H9
 vRt7Jz37Gy6f87V366It9uiYp51UUC87qkJg5zfl5ZYKS7/ydRFyBc6KDVNTVn2hhV
 qs9VLc5LgEtL3G12cvs3xz4g8QyyNTseRqQCwTdnbvqIhMJFPY+mNAbW02t5L+t3wl
 +we+qHB8f/a0g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9qKl6p9Gz4wcN;
 Thu, 19 Oct 2023 12:06:19 +1100 (AEDT)
Date: Thu, 19 Oct 2023 12:06:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20231019120618.71424848@canb.auug.org.au>
In-Reply-To: <20231010124357.5251e100@canb.auug.org.au>
References: <20231010124357.5251e100@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EvzrEbQXDf=esYQTxghpS2q";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/EvzrEbQXDf=esYQTxghpS2q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 10 Oct 2023 12:43:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In fun=
ction 'dml_core_mode_support':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:8229:1:=
 error: the frame size of 2736 bytes is larger than 2048 bytes [-Werror=3Df=
rame-larger-than=3D]
>  8229 | } // dml_core_mode_support
>       | ^
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   7966f319c66d ("drm/amd/display: Introduce DML2")
>=20
> (or maybe something later that changed storage size).
>=20
> I have used the amdgpu tree from next-20231009 for today.

This build failure now (presumably) exists in the drm tree.  I am still
applying the 2 patches from Rodrigo to my tree as a work around.

I would have expected that this was fixed in the amdgpu tree before
Dave was asked to merge it ...
--=20
Cheers,
Stephen Rothwell

--Sig_/EvzrEbQXDf=esYQTxghpS2q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUwgQoACgkQAVBC80lX
0GwQXAgAkVWIBBZuVsrW2Ci7iYuETWMRJU6ZRAJdcR+EICRaoPi2FOpYQ3hbmZAr
zk0GnevzSy0db8RSKyXIQOqB4THKKtDepqNSsxUN9PenwCvjtNg/DeYeZoB6pQ4D
0/0qQgYImc5OKZfOJtqPBmBxl8pIStcs2RjmUXttz+F/Q5RYnXWtLm0McfrlqbI3
HRxHBu+KYyiH7QZ/AN06HjQXGlIBs1Ynp+9kJ1dLpz76LB2KZx+QxEcMf9lYpVgA
bT7oSS54vbHDW41VtZOeZ4fjx8zGCfFubwb/u5pC2D83ilNWEiHoXQ5meqdfK0IT
pAwgc2ZI1zm+/M1j0L7pfzUuUcTdAw==
=x90u
-----END PGP SIGNATURE-----

--Sig_/EvzrEbQXDf=esYQTxghpS2q--
