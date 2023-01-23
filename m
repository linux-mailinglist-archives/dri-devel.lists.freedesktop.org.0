Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C311C67775C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 10:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA5210E1E5;
	Mon, 23 Jan 2023 09:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4225710E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:26:22 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-170-pWK5ZHwsNsOHzMuVCmnqRQ-1; Mon, 23 Jan 2023 09:26:18 +0000
X-MC-Unique: pWK5ZHwsNsOHzMuVCmnqRQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Mon, 23 Jan
 2023 09:26:18 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Mon, 23 Jan 2023 09:26:18 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Javier Martinez Canillas' <javierm@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/ssd130x: Silence a `dubious: x & !y` warning
Thread-Topic: [PATCH] drm/ssd130x: Silence a `dubious: x & !y` warning
Thread-Index: AQHZLcwEpBlghOuKm0WPZwn3mEYKGa6rvUhg
Date: Mon, 23 Jan 2023 09:26:17 +0000
Message-ID: <e5279ea9dfab400c8e6cd9346fb41a1d@AcuMS.aculab.com>
References: <20230121190930.2804224-1-javierm@redhat.com>
In-Reply-To: <20230121190930.2804224-1-javierm@redhat.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Javier Martinez Canillas
> Sent: 21 January 2023 19:10
>=20
> The sparse tool complains with the following warning:
>=20
> $ make M=3Ddrivers/gpu/drm/solomon/ C=3D2
>   CC [M]  drivers/gpu/drm/solomon/ssd130x.o
>   CHECK   drivers/gpu/drm/solomon/ssd130x.c
> drivers/gpu/drm/solomon/ssd130x.c:363:21: warning: dubious: x & !y
>=20
> This seems to be a false positive in my opinion but still we can silence
> the tool while making the code easier to read. Let's also add a comment,
> to explain why the "com_seq" logical not is used rather than its value.
>=20
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>=20
>  drivers/gpu/drm/solomon/ssd130x.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/=
ssd130x.c
> index c3bf3a18302e..b16330a8b624 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -81,7 +81,7 @@
>  #define SSD130X_SET_PRECHARGE_PERIOD2_MASK=09GENMASK(7, 4)
>  #define SSD130X_SET_PRECHARGE_PERIOD2_SET(val)=09FIELD_PREP(SSD130X_SET_=
PRECHARGE_PERIOD2_MASK, (val))
>  #define SSD130X_SET_COM_PINS_CONFIG1_MASK=09GENMASK(4, 4)
> -#define SSD130X_SET_COM_PINS_CONFIG1_SET(val)=09FIELD_PREP(SSD130X_SET_C=
OM_PINS_CONFIG1_MASK, !(val))
> +#define SSD130X_SET_COM_PINS_CONFIG1_SET(val)=09FIELD_PREP(SSD130X_SET_C=
OM_PINS_CONFIG1_MASK, (val))

How about just changing !(val) to (val) ? 0 : 1
It should shut the compiler up and is probably more descriptive.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

