Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471E129CEF1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2196E497;
	Wed, 28 Oct 2020 08:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0456E497
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 08:18:54 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h6so6105762lfj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 01:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ns4WCI74gHudVhGKsDYKAzLy17ar1SfLmReThzeM/TI=;
 b=tlcg/YHJ+IR3T5VvjyCxmLEEQor/6T+eZL5PEGwrlqYwAZ0hpMnFDT8/rHMfPgu5Zp
 k/G7L+XJDd3XHhzN5wemAy3u4c5SgJxzvRwlTgqKhLDmmhsePyXfT4ohsHC+44KqeZhx
 RnRR9dfPotJst0mdvsmj/jQV2jgbsrfIbBftBYdk1qGnf/+rMdAtOniYBqTpFHB/+4DH
 S3vnTzSRIaxkTolf1ArcI0djI1C5jpp5+Af7KXO4i7i7SbkOTzojQocn56y8PkT2d9V9
 3kKuilrrEpCvc9EcmInkiYaXvzPQIGgU61NQHm/ihFIVXUPKyu+nl+cAiC2nQKTkj69N
 OKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ns4WCI74gHudVhGKsDYKAzLy17ar1SfLmReThzeM/TI=;
 b=Yc1seh5z+ldxlNoutWggHyB/g03L3P+aO+QkJsxaAIO+k4aXhVPThr8CtmxGVKoffI
 gJ/hj+sjnrR2WUHRRYR3AmIqR2ZeIoE95CsV9gnkuj0xqUHFP8qVsqZHfzNYtD/Qumge
 9XzHOe+plokb23Zt+9u2MCR/xd7Db/A7NQGb0q58VRK1T1xFuao5fmAB/i9O2b/IH9VF
 HUFuHjCrmvHD9cwTm2CmPaavHRd34/jB0C1JBf18Pv1tw3TrNuIriLOYVmy1p78oy9OU
 YnlDOuq9+dz3L3snSh61e0lOFjYYF9LOuOtjWLDJ8cwAM1+zRH9NsLflhJAjT+aNCyVj
 u+MA==
X-Gm-Message-State: AOAM530g9lJj9O5Lyb/KqWusKUOBY26/Lu4jDdMeb1jx0vA41iU7LZHY
 W7qiNdmimJ03rTZ9j+v5qaw=
X-Google-Smtp-Source: ABdhPJyUdPDX2MSrUBcAwrUBk3tDYdJo0h0lo7xWXfb7XWHpoZFYwFyaieZtbX00VZGGg8jXX4bccQ==
X-Received: by 2002:a05:6512:20a:: with SMTP id
 a10mr2211151lfo.128.1603873133363; 
 Wed, 28 Oct 2020 01:18:53 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id r3sm443069lfm.287.2020.10.28.01.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 01:18:52 -0700 (PDT)
Date: Wed, 28 Oct 2020 10:18:42 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Paul Gofman <pgofman@codeweavers.com>
Subject: Re: [PATCH libdrm] xf86drm.c: Use integer logarithm.
Message-ID: <20201028101842.041e8a02@eldfell>
In-Reply-To: <20201026131120.1068959-1-pgofman@codeweavers.com>
References: <20201026131120.1068959-1-pgofman@codeweavers.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1557316393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1557316393==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/I8L6J1XiMnGPq8hal.4Bv/="; protocol="application/pgp-signature"

--Sig_/I8L6J1XiMnGPq8hal.4Bv/=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2020 16:11:20 +0300
Paul Gofman <pgofman@codeweavers.com> wrote:

> log() is affected by FP control word and can provide inaccurate result.
>=20
> Fixes Killer Instinct under Wine not being able to find AMD vulkan
> device.
>=20
> Signed-off-by: Paul Gofman <pgofman@codeweavers.com>
> ---
>     With the rounding mode the application sets (unsigned int)log2(4) is =
1.
>     The log2_int() implemetation is copied from radeon/radeon_surface.c.
>=20
>  xf86drm.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/xf86drm.c b/xf86drm.c
> index 50a6f092..dbb7c14b 100644
> --- a/xf86drm.c
> +++ b/xf86drm.c
> @@ -124,6 +124,22 @@ static drmServerInfoPtr drm_server_info;
>  static bool drmNodeIsDRM(int maj, int min);
>  static char *drmGetMinorNameForFD(int fd, int type);
> =20
> +static unsigned log2_int(unsigned x)
> +{
> +    unsigned l;
> +
> +    if (x < 2) {
> +        return 0;
> +    }
> +    for (l =3D 2; ; l++) {
> +        if ((unsigned)(1 << l) > x) {

Hi,

wouldn't this loop fail to end when x >=3D 0x80000000?

Sure, such value probably cannot occur where this is currently used,
but it seems like a landmine for the next developer to step on.


Thanks,
pq

> +            return l - 1;
> +        }
> +    }
> +    return 0;
> +}
> +
> +
>  drm_public void drmSetServerInfo(drmServerInfoPtr info)
>  {
>      drm_server_info =3D info;
> @@ -4001,7 +4017,7 @@ static void drmFoldDuplicatedDevices(drmDevicePtr l=
ocal_devices[], int count)
>          for (j =3D i + 1; j < count; j++) {
>              if (drmDevicesEqual(local_devices[i], local_devices[j])) {
>                  local_devices[i]->available_nodes |=3D local_devices[j]-=
>available_nodes;
> -                node_type =3D log2(local_devices[j]->available_nodes);
> +                node_type =3D log2_int(local_devices[j]->available_nodes=
);
>                  memcpy(local_devices[i]->nodes[node_type],
>                         local_devices[j]->nodes[node_type], drmGetMaxNode=
Name());
>                  drmFreeDevice(&local_devices[j]);


--Sig_/I8L6J1XiMnGPq8hal.4Bv/=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+ZKWIACgkQI1/ltBGq
qqeGxw//ffxTeytgZpaFfXIciwOXO9PI7GLIU/YTGHLs+H8mKEfy+Aq+xN74rLXF
HXjVYYaswLBsvAkhSq12KaYtbXQKHvXrWXfljAQzOOSJ2ZUcRwBTYASR5AdJW5Qz
hBh4cPLj1PYKGBJiIokK8AbF/E5D4L5r8dGxgamj/R9q0WFB1Mbz6U7U5zaH9TRj
FeV4TUe8OPGRSexDdIdx50O7bUdtlIkPVOh1YuKCzUEpoGkEQMRwhr+5L1QGTVmU
hKdQjxb+4n/aW6dyQy4UDVk3dc9vb/ZCMOwivYHEHL39KIAVC7Ck+kSxUwKv+5Et
ZP1XEET3dCRWu0sa4YxsMijU6OubjNK+5oCFfTJxjXotR63xN9oSacG9wqZI3ksi
143W4i5FI+8D+AFUQOXHq7XGzS98ekbxC7vkRmHH1cwY7Y//iXJfoiIuZsU39hEK
olln45BiKuvHcOA5tU7+egK2DQPud1Eh8WRKrfJoPqVZX1ZUlgx5mTjbZjg360qa
TFsclm0/aHCgdgDaxqcybXe71vIYrD0Q1aTMAdZawgLbKCY7U1AaNOHkxcvAb8Dr
BscPTyAou/d5ZPl0bMVAkLuSVRhHhcfv+vwNbfdeDoOOacd2PPEQ0b7hOeQbpFY0
Qaqp81mEri38yyK36DQM0RP5vrUtVqj4YgnSsRxe5nR3BlrYGAc=
=cbIy
-----END PGP SIGNATURE-----

--Sig_/I8L6J1XiMnGPq8hal.4Bv/=--

--===============1557316393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1557316393==--
