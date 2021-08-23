Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BABAD3F53B0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 01:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0633893C9;
	Mon, 23 Aug 2021 23:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A79893C9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 23:36:48 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtpY73x2rz9sW8;
 Tue, 24 Aug 2021 09:36:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1629761806;
 bh=hvLMigJIqx6oXYqrSl36W6Pn5wU2BQgJ6YZdidwL3uY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E4MhkrfZ5zdRIFicK6xmeCWs/qAfM6hglO0AqWDkFYD2vSGoij3bf900tOxkfNQ5T
 aQbGYLBm3/ttNWgJQKYcd4wyUMtCIjaXu68kxsPSSnJhDpOLlmaxMclSH9qv2+FuPW
 SLNU0JbRdgWtoabtSiBG2W/pieq3kkGcBZ1CgOWGvQd3y1BGyzOS/r0dcWaA+e+PxG
 NfHGW8peri9fD56Ht+vT2V9duDni85mvguGN2kxiSEop8xJxGiZcg+4/pq/+l7rrtQ
 IRURJcof3C4gn5dnbMSeEPXxcWCmKrh9U4Qig/wyOD/VNakmEjOiqPguoCRZ8gNtNE
 KRK9EAJVq0CdA==
Date: Tue, 24 Aug 2021 09:36:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@linux.ie>
Cc: Guenter Roeck <linux@roeck-us.net>, "linux-next@vger.kernel.org"
 <linux-next@vger.kernel.org>, Jason Ekstrand <jason@jlekstrand.net>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: Notable build failures in next-20210823
Message-ID: <20210824093642.05859341@canb.auug.org.au>
In-Reply-To: <291c0a6a-5285-0b63-21cd-f6aaff4e6727@roeck-us.net>
References: <291c0a6a-5285-0b63-21cd-f6aaff4e6727@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EDnFl_fLuSEELseFgGpPDcm";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/EDnFl_fLuSEELseFgGpPDcm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi allr,

On Mon, 23 Aug 2021 08:47:38 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
>
> Seen in next-20210823:
>=20
> Building x86_64:allyesconfig ... failed
>=20
> drivers/gpu/drm/i915/i915_module.c:50:11: error:
> 	positional initialization of field in 'struct' declared with 'designated=
_init' attribute
>=20
> This only happens with CONFIG_GCC_PLUGIN_RANDSTRUCT=3Dy.

Caused by commit

  a04ea6ae7c67 ("drm/i915: Use a table for i915_init/exit (v2)")

and then moved to this file by

  708b7df3480a ("drm/i915: Extract i915_module.c")

from the drm tree.

CONFIG_GCC_PLUGIN_RANDSTRUCT help says

	  If you say Y here, the layouts of structures that are entirely
          function pointers (and have not been manually annotated with
          __no_randomize_layout), or structures that have been explicitly
          marked with __randomize_layout, will be randomized at compile-tim=
e.

--=20
Cheers,
Stephen Rothwell

--Sig_/EDnFl_fLuSEELseFgGpPDcm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEkMQoACgkQAVBC80lX
0GxorwgAlAfEcwn9DTxDIWlC6ZXiFh17QQkmWYxKRbqt/XjCG0n6fPRGCUK+nF4p
L98y4AqTqsblpRtvafAvLS7nErSjDR4nGDtMhLdcgWFlVUdO40SAP54SHdwTcRvx
xZH9p6K+nSfQ5CvFgixlSdxnV/CLVlG37eZBa8wjnbVWgPLfBBRpyrBM9cN5+M1h
C87hNRdOIstRGFCZ4v3OtYbzoBrBkH67Mi0y1Y3mYrSwwgV+sVtxzyAht9/FP4Yh
tSgre1B2NgPvka/S84YYVrpfKeGmuOyFK5x7w0QD9HqbsNY46fHNsN5lJCMNe4b8
haGp8CTVgJwHI5KGtVgKaZzZSQVleQ==
=qVeC
-----END PGP SIGNATURE-----

--Sig_/EDnFl_fLuSEELseFgGpPDcm--
