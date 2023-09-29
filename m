Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D704D7B3213
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 14:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61C210E6F7;
	Fri, 29 Sep 2023 12:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E966510E6F7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 12:11:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id ED9E6B81E98;
 Fri, 29 Sep 2023 12:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD47C433C7;
 Fri, 29 Sep 2023 12:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695989508;
 bh=7llwjFO+dxUi/huSZU2WLo870SM7QRmuI/Itmu2MVAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XU8d4om8Efh6c0MLE3KzdQECCvzRwxe7t6lrUa3x74YtfQ09pnDXitJspEOjMXDyw
 L88BssFM08i0hXssY60GvZJFjaHr64CLTMf3u0hIrI41KWz7GHUVbaOOH+X6Vm7Jsl
 L3F7QcftgwpWTv5b/V8f0WVqVePuAgOqzHyJPgtGQSHV6JM8W+3ZlLF8GbWkGp47Ky
 qzIKYj70jyn6NR74hYkZrg4Xf84IXRag3iv9wVfKdycxrtIA3x5iiN81r/AFxf5TsQ
 VMN7qFIIfdeYE1gkxkyYJfoVzHjjjjkooCmrvTeFVAamCooAhDlT+aZkYlMFsSfzXI
 8as5sIUA7szZw==
Date: Fri, 29 Sep 2023 14:11:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/5] drm: Reuse temporary memory for format conversion
Message-ID: <kvsuwskjydl24euafxnlr52xhozw7ldyut7hjib3sveb7uyo66@pkpncxahqx5l>
References: <20230920142535.19321-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k3uojjy4vtmhvyda"
Content-Disposition: inline
In-Reply-To: <20230920142535.19321-1-tzimmermann@suse.de>
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


--k3uojjy4vtmhvyda
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 04:24:26PM +0200, Thomas Zimmermann wrote:
> DRM's format-conversion helpers require temporary memory. Pass the
> buffer from the caller and keep it allocated over several calls. Allow
> the caller to preallocate the buffer memory.
>=20
> The motivation for this patchset is the recent work on a DRM panic
> handler. The panic handler requires format conversion to display an
> error to the screen. But allocating memory during kernel panics is
> fragile. The changes in this patchset enable the DRM panic handler to
> preallocate buffer storage before the panic occurs.
>=20
> As an additonal benefit, drivers can now keep the temporary storage
> across multiple display updates. Avoiding memory allocation reduces
> the CPU overhead of the format helpers.

This argument is getting a bit tiring. The main reason is that it isn't
one, and:

  - we allocate something in the 10-20 range objects at a given commit,
    so another small one is not insignificant.

  - If it was, it would be trivial to produce a benchmark, but no-one
    ever actually showed a workload and numbers where there's actually
    any difference.

  - Also, the CPU overhead is indeed (even if marginally) decreased, but
    the memory overhead is increased. I don't know whether that's a good
    trade-off or not, see the point above.

It really sounds like an empty statement to me: "But just think of the
CPU!".

That being said, I also have more fundamental doubts about this series.

The first one is that storing the buffer pointer in the device instead
of the state makes it harder to reason about. When you have a state, the
framework provides the guarantee at commit time that there's only going
to be one at a given time. And since the buffer is stored in that state
object, you can't access it by mistake. The buffer size also depends on
the state, so that all makes sense from a logical PoV.

If we store the buffer into the device, then suddenly you have to think
about whether there's multiple CRTCs or not (since commits aren't
serialised if they affect different CRTCs), whether the buffer size you
allocated is large enough now for your current resolution and format,
etc. It adds a decent chunk of complexity on something that was quite
complex already.

I understand that the motivation is for drm_panic to have a buffer ready
when it has to kick in. But why don't we just allocate (and check) a
spare commit at probe time so we just have to commit it when we panic.

That would fall nicely into the rest of the atomic modesetting code, and
since we pretty much require not to allocate anything during
atomic_commit, we have that constraints already figured out.

Maxime

--k3uojjy4vtmhvyda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRa/AQAKCRDj7w1vZxhR
xbpVAP9/wZ18+t+IhkCWC8QTeb7Aq1ifQehcBFf4nLLsBvLG1gEAkkT86GrQTRDS
0XGd/7Btjds1a6x9LI81tDSg2aA5Ago=
=4qZ7
-----END PGP SIGNATURE-----

--k3uojjy4vtmhvyda--
