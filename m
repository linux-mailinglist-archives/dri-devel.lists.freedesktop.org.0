Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BCF6157F
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 18:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7341289A83;
	Sun,  7 Jul 2019 16:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E1A89A83
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 16:14:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 286DFAD26;
 Sun,  7 Jul 2019 16:14:56 +0000 (UTC)
Subject: Re: [PATCH v2 3/6] drm/fb-helper: Instanciate shadow FB if configured
 in device's mode_config
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com, 
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
References: <20190705092613.7621-1-tzimmermann@suse.de>
 <20190705092613.7621-4-tzimmermann@suse.de>
 <68f5783f-8022-3238-a6d9-c6a774b39633@tronnes.org>
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
Message-ID: <59111691-5283-fb50-94a9-6960c425e81c@suse.de>
Date: Sun, 7 Jul 2019 18:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <68f5783f-8022-3238-a6d9-c6a774b39633@tronnes.org>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============1326729072=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1326729072==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xrnQnM9U0vnHwBglvDO2alPx0W8Zsc3qs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xrnQnM9U0vnHwBglvDO2alPx0W8Zsc3qs
Content-Type: multipart/mixed; boundary="iCnlfK9L0EAkOjP9IGk8gypWQ2kKFJIyg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <59111691-5283-fb50-94a9-6960c425e81c@suse.de>
Subject: Re: [PATCH v2 3/6] drm/fb-helper: Instanciate shadow FB if configured
 in device's mode_config
References: <20190705092613.7621-1-tzimmermann@suse.de>
 <20190705092613.7621-4-tzimmermann@suse.de>
 <68f5783f-8022-3238-a6d9-c6a774b39633@tronnes.org>
In-Reply-To: <68f5783f-8022-3238-a6d9-c6a774b39633@tronnes.org>

--iCnlfK9L0EAkOjP9IGk8gypWQ2kKFJIyg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.07.19 um 16:37 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 05.07.2019 11.26, skrev Thomas Zimmermann:
>> Generic framebuffer emulation uses a shadow buffer for framebuffers wi=
th
>> dirty() function. If drivers want to use the shadow FB without such a
>> function, they can now set prefer_shadow or prefer_shadow_fbdev in the=
ir
>> mode_config structures. The former flag is exported to userspace, the =
latter
>> flag is fbdev-only.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_fb_helper.c | 19 ++++++++++++++-----
>>  include/drm/drm_mode_config.h   |  5 +++++
>>  2 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_=
helper.c
>> index 7ba6a0255821..56ef169e1814 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -421,7 +421,9 @@ static void drm_fb_helper_dirty_work(struct work_s=
truct *work)
>>  				return;
>>  			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
>>  		}
>> -		helper->fb->funcs->dirty(helper->fb, NULL, 0, 0, &clip_copy, 1);
>> +		if (helper->fb->funcs->dirty)
>> +			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
>> +						 &clip_copy, 1);
>> =20
>>  		if (helper->buffer)
>>  			drm_client_buffer_vunmap(helper->buffer);
>> @@ -620,9 +622,6 @@ static void drm_fb_helper_dirty(struct fb_info *in=
fo, u32 x, u32 y,
>>  	struct drm_clip_rect *clip =3D &helper->dirty_clip;
>>  	unsigned long flags;
>> =20
>> -	if (!helper->fb->funcs->dirty)
>> -		return;
>=20
> drm_fb_helper_dirty() is called unconditionally by
> drm_fb_helper_sys_imageblit() et al, so we need check with
> drm_fbdev_use_shadow_fb() here.
>=20
>> -
>>  	spin_lock_irqsave(&helper->dirty_lock, flags);
>>  	clip->x1 =3D min_t(u32, clip->x1, x);
>>  	clip->y1 =3D min_t(u32, clip->y1, y);
>> @@ -2166,6 +2165,16 @@ static struct fb_deferred_io drm_fbdev_defio =3D=
 {
>>  	.deferred_io	=3D drm_fb_helper_deferred_io,
>>  };
>> =20
>> +static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
>> +{
>> +	struct drm_device *dev =3D fb_helper->dev;
>> +	struct drm_framebuffer *fb =3D fb_helper->fb;
>> +
>> +	return dev->mode_config.prefer_shadow_fbdev |
>> +	       dev->mode_config.prefer_shadow |
>=20
> Use logical OR here
>=20
>> +	       !!fb->funcs->dirty;
>=20
> and you can drop the the double NOT here.
>=20
>> +}
>> +
>>  /**
>>   * drm_fb_helper_generic_probe - Generic fbdev emulation probe helper=

>>   * @fb_helper: fbdev helper structure
>> @@ -2213,7 +2222,7 @@ int drm_fb_helper_generic_probe(struct drm_fb_he=
lper *fb_helper,
>> =20
>>  	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
>> =20
>> -	if (fb->funcs->dirty) {
>> +	if (drm_fbdev_use_shadow_fb(fb_helper)) {
>>  		struct fb_ops *fbops;
>>  		void *shadow;
>> =20
>> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_conf=
ig.h
>> index 759d462d028b..e1c751aca353 100644
>> --- a/include/drm/drm_mode_config.h
>> +++ b/include/drm/drm_mode_config.h
>> @@ -347,6 +347,8 @@ struct drm_mode_config_funcs {
>>   * @output_poll_work: delayed work for polling in process context
>>   * @preferred_depth: preferred RBG pixel depth, used by fb helpers
>>   * @prefer_shadow: hint to userspace to prefer shadow-fb rendering
>> + * @prefer_shadow_fbdev: hint to framebuffer emulation to prefer shad=
ow-fb \
>> +	rendering
>=20
> It's preferred to have the doc together with the struct member.

I just tried to follow the file's existing style, but OK, I don't mind.

> it's less likely to be forgotten when things change. And we don't use
> line cont. when the doc line is too long. Just continue on the next lin=
e
> after an asterix.
>=20
>>   * @cursor_width: hint to userspace for max cursor width
>>   * @cursor_height: hint to userspace for max cursor height
>>   * @helper_private: mid-layer private data
>> @@ -852,6 +854,9 @@ struct drm_mode_config {
>>  	/* dumb ioctl parameters */
>>  	uint32_t preferred_depth, prefer_shadow;
>> =20
>> +	/* fbdev parameters */
>=20
> No need for this comment.
>=20
> Doc can look like this, I've done s/framebuffer/fbdev/:
> 	/**
> 	 * @prefer_shadow_fbdev:
> 	 *
> 	 * Hint to fbdev emulation to prefer shadow-fb rendering.
> 	 */
>=20
>> +	uint32_t prefer_shadow_fbdev;
>=20
> Use bool here.
>=20
> With that:
>=20
> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>=20
> I have tested this on 2 drivers that use generic fbdev: vc4 (no shadow
> buf) and mi0283qt which has a dirty callback.
>=20
> Tested-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

Thanks for reviewing and testing the patches.

Best regards
Thomas

>=20
>> +
>>  	/**
>>  	 * @quirk_addfb_prefer_xbgr_30bpp:
>>  	 *
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--iCnlfK9L0EAkOjP9IGk8gypWQ2kKFJIyg--

--xrnQnM9U0vnHwBglvDO2alPx0W8Zsc3qs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl0iGn4ACgkQaA3BHVML
eiNNIggAthjAg3eHNki+tZpOoHKASavxIe/t/vQKl0A6bQF1Lp3K2ruEEEtejAfn
qgoOHuzj38Q5ZcxVPsXi//9/6dAybXGvDhjrP1diuSVqzQAkXjPMG0lyjL5ygjbe
KUXI7yRE2zpnLOvbzbzyDiTkA7VkuZNOxak/zxCb9kfUDXoDrfS1aTiqcznz7vo5
YXDBXlG2+WexebBhbqp9mIOzU33KaAjXNsIEN1VHCxCNBU1WO69uyCUk6DP6H1u7
08zZgDSObadLtxe/g9hwi4KmusX50aAPL0s7RkVQ5gecf7W6Hbpu7T28G6VYMLyg
ciZlUzHy9axBkKaYvNl8QrFt2AXeWw==
=Wx+J
-----END PGP SIGNATURE-----

--xrnQnM9U0vnHwBglvDO2alPx0W8Zsc3qs--

--===============1326729072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1326729072==--
