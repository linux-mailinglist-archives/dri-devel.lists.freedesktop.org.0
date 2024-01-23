Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3337838F30
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 14:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3940A10E7A8;
	Tue, 23 Jan 2024 13:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B0E10E7A8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1706014972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sEgC3GZbIv2ilHeerXyxqqSY+yr0zL4n+rE4Iy27TC4=;
 b=Xmd8fMiGLFSmvc0bDjACwh4fKY+J+4MlQDMB7HYqTmKOEP8PkQIm3xN6rM5ZMdiLZ08t5p
 T+AoKs0cJGJjxwgEZhSVA3p6YBJNgxRa6sN/fhzQay3n+luucTP0TcVl0G9EcpNs53sPd4
 7IXDEhOVw449U8EFmti9JHjSgG1ecGk=
Message-ID: <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
Subject: Re: [Linaro-mm-sig] [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
From: Paul Cercueil <paul@crapouillou.net>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 23 Jan 2024 14:02:50 +0100
In-Reply-To: <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
References: <20240119141402.44262-1-paul@crapouillou.net>
 <20240119141402.44262-2-paul@crapouillou.net>
 <8035f515-591f-4c87-bf0a-23d5705d9b1c@gmail.com>
 <442f69f31ece6d441f3dc41c3dfeb4dcf52c00b8.camel@crapouillou.net>
 <0b6b8738-9ea3-44fa-a624-9297bd55778f@amd.com>
 <e4620acdf24628d904cedcb0030d78b14559f337.camel@crapouillou.net>
 <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
 YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mardi 23 janvier 2024 =C3=A0 12:52 +0100, Christian K=C3=B6nig a =C3=A9c=
rit=C2=A0:
> Am 23.01.24 um 11:10 schrieb Paul Cercueil:
> > Hi Christian,
> >=20
> > Le lundi 22 janvier 2024 =C3=A0 14:41 +0100, Christian K=C3=B6nig a =C3=
=A9crit=C2=A0:
> > > Am 22.01.24 um 12:01 schrieb Paul Cercueil:
> > > > Hi Christian,
> > > >=20
> > > > Le lundi 22 janvier 2024 =C3=A0 11:35 +0100, Christian K=C3=B6nig a
> > > > =C3=A9crit=C2=A0:
> > > > > Am 19.01.24 um 15:13 schrieb Paul Cercueil:
> > > > > > These functions should be used by device drivers when they
> > > > > > start
> > > > > > and
> > > > > > stop accessing the data of DMABUF. It allows DMABUF
> > > > > > importers
> > > > > > to
> > > > > > cache
> > > > > > the dma_buf_attachment while ensuring that the data they
> > > > > > want
> > > > > > to
> > > > > > access
> > > > > > is available for their device when the DMA transfers take
> > > > > > place.
> > > > > As Daniel already noted as well this is a complete no-go from
> > > > > the
> > > > > DMA-buf design point of view.
> > > > What do you mean "as Daniel already noted"? It was him who
> > > > suggested
> > > > this.
> > > Sorry, I haven't fully catched up to the discussion then.
> > >=20
> > > In general DMA-buf is build around the idea that the data can be
> > > accessed coherently by the involved devices.
> > >=20
> > > Having a begin/end of access for devices was brought up multiple
> > > times
> > > but so far rejected for good reasons.
> > I would argue that if it was brought up multiple times, then there
> > are
> > also good reasons to support such a mechanism.
> >=20
> > > That an exporter has to call extra functions to access his own
> > > buffers
> > > is a complete no-go for the design since this forces exporters
> > > into
> > > doing extra steps for allowing importers to access their data.
> > Then what about we add these dma_buf_{begin,end}_access(), with
> > only
> > implementations for "dumb" exporters e.g. udmabuf or the dmabuf
> > heaps?
> > And only importers (who cache the mapping and actually care about
> > non-
> > coherency) would have to call these.
>=20
> No, the problem is still that you would have to change all importers
> to=20
> mandatory use dma_buf_begin/end.
>=20
> But going a step back caching the mapping is irrelevant for
> coherency.=20
> Even if you don't cache the mapping you don't get coherency.

You actually do - at least with udmabuf, as in that case
dma_buf_map_attachment() / dma_buf_unmap_attachment() will handle cache
coherency when the SGs are mapped/unmapped.

The problem was then that dma_buf_unmap_attachment cannot be called
before the dma_fence is signaled, and calling it after is already too
late (because the fence would be signaled before the data is sync'd).

Daniel / Sima suggested then that I cache the mapping and add new
functions to ensure cache coherency, which is what these patches are
about.

> In other words exporters are not require to call sync_to_cpu or=20
> sync_to_device when you create a mapping.
>=20
> What exactly is your use case here? And why does coherency matters?

My use-case is, I create DMABUFs with udmabuf, that I attach to
USB/functionfs with the interface introduced by this patchset. I attach
them to IIO with a similar interface (being upstreamed in parallel),
and transfer data from USB to IIO and vice-versa in a zero-copy
fashion.

This works perfectly fine as long as the USB and IIO hardware are
coherent between themselves, which is the case on most of our boards.
However I do have a board (with a Xilinx Ultrascale SoC) where it is
not the case, and cache flushes/sync are needed. So I was trying to
rework these new interfaces to work on that system too.

If this really is a no-no, then I am fine with the assumption that
devices sharing a DMABUF must be coherent between themselves; but
that's something that should probably be enforced rather than assumed.

(and I *think* there is a way to force coherency in the Ultrascale's
interconnect - we're investigating it)

Cheers,
-Paul

> > At the very least, is there a way to check that "the data can be
> > accessed coherently by the involved devices"? So that my importer
> > can
> > EPERM if there is no coherency vs. a device that's already
> > attached.
>=20
> Yeah, there is functionality for this in the DMA subsystem. I've once
> created prototype patches for enforcing the same coherency approach=20
> between importer and exporter, but we never got around to upstream
> them.
>=20
>=20
>=20
> >=20
> > Cheers,
> > -Paul
> >=20
> > > That in turn is pretty much un-testable unless you have every
> > > possible
> > > importer around while testing the exporter.
> > >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > > Regards,
> > > > > Christian.
> > > > Cheers,
> > > > -Paul
> > > >=20
> > > > > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > > > >=20
> > > > > > ---
> > > > > > v5: New patch
> > > > > > ---
> > > > > > =C2=A0=C2=A0=C2=A0 drivers/dma-buf/dma-buf.c | 66
> > > > > > +++++++++++++++++++++++++++++++++++++++
> > > > > > =C2=A0=C2=A0=C2=A0 include/linux/dma-buf.h=C2=A0=C2=A0 | 37 +++=
+++++++++++++++++++
> > > > > > =C2=A0=C2=A0=C2=A0 2 files changed, 103 insertions(+)
> > > > > >=20
> > > > > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-
> > > > > > buf/dma-
> > > > > > buf.c
> > > > > > index 8fe5aa67b167..a8bab6c18fcd 100644
> > > > > > --- a/drivers/dma-buf/dma-buf.c
> > > > > > +++ b/drivers/dma-buf/dma-buf.c
> > > > > > @@ -830,6 +830,8 @@ static struct sg_table *
> > > > > > __map_dma_buf(struct
> > > > > > dma_buf_attachment *attach,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 - dma_buf_mm=
ap()
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 - dma_buf_be=
gin_cpu_access()
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 - dma_buf_en=
d_cpu_access()
> > > > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 - dma_buf_begin_access()
> > > > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 - dma_buf_end_access()
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 - dma_buf_ma=
p_attachment_unlocked()
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 - dma_buf_un=
map_attachment_unlocked()
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 - dma_buf_vm=
ap_unlocked()
> > > > > > @@ -1602,6 +1604,70 @@ void dma_buf_vunmap_unlocked(struct
> > > > > > dma_buf
> > > > > > *dmabuf, struct iosys_map *map)
> > > > > > =C2=A0=C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=C2=A0 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked=
, DMA_BUF);
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > +/**
> > > > > > + * @dma_buf_begin_access - Call before any hardware access
> > > > > > from/to
> > > > > > the DMABUF
> > > > > > + * @attach:	[in]	attachment used for hardware
> > > > > > access
> > > > > > + * @sg_table:	[in]	scatterlist used for the DMA
> > > > > > transfer
> > > > > > + * @direction:=C2=A0 [in]=C2=A0=C2=A0=C2=A0 direction of DMA t=
ransfer
> > > > > > + */
> > > > > > +int dma_buf_begin_access(struct dma_buf_attachment
> > > > > > *attach,
> > > > > > +			 struct sg_table *sgt, enum
> > > > > > dma_data_direction dir)
> > > > > > +{
> > > > > > +	struct dma_buf *dmabuf;
> > > > > > +	bool cookie;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	if (WARN_ON(!attach))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	dmabuf =3D attach->dmabuf;
> > > > > > +
> > > > > > +	if (!dmabuf->ops->begin_access)
> > > > > > +		return 0;
> > > > > > +
> > > > > > +	cookie =3D dma_fence_begin_signalling();
> > > > > > +	ret =3D dmabuf->ops->begin_access(attach, sgt, dir);
> > > > > > +	dma_fence_end_signalling(cookie);
> > > > > > +
> > > > > > +	if (WARN_ON_ONCE(ret))
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_NS_GPL(dma_buf_begin_access, DMA_BUF);
> > > > > > +
> > > > > > +/**
> > > > > > + * @dma_buf_end_access - Call after any hardware access
> > > > > > from/to
> > > > > > the DMABUF
> > > > > > + * @attach:	[in]	attachment used for hardware
> > > > > > access
> > > > > > + * @sg_table:	[in]	scatterlist used for the DMA
> > > > > > transfer
> > > > > > + * @direction:=C2=A0 [in]=C2=A0=C2=A0=C2=A0 direction of DMA t=
ransfer
> > > > > > + */
> > > > > > +int dma_buf_end_access(struct dma_buf_attachment *attach,
> > > > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sgt, e=
num
> > > > > > dma_data_direction dir)
> > > > > > +{
> > > > > > +	struct dma_buf *dmabuf;
> > > > > > +	bool cookie;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	if (WARN_ON(!attach))
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	dmabuf =3D attach->dmabuf;
> > > > > > +
> > > > > > +	if (!dmabuf->ops->end_access)
> > > > > > +		return 0;
> > > > > > +
> > > > > > +	cookie =3D dma_fence_begin_signalling();
> > > > > > +	ret =3D dmabuf->ops->end_access(attach, sgt, dir);
> > > > > > +	dma_fence_end_signalling(cookie);
> > > > > > +
> > > > > > +	if (WARN_ON_ONCE(ret))
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_NS_GPL(dma_buf_end_access, DMA_BUF);
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0 #ifdef CONFIG_DEBUG_FS
> > > > > > =C2=A0=C2=A0=C2=A0 static int dma_buf_debug_show(struct seq_fil=
e *s, void
> > > > > > *unused)
> > > > > > =C2=A0=C2=A0=C2=A0 {
> > > > > > diff --git a/include/linux/dma-buf.h b/include/linux/dma-
> > > > > > buf.h
> > > > > > index 8ff4add71f88..8ba612c7cc16 100644
> > > > > > --- a/include/linux/dma-buf.h
> > > > > > +++ b/include/linux/dma-buf.h
> > > > > > @@ -246,6 +246,38 @@ struct dma_buf_ops {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 */
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	int (*end_cpu_access)(struct dma_buf *=
, enum
> > > > > > dma_data_direction);
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > +	/**
> > > > > > +	 * @begin_access:
> > > > > > +	 *
> > > > > > +	 * This is called from dma_buf_begin_access() when
> > > > > > a
> > > > > > device driver
> > > > > > +	 * wants to access the data of the DMABUF. The
> > > > > > exporter
> > > > > > can use this
> > > > > > +	 * to flush/sync the caches if needed.
> > > > > > +	 *
> > > > > > +	 * This callback is optional.
> > > > > > +	 *
> > > > > > +	 * Returns:
> > > > > > +	 *
> > > > > > +	 * 0 on success or a negative error code on
> > > > > > failure.
> > > > > > +	 */
> > > > > > +	int (*begin_access)(struct dma_buf_attachment *,
> > > > > > struct
> > > > > > sg_table *,
> > > > > > +			=C2=A0=C2=A0=C2=A0 enum dma_data_direction);
> > > > > > +
> > > > > > +	/**
> > > > > > +	 * @end_access:
> > > > > > +	 *
> > > > > > +	 * This is called from dma_buf_end_access() when a
> > > > > > device
> > > > > > driver is
> > > > > > +	 * done accessing the data of the DMABUF. The
> > > > > > exporter
> > > > > > can
> > > > > > use this
> > > > > > +	 * to flush/sync the caches if needed.
> > > > > > +	 *
> > > > > > +	 * This callback is optional.
> > > > > > +	 *
> > > > > > +	 * Returns:
> > > > > > +	 *
> > > > > > +	 * 0 on success or a negative error code on
> > > > > > failure.
> > > > > > +	 */
> > > > > > +	int (*end_access)(struct dma_buf_attachment *,
> > > > > > struct
> > > > > > sg_table *,
> > > > > > +			=C2=A0 enum dma_data_direction);
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	/**
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 * @mmap:
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0	 *
> > > > > > @@ -606,6 +638,11 @@ void dma_buf_detach(struct dma_buf
> > > > > > *dmabuf,
> > > > > > =C2=A0=C2=A0=C2=A0 int dma_buf_pin(struct dma_buf_attachment *a=
ttach);
> > > > > > =C2=A0=C2=A0=C2=A0 void dma_buf_unpin(struct dma_buf_attachment=
 *attach);
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > +int dma_buf_begin_access(struct dma_buf_attachment
> > > > > > *attach,
> > > > > > +			 struct sg_table *sgt, enum
> > > > > > dma_data_direction dir);
> > > > > > +int dma_buf_end_access(struct dma_buf_attachment *attach,
> > > > > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct sg_table *sgt, e=
num
> > > > > > dma_data_direction dir);
> > > > > > +
> > > > > > =C2=A0=C2=A0=C2=A0 struct dma_buf *dma_buf_export(const struct
> > > > > > dma_buf_export_info
> > > > > > *exp_info);
> > > > > > =C2=A0=C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0=C2=A0 int dma_buf_fd(struct dma_buf *dmabuf, int f=
lags);
>=20

