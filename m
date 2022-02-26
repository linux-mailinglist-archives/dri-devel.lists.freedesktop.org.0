Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC94C587D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 23:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D32710E1AA;
	Sat, 26 Feb 2022 22:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A8710E1AA
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 22:22:04 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-218-qo9exv-6NkuKleZpLM9g_w-1; Sat, 26 Feb 2022 22:22:00 +0000
X-MC-Unique: qo9exv-6NkuKleZpLM9g_w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sat, 26 Feb 2022 22:21:58 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sat, 26 Feb 2022 22:21:58 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'trix@redhat.com'" <trix@redhat.com>, "alexander.deucher@amd.com"
 <alexander.deucher@amd.com>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>, "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "nathan@kernel.org" <nathan@kernel.org>, "ndesaulniers@google.com"
 <ndesaulniers@google.com>, "nirmoy.das@amd.com" <nirmoy.das@amd.com>,
 "lijo.lazar@amd.com" <lijo.lazar@amd.com>, "tom.stdenis@amd.com"
 <tom.stdenis@amd.com>, "evan.quan@amd.com" <evan.quan@amd.com>,
 "kevin1.wang@amd.com" <kevin1.wang@amd.com>, "Amaranath.Somalapuram@amd.com"
 <Amaranath.Somalapuram@amd.com>
Subject: RE: [PATCH] drm/amdgpu: Fix realloc of ptr
Thread-Topic: [PATCH] drm/amdgpu: Fix realloc of ptr
Thread-Index: AQHYKynKuecV+YVBsEaifDyg6Kuo9qymZ9yQ
Date: Sat, 26 Feb 2022 22:21:58 +0000
Message-ID: <f863c19ccba34e50802836bcb3b0b622@AcuMS.aculab.com>
References: <20220226155851.4176109-1-trix@redhat.com>
In-Reply-To: <20220226155851.4176109-1-trix@redhat.com>
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: trix@redhat.com
> Sent: 26 February 2022 15:59
>=20
> From: Tom Rix <trix@redhat.com>
>=20
> Clang static analysis reports this error
> amdgpu_debugfs.c:1690:9: warning: 1st function call
>   argument is an uninitialized value
>   tmp =3D krealloc_array(tmp, i + 1,
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> realloc will free tmp, so tmp can not be garbage.
> And the return needs to be checked.

Are you sure?
A quick check seems to show that krealloc() behaves the same
way as libc realloc() and the pointer isn't freed on failure.

=09David

> Fixes: 5ce5a584cb82 ("drm/amdgpu: add debugfs for reset registers list")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_debugfs.c
> index 9eb9b440bd438..159b97c0b4ebc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1676,7 +1676,7 @@ static ssize_t amdgpu_reset_dump_register_list_writ=
e(struct file *f,
>  {
>  =09struct amdgpu_device *adev =3D (struct amdgpu_device *)file_inode(f)-=
>i_private;
>  =09char reg_offset[11];
> -=09uint32_t *tmp;
> +=09uint32_t *tmp =3D NULL;
>  =09int ret, i =3D 0, len =3D 0;
>=20
>  =09do {
> @@ -1688,6 +1688,10 @@ static ssize_t amdgpu_reset_dump_register_list_wri=
te(struct file *f,
>  =09=09}
>=20
>  =09=09tmp =3D krealloc_array(tmp, i + 1, sizeof(uint32_t), GFP_KERNEL);
> +=09=09if (!tmp) {
> +=09=09=09ret =3D -ENOMEM;
> +=09=09=09goto error_free;
> +=09=09}
>  =09=09if (sscanf(reg_offset, "%X %n", &tmp[i], &ret) !=3D 1) {
>  =09=09=09ret =3D -EINVAL;
>  =09=09=09goto error_free;
> --
> 2.26.3

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

