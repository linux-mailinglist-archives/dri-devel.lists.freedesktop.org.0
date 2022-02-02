Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 312E54A6D6D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:03:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418BA10E6F1;
	Wed,  2 Feb 2022 09:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7520F10E6E7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:02:58 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-286-fMc-AKToMMKAIaDfh45yHg-1; Wed, 02 Feb 2022 09:02:54 +0000
X-MC-Unique: fMc-AKToMMKAIaDfh45yHg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 2 Feb 2022 09:02:52 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 2 Feb 2022 09:02:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Yizhuo Zhai' <yzhai003@ucr.edu>
Subject: RE: [PATCH v2] fbdev: fbmem: Fix the implicit type casting
Thread-Topic: [PATCH v2] fbdev: fbmem: Fix the implicit type casting
Thread-Index: AQHYFxVn+cS+fUmzMESHo6Syg/F7Wqx/+Mmg
Date: Wed, 2 Feb 2022 09:02:52 +0000
Message-ID: <5286c6acac7c4ee598f6fa4a7ea04b86@AcuMS.aculab.com>
References: <202201311943.VXU6K1gH-lkp@intel.com>
 <20220201023559.2622144-1-yzhai003@ucr.edu>
In-Reply-To: <20220201023559.2622144-1-yzhai003@ucr.edu>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zheyu Ma <zheyuma97@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Zhen
 Lei <thunder.leizhen@huawei.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yizhuo Zhai
> Sent: 01 February 2022 02:36
>=20
> In function do_fb_ioctl(), the "arg" is the type of unsigned long,
> and in "case FBIOBLANK:" this argument is casted into an int before
> passig to fb_blank(). In fb_blank(), the comparision
> if (blank > FB_BLANK_POWERDOWN) would be bypass if the original
> "arg" is a large number, which is possible because it comes from
> the user input. Fix this by adding the check before the function
> call.

Doesn't this convert invalid values (> FB_BLANK_POWERDOWN)
that should generate errors into valid requests?

=09David

>=20
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>  drivers/video/fbdev/core/fbmem.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/=
fbmem.c
> index 0fa7ede94fa6..f08326efff54 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1162,6 +1162,8 @@ static long do_fb_ioctl(struct fb_info *info, unsig=
ned int cmd,
>  =09case FBIOBLANK:
>  =09=09console_lock();
>  =09=09lock_fb_info(info);
> +=09=09if (blank > FB_BLANK_POWERDOWN)
> +=09=09=09blank =3D FB_BLANK_POWERDOWN;
>  =09=09ret =3D fb_blank(info, arg);
>  =09=09/* might again call into fb_blank */
>  =09=09fbcon_fb_blanked(info, arg);
> --
> 2.25.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

