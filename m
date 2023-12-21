Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE5481BD3B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 18:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2419110E6F7;
	Thu, 21 Dec 2023 17:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8AF10E6F7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1703179843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=DZ4PrQLxhflKIlVIWbwazWBJRSGqQYYv2Vc8n+RNJtY=;
 b=acNZkVFsDaV/tusjae2x+g1LihSsYjPG9R3ZwITPCLLKfsw1X7QUCkbrQTf+TB/mUl2dQD
 +1uRw11JEXtQdRYNK6sa+Vcyzk+cxglApAh0azfnrMa+AbF7DbkuonHkfa5De2hjy0ksjb
 dSGRXUCBfiVl7DulfQ0Ipa8elPFfam4=
Message-ID: <2da3fb55384a222868f90562be9e1e2ca55ec1c3.camel@crapouillou.net>
Subject: Re: [PATCH v5 7/8] iio: buffer-dmaengine: Support new DMABUF based
 userspace API
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>
Date: Thu, 21 Dec 2023 18:30:40 +0100
In-Reply-To: <20231221161258.056f5ce4@jic23-huawei>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-8-paul@crapouillou.net>
 <20231221161258.056f5ce4@jic23-huawei>
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jonathan,

Le jeudi 21 d=C3=A9cembre 2023 =C3=A0 16:12 +0000, Jonathan Cameron a =C3=
=A9crit=C2=A0:
> On Tue, 19 Dec 2023 18:50:08 +0100
> Paul Cercueil <paul@crapouillou.net> wrote:
>=20
> > Use the functions provided by the buffer-dma core to implement the
> > DMABUF userspace API in the buffer-dmaengine IIO buffer
> > implementation.
> >=20
> > Since we want to be able to transfer an arbitrary number of bytes
> > and
> > not necesarily the full DMABUF, the associated scatterlist is
> > converted
> > to an array of DMA addresses + lengths, which is then passed to
> > dmaengine_prep_slave_dma_array().
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> One question inline. Otherwise looks fine to me.
>=20
> J
> >=20
> > ---
> > v3: Use the new dmaengine_prep_slave_dma_array(), and adapt the
> > code to
> > =C2=A0=C2=A0=C2=A0 work with the new functions introduced in industrial=
io-buffer-
> > dma.c.
> >=20
> > v5: - Use the new dmaengine_prep_slave_dma_vec().
> > =C2=A0=C2=A0=C2=A0 - Restrict to input buffers, since output buffers ar=
e not yet
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 supported by IIO buffers.
> > ---
> > =C2=A0.../buffer/industrialio-buffer-dmaengine.c=C2=A0=C2=A0=C2=A0 | 52
> > ++++++++++++++++---
> > =C2=A01 file changed, 46 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> > b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> > index 5f85ba38e6f6..825d76a24a67 100644
> > --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> > +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> > @@ -64,15 +64,51 @@ static int
> > iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue
> > *queue,
> > =C2=A0	struct dmaengine_buffer *dmaengine_buffer =3D
> > =C2=A0		iio_buffer_to_dmaengine_buffer(&queue->buffer);
> > =C2=A0	struct dma_async_tx_descriptor *desc;
> > +	unsigned int i, nents;
> > +	struct scatterlist *sgl;
> > +	struct dma_vec *vecs;
> > +	size_t max_size;
> > =C2=A0	dma_cookie_t cookie;
> > +	size_t len_total;
> > =C2=A0
> > -	block->bytes_used =3D min(block->size, dmaengine_buffer-
> > >max_size);
> > -	block->bytes_used =3D round_down(block->bytes_used,
> > -			dmaengine_buffer->align);
> > +	if (queue->buffer.direction !=3D IIO_BUFFER_DIRECTION_IN) {
> > +		/* We do not yet support output buffers. */
> > +		return -EINVAL;
> > +	}
> > =C2=A0
> > -	desc =3D dmaengine_prep_slave_single(dmaengine_buffer->chan,
> > -		block->phys_addr, block->bytes_used,
> > DMA_DEV_TO_MEM,
> > -		DMA_PREP_INTERRUPT);
> > +	if (block->sg_table) {
> > +		sgl =3D block->sg_table->sgl;
> > +		nents =3D sg_nents_for_len(sgl, block->bytes_used);
>=20
> Are we guaranteed the length in the sglist is enough?=C2=A0 If not this
> can return an error code.

The length of the sglist will always be enough, the
iio_buffer_enqueue_dmabuf() function already checks that block-
>bytes_used is equal or smaller than the size of the DMABUF.

It is quite a few functions above in the call stack though, so I can
handle the errors of sg_nents_for_len() here if you think makes sense.

Cheers,
-Paul

> > +
> > +		vecs =3D kmalloc_array(nents, sizeof(*vecs),
> > GFP_KERNEL);
> > +		if (!vecs)
> > +			return -ENOMEM;
> > +
> > +		len_total =3D block->bytes_used;
> > +
> > +		for (i =3D 0; i < nents; i++) {
> > +			vecs[i].addr =3D sg_dma_address(sgl);
> > +			vecs[i].len =3D min(sg_dma_len(sgl),
> > len_total);
> > +			len_total -=3D vecs[i].len;
> > +
> > +			sgl =3D sg_next(sgl);
> > +		}
> > +
> > +		desc =3D
> > dmaengine_prep_slave_dma_vec(dmaengine_buffer->chan,
> > +						=C2=A0=C2=A0=C2=A0 vecs, nents,
> > DMA_DEV_TO_MEM,
> > +						=C2=A0=C2=A0=C2=A0
> > DMA_PREP_INTERRUPT);
> > +		kfree(vecs);
> > +	} else {
> > +		max_size =3D min(block->size, dmaengine_buffer-
> > >max_size);
> > +		max_size =3D round_down(max_size, dmaengine_buffer-
> > >align);
> > +		block->bytes_used =3D max_size;
> > +
> > +		desc =3D
> > dmaengine_prep_slave_single(dmaengine_buffer->chan,
> > +						=C2=A0=C2=A0 block-
> > >phys_addr,
> > +						=C2=A0=C2=A0 block-
> > >bytes_used,
> > +						=C2=A0=C2=A0 DMA_DEV_TO_MEM,
> > +						=C2=A0=C2=A0
> > DMA_PREP_INTERRUPT);
> > +	}
> > =C2=A0	if (!desc)
> > =C2=A0		return -ENOMEM;
> > =C2=A0
>=20

