Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29992AFFCC3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 10:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AA010E376;
	Thu, 10 Jul 2025 08:49:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="HPmozO2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1376510E376;
 Thu, 10 Jul 2025 08:49:22 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 71F821C00A4; Thu, 10 Jul 2025 10:49:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1752137360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JtsDBA795YfReYH/GF2nMaqLkXwFgaNAo981tm46dl4=;
 b=HPmozO2rGjK2OOGdab1zyeJX8Mr6qIQ58OYfWhT3tFLnrIj/JkdrbYkxiQfSiSy42rqlae
 1/T7eB6smwFKxs9Ap/c4DEzTrV+VgC7Z2KkqC1dNEF82gIlp+x/hMb62bq4MFydLgBiCM5
 3hH4RQPYg7s3dZcicRfGpHdoLWGyvL8=
Date: Thu, 10 Jul 2025 10:49:19 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: kraxel@redhat.com, vivek.kasireddy@intel.com,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel list <linux-kernel@vger.kernel.org>,
 laurent.pinchart@ideasonboard.com, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, etnaviv@lists.freedesktop.org,
 phone-devel@vger.kernel.org
Subject: Re: DMA-BUFs always uncached on arm64, causing poor camera
 performance on Librem 5
Message-ID: <aG9+j3p0+fdLQZwu@duo.ucw.cz>
References: <aG94uNDrL1MdHJPM@duo.ucw.cz>
 <aecd03f464f25d50f379be405a8596261f247897.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="uIo81BiHoorXdIb1"
Content-Disposition: inline
In-Reply-To: <aecd03f464f25d50f379be405a8596261f247897.camel@pengutronix.de>
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


--uIo81BiHoorXdIb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > memcpy() from normal memory is about 2msec/1MB. Unfortunately, for
> > DMA-BUFs it is 20msec/1MB, and that basically means I can't easily do
> > 760p video recording. Plus, copying full-resolution photo buffer takes
> > more than 200msec!
> >=20
> > There's possibility to do some processing on GPU, and its implemented h=
ere:
> >=20
> > https://gitlab.com/tui/tui/-/tree/master/icam?ref_type=3Dheads
> >=20
> > but that hits the same problem in the end -- data is in DMA-BUF,
> > uncached, and takes way too long to copy out.
> >=20
> > And that's ... wrong. DMA ended seconds ago, complete cache flush
> > would be way cheaper than copying single frame out, and I still have
> > to deal with uncached frames.
> >=20
> > So I have two questions:
> >=20
> > 1) Is my analysis correct that, no matter how I get frame from v4l and
> > process it on GPU, I'll have to copy it from uncached memory in the
> > end?
>=20
> If you need to touch the buffers using the CPU then you are either
> stuck with uncached memory or you need to implement bracketed access to
> do the necessary cache maintenance. Be aware that completely flushing
> the cache is not really an option, as that would impact other
> workloads, so you have to flush the cache by walking the virtual
> address space of the buffer, which may take a significant amount of CPU
> time.

What kind of "significant amount of CPU time" are we talking here?
Millisecond?

Bracketed access is fine with me.

Flushing a cache should be an option. I'm root, there's no other
significant workload, and copying out the buffer takes 200msec+. There
are lot of cache flushes that can be done in quarter a second!

> However, if you are only going to use the buffer with the GPU I see no
> reason to touch it from the CPU side. Why would you even need to copy
> the content? After all dma-bufs are meant to enable zero-copy between
> DMA capable accelerators. You can simply import the V4L2 buffer into a
> GL texture using EGL_EXT_image_dma_buf_import. Using this path you
> don't need to bother with the cache at all, as the GPU will directly
> read the video buffers from RAM.

Yes, so GPU will read video buffer from RAM, then debayer it, and then
what? Then I need to store a data into raw file, or use CPU to turn it
into JPEG file, or maybe run video encoder on it. That are all tasks
that are done on CPU...

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--uIo81BiHoorXdIb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaG9+jwAKCRAw5/Bqldv6
8pFxAJ9w5Ne/+ev32mB6Cj5DYUglkB9gbwCgpjZ84DNpnW6H133GyLZrpyPjFjg=
=8vV3
-----END PGP SIGNATURE-----

--uIo81BiHoorXdIb1--
