Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435B9710560
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 07:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A96110E86D;
	Thu, 25 May 2023 05:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 315 seconds by postgrey-1.36 at gabe;
 Thu, 25 May 2023 05:39:01 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAD510E86D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 05:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1684993138; i=markus.elfring@web.de;
 bh=Zvvwc8cnnW4Wc+pZOkXa60n/k+NdYaDNQDSle5oyfG4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=qOE6j7vNoA+RBNbVtxb3gpfnMmZ5LP/GeXqau/tCNKl7CtgLQGxl/0Xmp6+TiADHO
 JS0cFDGHXDwyIMFxNIGEk/2tj0tcwh+qXHnmhWkEA6pmFIRCCXkFwyabW6xmuPlL8r
 RtOMo4oACRBXrdt5/YXzuVpB9UKGPqbtrEPWpdRVc2j1D68Nu2m95S4FtHQYT6Y2x4
 j3+AnRtJN8tzM+u0ui0gG6PxUEfCV6mmehjSqpHm4ng29cKBOWmg5wKvys50ZTIkyD
 BA3rMypa9ueGzOWTXBJez1qIAhK2nU3FWznnzZ7chFsfpq5vapdieAAIzSSoqpDPBc
 1FHyi2P3C2weg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLifq-1pkOEC2Wqu-00HgoC; Thu, 25
 May 2023 07:33:36 +0200
Message-ID: <1d7228fb-f1f8-364c-aa29-5719a9da1fc6@web.de>
Date: Thu, 25 May 2023 07:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] fbdev: imsttfb: Fix error handling in init_imstt()
Content-Language: en-GB
To: Helge Deller <deller@gmx.de>, kernel-janitors@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zheng Wang <zyytlz.wz@163.com>
References: <069f2f78-01f3-9476-d860-2b695c122649@gmx.de>
 <97807a2d-ccf2-1fbf-06f7-085bb1bdf451@web.de>
 <c551c670-7458-ed50-eb2f-5a2b7ba421a8@web.de>
 <7e5643de-5d64-272e-cb36-bbe1e5c187ec@gmx.de>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <7e5643de-5d64-272e-cb36-bbe1e5c187ec@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LMZlbeHN89kCJKhe59rpM7y9XNJxfVfn5bd0SmDU7/INgTp4/UN
 dL7/6qAwYe4mZzU2+/hnlf4zf5onXrRlcxdNx41t3V06tWGLtDA7q/e9SEJzSW8wJMsLSqp
 bYOgZ/wFwTbTXT7r4rpeMukoW9KwizCTPWq94ZaI20SmdvkRC8BxU+kGmQwMMGFYLnQtmgo
 /Jti0y2U2fziIa0JBqhKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ne6WtrRgk8c=;LTr+CpHxBUzt/jFPPg0LqwUBZ09
 ebW9yyu45tZYGAAyBrtj2nVD8Nc5AAtwUWPjUTbzXqIk8KzWpA/vk8nmkZuoC6xAjlhwhSkpU
 m+Vok7WCeqscNIPXueC0lTS7m7TG0bQ9x7mocrp9mzsZihXTIOJTVYoyzrsNlW7zpL+BVt+Su
 F91Vk3Khmompa47Vkc79QB9lHV6m51jQkh4E51Cfeg/h0/EW1yIy+kM51avwv+PKJzPx42xfA
 enplAkrYXK5bANw3wF9OqfDjb5jf8+58CXGdE9SXWa3XAVta6wwu/gy2ijpE+sKj9hCZ7956+
 U+euD5sLn6ZqMxpmAulpU/W8i2gqluAPM4CGRZbD0sIe1qlYV3BMGJmmVWfj74D7sr/gvmWvS
 eRh7ekD39Byx4k6YlXpt8M/3yUAEw4JjgjsvnGBSox9liRm9Yn0fELzoD71di9IywfkyS6JwT
 l4bEOVIcs/eR+tr6aco8eZCH73OYP0n8NdV1uhoX2oXEeCYmD4EcQbMXIdJCtFBRgCP8d4vF8
 QKDPHyViG5AqiNuwTyHEvUkhJTPybxI1X1VGJ24iZ6Jc3QtmeKtv/qtb01bt6C2zPgfS0queq
 pLirsl3u8789ia4Cc2O0hnPLufnK/Xz/9rvqbLbyznk8Q0Q6Pu9NeBZBsAmlN1cRB+rVwNbug
 RF9OdVNHEiqSt7F20nuB296cHuQlmVVUmWwohdpplIIn4JqC/4TPrCWwxZyfMxIuBZ5ztCRlE
 8A5aseT4uIUBzGhKksBoFWfOQ2A5kkzZzjLghCZ7kCPmq10wgD+NB5Z0Mq0QAteFJJXBhM1w0
 sWV/marwaFQBVMYf0I/1qIaAw/BXcecg9x0l0RiI+OKeNUDV//yUbUuRC2p2EfcioWpkNcK/8
 RRdQf53alpLlaHrkbnaTegG7nWJ8lvCkkchjGNwrN/Ue7rqAW0Yc+eVErPMXF4PJH3emQPGFe
 AzFkaNmXChJ4+lrXPOFuq9F3PxM=
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
Cc: 1395428693sheep@gmail.com, hackerzheng666@gmail.com,
 LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr, alex000young@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> The return value was overlooked from a call of
>> the function =E2=80=9Cfb_alloc_cmap=E2=80=9D.
>>
>> * Thus use a corresponding error check.
>>
>> * Add two jump targets so that a bit of exception handling
>> =C2=A0=C2=A0 can be better reused at the end of this function.
=E2=80=A6
>> +++ b/drivers/video/fbdev/imsttfb.c
=E2=80=A6
>> @@ -1452,17 +1452,25 @@ static int init_imstt(struct fb_info *info)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FBINFO_HWACCEL_FILLRECT |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FBINFO_HWACCEL_YPAN;
>>
>> -=C2=A0=C2=A0=C2=A0 fb_alloc_cmap(&info->cmap, 0, 0);
>> +=C2=A0=C2=A0=C2=A0 ret =3D fb_alloc_cmap(&info->cmap, 0, 0);
>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto release_framebuffer;
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (register_framebuffer(info) < 0) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 framebuffer_release(info);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_dealloc_cmap(&info->cmap=
);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto e_nodev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmp =3D (read_reg_le32(par->dc_regs, SST=
ATUS) & 0x0f00) >> 8;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb_info(info, "%s frame buffer; %uMB vra=
m; chip version %u\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->fix.id, in=
fo->fix.smem_len >> 20, tmp);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +e_nodev:
>> +=C2=A0=C2=A0=C2=A0 ret =3D -ENODEV;
>
> I think the return value isn't checked at all, so you could
> simply return below "-ENODEV" for all cases (instead of "return ret").
> Then you don't need the e_nodev label and can simplify the flow.

Can it be helpful to distinguish involved error codes better?

How should return value ignorance be avoided further?

Regards,
Markus
