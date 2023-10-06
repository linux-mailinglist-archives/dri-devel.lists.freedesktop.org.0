Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C79827BBACC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 16:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED96B10E507;
	Fri,  6 Oct 2023 14:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BC310E507
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 14:49:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0096960EC2;
 Fri,  6 Oct 2023 14:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F930C433C7;
 Fri,  6 Oct 2023 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696603784;
 bh=Ec25Rk0aaiTKAFv6uPcPQ7KEBj4Dq0aHRgdKbZ/UaIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FGuz3enX8Rwcxn/tUjfdR6TX83fIV3fTxPe8qbKUXkDUmIFtlYPqGTsKvuie0HKmk
 yNTDfjGDLsdFJeppggqASizmBOER+fDiu9iRukE0VeHrH5vYNMmIE1eabGqLIsINAS
 7TX94b0ivkNSuCTfC3EWGlbHEybuPmVrAK8QSMlOCGrsdNu5A30f1NtjrOlIQ0EPBr
 JD8ptUSIQMF+cCEqRlFxAiiK4KINLggmVvhnT8gpYPPvd1bplbqU9D9PPDw5hxDUHV
 zdQ1hDb0ppqwOckfWB6B9drxmuH5whtd3V/Sx7/7K32buJr/Xc6O8lq4eC2I9eKDwT
 flaUW1YzkqPmA==
Date: Fri, 6 Oct 2023 16:49:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/7] drm: Reuse temporary memory for format conversion
Message-ID: <ozoizmezbyhwtnsyxahdoibpkwm2gvxnclw5gyt5j257demgpd@3efr2ioqhgg2>
References: <20231005090520.16511-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vhw3jh47qs4ze4i5"
Content-Disposition: inline
In-Reply-To: <20231005090520.16511-1-tzimmermann@suse.de>
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
Cc: jfalempe@redhat.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, noralf@tronnes.org, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vhw3jh47qs4ze4i5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 05, 2023 at 11:04:20AM +0200, Thomas Zimmermann wrote:
> DRM's format-conversion helpers require temporary memory. Pass the
> buffer from the caller and keep it allocated over several calls. Allow
> the caller to preallocate the buffer memory.

I'm sorry... but why? Why do you need to keep it allocated over several
calls and preallocate the buffer? It's not clear to me at all.

> The motivation for this patchset is the recent work on a DRM panic
> handler. [1] The panic handler requires format conversion to display an
> error to the screen. But allocating memory during kernel panics is
> fragile.

We agree that we shouldn't allocate memory during the panic. I still
have concerns about how the panic handler will handle the driver
currently set up for a plane that isn't using an RGB format, or a buffer
not accessible by the kernel or CPU.

You can't expect to get away with just a copy to the current active
buffer.

If that's the assumption that underlines that patch series, then I don't
know why we need it at all, because that assumption is wrong to begin
with, and way too restrictive.

> The changes in this patchset enable the DRM panic handler to
> preallocate buffer storage before the panic occurs.
>=20
> As an additonal benefit, drivers can now keep the temporary storage
> across multiple updates. Avoiding memory allocation slightly reduces
> the CPU overhead of the format helpers.

I'm sorry to go over that again, but you can't write a performance
improvement mechanism without some kind of benchmark. kmalloc has
built-in caching, why do we absolutely need our own cache on top of it?

If you never measured it, for all we know, we simply don't need it and
kmalloc is good enough.

Maxime

--vhw3jh47qs4ze4i5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSAehgAKCRDj7w1vZxhR
xcEMAQD/vffXZ/JnP3mqi4VmA9LKtrlq/aMAT55FIx//v5tzvQEAvXeLIG6BXwly
S6c0LUcguWp9c1D7As0ql8kb2mR3vQ0=
=WfUq
-----END PGP SIGNATURE-----

--vhw3jh47qs4ze4i5--
