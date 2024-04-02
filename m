Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9E8951D9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 13:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C345510F243;
	Tue,  2 Apr 2024 11:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="3+PWiZnt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FDD10F3F4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1712057487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RACmCVo3oQizc0IV4xsfh1Yt5T/9H2Y8ArFlx9eSREM=;
 b=3+PWiZntDUNpIPR9lZJONsKTr7S7V+JfwELyvJim7PbDNPejxbk9kNjwARkaSGeRA35wRu
 V5DfyIBRIglj7tKbU+PHJ+/asCCVIxK5QV+R5y3Erlo69ehIchvfFuPpaCD8kHqTkHZOnB
 ULIVfZ6QwtCtP+4iRZjRzESWmMKPAqo=
Message-ID: <599394c0220079b7b42dc732be817ca8a1eb4214.camel@crapouillou.net>
Subject: Re: [PATCH v9 1/6] dmaengine: Add API function
 dmaengine_prep_peripheral_dma_vec()
From: Paul Cercueil <paul@crapouillou.net>
To: Vinod Koul <vkoul@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>, Lars-Peter
 Clausen <lars@metafoo.de>, Sumit Semwal <sumit.semwal@linaro.org>, Nuno Sa
 <nuno.sa@analog.com>,  Michael Hennerich <michael.hennerich@analog.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Tue, 02 Apr 2024 13:31:25 +0200
In-Reply-To: <ZgUM1LFEWs3lwoAU@matsya>
References: <20240310124836.31863-1-paul@crapouillou.net>
 <20240310124836.31863-2-paul@crapouillou.net> <ZgUM1LFEWs3lwoAU@matsya>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFC
 qaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IWYXnd
 JO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN70
 62DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOt
 X0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEA
 AYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/
 Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmc
 Gu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2z
 McLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/
 7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2c
 LUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

Le jeudi 28 mars 2024 =C3=A0 11:53 +0530, Vinod Koul a =C3=A9crit=C2=A0:
> On 10-03-24, 13:48, Paul Cercueil wrote:
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
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
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
> >=20
> > v7:
> > =C2=A0 - Renamed *device_prep_slave_dma_vec() ->
> > device_prep_peripheral_dma_vec();
> > =C2=A0 - Added a new flag parameter to the function as agreed between
> > Paul
> > =C2=A0=C2=A0=C2=A0 and Vinod. I renamed the first parameter to prep_fla=
gs as it's
> > supposed to
> > =C2=A0=C2=A0=C2=A0 be used (I think) with enum dma_ctrl_flags. I'm not =
really sure
> > how that API
> > =C2=A0=C2=A0=C2=A0 can grow but I was thinking in just having a bool cy=
clic
> > parameter (as the
> > =C2=A0=C2=A0=C2=A0 first intention of the flags is to support cyclic tr=
ansfers)
> > but ended up
> > =C2=A0=C2=A0=C2=A0 "respecting" the previously agreed approach.
> > ---
> > =C2=A0include/linux/dmaengine.h | 27 +++++++++++++++++++++++++++
> > =C2=A01 file changed, 27 insertions(+)
> >=20
> > diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> > index 752dbde4cec1..856df8cd9a4e 100644
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
> > *(*device_prep_peripheral_dma_vec)(
> > +		struct dma_chan *chan, const struct dma_vec *vecs,
> > +		size_t nents, enum dma_transfer_direction
> > direction,
> > +		unsigned long prep_flags, unsigned long flags);
> > =C2=A0	struct dma_async_tx_descriptor *(*device_prep_slave_sg)(
> > =C2=A0		struct dma_chan *chan, struct scatterlist *sgl,
> > =C2=A0		unsigned int sg_len, enum dma_transfer_direction
> > direction,
> > @@ -973,6 +987,19 @@ static inline struct dma_async_tx_descriptor
> > *dmaengine_prep_slave_single(
> > =C2=A0						=C2=A0 dir, flags,
> > NULL);
> > =C2=A0}
> > =C2=A0
> > +static inline struct dma_async_tx_descriptor
> > *dmaengine_prep_peripheral_dma_vec(
> > +	struct dma_chan *chan, const struct dma_vec *vecs, size_t
> > nents,
> > +	enum dma_transfer_direction dir, unsigned long prep_flags,
> > +	unsigned long flags)
> > +{
> > +	if (!chan || !chan->device || !chan->device-
> > >device_prep_peripheral_dma_vec)
> > +		return NULL;
> > +
> > +	return chan->device->device_prep_peripheral_dma_vec(chan,
> > vecs, nents,
> > +							=C2=A0=C2=A0=C2=A0 dir,
> > prep_flags,
> > +							=C2=A0=C2=A0=C2=A0
> > flags);
> > +}
>=20
> API looks good to me, thanks
> Few nits though:
> - Can we add kernel-doc for this new API please
> - Also update the documentation adding this new api
> - Lastly, we seem to have two flags, I know you have added a comment
> but
> =C2=A0 I dont seem to recall the discussion (looked at old threads for
> clue
> =C2=A0 as well), can you please remind me why we need both? And in your
> case,
> =C2=A0 what is the intended usage of these flags, i would prefer single
> =C2=A0 clean one...
>=20

The "prep_flags" is a mask of "enum dma_ctrl_flags".

The second "flags" was supposed to be specific to this function, and
was to future-proof the API as we eventually want to have a "cyclic"
flag, which would emulate a cyclic transfer by linking the SG hardware
descriptors accordingly.

However - I think we can already do that with DMA_PREP_REPEAT and
DMA_PREP_LOAD_EOT, right? So we can probably drop the second "flags".

Cheers,
-Paul
