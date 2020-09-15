Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C8A26A156
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 10:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78BFE6E21E;
	Tue, 15 Sep 2020 08:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E9B89FCA;
 Tue, 15 Sep 2020 08:56:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87BA2AFA9;
 Tue, 15 Sep 2020 08:57:07 +0000 (UTC)
Subject: Re: [PATCH 18/20] drm/xen: Introduce GEM object functions
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
 "inki.dae@samsung.com" <inki.dae@samsung.com>,
 "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "kgene@kernel.org" <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "bskeggs@redhat.com"
 <bskeggs@redhat.com>, "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
 "eric@anholt.net" <eric@anholt.net>, "hjc@rock-chips.com"
 <hjc@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "hyun.kwon@xilinx.com" <hyun.kwon@xilinx.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "evan.quan@amd.com" <evan.quan@amd.com>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "tianci.yin@amd.com" <tianci.yin@amd.com>,
 "marek.olsak@amd.com" <marek.olsak@amd.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "andrey.grodzovsky@amd.com" <andrey.grodzovsky@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "xinhui.pan@amd.com" <xinhui.pan@amd.com>,
 "aaron.liu@amd.com" <aaron.liu@amd.com>,
 "nirmoy.das@amd.com" <nirmoy.das@amd.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "abdiel.janulgue@linux.intel.com" <abdiel.janulgue@linux.intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "andi.shyti@intel.com" <andi.shyti@intel.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "miaoqinglang@huawei.com" <miaoqinglang@huawei.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-19-tzimmermann@suse.de>
 <1fe5f918-2445-d2e6-a501-881e70929404@epam.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ea91877b-6398-a398-4972-9794f7965662@suse.de>
Date: Tue, 15 Sep 2020 10:56:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1fe5f918-2445-d2e6-a501-881e70929404@epam.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============2127342813=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2127342813==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PEKUmr8ZTfzNvLYko4DS4LvqUwNvZCpsP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PEKUmr8ZTfzNvLYko4DS4LvqUwNvZCpsP
Content-Type: multipart/mixed; boundary="kA0kz2rRnYLjEYgqBQNbqkILRFPajOphI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
 "inki.dae@samsung.com" <inki.dae@samsung.com>,
 "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "kgene@kernel.org" <kgene@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>, "bskeggs@redhat.com"
 <bskeggs@redhat.com>, "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
 "eric@anholt.net" <eric@anholt.net>, "hjc@rock-chips.com"
 <hjc@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "hyun.kwon@xilinx.com" <hyun.kwon@xilinx.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "evan.quan@amd.com" <evan.quan@amd.com>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "tianci.yin@amd.com" <tianci.yin@amd.com>,
 "marek.olsak@amd.com" <marek.olsak@amd.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "andrey.grodzovsky@amd.com" <andrey.grodzovsky@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "xinhui.pan@amd.com" <xinhui.pan@amd.com>,
 "aaron.liu@amd.com" <aaron.liu@amd.com>,
 "nirmoy.das@amd.com" <nirmoy.das@amd.com>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "matthew.auld@intel.com" <matthew.auld@intel.com>,
 "abdiel.janulgue@linux.intel.com" <abdiel.janulgue@linux.intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "andi.shyti@intel.com" <andi.shyti@intel.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "miaoqinglang@huawei.com" <miaoqinglang@huawei.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <ea91877b-6398-a398-4972-9794f7965662@suse.de>
Subject: Re: [PATCH 18/20] drm/xen: Introduce GEM object functions
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-19-tzimmermann@suse.de>
 <1fe5f918-2445-d2e6-a501-881e70929404@epam.com>
In-Reply-To: <1fe5f918-2445-d2e6-a501-881e70929404@epam.com>

--kA0kz2rRnYLjEYgqBQNbqkILRFPajOphI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 13:19 schrieb Oleksandr Andrushchenko:
> Hi,
>=20
> On 8/13/20 11:36 AM, Thomas Zimmermann wrote:
>> GEM object functions deprecate several similar callback interfaces in
>> struct drm_driver. This patch replaces the per-driver callbacks with
>> per-instance callbacks in xen. The only exception is gem_prime_mmap,
>> which is non-trivial to convert.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/xen/xen_drm_front.c     | 12 +-----------
>>   drivers/gpu/drm/xen/xen_drm_front.h     |  2 ++
>>   drivers/gpu/drm/xen/xen_drm_front_gem.c | 15 +++++++++++++++
>>   3 files changed, 18 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen=
/xen_drm_front.c
>> index 3e660fb111b3..bd9af1875af1 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
>> @@ -433,7 +433,7 @@ static int xen_drm_drv_dumb_create(struct drm_file=
 *filp,
>>   	return ret;
>>   }
>>  =20
>> -static void xen_drm_drv_free_object_unlocked(struct drm_gem_object *o=
bj)
>> +void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj)
>=20
> Can we please have naming consistent and name it as
>=20
> xen_drm_front_drv_free_object_unlocked or any other name if this seems =
to be too long,
>=20
> but starting with xen_drm_front_ as the rest of exported functions?

There already is a function with that name in drm_xen_front_gem.c. I'll
move the callback function next to the object-function structure and
rename it slightly.

Best regards
Thomas

>=20
> With this,
>=20
> Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Thank you,
>=20
> Oleksandr
>=20
>>   {
>>   	struct xen_drm_front_drm_info *drm_info =3D obj->dev->dev_private;
>>   	int idx;
>> @@ -481,22 +481,12 @@ static const struct file_operations xen_drm_dev_=
fops =3D {
>>   	.mmap           =3D xen_drm_front_gem_mmap,
>>   };
>>  =20
>> -static const struct vm_operations_struct xen_drm_drv_vm_ops =3D {
>> -	.open           =3D drm_gem_vm_open,
>> -	.close          =3D drm_gem_vm_close,
>> -};
>> -
>>   static struct drm_driver xen_drm_driver =3D {
>>   	.driver_features           =3D DRIVER_GEM | DRIVER_MODESET | DRIVER=
_ATOMIC,
>>   	.release                   =3D xen_drm_drv_release,
>> -	.gem_vm_ops                =3D &xen_drm_drv_vm_ops,
>> -	.gem_free_object_unlocked  =3D xen_drm_drv_free_object_unlocked,
>>   	.prime_handle_to_fd        =3D drm_gem_prime_handle_to_fd,
>>   	.prime_fd_to_handle        =3D drm_gem_prime_fd_to_handle,
>>   	.gem_prime_import_sg_table =3D xen_drm_front_gem_import_sg_table,
>> -	.gem_prime_get_sg_table    =3D xen_drm_front_gem_get_sg_table,
>> -	.gem_prime_vmap            =3D xen_drm_front_gem_prime_vmap,
>> -	.gem_prime_vunmap          =3D xen_drm_front_gem_prime_vunmap,
>>   	.gem_prime_mmap            =3D xen_drm_front_gem_prime_mmap,
>>   	.dumb_create               =3D xen_drm_drv_dumb_create,
>>   	.fops                      =3D &xen_drm_dev_fops,
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen=
/xen_drm_front.h
>> index f92c258350ca..93e60c1db550 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front.h
>> +++ b/drivers/gpu/drm/xen/xen_drm_front.h
>> @@ -160,4 +160,6 @@ int xen_drm_front_page_flip(struct xen_drm_front_i=
nfo *front_info,
>>   void xen_drm_front_on_frame_done(struct xen_drm_front_info *front_in=
fo,
>>   				 int conn_idx, u64 fb_cookie);
>>  =20
>> +void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj);
>> +
>>   #endif /* __XEN_DRM_FRONT_H_ */
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm=
/xen/xen_drm_front_gem.c
>> index f0b85e094111..7b315c08bcfc 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
>> @@ -56,6 +56,19 @@ static void gem_free_pages_array(struct xen_gem_obj=
ect *xen_obj)
>>   	xen_obj->pages =3D NULL;
>>   }
>>  =20
>> +static const struct vm_operations_struct xen_drm_drv_vm_ops =3D {
>> +	.open           =3D drm_gem_vm_open,
>> +	.close          =3D drm_gem_vm_close,
>> +};
>> +
>> +static const struct drm_gem_object_funcs xen_drm_front_gem_object_fun=
cs =3D {
>> +	.free =3D xen_drm_drv_free_object_unlocked,
>> +	.get_sg_table =3D xen_drm_front_gem_get_sg_table,
>> +	.vmap =3D xen_drm_front_gem_prime_vmap,
>> +	.vunmap =3D xen_drm_front_gem_prime_vunmap,
>> +	.vm_ops =3D &xen_drm_drv_vm_ops,
>> +};
>> +
>>   static struct xen_gem_object *gem_create_obj(struct drm_device *dev,=

>>   					     size_t size)
>>   {
>> @@ -66,6 +79,8 @@ static struct xen_gem_object *gem_create_obj(struct =
drm_device *dev,
>>   	if (!xen_obj)
>>   		return ERR_PTR(-ENOMEM);
>>  =20
>> +	xen_obj->base.funcs =3D &xen_drm_front_gem_object_funcs;
>> +
>>   	ret =3D drm_gem_object_init(dev, &xen_obj->base, size);
>>   	if (ret < 0) {
>>   		kfree(xen_obj);

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--kA0kz2rRnYLjEYgqBQNbqkILRFPajOphI--

--PEKUmr8ZTfzNvLYko4DS4LvqUwNvZCpsP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9ggdEUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPDBwf/f2Q/YJ8WXCfC3ehLZzwlJXNPSLdV
RBu8TYn7lfxxUA4dxKgUAU8gtA/RhGAj6nStvS9xB/lBn3Pzea0Zgxyi9muLzrVj
AAtdCLdz4ykNSJKXeHJFa2/gNzRETQYNok4p3aC2o7qLw1vUdb3U2GY3PzrEX+CR
cF1iwAbanJ+/6sT1OATWLOSzjyZ4EkRCP6xclKm6wzrrATaBUeneBeDT0TW4OY1i
0W8WRT7epjcXidinkJnDOtSXDzLRgl5eV5BnsTioD1vJ12ArZwkW0xG/wTTpNgMq
Rs06mSE5osC1vjmNLl5TUYmtRzgLkOztpo+HyNQH5SwuMdM1wMCL8OkOVA==
=swh3
-----END PGP SIGNATURE-----

--PEKUmr8ZTfzNvLYko4DS4LvqUwNvZCpsP--

--===============2127342813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2127342813==--
