Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD3842AD5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554E9113281;
	Tue, 30 Jan 2024 17:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80406113281
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 17:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1706635413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=5yttsGv/nZzm8P4I37O+sbjW65Bb56qxCJ5ApCblXiM=;
 b=faZH3siafi9jEi315A2HIps30mZcyIsINRLU55uymIvXMB5fB98He1hDz67Ccd+M0kvtEM
 1P9kAwCBxym7GHnLVrowoWysHJFkzjEI6d0v+0a+ThZomANVbwAxP3yndvdPm247qwjdQX
 2Z7gnNBfPsjBkxG2zNvElx2YtbwW6sw=
Message-ID: <fcf3e49cae178b18c0b15e12c69f9f2a84e8312e.camel@crapouillou.net>
Subject: Re: [PATCH v6 1/6] dmaengine: Add API function
 dmaengine_prep_slave_dma_vec()
From: Paul Cercueil <paul@crapouillou.net>
To: Vinod Koul <vkoul@kernel.org>
Date: Tue, 30 Jan 2024 18:23:31 +0100
In-Reply-To: <ZbkfC31eWBUQ3kSl@matsya>
References: <20240129170201.133785-1-paul@crapouillou.net>
 <20240129170201.133785-2-paul@crapouillou.net> <ZbkfC31eWBUQ3kSl@matsya>
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
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel@ffwll.ch>,
 dmaengine@vger.kernel.org, Nuno Sa <nuno.sa@analog.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

Le mardi 30 janvier 2024 =C3=A0 21:38 +0530, Vinod Koul a =C3=A9crit=C2=A0:
> On 29-01-24, 18:01, Paul Cercueil wrote:
> > This function can be used to initiate a scatter-gather DMA
> > transfer,
> > where the address and size of each segment is located in one entry
> > of
> > the dma_vec array.
> >=20
> > The major difference with dmaengine_prep_slave_sg() is that it
> > supports
> > specifying the lengths of each DMA transfer; as trying to override
> > the
> > length of the transfer with dmaengine_prep_slave_sg() is a very
> > tedious
> > process. The introduction of a new API function is also justified
> > by the
> > fact that scatterlists are on their way out.
> >=20
> > Note that dmaengine_prep_interleaved_dma() is not helpful either in
> > that
> > case, as it assumes that the address of each segment will be higher
> > than
> > the one of the previous segment, which we just cannot guarantee in
> > case
> > of a scatter-gather transfer.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >=20
> > ---
> > v3: New patch
> >=20
> > v5: Replace with function dmaengine_prep_slave_dma_vec(), and
> > struct
> > =C2=A0=C2=A0=C2=A0 'dma_vec'.
> > =C2=A0=C2=A0=C2=A0 Note that at some point we will need to support cycl=
ic
> > transfers
> > =C2=A0=C2=A0=C2=A0 using dmaengine_prep_slave_dma_vec(). Maybe with a n=
ew "flags"
> > =C2=A0=C2=A0=C2=A0 parameter to the function?
>=20
> that would be better

Ok, I think it'd be better that I add a new "flags" parameter now -
even if it means passing 0 until we actually have flags for it.

>=20
> > ---
> > =C2=A0include/linux/dmaengine.h | 25 +++++++++++++++++++++++++
> > =C2=A01 file changed, 25 insertions(+)
> >=20
> > diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> > index 3df70d6131c8..ee5931ddb42f 100644
> > --- a/include/linux/dmaengine.h
> > +++ b/include/linux/dmaengine.h
> > @@ -160,6 +160,16 @@ struct dma_interleaved_template {
> > =C2=A0	struct data_chunk sgl[];
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct dma_vec - DMA vector
> > + * @addr: Bus address of the start of the vector
> > + * @len: Length in bytes of the DMA vector
> > + */
> > +struct dma_vec {
> > +	dma_addr_t addr;
> > +	size_t len;
> > +};
> > +
> > =C2=A0/**
> > =C2=A0 * enum dma_ctrl_flags - DMA flags to augment operation
> > preparation,
> > =C2=A0 *=C2=A0 control completion, and communicate status.
> > @@ -910,6 +920,10 @@ struct dma_device {
> > =C2=A0	struct dma_async_tx_descriptor
> > *(*device_prep_dma_interrupt)(
> > =C2=A0		struct dma_chan *chan, unsigned long flags);
> > =C2=A0
> > +	struct dma_async_tx_descriptor
> > *(*device_prep_slave_dma_vec)(
> > +		struct dma_chan *chan, const struct dma_vec *vecs,
> > +		size_t nents, enum dma_transfer_direction
> > direction,
> > +		unsigned long flags);
>=20
> s/slave/peripheral
>=20
> I had requested it a bit while ago as well

You did. Sorry, I forgot about it when working on the v6.

Cheers,
-Paul

> > =C2=A0	struct dma_async_tx_descriptor *(*device_prep_slave_sg)(
> > =C2=A0		struct dma_chan *chan, struct scatterlist *sgl,
> > =C2=A0		unsigned int sg_len, enum dma_transfer_direction
> > direction,
> > @@ -972,6 +986,17 @@ static inline struct dma_async_tx_descriptor
> > *dmaengine_prep_slave_single(
> > =C2=A0						=C2=A0 dir, flags,
> > NULL);
> > =C2=A0}
> > =C2=A0
> > +static inline struct dma_async_tx_descriptor
> > *dmaengine_prep_slave_dma_vec(
> > +	struct dma_chan *chan, const struct dma_vec *vecs, size_t
> > nents,
> > +	enum dma_transfer_direction dir, unsigned long flags)
> > +{
> > +	if (!chan || !chan->device || !chan->device-
> > >device_prep_slave_dma_vec)
> > +		return NULL;
> > +
> > +	return chan->device->device_prep_slave_dma_vec(chan, vecs,
> > nents,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dir,
> > flags);
> > +}
> > +
> > =C2=A0static inline struct dma_async_tx_descriptor
> > *dmaengine_prep_slave_sg(
> > =C2=A0	struct dma_chan *chan, struct scatterlist
> > *sgl,	unsigned int sg_len,
> > =C2=A0	enum dma_transfer_direction dir, unsigned long flags)
> > --=20
> > 2.43.0
>=20

