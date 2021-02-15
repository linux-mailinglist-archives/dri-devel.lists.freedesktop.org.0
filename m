Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F231B88E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 13:00:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD956E198;
	Mon, 15 Feb 2021 12:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6D66E198
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 12:00:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7F02BACD4;
 Mon, 15 Feb 2021 12:00:48 +0000 (UTC)
Subject: Re: DMA-buf and uncached system memory
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>
Message-ID: <302e06ad-f979-dc77-5d84-fa0923aa4632@suse.de>
Date: Mon, 15 Feb 2021 13:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Content-Type: multipart/mixed; boundary="===============1084656255=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1084656255==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8ejIhBaoaH74EllZioVxmsx5UYclcyGPJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8ejIhBaoaH74EllZioVxmsx5UYclcyGPJ
Content-Type: multipart/mixed; boundary="jpBOcMfQ4Rk9pKdZviZiesqHtZrYP8I7j";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Message-ID: <302e06ad-f979-dc77-5d84-fa0923aa4632@suse.de>
Subject: Re: DMA-buf and uncached system memory
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>
In-Reply-To: <e6897f92-4c61-cd42-2822-43c50a744d4c@suse.de>

--jpBOcMfQ4Rk9pKdZviZiesqHtZrYP8I7j
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.02.21 um 10:49 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 15.02.21 um 09:58 schrieb Christian K=C3=B6nig:
>> Hi guys,
>>
>> we are currently working an Freesync and direct scan out from system=20
>> memory on AMD APUs in A+A laptops.
>>
>> On problem we stumbled over is that our display hardware needs to scan=
=20
>> out from uncached system memory and we currently don't have a way to=20
>> communicate that through DMA-buf.

Re-reading this paragrah, it sounds more as if you want to let the=20
exporter know where to move the buffer. Is this another case of the=20
missing-pin-flag problem?

Best regards
Thomas

>>
>> For our specific use case at hand we are going to implement something =

>> driver specific, but the question is should we have something more=20
>> generic for this?
>=20
> For vmap operations, we return the address as struct dma_buf_map, which=
=20
> contains additional information about the memory buffer. In vram=20
> helpers, we have the interface drm_gem_vram_offset() that returns the=20
> offset of the GPU device memory.
>=20
> Would it be feasible to combine both concepts into a dma-buf interface =

> that returns the device-memory offset plus the additional caching flag?=

>=20
> There'd be a structure and a getter function returning the structure.
>=20
> struct dma_buf_offset {
>  =C2=A0=C2=A0=C2=A0=C2=A0bool cached;
>  =C2=A0=C2=A0=C2=A0=C2=A0u64 address;
> };
>=20
> // return offset in *off
> int dma_buf_offset(struct dma_buf *buf, struct dma_buf_off *off);
>=20
> Whatever settings are returned by dma_buf_offset() are valid while the =

> dma_buf is pinned.
>=20
> Best regards
> Thomas
>=20
>>
>> After all the system memory access pattern is a PCIe extension and as =

>> such something generic.
>>
>> Regards,
>> Christian.
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
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


--jpBOcMfQ4Rk9pKdZviZiesqHtZrYP8I7j--

--8ejIhBaoaH74EllZioVxmsx5UYclcyGPJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAqYm4FAwAAAAAACgkQlh/E3EQov+CM
OQ/9H7AYQ1xEe3151Vo7dWI+/gR1rlw3WGzPnRdx+eIaBeNgNERC4eOnalzj/yovVjPQis6HVWIg
wfQ4BFIvwLKml+RSHEqJGbmAKly3J8NJCFyGk6E+de83sAENt9kqZSkXJpggzI3ZAjLDBB9L9Uff
LglN6XzVNgiW3TFN+2CkqPzIC+xoTcHhRvJpPyHB+geUHrjvd15hdIVcl4kbkOGe4+llrQgmw5m3
n9jz3oRhFHgd53G+ZipWlnPigd3RP4fb5+aVofSowQXeQYe6lI6J+Cf60Frc4So7I1lyfgwSr6tY
v8MSW5+F4ua1AKA2uDS/9eoYkyqB4N9amaLnTBJ0Q5DER9xXmfLHZCk2JlViTW/bAbhg5kB6EHxy
8GtBWvyQupA53nATzkipM6LNClAt47lh8vGH1hV8PiirSSETLtJ53/UccaqWag41WaWlfQAsbe0g
cZ+EgZvCkjuf3iTVF0OFs0nz2cXJcdnnI3u0u+BvrSFv50pvJ+mNSvJNtIE5Ew69e6ldLQe5UKXQ
ku0aXBtFP1MWo72Y5IKaHWJmoJyYWL5Y/9UucBILAsGBaJu8YKBDIEcVqjLNNjRxb/TUFRgA5NEv
UC5aI+2CsGLxy350LmncNZk2L/xJzIwpe3hhuuRZf+TgNoJfn3ibNLdzGyEVi8MJPXPXuzm8NPs4
iw8=
=W8bt
-----END PGP SIGNATURE-----

--8ejIhBaoaH74EllZioVxmsx5UYclcyGPJ--

--===============1084656255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1084656255==--
