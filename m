Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF812AB5C0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 12:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE686E1CD;
	Fri,  6 Sep 2019 10:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EA86E1CD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 10:24:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DBC39B04F;
 Fri,  6 Sep 2019 10:24:05 +0000 (UTC)
Subject: Re: [PATCH v3 2/3] drm/vram: Add infrastructure for move_notify()
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190906085214.11677-1-tzimmermann@suse.de>
 <20190906085214.11677-3-tzimmermann@suse.de>
 <20190906092822.GD3958@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <5b033377-44a1-ebd1-7fad-322bede05eef@suse.de>
Date: Fri, 6 Sep 2019 12:24:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906092822.GD3958@phenom.ffwll.local>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: feng.tang@intel.com, dave@stgolabs.net, rong.a.chen@intel.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, maxime.ripard@bootlin.com,
 kraxel@redhat.com, ying.huang@intel.com, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1167098679=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1167098679==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FzMdCdnPqo6bBH8umToSRxntfH5KcpwDJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FzMdCdnPqo6bBH8umToSRxntfH5KcpwDJ
Content-Type: multipart/mixed; boundary="XjhILtgrQ2kXfQrdREfGbjlTKhUsk0KNS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: noralf@tronnes.org, airlied@linux.ie, rong.a.chen@intel.com,
 feng.tang@intel.com, ying.huang@intel.com, sean@poorly.run,
 maxime.ripard@bootlin.com, maarten.lankhorst@linux.intel.com,
 dave@stgolabs.net, kraxel@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <5b033377-44a1-ebd1-7fad-322bede05eef@suse.de>
Subject: Re: [PATCH v3 2/3] drm/vram: Add infrastructure for move_notify()
References: <20190906085214.11677-1-tzimmermann@suse.de>
 <20190906085214.11677-3-tzimmermann@suse.de>
 <20190906092822.GD3958@phenom.ffwll.local>
In-Reply-To: <20190906092822.GD3958@phenom.ffwll.local>

--XjhILtgrQ2kXfQrdREfGbjlTKhUsk0KNS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 06.09.19 um 11:28 schrieb Daniel Vetter:
> On Fri, Sep 06, 2019 at 10:52:13AM +0200, Thomas Zimmermann wrote:
>> This patch prepares VRAM helpers for lazy unmapping of buffer objects.=

>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_vram_mm_helper.c | 12 ++++++++++++
>>  include/drm/drm_vram_mm_helper.h     |  4 ++++
>>  2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_vram_mm_helper.c b/drivers/gpu/drm/dr=
m_vram_mm_helper.c
>> index c911781d6728..31984690d5f3 100644
>> --- a/drivers/gpu/drm/drm_vram_mm_helper.c
>> +++ b/drivers/gpu/drm/drm_vram_mm_helper.c
>> @@ -98,6 +98,17 @@ static int bo_driver_verify_access(struct ttm_buffe=
r_object *bo,
>>  	return vmm->funcs->verify_access(bo, filp);
>>  }
>> =20
>> +static void bo_driver_move_notify(struct ttm_buffer_object *bo,
>> +				  bool evict,
>> +				  struct ttm_mem_reg *new_mem)
>> +{
>> +	struct drm_vram_mm *vmm =3D drm_vram_mm_of_bdev(bo->bdev);
>> +
>> +	if (!vmm->funcs || !vmm->funcs->move_notify)
>> +		return;
>> +	vmm->funcs->move_notify(bo, evict, new_mem);
>> +}
>> +
>>  static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
>>  				    struct ttm_mem_reg *mem)
>>  {
>> @@ -140,6 +151,7 @@ static struct ttm_bo_driver bo_driver =3D {
>>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>>  	.evict_flags =3D bo_driver_evict_flags,
>>  	.verify_access =3D bo_driver_verify_access,
>> +	.move_notify =3D bo_driver_move_notify,
>>  	.io_mem_reserve =3D bo_driver_io_mem_reserve,
>>  	.io_mem_free =3D bo_driver_io_mem_free,
>>  };
>> diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram_m=
m_helper.h
>> index 2aacfb1ccfae..7fb8700f45fe 100644
>> --- a/include/drm/drm_vram_mm_helper.h
>> +++ b/include/drm/drm_vram_mm_helper.h
>> @@ -15,6 +15,8 @@ struct drm_device;
>>  	&ttm_bo_driver.evict_flags
>>   * @verify_access:	Provides an implementation for \
>>  	struct &ttm_bo_driver.verify_access
>> + * @move_notify:	Provides an implementation for
>> + *			struct &ttm_bo_driver.move_notify
>>   *
>>   * These callback function integrate VRAM MM with TTM buffer objects.=
 New
>>   * functions can be added if necessary.
>> @@ -23,6 +25,8 @@ struct drm_vram_mm_funcs {
>>  	void (*evict_flags)(struct ttm_buffer_object *bo,
>>  			    struct ttm_placement *placement);
>>  	int (*verify_access)(struct ttm_buffer_object *bo, struct file *filp=
);
>> +	void (*move_notify)(struct ttm_buffer_object *bo, bool evict,
>> +			    struct ttm_mem_reg *new_mem);
>=20
> Is this indirection really worth it? We have a grand total of 1 driver
> which isn't using gem (vmwgfx), and I don't think that one will ever
> switch over to vram helpers.
>=20
> I'd fold that all in. Helpers don't need to be flexible enough to suppo=
rt
> every possible use-case (that's just the job of the core), they can be
> opinionated to get cleaner code for most cases.
>=20

The original idea was to make this as flexible as possible; probably
more flexible than necessary. I wouldn't mind merging everything into
one file, but please not in this patch set, can we keep it for now and I
send you a cleanup next?

Best regards
Thomas

> For this case here if you fold this in you can unexport 3 EXPORT_SYMBOL=
s
> (4 with this patch here), which I think is a neat simplification of the=

> complexity exposed to driver writers. Just put the necessary declaratio=
ns
> into a drm_vram_helper_internal.h so that drivers don't get at it by
> accident (like the other drm*internal.h helpers we have).
> -Daniel
>=20
>>  };
>> =20
>>  /**
>> --=20
>> 2.23.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--XjhILtgrQ2kXfQrdREfGbjlTKhUsk0KNS--

--FzMdCdnPqo6bBH8umToSRxntfH5KcpwDJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl1yM8AACgkQaA3BHVML
eiPGhQf+PPvzqDIrgVdsjLfX+jaxYahye/OQY44ejG1VOxpLtG9lS/klRSO6Hgg3
XeTBnKDj+SRXxiXZzxDXMHEWlugeNWh9j4U/XGh/gMWzWBtHCPc+FBhquh5xTCM0
I4dBWHxLg46ev3Hvjyqv4+nxyk84114uudtSSjiurhsY+9+4kIfeRRqVlvwsmfaS
yeUenOQdsqvHS7h0l9s1YcPqUWVvzKLDPnlEUpM4YGg+SUZ7RICI82tnP4H213nY
jff8e1ODWRAoJxjCKaaJtAOrt1TuGwutCt8DkuVn0J9aT1B5zCfDS5V9yk/rmPYc
1Jec6CgufR1DlC8DYegIZ9cW1FhmUQ==
=eqNx
-----END PGP SIGNATURE-----

--FzMdCdnPqo6bBH8umToSRxntfH5KcpwDJ--

--===============1167098679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1167098679==--
