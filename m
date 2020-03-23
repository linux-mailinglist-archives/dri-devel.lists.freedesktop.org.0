Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036CF190722
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2E76E452;
	Tue, 24 Mar 2020 08:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 368 seconds by postgrey-1.36 at gabe;
 Mon, 23 Mar 2020 15:00:53 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739C86E188
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 15:00:53 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-2-iYJu0SDqM9iMX_bcm93M5w-1;
 Mon, 23 Mar 2020 14:54:41 +0000
X-MC-Unique: iYJu0SDqM9iMX_bcm93M5w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 23 Mar 2020 14:54:40 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 23 Mar 2020 14:54:40 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Melissa Wen' <melissa.srw@gmail.com>, Rodrigo Siqueira
 <rodrigosiqueiramelo@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>
Subject: RE: [PATCH] drm/vkms: use bitfield op to get xrgb on compute crc
Thread-Topic: [PATCH] drm/vkms: use bitfield op to get xrgb on compute crc
Thread-Index: AQHV/8B1smDC5j2GuEKWS+RWmHzqeKhWQ8Aw
Date: Mon, 23 Mar 2020 14:54:40 +0000
Message-ID: <d82c4d909a2d4921941121ba60aa91c9@AcuMS.aculab.com>
References: <20200321203640.dwyk25jvnn2rffpw@smtp.gmail.com>
In-Reply-To: <20200321203640.dwyk25jvnn2rffpw@smtp.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Melissa Wen
> Sent: 21 March 2020 20:37
> The previous memset operation was not correctly setting zero on the
> alpha channel to compute the crc, and as a result, the
> pipe-A-cursor-alpha-transparent subtest of the IGT test kms_cursor_crc
> was crashing. To avoid errors of misinterpretation related to
> endianness, this solution uses a bitfield operation to extract the RGB
> values from each pixel and ignores the alpha channel as expected.
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 4af2f19480f4..8c1c005bb717 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
> 
>  #include <linux/crc32.h>
> +#include <linux/bitfield.h>
> 
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -9,6 +10,8 @@
> 
>  #include "vkms_drv.h"
> 
> +#define XRGB_MSK GENMASK(23, 0)
> +
>  /**
>   * compute_crc - Compute CRC value on output frame
>   *
> @@ -26,6 +29,7 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
>  	int h_src = drm_rect_height(&composer->src) >> 16;
>  	int w_src = drm_rect_width(&composer->src) >> 16;
>  	u32 crc = 0;
> +	u32 *pixel;
> 
>  	for (i = y_src; i < y_src + h_src; ++i) {
>  		for (j = x_src; j < x_src + w_src; ++j) {
> @@ -33,7 +37,8 @@ static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
>  				     + (i * composer->pitch)
>  				     + (j * composer->cpp);
>  			/* XRGB format ignores Alpha channel */
> -			memset(vaddr_out + src_offset + 24, 0,  8);
> +			pixel = vaddr_out + src_offset;
> +			*pixel = FIELD_GET(XRGB_MSK, *(u32 *)pixel);
>  			crc = crc32_le(crc, vaddr_out + src_offset,
>  				       sizeof(u32));

That looks horrid.
I suspect the simplest fix is to change the memset() offset/length
to bytes from bits.
Or (assuming the alpha channel is last) just:
	*(u8 *)(vaddr_out + src_offset + 3) = 0;
I'm not sure of the options for the crc code, but if you are only
passing in 4 bytes there ought to be an option to pass in the value
itself (rather than the address).

Do you actually want to 'zap' the alpha channel data from the
output buffer? or just exclude it from the crc??

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
