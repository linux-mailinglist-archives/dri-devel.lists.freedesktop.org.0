Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E89E01F8EEB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 08:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44BA89FAD;
	Mon, 15 Jun 2020 06:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA78789FAD
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 06:59:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D9A9ACAE;
 Mon, 15 Jun 2020 06:59:04 +0000 (UTC)
Subject: Re: [PATCH 1/2] drm/shmem: add support for per object dma api
 operations
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20200612013625.547-1-gurchetansingh@chromium.org>
 <b1b26b94-b0a5-6af8-a151-ad6310358708@suse.de>
 <20200612101650.2kp7wvpz5gfv3vyg@sirius.home.kraxel.org>
 <CAAfnVBn=3_ekqKXoUKMGMHw+VWxL2RK0mJO72vx79RvvUa8cPw@mail.gmail.com>
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
Message-ID: <f6b69471-16f7-0d97-65eb-d80f7c607133@suse.de>
Date: Mon, 15 Jun 2020 08:58:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAAfnVBn=3_ekqKXoUKMGMHw+VWxL2RK0mJO72vx79RvvUa8cPw@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0111031664=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0111031664==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ztu6TZqyx4JyYUbemmZkE0xkTr6kik4Is"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ztu6TZqyx4JyYUbemmZkE0xkTr6kik4Is
Content-Type: multipart/mixed; boundary="WxDYJvYgDx4Wzb2JzBxbeM1FxixpZvdt7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <f6b69471-16f7-0d97-65eb-d80f7c607133@suse.de>
Subject: Re: [PATCH 1/2] drm/shmem: add support for per object dma api
 operations
References: <20200612013625.547-1-gurchetansingh@chromium.org>
 <b1b26b94-b0a5-6af8-a151-ad6310358708@suse.de>
 <20200612101650.2kp7wvpz5gfv3vyg@sirius.home.kraxel.org>
 <CAAfnVBn=3_ekqKXoUKMGMHw+VWxL2RK0mJO72vx79RvvUa8cPw@mail.gmail.com>
In-Reply-To: <CAAfnVBn=3_ekqKXoUKMGMHw+VWxL2RK0mJO72vx79RvvUa8cPw@mail.gmail.com>

--WxDYJvYgDx4Wzb2JzBxbeM1FxixpZvdt7
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.06.20 um 20:54 schrieb Gurchetan Singh:
> On Fri, Jun 12, 2020 at 3:17 AM Gerd Hoffmann <kraxel@redhat.com> wrote=
:
>>
>> On Fri, Jun 12, 2020 at 11:47:55AM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 12.06.20 um 03:36 schrieb Gurchetan Singh:
>>>> This is useful for the next patch.  Also, should we only unmap the
>>>> amount entries that we mapped with the dma-api?
>>>
>>> It looks like you're moving virtio code into shmem.
>>
>> Well, not really.
>>
>> virtio has -- for historical reasons -- the oddity that it may or may
>> not need to dma_map resources, depending on device configuration.
>> Initially virtio went with "it's just a vm, lets simply operate on
>> physical ram addresses".  That shortcut turned out to be a bad idea
>> later on, especially with the arrival of iommu emulation support in
>> qemu.  But we couldn't just scratch it for backward compatibility
>> reasons.  See virtio_has_iommu_quirk().
>>
>> This just allows to enable/disable dma_map, I guess to fix some fallou=
t
>> from recent shmem helper changes
>=20
> Yes, the main goal is to fix the double free.
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 346cef5ce251..2f7b6cd25a4b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -78,7 +78,6 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_obje=
ct *bo)
>                                 shmem->mapped =3D 0;
>                         }
>=20
> -                       sg_free_table(shmem->pages);
>                         shmem->pages =3D NULL;
>                         drm_gem_shmem_unpin(&bo->base.base);
>                 }
>=20
> Doing only that on it's own causes log spam though
>=20
> [   10.368385] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
> bytes), total 0 (slots), used 0 (slots)
> [   10.384957] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
> bytes), total 0 (slots), used 0 (slots)
> [   10.389920] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
> bytes), total 0 (slots), used 0 (slots)
> [   10.396859] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
> bytes), total 0 (slots), used 0 (slots)
> [   10.401954] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
> bytes), total 0 (slots), used 0 (slots)
> [   10.406694] virtio_gpu virtio5: swiotlb buffer is full (sz: 8192
> bytes), total 0 (slots), used 0 (slots)
> [   10.495744] virtio_gpu virtio5: swiotlb buffer is full (sz: 4096
> bytes), total 0 (slots), used 0 (slots)
>=20
> Plus, I just realized the virtio dma ops and ops used by drm shmem are
> different, so virtio would have to unconditionally have to skip the
> shmem path.  Perhaps the best policy is to revert d323bb44e4d2?

Can you fork the shmem code into virtio and modify it according to your
needs? I know that code splitting is unpopular, but at least it's a
clean solution. For some GEM object functions, you might still be able
to share code with shmem helpers.

Best regards
Thomas

>=20
>> (Gurchetan, that kind of stuff should
>> be mentioned in cover letter and commit messages).
>=20
> Good tip.
>=20
>>
>> I'm not sure virtio actually needs that patch though.  I *think* doing=

>> the dma_map+dma_unmap unconditionally, but then ignore the result in
>> case we don't need it should work.  And it shouldn't be a horrible
>> performance hit either, in case we don't have a (virtual) iommu in the=

>> VM dma mapping is essentially a nop ...
>>
>> take care,
>>   Gerd
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WxDYJvYgDx4Wzb2JzBxbeM1FxixpZvdt7--

--Ztu6TZqyx4JyYUbemmZkE0xkTr6kik4Is
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7nHDIACgkQaA3BHVML
eiN3TAf/RYhtnQ5tvSj9BvEdNf4JTyb5ii7P7qkMYoNK1w7LfL/Ua5mn/SwgUoZK
Yyl8UudWDUEhPbc5Y0GeTOogScU2MF9CUSxHESiIETl1Ga6vuRBWvOc4NeOcJ9P7
E0/+LDrFp6Ny3vSVJjG5AF5D1Zei3KGp7B3z3LcyzNjDICFbfTQHV/6DZAZf0lz9
Aq8xU6raH7NLHEXrWJZuDL5/2vccaU37mNDMtz+u74+DVZ1t+A5p61d3P2LFbN+7
dDaiyLYV1gIqxaetJk3+dM7COTeng4u4HXYvx4KJEibN9MT09rKaMafB59E6iFhP
Ib+xdKisAplah7Ygcs4WDecyn7zckA==
=yTvt
-----END PGP SIGNATURE-----

--Ztu6TZqyx4JyYUbemmZkE0xkTr6kik4Is--

--===============0111031664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0111031664==--
