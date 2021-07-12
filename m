Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534333C65F5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 00:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE7889F06;
	Mon, 12 Jul 2021 22:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 472 seconds by postgrey-1.36 at gabe;
 Mon, 12 Jul 2021 22:07:33 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889F389F06
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 22:07:33 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 6ED781C0B7A; Mon, 12 Jul 2021 23:59:38 +0200 (CEST)
Date: Mon, 12 Jul 2021 23:59:37 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 4.4 08/31] drm/virtio: Fixes a potential NULL
 pointer dereference on probe failure
Message-ID: <20210712215937.GA9488@amd>
References: <20210706112931.2066397-1-sashal@kernel.org>
 <20210706112931.2066397-8-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <20210706112931.2066397-8-sashal@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Xie Yongji <xieyongji@bytedance.com>, stable@vger.kernel.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Xie Yongji <xieyongji@bytedance.com>
>=20
> [ Upstream commit 17f46f488a5d82c5568e6e786cd760bba1c2ee09 ]
>=20
> The dev->dev_private might not be allocated if virtio_gpu_pci_quirk()
> or virtio_gpu_init() failed. In this case, we should avoid the cleanup
> in virtio_gpu_release().

The check is in wrong place at least in 4.4:

> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -257,6 +257,9 @@ int virtio_gpu_driver_unload(struct drm_device *dev)
>  	flush_work(&vgdev->config_changed_work);
>  	vgdev->vdev->config->del_vqs(vgdev->vdev);
> =20
> +	if (!vgdev)
> +		return;
> +

Pointer is dereferenced before being tested.

Best regards,
								Pavel
--
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany


--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDsu0kACgkQMOfwapXb+vJjkQCfTnZfEObWPQ0KW+EVB/gjNplI
MTsAoLIl0zT4dRziH65vFg9CK41DHEHK
=xObD
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
