Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BA77E6AA9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 13:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE8710E206;
	Thu,  9 Nov 2023 12:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CED010E206
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 12:35:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B256D617E3;
 Thu,  9 Nov 2023 12:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF98C433C8;
 Thu,  9 Nov 2023 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699533357;
 bh=7h2+xf4fPPpT6aVQcLt3UUebBSZaOO1kv/vER25O/D8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MBITUer2FbxOVm++rN+/xoYP7f1IrAqijliOQsOZCCwEf7ySyRL1kIEOHxeNE9Rgn
 kBf2jL7Memn/zv9JN5TuBMAt6nfUXSCSqKUxHRgvvieSlnlC70n90+CUNfmKzWKv0o
 XRHxwxNJwdRpPhcMIhiBYrR44d7eqLDzDFNbgk2lgXBwUmacefD7IjltOvXUMAG+oE
 ZfdmNrDrsmXFAEff18NZXMq4CDZPAo7CRV0ZDqwFfD8f6fiFmfoiv/vEkW7KguDpt7
 t5xBwTkeSuZ2ILGrzpe1e+jIKTzL8+pufxvWTUPgCoKd03pmBgr9oUsUATCrskVFEL
 +OLFHLckOVNhw==
Date: Thu, 9 Nov 2023 13:35:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Maira Canal <mcanal@igalia.com>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
Message-ID: <xq5fdh327xr2mbssiwylnxnf4tctvca3nst6xj5nn43qoqjafe@7mr2sfmdpqic>
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <171f9c48-d080-944d-d24e-0f7cf341ea8e@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="67qajsbnnkytcj73"
Content-Disposition: inline
In-Reply-To: <171f9c48-d080-944d-d24e-0f7cf341ea8e@igalia.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--67qajsbnnkytcj73
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maira,

On Thu, Nov 09, 2023 at 09:14:29AM -0300, Maira Canal wrote:
> On 11/9/23 04:45, Simon Ser wrote:
> > User-space sometimes needs to allocate scanout-capable memory for
> > GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> > is achieved via DRM dumb buffers: the v3d user-space driver opens
> > the primary vc4 node, allocates a DRM dumb buffer there, exports it
> > as a DMA-BUF, imports it into the v3d render node, and renders to it.
> >=20
> > However, DRM dumb buffers are only meant for CPU rendering, they are
> > not intended to be used for GPU rendering. Primary nodes should only
> > be used for mode-setting purposes, other programs should not attempt
> > to open it. Moreover, opening the primary node is already broken on
> > some setups: systemd grants permission to open primary nodes to
> > physically logged in users, but this breaks when the user is not
> > physically logged in (e.g. headless setup) and when the distribution
> > is using a different init (e.g. Alpine Linux uses openrc).
> >=20
> > We need an alternate way for v3d to allocate scanout-capable memory.
>=20
> For me, it is a bit unclear how we import the vc4 DMA-BUF heap into v3d.
> Should we create an IOCTL for it on v3d?

dma-heaps are separate device files (under /dev/dma_heap) that have
their specific uapi to allocate buffers:
https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-heap.c#L=
126

You then get a dma-buf handle you can import into whatever device you
want.

Maxime

--67qajsbnnkytcj73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUzSJQAKCRDj7w1vZxhR
xWq5AQDnBJrkqosVaQRzSsvkbCnOvIpZ+HcMZzx3FvANYgDVOQEA+WXQ7ewbmnNF
MwfyugiY5ITq8ONu3poKLG4YvPxsCwg=
=limw
-----END PGP SIGNATURE-----

--67qajsbnnkytcj73--
