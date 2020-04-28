Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B4E1BC283
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 17:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6C089B96;
	Tue, 28 Apr 2020 15:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C57E89B96
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 15:16:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48175AFD7;
 Tue, 28 Apr 2020 15:16:21 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
 <b9315d4b-0f3e-712b-8a26-0ed5e3ac6f68@suse.de>
 <20200424093849.tiyukod37qeztaxb@sirius.home.kraxel.org>
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
Message-ID: <2cbafd95-22cf-5471-9ee4-807b152828ec@suse.de>
Date: Tue, 28 Apr 2020 17:16:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200424093849.tiyukod37qeztaxb@sirius.home.kraxel.org>
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
Content-Type: multipart/mixed; boundary="===============0328631931=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0328631931==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CGswBPRlNc5cq1KsEFBVByH9CUFRkVNTD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CGswBPRlNc5cq1KsEFBVByH9CUFRkVNTD
Content-Type: multipart/mixed; boundary="kps4CHfwvGbcRcudRPmLLdRu10ZidTnDk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 christian.koenig@amd.com
Message-ID: <2cbafd95-22cf-5471-9ee4-807b152828ec@suse.de>
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
 <b9315d4b-0f3e-712b-8a26-0ed5e3ac6f68@suse.de>
 <20200424093849.tiyukod37qeztaxb@sirius.home.kraxel.org>
In-Reply-To: <20200424093849.tiyukod37qeztaxb@sirius.home.kraxel.org>

--kps4CHfwvGbcRcudRPmLLdRu10ZidTnDk
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Gerd

Am 24.04.20 um 11:38 schrieb Gerd Hoffmann:
>   Hi,
>=20
>> At some point one has to choose to switch to top-down, and then back
>> again at one of the next BOs. So the current patch effectively splits
>> vram into a lower half and an upper half and puts BOs in alternating h=
alves.
>=20
> Hmm, so maybe just make the split explicit instead of playing tricks
> with top_bottom?  Register the lower vram half as TT_VRAM, register the=

> upper half as TT_PRIV.  That'll make sure you never have a big
> allocation in the middle blocking things.  Or maybe add a allocation
> strategy flag to ttm which effectively does the same.

It's not that easy. Current cursors n ast are statically allocated. As
soon as you add dynamic cursors into the mix, you'd get OOMs. If the
framebuffer BO goes into VRAM and the cursor BO goes into PRIV, pinning
the next framebuffer BO during a pageflip would send it to VRAM. But
VRAM is still filled with the first framebuffer BO. So the memory
manager needs some flexibility with the placement. Handling all that is
already TTM's job.

I'm preparing v2 of this patch set. It'll get static cursors out of the
way and make the feature opt-in.

Best regards
Thomas

>=20
> take care,
>   Gerd
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--kps4CHfwvGbcRcudRPmLLdRu10ZidTnDk--

--CGswBPRlNc5cq1KsEFBVByH9CUFRkVNTD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6oSMQACgkQaA3BHVML
eiOmSgf/Xey4hWpFk4bwfrZqdWuvOHKHA6tMn4TknQlMy0SKKRI2oOjWuo+qg0wt
cL7NlOrCnG1MkKMsm1DodttE3vp1m4AxRKxht1dX7C5i/jhsPESnxhQooVdV85Si
Rm2jlCLEHNYVbQXSlR6xbCjLD6+XEOeE4b/j1LFg+rMga5+auNfA2tKuJytv/ZFT
HykYkJWJNWGndRTAjUUbZR2h9hWj5UIxhGYon+vWyQi8rBjEeQaBeR1yorzY0FFp
Gi9CSsM7sMprE93iaH6WQOEUdAQkjakni8K9Rq9WuVn32ndIVYZEIZz9MJ2dyGF4
lsnGVq/CE60EbHbEkWz2Bc3eaf4Onw==
=YFWO
-----END PGP SIGNATURE-----

--CGswBPRlNc5cq1KsEFBVByH9CUFRkVNTD--

--===============0328631931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0328631931==--
