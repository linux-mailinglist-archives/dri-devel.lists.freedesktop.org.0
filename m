Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283987E521
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 09:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA8610F4AF;
	Mon, 18 Mar 2024 08:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CSEd7k75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69D110F4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:44:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 745E2CE09FC;
 Mon, 18 Mar 2024 08:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD604C43390;
 Mon, 18 Mar 2024 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710751457;
 bh=tgAPjvF3ioJGuh/k4VH4nzhLxQlR7APgozh3yQXWWXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CSEd7k75BiPJDsR6nMMSvz1HnRuZFCyR006gvaJMOqeHmtY535njdAhdxnB7s3Vly
 1t5Eh7L+cvgzBzAsS/8h9KIANO/PCFX+p5hgwWwNiIkvdd8xhckgNeP4yFGBrVO6z6
 5pklNU/U49/G2SYbSqPcXgOcu9ggw4nTfucaoZbquimYqPT3QqAJc4xVLdr2tr4+cH
 wQlwW1zFgtq1ZLXfW07XG2O+ojyenkAV0dswz/S7W3JU+n/daTDSPpin4fj72UqtNv
 xnrcqXWBFQkEhhqeI7jzV1g0UWGqtl3hLvYIbyKb5Eaj9Mynh+NsT0ahZ0+kXDvwAw
 t1HhanHBmNYrw==
Date: Mon, 18 Mar 2024 09:44:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Zack Rusin <zack.rusin@broadcom.com>, daniel@ffwll.ch, 
 airlied@gmail.com, deller@gmx.de, javierm@redhat.com,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH 01/43] drm/fbdev-generic: Do not set physical framebuffer
 address
Message-ID: <20240318-dark-mongoose-of-camouflage-7ac6ed@houat>
References: <20240312154834.26178-1-tzimmermann@suse.de>
 <20240312154834.26178-2-tzimmermann@suse.de>
 <CABQX2QPJJFrARdteFFZ8f33hvDx-HSyOQJQ7AMFK4C8C=BquTQ@mail.gmail.com>
 <e684558e-8308-4d73-b920-547f9012a2cb@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a7vnwfog3n7f6fea"
Content-Disposition: inline
In-Reply-To: <e684558e-8308-4d73-b920-547f9012a2cb@suse.de>
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


--a7vnwfog3n7f6fea
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 08:59:01AM +0100, Thomas Zimmermann wrote:
> Hi
>=20
> Am 18.03.24 um 03:35 schrieb Zack Rusin:
> > On Tue, Mar 12, 2024 at 11:48=E2=80=AFAM Thomas Zimmermann <tzimmermann=
@suse.de> wrote:
> > > Framebuffer memory is allocated via vmalloc() from non-contiguous
> > > physical pages. The physical framebuffer start address is therefore
> > > meaningless. Do not set it.
> > >=20
> > > The value is not used within the kernel and only exported to userspace
> > > on dedicated ARM configs. No functional change is expected.
> > >=20
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Fixes: a5b44c4adb16 ("drm/fbdev-generic: Always use shadow buffering")
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > > Cc: Zack Rusin <zackr@vmware.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: <stable@vger.kernel.org> # v6.4+
> > > ---
> > >   drivers/gpu/drm/drm_fbdev_generic.c | 1 -
> > >   1 file changed, 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/dr=
m_fbdev_generic.c
> > > index d647d89764cb9..b4659cd6285ab 100644
> > > --- a/drivers/gpu/drm/drm_fbdev_generic.c
> > > +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> > > @@ -113,7 +113,6 @@ static int drm_fbdev_generic_helper_fb_probe(stru=
ct drm_fb_helper *fb_helper,
> > >          /* screen */
> > >          info->flags |=3D FBINFO_VIRTFB | FBINFO_READS_FAST;
> > >          info->screen_buffer =3D screen_buffer;
> > > -       info->fix.smem_start =3D page_to_phys(vmalloc_to_page(info->s=
creen_buffer));
> > >          info->fix.smem_len =3D screen_size;
> > >=20
> > >          /* deferred I/O */
> > > --
> > > 2.44.0
> > >=20
> > Good idea. I think given that drm_leak_fbdev_smem is off by default we
> > could remove the setting of smem_start by all of the in-tree drm
> > drivers (they all have open source userspace that won't mess around
> > with fbdev fb) - it will be reset to 0 anyway. Actually, I wonder if
> > we still need drm_leak_fbdev_smem at all...
>=20
> All I know is that there's an embedded userspace driver that requires that
> setting. I don't even know which hardware.

The original Mali driver (ie, lima) used to require it, that's why we
introduced it in the past.

I'm not sure if the newer versions of that driver, or if newer Mali
generations (ie, panfrost and panthor) closed source driver would
require it, so it might be worth removing if it's easy enough to revert.

Maxime

--a7vnwfog3n7f6fea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZff+0QAKCRDj7w1vZxhR
xbbfAP9Pld0vccS27vREZ3xsYkeM/kiU0yHFImyTFQZWfZWwiAD/aouRJnuZ7N1x
BfTpDauyPANFnaIznKrfRtKrI2D+4QU=
=utup
-----END PGP SIGNATURE-----

--a7vnwfog3n7f6fea--
