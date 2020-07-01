Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B45210457
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 08:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE01D6E44A;
	Wed,  1 Jul 2020 06:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ADE6E44A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 06:57:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 172A5AC22;
 Wed,  1 Jul 2020 06:56:59 +0000 (UTC)
Subject: Re: [PATCH] drm: fix double free for gbo in drm_gem_vram_init and
 drm_gem_vram_create
To: Jia Yang <jiayang5@huawei.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
References: <20200620062134.82961-1-jiayang5@huawei.com>
 <b6410a5e-2649-ba17-b4fe-eb24dab45253@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <9ab7bd1e-93b2-6867-aea8-239fb848b3bb@suse.de>
Date: Wed, 1 Jul 2020 08:56:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <b6410a5e-2649-ba17-b4fe-eb24dab45253@huawei.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2075032765=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2075032765==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TGCSCpzdeQxFOMXH8fIaFbCRNJdz4hh2N"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TGCSCpzdeQxFOMXH8fIaFbCRNJdz4hh2N
Content-Type: multipart/mixed; boundary="jDRub4HfXYqQa83F4pTkQBC2diU4aJNUs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jia Yang <jiayang5@huawei.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <9ab7bd1e-93b2-6867-aea8-239fb848b3bb@suse.de>
Subject: Re: [PATCH] drm: fix double free for gbo in drm_gem_vram_init and
 drm_gem_vram_create
References: <20200620062134.82961-1-jiayang5@huawei.com>
 <b6410a5e-2649-ba17-b4fe-eb24dab45253@huawei.com>
In-Reply-To: <b6410a5e-2649-ba17-b4fe-eb24dab45253@huawei.com>

--jDRub4HfXYqQa83F4pTkQBC2diU4aJNUs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Thanks for the patch and apologies for being late with the review.

The fix is good, but I'd like to see different approach. I'd rather have
drm_gem_vram_init() being integrated into drm_gem_vram_create().

Do you prefer to make the patch or shall I type up something? Would you
be able to test?

I have some comments on the resulting changes below.

Am 01.07.20 um 04:32 schrieb Jia Yang:
> Ping...
>=20
> On 2020/6/20 14:21, Jia Yang wrote:
>> I got a use-after-free report when doing some fuzz test:
>>
>> If ttm_bo_init() fails, the "gbo" and "gbo->bo.base" will be
>> freed by ttm_buffer_object_destroy() in ttm_bo_init(). But
>> then drm_gem_vram_create() and drm_gem_vram_init() will free
>> "gbo" and "gbo->bo.base" again.
>>
>> BUG: KMSAN: use-after-free in drm_vma_offset_remove+0xb3/0x150
>> CPU: 0 PID: 24282 Comm: syz-executor.1 Tainted: G    B   W         5.7=
=2E0-rc4-msan #2
>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Ubuntu-1.8=
=2E2-1ubuntu1 04/01/2014
>> Call Trace:
>>  __dump_stack
>>  dump_stack+0x1c9/0x220
>>  kmsan_report+0xf7/0x1e0
>>  __msan_warning+0x58/0xa0
>>  drm_vma_offset_remove+0xb3/0x150
>>  drm_gem_free_mmap_offset
>>  drm_gem_object_release+0x159/0x180
>>  drm_gem_vram_init
>>  drm_gem_vram_create+0x7c5/0x990
>>  drm_gem_vram_fill_create_dumb
>>  drm_gem_vram_driver_dumb_create+0x238/0x590
>>  drm_mode_create_dumb
>>  drm_mode_create_dumb_ioctl+0x41d/0x450
>>  drm_ioctl_kernel+0x5a4/0x710
>>  drm_ioctl+0xc6f/0x1240
>>  vfs_ioctl
>>  ksys_ioctl
>>  __do_sys_ioctl
>>  __se_sys_ioctl+0x2e9/0x410
>>  __x64_sys_ioctl+0x4a/0x70
>>  do_syscall_64+0xb8/0x160
>>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> RIP: 0033:0x4689b9
>> Code: fd e0 fa ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 8=
9 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 =
f0 ff ff 0f 83 cb e0 fa ff c3 66 2e 0f 1f 84 00 00 00 00
>> RSP: 002b:00007f368fa4dc98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010=

>> RAX: ffffffffffffffda RBX: 000000000076bf00 RCX: 00000000004689b9
>> RDX: 0000000020000240 RSI: 00000000c02064b2 RDI: 0000000000000003
>> RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> R13: 00000000004d17e0 R14: 00007f368fa4e6d4 R15: 000000000076bf0c
>>
>> Uninit was created at:
>>  kmsan_save_stack_with_flags
>>  kmsan_internal_poison_shadow+0x66/0xd0
>>  kmsan_slab_free+0x6e/0xb0
>>  slab_free_freelist_hook
>>  slab_free
>>  kfree+0x571/0x30a0
>>  drm_gem_vram_destroy
>>  ttm_buffer_object_destroy+0xc8/0x130
>>  ttm_bo_release
>>  kref_put
>>  ttm_bo_put+0x117d/0x23e0
>>  ttm_bo_init_reserved+0x11c0/0x11d0
>>  ttm_bo_init+0x289/0x3f0
>>  drm_gem_vram_init
>>  drm_gem_vram_create+0x775/0x990
>>  drm_gem_vram_fill_create_dumb
>>  drm_gem_vram_driver_dumb_create+0x238/0x590
>>  drm_mode_create_dumb
>>  drm_mode_create_dumb_ioctl+0x41d/0x450
>>  drm_ioctl_kernel+0x5a4/0x710
>>  drm_ioctl+0xc6f/0x1240
>>  vfs_ioctl
>>  ksys_ioctl
>>  __do_sys_ioctl
>>  __se_sys_ioctl+0x2e9/0x410
>>  __x64_sys_ioctl+0x4a/0x70
>>  do_syscall_64+0xb8/0x160
>>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>
>> If ttm_bo_init() fails, the "gbo" will be freed by
>> ttm_buffer_object_destroy() in ttm_bo_init(). But then
>> drm_gem_vram_create() and drm_gem_vram_init() will free
>> "gbo" again.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Jia Yang <jiayang5@huawei.com>
>> ---
>>  drivers/gpu/drm/drm_gem_vram_helper.c | 28 +++++++++++++++-----------=
-
>>  1 file changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/d=
rm_gem_vram_helper.c
>> index 8b2d5c945c95..1d85af9a481a 100644
>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>> @@ -175,6 +175,10 @@ static void drm_gem_vram_placement(struct drm_gem=
_vram_object *gbo,
>>  	}
>>  }
>> =20
>> +/*
>> + * Note that on error, drm_gem_vram_init will free the buffer object.=

>> + */
>> +

This comment could go away.

>>  static int drm_gem_vram_init(struct drm_device *dev,
>>  			     struct drm_gem_vram_object *gbo,
>>  			     size_t size, unsigned long pg_align)
>> @@ -184,15 +188,19 @@ static int drm_gem_vram_init(struct drm_device *=
dev,
>>  	int ret;
>>  	size_t acc_size;
>> =20
>> -	if (WARN_ONCE(!vmm, "VRAM MM not initialized"))
>> +	if (WARN_ONCE(!vmm, "VRAM MM not initialized")) {
>> +		kfree(gbo);
>>  		return -EINVAL;
>> +	}

This test can go to the top of drm_gem_vram_create()

>>  	bdev =3D &vmm->bdev;
>> =20
>>  	gbo->bo.base.funcs =3D &drm_gem_vram_object_funcs;
>> =20
>>  	ret =3D drm_gem_object_init(dev, &gbo->bo.base, size);
>> -	if (ret)
>> +	if (ret) {
>> +		kfree(gbo);
>>  		return ret;
>> +	}
>> =20
>>  	acc_size =3D ttm_bo_dma_acc_size(bdev, size, sizeof(*gbo));
>> =20
>> @@ -203,13 +211,13 @@ static int drm_gem_vram_init(struct drm_device *=
dev,
>>  			  &gbo->placement, pg_align, false, acc_size,
>>  			  NULL, NULL, ttm_buffer_object_destroy);
>>  	if (ret)
>> -		goto err_drm_gem_object_release;
>> +		/*
>> +		 * A failing ttm_bo_init will call ttm_buffer_object_destroy
>> +		 * to release gbo->bo.base and kfree gbo.
>> +		 */
>> +		return ret;

The rest of this function would be inlined where the call to
drm_gem_vram_init() currently happens.

>> =20
>>  	return 0;
>> -
>> -err_drm_gem_object_release:
>> -	drm_gem_object_release(&gbo->bo.base);
>> -	return ret;
>>  }
>> =20
>>  /**
>> @@ -243,13 +251,9 @@ struct drm_gem_vram_object *drm_gem_vram_create(s=
truct drm_device *dev,
>> =20
>>  	ret =3D drm_gem_vram_init(dev, gbo, size, pg_align);
>>  	if (ret < 0)
>> -		goto err_kfree;
>> +		return ERR_PTR(ret);
>> =20
>>  	return gbo;
>> -
>> -err_kfree:
>> -	kfree(gbo);
>> -	return ERR_PTR(ret);

All inlined code up to ttm_bo_init() would jump to error labels on
errors. ttm_bo_init() would return directly.

Best regards
Thomas


>>  }
>>  EXPORT_SYMBOL(drm_gem_vram_create);
>> =20
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--jDRub4HfXYqQa83F4pTkQBC2diU4aJNUs--

--TGCSCpzdeQxFOMXH8fIaFbCRNJdz4hh2N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl78M7kACgkQaA3BHVML
eiM2mgf9GAPsFrdxX5yJbLkhY86+K9gIQ+nzeHMSsb4kDSDYN3t0BG+v8CHzuBBv
SPNKhSWBsLDJU6SkllDuQfAIKsaV+HAhW6nz/Ku5GT5xlYp7EkPxpYjGrV5A+R9c
9LMlPvC2nn3IDMF6R4G96OY6EL84johxHw4rSq8kmhfpheJDsokPIeeAge8eAmU2
h2yjxAUvcqGZhwA52K009aF0C44ojJvnPwBk3fOTfs/BE4VSjRTJJg2g18daCZLw
JjCHgFcKkTH6QNWL3yXPKKyHAtuVuqcGtjPXF+q7+0afgg7bsznrdQbZ7psZDAKy
fG8ywNJ4afzc08IzY39o5ndLfIY92w==
=sCvm
-----END PGP SIGNATURE-----

--TGCSCpzdeQxFOMXH8fIaFbCRNJdz4hh2N--

--===============2075032765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2075032765==--
