Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219277B53D1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 15:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3334710E0BA;
	Mon,  2 Oct 2023 13:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD15210E0BA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 13:24:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B96460C34;
 Mon,  2 Oct 2023 13:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C5A1C433C8;
 Mon,  2 Oct 2023 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696253074;
 bh=SiBXn7oJfwXt/oKihBFUqEUo3m244m5i8lyQ0JMROeI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gl9Uak7jWLynA0VMv4AKjdR1l/hSzS4tQQFQClO5yyZgx7PiwAmI98NxRTfDU+5IQ
 Pe/ITOQoJ3c+R9F1iXSZ2Jj1hz5fXf/J+DuFgwljWb0XrDQrk2WjLembKJigkZf4Ts
 snvKQPwX+hAKao9Mrw219fk7HfP7XehXcZPAPIXVGQM+cwdo+BpZr6op6kvZo51tTT
 yQAauwMu6/0G1r5LUbNUDckTnf5YtM8h++0sy3EKkU0T8/+6IqNEZ8opqSbCy0T6SW
 hFM/nfgebNop+Au8ApO69kQErwgMdmiKJqPx+ob9rbRsrF/tuHCvBFbrsgTl1Bpyfj
 2yeEzbW90zWgQ==
Date: Mon, 2 Oct 2023 15:24:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/5] drm: Reuse temporary memory for format conversion
Message-ID: <whemf4pr5qkkcww6pyzen5di44qvyhktmgt255ijphqufkgqfb@nmyfyfsrxo5k>
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <kvsuwskjydl24euafxnlr52xhozw7ldyut7hjib3sveb7uyo66@pkpncxahqx5l>
 <cf9eb014-8f84-4203-ba4e-a38f2aa7c769@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5hrycvayhttip7xy"
Content-Disposition: inline
In-Reply-To: <cf9eb014-8f84-4203-ba4e-a38f2aa7c769@suse.de>
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


--5hrycvayhttip7xy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 04:58:30PM +0200, Thomas Zimmermann wrote:
> Am 29.09.23 um 14:11 schrieb Maxime Ripard:
> > On Wed, Sep 20, 2023 at 04:24:26PM +0200, Thomas Zimmermann wrote:
> > > DRM's format-conversion helpers require temporary memory. Pass the
> > > buffer from the caller and keep it allocated over several calls. Allow
> > > the caller to preallocate the buffer memory.
> > >=20
> > > The motivation for this patchset is the recent work on a DRM panic
> > > handler. The panic handler requires format conversion to display an
> > > error to the screen. But allocating memory during kernel panics is
> > > fragile. The changes in this patchset enable the DRM panic handler to
> > > preallocate buffer storage before the panic occurs.
> > >=20
> > > As an additonal benefit, drivers can now keep the temporary storage
> > > across multiple display updates. Avoiding memory allocation reduces
> > > the CPU overhead of the format helpers.
> >=20
> > This argument is getting a bit tiring. The main reason is that it isn't
> > one, and:
>=20
> CPU overhead isn't the driver behind this patchset, but if it is affected,
> why not say that in the commit message?

Any patch affects the CPU overhead then, one way or the other.

> There's a alloc/free pair for each updated scanline. For a full-screen
> updates, that's quite a bit.
>
> >=20
> >    - we allocate something in the 10-20 range objects at a given commit,
> >      so another small one is not insignificant.
> >=20
> >    - If it was, it would be trivial to produce a benchmark, but no-one
> >      ever actually showed a workload and numbers where there's actually
> >      any difference.
> >=20
> >    - Also, the CPU overhead is indeed (even if marginally) decreased, b=
ut
> >      the memory overhead is increased. I don't know whether that's a go=
od
> >      trade-off or not, see the point above.
> >=20
> > It really sounds like an empty statement to me: "But just think of the
> > CPU!".
> >=20
> > That being said, I also have more fundamental doubts about this series.
> >=20
> > The first one is that storing the buffer pointer in the device instead
> > of the state makes it harder to reason about. When you have a state, the
> > framework provides the guarantee at commit time that there's only going
> > to be one at a given time. And since the buffer is stored in that state
> > object, you can't access it by mistake. The buffer size also depends on
> > the state, so that all makes sense from a logical PoV.
>=20
> Yes. I discussed this with Javier already. Putting this into the state is
> the clean solution.
>=20
> >=20
> > If we store the buffer into the device, then suddenly you have to think
> > about whether there's multiple CRTCs or not (since commits aren't
> > serialised if they affect different CRTCs), whether the buffer size you
> > allocated is large enough now for your current resolution and format,
> > etc. It adds a decent chunk of complexity on something that was quite
> > complex already.
>=20
> It's in the device because it's good enough for these simple drivers. The
> next best place would be a dedicated plane structure in each driver. The
> per-plane cache would then be clearly attributed to a single plane.

Right, but you still need to think about all that before figuring it
out. And we now have simple drivers very likely to be used as an example
unsafe-but-actually-aren't. When copied and pasted into a different
context, it might not be safe anymore. And since those copy/pasting that
code are super experienced, they won't know about it.

> > I understand that the motivation is for drm_panic to have a buffer ready
> > when it has to kick in. But why don't we just allocate (and check) a
> > spare commit at probe time so we just have to commit it when we panic.
>=20
> DRM panic doesn't commit anything. It picks up whatever the current scano=
ut
> buffer is and draws into that. If the DRM driver cannot provide a scanout
> buffer, DRM panic does nothing.

My point is that it could do a commit if we have prepared everything. Or
we could steal the current buffer. Or we could pre-allocate a dumb
buffer for every device. You'll have to interact the state anyway for
any proper driver, and I don't think just allocating it here like you do
is safe and enough.

Maxime

--5hrycvayhttip7xy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRrEjwAKCRDj7w1vZxhR
xZR9AQCjfRVLysGjGgQFSPlMbYxng21Gk97uE8heJtOrlEoJjwD/YzlwKL+8rFyw
+1gb+U0Liq7vkoPSho2eUk8cKu/dLQY=
=T0Ba
-----END PGP SIGNATURE-----

--5hrycvayhttip7xy--
