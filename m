Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7963BEFF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF5E10E3B4;
	Tue, 29 Nov 2022 11:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A7610E3B1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gNBLSZAF56/LN24qZVNj60+NHeDfgi6GnJ8+SBN0Mv4=; b=qBNRrtcxbChGODJys7iZ78jvQW
 OU/Sfxu5pUSOHtCZdJZpKsXG/6+dbf+CWNEdGsuEGo0MfcKHwuHZOdXE8cUPPjprnQdze+9rZmDfB
 Bb0i6S/pJh44pwIay5JH/L/m2W+8EKQqOwgp7Y0l9Lwzlhq03BB6mCE7XfFhgmhfPb73pPH0YXx6b
 OJgEbXrDOKDviAOgnaSwZ2Pm/n/H1UJc5gGNFi1MBJDCcaWaXz5w1ARKjgLCekIAZmrFjM3fZSP14
 u4TxKhv2YHZ5YxpJ/hk1uwTSbppaOSCUF7M3ShYHefhr53jMfx5aG/eys6mj7EPPSh/0ypuK4nxHG
 B0nEGPeA==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ozyop-00Awhl-Uv; Tue, 29 Nov 2022 12:30:32 +0100
Date: Tue, 29 Nov 2022 10:30:27 -0100
From: Melissa Wen <mwen@igalia.com>
To: Yuan Can <yuancan@huawei.com>
Subject: Re: [PATCH 2/2] drm/vkms: Fix null-ptr-deref in vkms_release()
Message-ID: <20221129113027.mxfmj7cfi2cuso5g@mail.igalia.com>
References: <20221101065156.41584-1-yuancan@huawei.com>
 <20221101065156.41584-3-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2m32qt7vjqbyabio"
Content-Disposition: inline
In-Reply-To: <20221101065156.41584-3-yuancan@huawei.com>
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
Cc: hamohammed.sa@gmail.com, sylphrenadin@gmail.com,
 rodrigosiqueiramelo@gmail.com, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2m32qt7vjqbyabio
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11/01, Yuan Can wrote:
> A null-ptr-deref is triggered when it tries to destroy the workqueue in
> vkms->output.composer_workq in vkms_release().
>=20
>  KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
>  CPU: 5 PID: 17193 Comm: modprobe Not tainted 6.0.0-11331-gd465bff130bf #=
24
>  RIP: 0010:destroy_workqueue+0x2f/0x710
>  ...
>  Call Trace:
>   <TASK>
>   ? vkms_config_debugfs_init+0x50/0x50 [vkms]
>   __devm_drm_dev_alloc+0x15a/0x1c0 [drm]
>   vkms_init+0x245/0x1000 [vkms]
>   do_one_initcall+0xd0/0x4f0
>   do_init_module+0x1a4/0x680
>   load_module+0x6249/0x7110
>   __do_sys_finit_module+0x140/0x200
>   do_syscall_64+0x35/0x80
>   entry_SYSCALL_64_after_hwframe+0x46/0xb0
>=20
> The reason is that an OOM happened which triggers the destroy of the
> workqueue, however, the workqueue is alloced in the later process,
> thus a null-ptr-deref happened. A simple call graph is shown as below:
>=20
>  vkms_init()
>   vkms_create()
>     devm_drm_dev_alloc()
>       __devm_drm_dev_alloc()
>         devm_drm_dev_init()
>           devm_add_action_or_reset()
>             devm_add_action() # an error happened
>             devm_drm_dev_init_release()
>               drm_dev_put()
>                 kref_put()
>                   drm_dev_release()
>                     vkms_release()
>                       destroy_workqueue() # null-ptr-deref happened
>     vkms_modeset_init()
>       vkms_output_init()
>         vkms_crtc_init() # where the workqueue get allocated
>=20
> Fix this by checking if composer_workq is NULL before passing it to
> the destroy_workqueue() in vkms_release().
>=20
> Fixes: 6c234fe37c57 ("drm/vkms: Implement CRC debugfs API")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index dfe983eaa07f..f716c5796f5f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -57,7 +57,8 @@ static void vkms_release(struct drm_device *dev)
>  {
>  	struct vkms_device *vkms =3D drm_device_to_vkms_device(dev);
> =20
> -	destroy_workqueue(vkms->output.composer_workq);
> +	if (vkms->output.composer_workq)
> +		destroy_workqueue(vkms->output.composer_workq);

Reviewed-by: Melissa Wen <mwen@igalia.com>
>  }
> =20
>  static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> --=20
> 2.17.1
>=20

--2m32qt7vjqbyabio
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOF7VMACgkQwqF3j0dL
ehwGMhAArhbC6jMX4Do2oTMaXkeokEX81a94SrTfeSPOiHkCupxZlS9oO+0lEPPI
dGd7gNZ41NMVDvdHM1F8HsgXD7zg3eUBNO+xlqSa6uFeAruqEFLbRTZ2Au9BxN6v
V1KgH+UisXRL99L8ZIIdUiodPRFpJs3wXkZjvxNb6BnyvCqRILKMQHd/n9oNp+EN
Q7MiQ8UWa0j+HQJD26623LuP5fXimoXwPZLZh4pJ1Cu+2yv7DKzRrpeXg7u0LGA7
rLlL/Y8vslQbvaJms5V6Bx3/f7fozDIN5ceo5lO1v2GkNBSdZijfbuAF0Qr7GlQL
1Teap9sayBuKbn9JjdU/1q5JijuM1pdDtIXXL3F1tKQsGyj/GYjuG5Qu6L0Nf3Wf
z2GZvtzzyhi1Q+s1pcGAWAr5xrZHC+xGqApMF85EHQGN5OZTohK6nwv75AMX1wfJ
8XyDW6pt7k7UW/fkPlGCdHF4w7yqNBZXuCW72TnRTpF80RGOFbtec0AngHunlu8w
1Sz+D/necL6pXOykAbSCqnKme0+PvqCzV4HLIvYJbXHju+q7CIqG59pYjOnbl843
ETSwmyri9Qzav0Iw7T5EH10dlwW+SizwgZpppLtmNBlrEz02IVTfMbKoPF3SYyfP
Q7fYTNImcHKWLv8oE5589WcNb4apqJ54H4cy4ATEJsRMX8Dtwa8=
=v2xL
-----END PGP SIGNATURE-----

--2m32qt7vjqbyabio--
