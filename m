Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9C8331C4
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 01:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA75310EAA2;
	Sat, 20 Jan 2024 00:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECB110EAA4
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 00:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1705709694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=uTRM9d6bvlbWT4CTU/U4qeImT68CpFKTYfre+yx+3OQ=;
 b=JA265L43X+KVrNQQpKTeItKpNrS74hBHSilZLefH+GSdoIa6uDIXf4ZrMKJYw2cM106Vp6
 BQC7TTWrnq9Vj+5LxaM33VHNWqeReEPckoCVSemlDGNc/QfOnOhmwjrJbAGucqHWZWf0ra
 vjxOzGBKes+Jac25P3fz9YBWxAGp9Tk=
Message-ID: <59799a40d8cc425dc5a847a0c8e25730db4fc5c8.camel@crapouillou.net>
Subject: Re: [PATCH v4 1/4] usb: gadget: Support already-mapped DMA SGs
From: Paul Cercueil <paul@crapouillou.net>
To: Frank Li <Frank.li@nxp.com>
Date: Sat, 20 Jan 2024 01:14:52 +0100
In-Reply-To: <ZaruU5BpQF8SeZZS@lizhi-Precision-Tower-5810>
References: <20240117122646.41616-1-paul@crapouillou.net>
 <20240117122646.41616-2-paul@crapouillou.net>
 <ZaruU5BpQF8SeZZS@lizhi-Precision-Tower-5810>
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
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frank,

Le vendredi 19 janvier 2024 =C3=A0 16:49 -0500, Frank Li a =C3=A9crit=C2=A0=
:
> On Wed, Jan 17, 2024 at 01:26:43PM +0100, Paul Cercueil wrote:
> > Add a new 'sg_was_mapped' field to the struct usb_request. This
> > field
> > can be used to indicate that the scatterlist associated to the USB
> > transfer has already been mapped into the DMA space, and it does
> > not
> > have to be done internally.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> > =C2=A0drivers/usb/gadget/udc/core.c | 7 ++++++-
> > =C2=A0include/linux/usb/gadget.h=C2=A0=C2=A0=C2=A0 | 2 ++
> > =C2=A02 files changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/usb/gadget/udc/core.c
> > b/drivers/usb/gadget/udc/core.c
> > index d59f94464b87..9d4150124fdb 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> > @@ -903,6 +903,11 @@ int usb_gadget_map_request_by_dev(struct
> > device *dev,
> > =C2=A0	if (req->length =3D=3D 0)
> > =C2=A0		return 0;
> > =C2=A0
> > +	if (req->sg_was_mapped) {
> > +		req->num_mapped_sgs =3D req->num_sgs;
> > +		return 0;
> > +	}
> > +
> > =C2=A0	if (req->num_sgs) {
> > =C2=A0		int=C2=A0=C2=A0=C2=A0=C2=A0 mapped;
> > =C2=A0
> > @@ -948,7 +953,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_map_request);
> > =C2=A0void usb_gadget_unmap_request_by_dev(struct device *dev,
> > =C2=A0		struct usb_request *req, int is_in)
> > =C2=A0{
> > -	if (req->length =3D=3D 0)
> > +	if (req->length =3D=3D 0 || req->sg_was_mapped)
> > =C2=A0		return;
> > =C2=A0
> > =C2=A0	if (req->num_mapped_sgs) {
> > diff --git a/include/linux/usb/gadget.h
> > b/include/linux/usb/gadget.h
> > index a771ccc038ac..c529e4e06997 100644
> > --- a/include/linux/usb/gadget.h
> > +++ b/include/linux/usb/gadget.h
> > @@ -52,6 +52,7 @@ struct usb_ep;
> > =C2=A0 * @short_not_ok: When reading data, makes short packets be
> > =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 treated as errors (queue stops advanci=
ng till cleanup).
> > =C2=A0 * @dma_mapped: Indicates if request has been mapped to DMA
> > (internal)
> > + * @sg_was_mapped: Set if the scatterlist has been mapped before
> > the request
> > =C2=A0 * @complete: Function called when request completes, so this
> > request and
> > =C2=A0 *	its buffer may be re-used.=C2=A0 The function will always be
> > called with
> > =C2=A0 *	interrupts disabled, and it must not sleep.
> > @@ -111,6 +112,7 @@ struct usb_request {
> > =C2=A0	unsigned		zero:1;
> > =C2=A0	unsigned		short_not_ok:1;
> > =C2=A0	unsigned		dma_mapped:1;
> > +	unsigned		sg_was_mapped:1;
>=20
> why not use dma_mapped direclty?

Because of the unmap case. We want to know whether we should unmap or
not.

>=20
> Frank

Cheers,
-Paul

>=20
> > =C2=A0
> > =C2=A0	void			(*complete)(struct usb_ep *ep,
> > =C2=A0					struct usb_request *req);
> > --=20
> > 2.43.0
> >=20

