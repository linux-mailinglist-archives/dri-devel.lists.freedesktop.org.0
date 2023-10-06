Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285417BBA5A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 16:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411E810E505;
	Fri,  6 Oct 2023 14:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596CB10E505
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 14:35:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5039E60AEB;
 Fri,  6 Oct 2023 14:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FE3C433C8;
 Fri,  6 Oct 2023 14:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696602931;
 bh=j18kQfvGUFM+G38xoeEFfKXWXeHxm8lOEQM4nZafpoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hsv3T/EfT+VjjBqWbZ4R8PhSWQaDRV9KNU9ihiVXLoNgXTYgXJe4MnGGgazBELfxF
 wf+OuCh6guD0pESnNnTj16PDldwWjz3yLXEAu84Y8Va9Q5WVkK9x5e/fALNbLM7vx2
 DZqKcljgHk1J9IA8wDJnhOcdwheMP3NQTYUZ++ehd2ucaUJMGL3PxfYSCDzS0401yZ
 bzHdjXcoRE8EUJnlcd3JKwMKuJX0RUWMTYCfMwErykgFZ7dVJr6U1bYTF3JIrAawL9
 BDdNeSi2oqw7NYISsuvFvPIit4VpNVlfk2nfl7E6+/iE+tbnpXTvE+xwwns9j2MUou
 FbS7PB8tQ0HVA==
Date: Fri, 6 Oct 2023 16:35:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v4 2/4] drm/panic: Add a drm panic handler
Message-ID: <6iaqx7ef4hdd6bucsxtfy37nsizloraxbudez4ms7jlusbghr3@i5hliqpimdp2>
References: <20231003142508.190246-1-jfalempe@redhat.com>
 <20231003142508.190246-3-jfalempe@redhat.com>
 <lbwngkco3zam7yjo3owwpn47o3pe6g7oh5giglsclenx52jk5q@lw2fwsxz6kqp>
 <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3fiwbmorypye3cnj"
Content-Disposition: inline
In-Reply-To: <3a359910-31ae-355f-2608-239e04689fde@redhat.com>
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--3fiwbmorypye3cnj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jocelyn,

On Thu, Oct 05, 2023 at 11:16:15AM +0200, Jocelyn Falempe wrote:
> On 05/10/2023 10:18, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Oct 03, 2023 at 04:22:45PM +0200, Jocelyn Falempe wrote:
> > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > > index 89e2706cac56..e538c87116d3 100644
> > > --- a/include/drm/drm_drv.h
> > > +++ b/include/drm/drm_drv.h
> > > @@ -43,6 +43,7 @@ struct dma_buf_attachment;
> > >   struct drm_display_mode;
> > >   struct drm_mode_create_dumb;
> > >   struct drm_printer;
> > > +struct drm_scanout_buffer;
> > >   struct sg_table;
> > >   /**
> > > @@ -408,6 +409,19 @@ struct drm_driver {
> > >   	 */
> > >   	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
> > > +	/**
> > > +	 * @get_scanout_buffer:
> > > +	 *
> > > +	 * Get the current scanout buffer, to display a panic message with =
drm_panic.
> > > +	 * It is called from a panic callback, and must follow its restrict=
ions.
> > > +	 *
> > > +	 * Returns:
> > > +	 *
> > > +	 * Zero on success, negative errno on failure.
> > > +	 */
> > > +	int (*get_scanout_buffer)(struct drm_device *dev,
> > > +				  struct drm_scanout_buffer *sb);
> > > +
> >=20
> > What is the format of that buffer? What is supposed to happen if the
> > planes / CRTC are setup in a way that is incompatible with the buffer
> > format?
>=20
> Currently, it only supports linear format, either in system memory, or
> iomem.
> But really what is needed is the screen size, and a way to write pixels to
> it.
> For more complex GPU, I don't know if it's easier to reprogram the GPU to
> linear format, or to add a simple "tiled" support to drm_panic.
> What would you propose as a panic interface to handle those complex forma=
t ?

It's not just about tiling, but also about YUV formats. If the display
engine is currently playing a video at the moment, it's probably going
to output some variation of multi-planar YUV and you won't have an RGB
buffer available.

Same story if you're using a dma-buf buffer. You might not even be able
to access that buffer at all from the CPU or the kernel.

I really think we should have some emergency state ready to commit on
the side, and possibly a panic_commit function to prevent things like
sleeping or waiting that regular atomic_commit can use.

That way, you know have all the resources available to you any time.

> Sometime it's also just not possible to write pixels to the screen, like =
if
> the panic occurs in the middle of suspend/resume, or during a mode-settin=
g,
> and the hardware state is broken. In this case it's ok to return an error,
> and nothing will get displayed.

And yeah, you won't be able to do it every time, but if it's never for
some workload it's going to be a concern.

Anyway, we should at the very least document what we expect here.

Maxime

--3fiwbmorypye3cnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSAbMAAKCRDj7w1vZxhR
xQ1FAP9Jhh8XhmAtPzIoa7DE3N5EtXjU0fLclTb87jIDWHm63QD9F0iRpdni7vlk
0+/p1M3SsR6jpO+aZOs5lchrbPfpRgo=
=cOfS
-----END PGP SIGNATURE-----

--3fiwbmorypye3cnj--
