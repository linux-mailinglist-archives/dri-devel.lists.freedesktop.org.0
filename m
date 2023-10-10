Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C244A7BF7F2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 11:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3023210E156;
	Tue, 10 Oct 2023 09:55:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE8E10E156
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 09:55:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5F60BB81B6B;
 Tue, 10 Oct 2023 09:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690F0C433C7;
 Tue, 10 Oct 2023 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696931702;
 bh=oDr3O6+l+YWjoydO5TRcIVJ64551cZEGsiw9mrbca0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjYRlGltx9K1W4DJRVwgKS191fs1FPqWe8kfxWdHpoAy7JVw7i1g3Wc6z6lAWBC0Z
 WfXKV4m4Ek6HmEDps4v8zLGKFpye7wTllPxZ07UzPSgBfXoygsKQ6iRCsZFPATUsWS
 wAl3I6U9fWSykutBwzoLJ9VeiuqH1EihINGMEDsO0dF281bhdOC5DRb7QDPFhUBIg+
 2x3XaJaw/3sCnnjHb5er2v1mewPuybzE+wNjR0fF6FBXyOchEaYhpP++tdQw4kDNNm
 5wbfolD1b8KO+bHQgf2IboR1WCP75XQ+h5e/wwAkoOXCFYaP2aiueKwqQ6Z5G17Jc5
 H3QKbPcTnGB6w==
Date: Tue, 10 Oct 2023 11:55:00 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/7] drm: Reuse temporary memory for format conversion
Message-ID: <ry2xlooaw3ipv3jewqpyx3wmk7t57jvajhaf3ut74hchxbw7i7@zdp5jwcenxha>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <ozoizmezbyhwtnsyxahdoibpkwm2gvxnclw5gyt5j257demgpd@3efr2ioqhgg2>
 <e90dceff-5f8a-4d2c-b1a9-8afec856ba20@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ra4nld76ztgghlo2"
Content-Disposition: inline
In-Reply-To: <e90dceff-5f8a-4d2c-b1a9-8afec856ba20@suse.de>
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


--ra4nld76ztgghlo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 10:23:02AM +0200, Thomas Zimmermann wrote:
> Hi Maxime
>=20
> Am 06.10.23 um 16:49 schrieb Maxime Ripard:
> > Hi,
> >=20
> > On Thu, Oct 05, 2023 at 11:04:20AM +0200, Thomas Zimmermann wrote:
> > > DRM's format-conversion helpers require temporary memory. Pass the
> > > buffer from the caller and keep it allocated over several calls. Allow
> > > the caller to preallocate the buffer memory.
> >=20
> > I'm sorry... but why? Why do you need to keep it allocated over several
> > calls and preallocate the buffer? It's not clear to me at all.
> >
> > > The motivation for this patchset is the recent work on a DRM panic
> > > handler. [1] The panic handler requires format conversion to display =
an
> > > error to the screen. But allocating memory during kernel panics is
> > > fragile.
> >=20
> > We agree that we shouldn't allocate memory during the panic. I still
> > have concerns about how the panic handler will handle the driver
> > currently set up for a plane that isn't using an RGB format, or a buffer
> > not accessible by the kernel or CPU.
> >=20
> > You can't expect to get away with just a copy to the current active
> > buffer.
>=20
> In our current design, the panic handler calls get_scanout_buffer from
> struct drm_driver to retrieve a scanout buffer. What happens within that
> callback depends on the driver and hardware. Here are some of the expected
> scenarios:
>=20
>  * simpledrm or ofdrm can return the firmware-provided scanout buffer. No
> further action is required.
>=20
>  * Devices on a PCI-like bus:
>      * With a working mode in RGB colors, drivers can return the current
> scanout buffer as well.

Nothing guarantees that this is true. Even if in RGB, the buffer could
be unaccessible by the CPU, or still in an opaque format (when using
AFBC for example).

>      * Without a working mode, drivers likely attempt to program a common
> display mode with RGB colors.

Which would potentially require extra allocations, computations, etc.
that probably aren't doable in a panic handler path.

>  * Drivers for devices behind other busses, such as USB, will probably not
> be able to reprogram during a panic or provide a useful scanout buffer at
> all.
>=20
>  * The scanout buffer has to be mapped into kernel address space. This
> operation might be fragile during a panic. So drivers could set aside a
> slice of graphics memory and pre-map it; then use it during panic (requir=
es
> some mode programming).
>=20
> I expect that we will eventually have helpers for the various scenarios.
> Drivers will be able to implement their get_scanout_buffer with these
> helpers.

What I'm trying to say is that it's not just about providing new
helpers. Sure, we can make drivers do whatever they want and provide a
scanout buffer. We still have to put that buffer into an active plane at
some point. The current design doesn't provide any way to do that
properly.

That's what I'd like to see addressed, and I will disagree with any
proposal that just ignores it.

> The font glyphs are 1-bit bitmaps. So we have to convert them to the scan=
out
> buffer's format in any case. We want to use the existing format-conversion
> helpers were possible.
>=20
> >=20
> > If that's the assumption that underlines that patch series, then I don't
> > know why we need it at all, because that assumption is wrong to begin
> > with, and way too restrictive.
> >=20
> > > The changes in this patchset enable the DRM panic handler to
> > > preallocate buffer storage before the panic occurs.
> > >=20
> > > As an additonal benefit, drivers can now keep the temporary storage
> > > across multiple updates. Avoiding memory allocation slightly reduces
> > > the CPU overhead of the format helpers.
> >=20
> > I'm sorry to go over that again, but you can't write a performance
> > improvement mechanism without some kind of benchmark. kmalloc has
> > built-in caching, why do we absolutely need our own cache on top of it?
> >=20
> > If you never measured it, for all we know, we simply don't need it and
> > kmalloc is good enough.
>=20
> I'll remove that paragraph if you find it so annoying. Let me just say ag=
ain
> that overhead is not the primary motivation behind these patches.

I mean, I don't want to sweep the code under the rug but keep it. I want
to know why we need that code in the first place. If there's no reason
then we just shouldn't have that caching at all.

Maxime

--ra4nld76ztgghlo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSUfdAAKCRDj7w1vZxhR
xU9IAP9dejooVpRHpBwOjuRDoJkq7+N/E1rtqYom4XpFCgvyswD+KEIqW1HUMWub
19PoAoxD8lxm91c0SopZV3ANFD+7wwQ=
=DuHu
-----END PGP SIGNATURE-----

--ra4nld76ztgghlo2--
