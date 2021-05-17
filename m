Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E513382DF0
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 15:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346406E7DD;
	Mon, 17 May 2021 13:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B3F6E7DD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:51:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6077AAF11;
 Mon, 17 May 2021 13:51:09 +0000 (UTC)
Subject: Re: [PATCH v4 2/3] drm/hyperv: Handle feature change message from
 device
To: Deepak Rawat <drawat.floss@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org
References: <20210517115922.8033-1-drawat.floss@gmail.com>
 <20210517115922.8033-2-drawat.floss@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <917a36ef-8db3-16c5-21f1-7bd9aa7ee706@suse.de>
Date: Mon, 17 May 2021 15:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210517115922.8033-2-drawat.floss@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="876RRYCtmUYI4TgYg1M28rTMBdnHMKzlO"
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
Cc: Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--876RRYCtmUYI4TgYg1M28rTMBdnHMKzlO
Content-Type: multipart/mixed; boundary="Snc8cqlPpJR2QKdTuMz4CBgcTrZmeYBvJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Deepak Rawat <drawat.floss@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org
Cc: Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>
Message-ID: <917a36ef-8db3-16c5-21f1-7bd9aa7ee706@suse.de>
Subject: Re: [PATCH v4 2/3] drm/hyperv: Handle feature change message from
 device
References: <20210517115922.8033-1-drawat.floss@gmail.com>
 <20210517115922.8033-2-drawat.floss@gmail.com>
In-Reply-To: <20210517115922.8033-2-drawat.floss@gmail.com>

--Snc8cqlPpJR2QKdTuMz4CBgcTrZmeYBvJ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.05.21 um 13:59 schrieb Deepak Rawat:
> Virtual device inform if screen update is needed or not with
> SYNTHVID_FEATURE_CHANGE message. Handle this message to set dirt_needed=

> flag.
>=20
> Suggested-by: Dexuan Cui <decui@microsoft.com>
> Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/hyperv/hyperv_drm.h       | 1 +
>   drivers/gpu/drm/hyperv/hyperv_drm_drv.c   | 2 ++
>   drivers/gpu/drm/hyperv/hyperv_drm_proto.c | 7 +++++++
>   3 files changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hype=
rv/hyperv_drm.h
> index e1d1fdea96f2..886add4f9cd0 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm.h
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
> @@ -29,6 +29,7 @@ struct hyperv_drm_device {
>   	struct completion wait;
>   	u32 synthvid_version;
>   	u32 mmio_megabytes;
> +	bool dirt_needed;
>  =20
>   	u8 init_buf[VMBUS_MAX_PACKET_SIZE];
>   	u8 recv_buf[VMBUS_MAX_PACKET_SIZE];
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/=
hyperv/hyperv_drm_drv.c
> index 68a6ba91a486..8e6ff86c471a 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -201,6 +201,8 @@ static int hyperv_vmbus_probe(struct hv_device *hde=
v,
>   	if (ret)
>   		drm_warn(dev, "Failed to update vram location.\n");
>  =20
> +	hv->dirt_needed =3D true;
> +
>   	ret =3D hyperv_mode_config_init(hv);
>   	if (ret)
>   		goto err_vmbus_close;
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/dr=
m/hyperv/hyperv_drm_proto.c
> index 700870b243fe..6fff24b40974 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> @@ -301,8 +301,12 @@ int hyperv_update_situation(struct hv_device *hdev=
, u8 active, u32 bpp,
>  =20
>   int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect)=

>   {
> +	struct hyperv_drm_device *hv =3D hv_get_drvdata(hdev);
>   	struct synthvid_msg msg;
>  =20
> +	if (!hv->dirt_needed)
> +		return 0;
> +
>   	memset(&msg, 0, sizeof(struct synthvid_msg));
>  =20
>   	msg.vid_hdr.type =3D SYNTHVID_DIRT;
> @@ -387,6 +391,9 @@ static void hyperv_receive_sub(struct hv_device *hd=
ev)
>   		complete(&hv->wait);
>   		return;
>   	}
> +
> +	if (msg->vid_hdr.type =3D=3D SYNTHVID_FEATURE_CHANGE)
> +		hv->dirt_needed =3D msg->feature_chg.is_dirt_needed;
>   }
>  =20
>   static void hyperv_receive(void *ctx)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Snc8cqlPpJR2QKdTuMz4CBgcTrZmeYBvJ--

--876RRYCtmUYI4TgYg1M28rTMBdnHMKzlO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCidMwFAwAAAAAACgkQlh/E3EQov+DF
FxAAidwCE+/73KSotR2dlSbhgCOM9bYwaCRf+jS6NUcBMP7WJo0ALQcPnZQXlKzB8300RIl6Fsb2
/6euzj6aUTj0Zgf/tkfEiBiPof2AJXMseIDVpK8D/2XQ6xwFkug9WEV8M1fSMgBtEcLMgj7Oyh1m
Bxe4llxEs1jwML+hXkSWFz2g478m7EN1t3MlSOr8g2EFndu2EbJQf7tEoH9akCXSgxhpwV8l3Sr2
j3wuymFDtrDUK/h79pE+2f/wu50D/a+G52/22VYbYlghCDetJ9siLp6FQ2wkDO/0gvBDN1RlUECL
dEY4Qed03FIaLxULfXABCQnBU39nGquMC5f5VWShU4dpTJrQAvEd+mXHaga09uGW2ppVa3Qj1tOQ
FqzT7/BgAQHVrO+ezEfkvQlReEZSWy2snOgbX14Z15ftBnBwigW7EzCmTbAr4JzHRRtrfYRbieb1
k/hcflYG5l41lnGAA4fM0Kvt1vGt/fXYkoJgL/JbfjuZdOakAxmYVGBuWyjheB4thhLdYHm2VG58
zATm0gVqWJQEVGq3y3OvFy7EWepbT0KbiNZoMIuTFw7nISzCoYhHhDOO4dpEo5cQ9vcuJCjEoDp8
SA5CN5prSxU/KmZvm1ueJsXEVOtIjJIi2Rz+Bn/jLo3fXqGn6nKpdNLU1Yfz6nsAj2pYpfbItYwH
Lyw=
=sSso
-----END PGP SIGNATURE-----

--876RRYCtmUYI4TgYg1M28rTMBdnHMKzlO--
