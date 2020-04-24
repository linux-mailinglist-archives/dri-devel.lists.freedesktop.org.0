Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 813BF1B6E93
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 08:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762EE88065;
	Fri, 24 Apr 2020 06:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6340388065
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 06:59:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 540F3AC6E;
 Fri, 24 Apr 2020 06:59:12 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
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
Message-ID: <b9315d4b-0f3e-712b-8a26-0ed5e3ac6f68@suse.de>
Date: Fri, 24 Apr 2020 08:59:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
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
Cc: airlied@linux.ie, sam@ravnborg.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0511474532=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0511474532==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7R9s6AEHh2Or138iVCbhuwQ4mOG4KOZjx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7R9s6AEHh2Or138iVCbhuwQ4mOG4KOZjx
Content-Type: multipart/mixed; boundary="zXwVrdScneIParpLSmZ5SPAgFS9eaot1r";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 christian.koenig@amd.com
Message-ID: <b9315d4b-0f3e-712b-8a26-0ed5e3ac6f68@suse.de>
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
In-Reply-To: <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>

--zXwVrdScneIParpLSmZ5SPAgFS9eaot1r
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Gerd

Am 23.04.20 um 15:57 schrieb Gerd Hoffmann:
>>> I don't think it is that simple.
>>>
>>> First:  How will that interact with cursor bo allocations?  IIRC the
>>> strategy for them is to allocate top-down, for similar reasons (avoid=

>>> small cursor bo allocs fragment vram memory).
>>
>> In ast, 2 cursor BOs are allocated during driver initialization and ke=
pt
>> permanently at the vram's top end. I don't know about other drivers.
>=20
> One-time allocation at init time shouldn't be a problem.
>=20
>> But cursor BOs are small, so they don't make much of a difference. Wha=
t
>> is needed is space for 2 primary framebuffers during pageflips, with o=
ne
>> of them pinned. The other framebuffer can be located anywhere.
>=20
> The problem isn't the size.  The problem is dynamically allocated curso=
r
> BOs can also fragment vram, especially if top-bottom allocation is also=

> used for large framebuffers so cursor BOs can end up somewhere in the
> middle of vram.

But the problem is the size. Cursor BOs are unrelated. Of the
vram-helper-based drivers, only ast and mgag200 use cursors, and both
perma-pin them to the end of vram.


>=20
>>> Second:  I think ttm will move bo's from vram to system only on memor=
y
>>> pressure.  So you can still end up with fragmented memory.  To make t=
he
>>> scheme with one fb @ top and one @ bottom work reliable you have to b=
e
>>> more aggressive on pushing out framebuffers.
>>
>> I'm the process of converting mgag200 to atomic modesetting. The given=

>> example is what I observed. I'm not claiming that the placement scheme=

>> is perfect, but it is required to get mgag200 working with atomic
>> modesetting's pageflip logic. So we're solving a real problem here.
>=20
> I don't doubt this is a real problem.
>=20
>> The bug comes from Weston's allocation strategy. Looking at the debug
>> output:
>>
>>>>   0x0000000000000000-0x000000000000057f: 1407: free
>>
>> This was fbdev's framebuffer with 1600x900@32bpp
>>
>>>>   0x000000000000057f-0x0000000000000b5b: 1500: used
>>
>> This is Weston's framebuffer also with 1600x900@32bpp. But Weston
>> allocates an additional, unused 60 scanlines. That is to render with
>> tiles of 64x64px, I suppose. fbdev doesn't do that, hence Weston's
>> second framebuffer doesn't fit into the free location of the fbdev
>> framebuffer.
>=20
> Sure.  Assume there is just enough vram to fit in fbdev and two weston
> framebuffers.  fbdev is allocated from bottom, first weston fb from top=
,
> second weston fb from bottom again.  fbdev is not pushed out (no memory=

> pressure yet) so the second weston fb ends up in the middle of vram
> fragmenting things.  And now you are again in the situation where you
> might have enough free vram for an allocation but can't use it due to
> fragmention (probably harder to trigger in practice though).

Not quite. Framebuffer BOs of the current or smaller size will fit into
vram. It's only a problem if the size of the new framebuffer BO
increases. And that is exactly what currently happens with mgag200.

That aside, it's not a fair point, as you constructed an example that no
memory manager can resolve.

>=20
> That's why I would suggest to explicitly move out unpinned framebuffers=

> (aka fbdev) before pinning a new one (second weston fb) instead of
> depending on ttm moving things out on OOM, to make sure you never
> allocate something in the middle of vram.

We cannot do that. Evicting BOs from vram involves an unmap operation.
We did that in an earlier version of the code and received reports about
performance regressions and CPU cycles in TLB update.

So we added the lazy-unmap feature, where BOs are only unmapped and
evicted when necessary. I think it was even you who suggested this idea. =
:)

>=20
>>> Third:  I'd suggest make topdown allocations depending on current sta=
te
>>> instead of simply alternating, i.e. if there is a pinned framebuffer =
@
>>> offset 0, then go for top-down.
>>
>> That's what the current patch does. If the last pin was at the bottom,=

>> the next goes to the top. And then the other way around. Without
>> alternating between both end of vram, the problem would occur again wh=
en
>> fragmentation happens near the top end.
>=20
> I'd feel better when checking the state of my current pins to figure
> whenever I should alloc top-bottom or not, for robustness reasons.

I don't understand why this is more robust. For example, if you pin a
larger number of BOs, and than evict every other BO, there will always
be free areas among the remaining BOs. All that changes is the location
of those areas.

For a strategy, one cannot look at the BO size alone. In my initial
example, BOs are ~6 MiB and vram is 16 MiB. So any strategy ala 'choose
top-bottom for BOs >1/3 of vram' selects top-bottom for all framebuffer
BOs. This would result in the same OOM, but from top to bottom.

At some point one has to choose to switch to top-down, and then back
again at one of the next BOs. So the current patch effectively splits
vram into a lower half and an upper half and puts BOs in alternating halv=
es.

Best regards
Thomas

>=20
>> Looking again at the vram helpers, this functionality could be
>> implemented in drm_gem_vram_plane_helper_prepare_fb(). Drivers with
>> other placement strategies could implement their own helper for prepar=
e_fb.
>=20
> vram helpers could also simply offer two prepare_fb variants.
>=20
> cheers,
>   Gerd
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zXwVrdScneIParpLSmZ5SPAgFS9eaot1r--

--7R9s6AEHh2Or138iVCbhuwQ4mOG4KOZjx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6ijj0ACgkQaA3BHVML
eiPegwf+OnfoZbvVFxeRP3dv7NFk9NKhQnXsCmdXyqDM0bIXlHnc68hbWzN7bO7B
T1FKchRQR57IwN7t90CkO6pNMl0YMxVauvdmucdVzkDnUtkjbbYhvrtVzAvVrQUl
dCyEw19D56NrcunlsBqJ4EyMSPYHN9HGP5CEW8ednk1T5BNSfH9dtTutNz+Tkgoh
ARcV9Gg8b5lVtmRcOm4b+0nXFX9UFZbsfw27MpUJGoBMOfbCCYu8Rv9aKdIifAIq
8isUY/SWhkf11TBxMY7/UbeFfODYWIYvMf9wYCH2VPLwBlq/HHod9IYhifYyISWI
zpto9ll8SY+c+SVEBWeuqyyIBkFDxw==
=V2sc
-----END PGP SIGNATURE-----

--7R9s6AEHh2Or138iVCbhuwQ4mOG4KOZjx--

--===============0511474532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0511474532==--
