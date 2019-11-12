Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F6F8C33
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 10:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A266EADD;
	Tue, 12 Nov 2019 09:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57386EADD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:49:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 27095AFCB;
 Tue, 12 Nov 2019 09:49:25 +0000 (UTC)
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
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
Message-ID: <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
Date: Tue, 12 Nov 2019 10:49:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191112093246.GD23790@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1586402827=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1586402827==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1mVBLRIYOGyPc5vIKg7PAZAEZJYM3QHgf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1mVBLRIYOGyPc5vIKg7PAZAEZJYM3QHgf
Content-Type: multipart/mixed; boundary="0zHHWYRyJECcM8o6JoFiBa6wOJLvK5Dnd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <06f1f400-2e20-5c40-c0ea-967f1ab2b787@suse.de>
Subject: Re: [PATCH v2] drm/gem: Fix mmap fake offset handling for
 drm_gem_object_funcs.mmap
References: <20191024191859.31700-1-robh@kernel.org>
 <20191025073042.GL11828@phenom.ffwll.local>
 <20191108162759.GY23790@phenom.ffwll.local>
 <d2146f86-ddb8-242e-025f-d29a43682487@suse.de>
 <20191112093246.GD23790@phenom.ffwll.local>
In-Reply-To: <20191112093246.GD23790@phenom.ffwll.local>

--0zHHWYRyJECcM8o6JoFiBa6wOJLvK5Dnd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.11.19 um 10:32 schrieb Daniel Vetter:
> On Tue, Nov 12, 2019 at 10:26:44AM +0100, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 08.11.19 um 17:27 schrieb Daniel Vetter:
>>> On Fri, Oct 25, 2019 at 09:30:42AM +0200, Daniel Vetter wrote:
>>>> On Thu, Oct 24, 2019 at 02:18:59PM -0500, Rob Herring wrote:
>>>>> Commit c40069cb7bd6 ("drm: add mmap() to drm_gem_object_funcs")
>>>>> introduced a GEM object mmap() hook which is expected to subtract t=
he
>>>>> fake offset from vm_pgoff. However, for mmap() on dmabufs, there is=
 not
>>>>> a fake offset.
>>>>>
>>>>> To fix this, let's always call mmap() object callback with an offse=
t of 0,
>>>>> and leave it up to drm_gem_mmap_obj() to remove the fake offset.
>>>>>
>>>>> TTM still needs the fake offset, so we have to add it back until th=
at's
>>>>> fixed.
>>>>>
>>>>> Fixes: c40069cb7bd6 ("drm: add mmap() to drm_gem_object_funcs")
>>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>>>> ---
>>>>> v2:
>>>>> - Move subtracting the fake offset out of mmap() obj callbacks.
>>>>>
>>>>> I've tested shmem, but not ttm. Hopefully, I understood what's need=
ed=20
>>>>> for TTM.
>>>
>>> So unfortunately I'm already having regrets on this. We might even ha=
ve
>>> broken some of the ttm drivers here.
>>>
>>> Trouble is, if you need to shoot down userspace ptes of a bo (because=
 it's
>>> getting moved or whatever), then we do that with unmap_mapping_range.=

>>> Which means each bo needs to be mapping with a unique (offset,
>>> adress_space), or it won't work. By remapping all the bo to 0 we've b=
roken
>>> this. We've also had this broken this for a while for the simplistic
>>> dma-buf mmap, since without any further action we'll reuse the addres=
s
>>> space of the dma-buf inode, not of the drm_device.
>>>
>>> Strangely both etnaviv and msm have a comment to that effect - grep f=
or
>>> unmap_mapping_range. But neither actually uses it.
>>>
>>> Not exactly sure what's the best course of action here now.
>>>
>>> Also adding Thomas Zimmermann, who's worked on all the vram helpers.
>>
>> VRAM helpers use drm_gem_ttm_mmap(), which wraps ttm_bo_mmap_obj().
>> These changes should be transparent.
>=20
> There's still the issue that for dma-buf mmap vs drm mmap you use
> different f_mapping, which means ttm's pte shootdown won't work correct=
ly
> for dma-buf mmaps. But yeah normal operation for ttm/vram helpers shoul=
d
> be fine.

VRAM helpers don't support dmabufs.

Best regards
Thomas

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>> -Daniel
>>>
>>>>>
>>>>> Rob
>>>>>
>>>>>  drivers/gpu/drm/drm_gem.c              | 3 +++
>>>>>  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ---
>>>>>  drivers/gpu/drm/ttm/ttm_bo_vm.c        | 7 +++++++
>>>>>  include/drm/drm_gem.h                  | 4 +++-
>>>>>  4 files changed, 13 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>>>> index 56f42e0f2584..2f2b889096b0 100644
>>>>> --- a/drivers/gpu/drm/drm_gem.c
>>>>> +++ b/drivers/gpu/drm/drm_gem.c
>>>>> @@ -1106,6 +1106,9 @@ int drm_gem_mmap_obj(struct drm_gem_object *o=
bj, unsigned long obj_size,
>>>>>  		return -EINVAL;
>>>>> =20
>>>>>  	if (obj->funcs && obj->funcs->mmap) {
>>>>> +		/* Remove the fake offset */
>>>>> +		vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
>>>>> +
>>>>>  		ret =3D obj->funcs->mmap(obj, vma);
>>>>>  		if (ret)
>>>>>  			return ret;
>>>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/d=
rm/drm_gem_shmem_helper.c
>>>>> index a878c787b867..e8061c64c480 100644
>>>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>>>> @@ -542,9 +542,6 @@ int drm_gem_shmem_mmap(struct drm_gem_object *o=
bj, struct vm_area_struct *vma)
>>>>>  	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>>>>>  	vma->vm_ops =3D &drm_gem_shmem_vm_ops;
>>>>> =20
>>>>> -	/* Remove the fake offset */
>>>>> -	vma->vm_pgoff -=3D drm_vma_node_start(&shmem->base.vma_node);
>>>>> -
>>>>>  	return 0;
>>>>>  }
>>>>>  EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/=
ttm_bo_vm.c
>>>>> index 1a9db691f954..08902c7290a5 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> @@ -482,6 +482,13 @@ EXPORT_SYMBOL(ttm_bo_mmap);
>>>>>  int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_=
object *bo)
>>>>>  {
>>>>>  	ttm_bo_get(bo);
>>>>> +
>>>>> +	/*
>>>>> +	 * FIXME: &drm_gem_object_funcs.mmap is called with the fake offs=
et
>>>>> +	 * removed. Add it back here until the rest of TTM works without =
it.
>>>>> +	 */
>>>>> +	vma->vm_pgoff +=3D drm_vma_node_start(&bo->base.vma_node);
>>>>> +
>>>>>  	ttm_bo_mmap_vma_setup(bo, vma);
>>>>>  	return 0;
>>>>>  }
>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>> index e71f75a2ab57..c56cbb3509e0 100644
>>>>> --- a/include/drm/drm_gem.h
>>>>> +++ b/include/drm/drm_gem.h
>>>>> @@ -159,7 +159,9 @@ struct drm_gem_object_funcs {
>>>>>  	 *
>>>>>  	 * The callback is used by by both drm_gem_mmap_obj() and
>>>>>  	 * drm_gem_prime_mmap().  When @mmap is present @vm_ops is not
>>>>> -	 * used, the @mmap callback must set vma->vm_ops instead.
>>>>> +	 * used, the @mmap callback must set vma->vm_ops instead. The @mm=
ap
>>>>> +	 * callback is always called with a 0 offset. The caller will rem=
ove
>>>>> +	 * the fake offset as necessary.
>>>>>  	 *
>>>>
>>>> Maybe remove this empty comment line here while at it. With that
>>>>
>>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>
>>>> I think I'll follow up with a patch to annotate drm_gem_mmap_obj as
>>>> deprecated and that instead this here should be used.
>>>> -Daniel
>>>>
>>>>>  	 */
>>>>>  	int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct *vm=
a);
>>>>> --=20
>>>>> 2.20.1
>>>>>
>>>>
>>>> --=20
>>>> Daniel Vetter
>>>> Software Engineer, Intel Corporation
>>>> http://blog.ffwll.ch
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--0zHHWYRyJECcM8o6JoFiBa6wOJLvK5Dnd--

--1mVBLRIYOGyPc5vIKg7PAZAEZJYM3QHgf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3KgCEACgkQaA3BHVML
eiM+/Qf+KR6/8VAwa0sJKQBbtEoriDIg+YNSyZeNC0U//UIH0asM2RtdxW6hqkYc
Hqllp51Ht9nRD5cOtgYjYvKD3zQtIUhLZQ65zRDfPCVAxyZgxfUjuoDW7MZdRf9s
6jFAiiY794iVnDfEfBlfgBm+Ep84cD6Pv+cot48s+vP+tbg/d7qrWWrMVD29+3Wn
BmztwD48N1KX+E1mYONi6F8IYqiD1RvsZfrujxhb5+AgXux8U3RYO0bks1VxZNbn
y5l6x/7bYifXj4ZLMEt7cq5yPyA5NZcM6pjkCUNXBddzoUWv7pb1y2MexO5H926F
WWr7jgCVUwYBhGo6+cYDPyemDb99GQ==
=/PDa
-----END PGP SIGNATURE-----

--1mVBLRIYOGyPc5vIKg7PAZAEZJYM3QHgf--

--===============1586402827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1586402827==--
