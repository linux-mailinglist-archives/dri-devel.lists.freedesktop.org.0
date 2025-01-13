Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879BDA0BDEE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 17:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0701210E730;
	Mon, 13 Jan 2025 16:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="ICdZ5kYC";
	dkim=pass (2048-bit key; secure) header.d=sapience.com header.i=@sapience.com header.b="md32p62r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C4010E72E;
 Mon, 13 Jan 2025 16:48:30 +0000 (UTC)
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
 signature) header.d=sapience.com header.i=@sapience.com 
 header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
 header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by s1.sapience.com (Postfix) with ESMTPS id A510D480A41;
 Mon, 13 Jan 2025 11:48:29 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1736786909;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=u/YC2T5rfqWAbWfWzUHFz42ptWsYmEPR92N33rWxDU0=;
 b=ICdZ5kYCWccA3K3n6LxQi7qbHyuSiA0NGpqmAgptrUmeBJCA/nkD8Bv6Xh3qpZiY6WVYl
 CQpeIMBlBf0DCJwDg==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1736786909; 
 cv=none;
 b=AOYSOxEQC6ZVQfOe7U47CLTo285X5F2m8Uz9j+oiBm27Ajc6cRLzYh1f7b37GFU+FKgkt9zBZj/7lwrzsbLnoforxkyuSRYxZu1QEDMmHamkG8aW1KAzCZjo0wUNNTW/LaPQUbOTFHVRGKrnvgYTzPuSX7SUGLzHPaDEHBUBuqL6ObcAcauCgtn/TmHY1WaRQgPmXNz4u8DdLNjbsUTSAAQZNC5jqrKJviXG2b1pEalpY+KRhjSnnKMT6iJiHlWc+tSDbCUYK8gaDqPHmyyYS8q5VHoiaJwOQUUb4EsHMrfvOfx/DBMj4wiHskl3zglhJKDEIVD7JcwbZt/efH8yOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
 t=1736786909; c=relaxed/simple;
 bh=gXKgdTWxfvNgx24T2zV+JaE5rsZk1jTeEGclnt7mWsw=;
 h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
 MIME-Version;
 b=RzyrnPbxPvbYnFlmlN7NfEZHkVK5GJn0EycLC1F7yu3u0Mv3yox0o7AVfaQ5SNvo0Qs9WZjhb+saXN0bKkiufxrH+i8OFDGPVOKCBdL9Pu0+T7QAiw/9sVV6VYaoQg2vsCBegSI61OVBJvEeA7CGW5hMoO5NF2r7NCdEZEM5qW9lRPAtztUXn2+WZ4oeW9ClJ6s5KrIe94JJzAGIuZscEmxsiOoH1pEc+HZcmakFvFft+6rkHFY/yaNceb38ugL/UGEVINFjgSreF7TrU/AdWyBneras5TAkAiE0p2SYV8FNmO0S6GHL/NVHjid0kRRXHNSdfYlKMM8C6CCV5dLh4w==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1736786909;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=u/YC2T5rfqWAbWfWzUHFz42ptWsYmEPR92N33rWxDU0=;
 b=md32p62rxgVOFtmUnLVggYBN0rA6F8vjQ3Z/yiKUmdXwoTG5P2hwO4RefON/IwwEqLvvV
 x2j+2fCZKaWtvTJTzC1Iob9BBV+0IGou1ccuo4HWhjXESD8Ny3IUzzvyvQ2+GrO3O48ygRZ
 6teFsEhO+G9b95hRasdxuAWBHjWWvNs3p+W+upNirlNZYxxc5+URWSF+vPAfYZU7x8+5WVW
 rX3CCxdI9Y7DYEn9+aqF+s9CPxG0A+D3EXYrYajJBjuEeFiQQmuaheZWF9FcWamJ9VmRbkS
 xI2Lq5fmUI99v1VGtDjzNEYn3mke3zZ7RhwcCyC0Y4hPRKQRYVTwqsTx/YbQ==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by srv8.sapience.com (Postfix) with ESMTPS id 6CC52280050;
 Mon, 13 Jan 2025 11:48:29 -0500 (EST)
Message-ID: <1c418b7b67b1e75bed5068a86165939648bd1952.camel@sapience.com>
Subject: Re: [REGRESSION] Re: 6.13-rc1 graphics fail -> resolved
From: Genes Lists <lists@sapience.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, airlied@gmail.com, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 13 Jan 2025 11:48:28 -0500
In-Reply-To: <53757618ad585771809d0b37915c4d97fab06fdb.camel@sapience.com>
References: <3b097dddd7095bccabe6791b90899c689f271a35.camel@sapience.com>
 <Z07Mg2_6y2MW22qV@intel.com>
 <7db24095f935d874fae466853b0984103f97b40f.camel@sapience.com>
 <dd13efc9b3fe3e3acd599ca91b714fa92f6cb9a8.camel@sapience.com>
 <53757618ad585771809d0b37915c4d97fab06fdb.camel@sapience.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
 protocol="application/pgp-signature"; boundary="=-lcoIbt6gV8L3KOHuxPSh"
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--=-lcoIbt6gV8L3KOHuxPSh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2025-01-04 at 06:06 -0500, Genes Lists wrote:
> On Fri, 2024-12-13 at 07:14 -0500, Genes Lists wrote:
> > On Tue, 2024-12-03 at 06:34 -0500, Genes Lists wrote:
> > > On Tue, 2024-12-03 at 11:16 +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > > > ...
> > >=20
> > > > Probably https://gitlab.freedesktop.org/drm/i915/kernel/-
> > > > /issues/13057
> > > >=20
> > > Very helpful.
> > >=20
> > > I tested your patch set on Linus' tree commit
> > > cdd30ebb1b9f36159d66f088b61aee264e649d7a :
> > >=20
> > > =C2=A0 =C2=A0=C2=A0https://patchwork.freedesktop.org/series/141911/
> > >=20
> > > and confirm that this fixes the problem=C2=A0
> > >=20
> > > Thank you.
> > >=20
> > >=20
> >=20
> > Just a CC to regressions list for tracking.
> >=20
> > First report here:=C2=A0
> > https://lore.kernel.org/lkml/3b097dddd7095bccabe6791b90899c689f271a
> > 35.c
> > amel@sapience.com/
> >=20
> > Fixed by patch set as noted above, but not yet in mainline or
> > linux-
> > next.
> >=20
> > Thank you again Ville for quickly coming up with a fix.
> >=20
>=20
> Follow up to check on where things stand with getting the fix into
> mainline?=C2=A0
>=20
> Obviously it would be really good to get this fixed before 6.13 gets
> released.
>=20
> Thanks and happy 2025!
>=20
>=20

Update -=C2=A0I no longer see this problem.

Quick test (meaning I booted machine once) using:

   linux 6.13-rc7  (previously 6.13-rc1=20
   mesa 24.3.3     (previously 24.3.0)

Works fine.

I note that the patches
(https://patchwork.freedesktop.org/series/141911/) are not in the this
kernel. i.e. the file drivers/gpu/drm/i915/display/intel_fb.c still has
around line 1694 or so:

  if (IS_ALIGNED(fb->base.offsets[i], PAGE_SIZE))

whereas the patch changes PAGE_SIZE to 64.

I have not yet tracked down what has changed but wanted to report back,
since 6.13 is not far off.

Could it be other kernel patches or perhaps changes in mesa itself?
Thanks for resolving it.=C2=A0

I will continue to test and report back if I see anything different.

gene

--=20
Gene


--=-lcoIbt6gV8L3KOHuxPSh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ4VD3AAKCRA5BdB0L6Ze
29+GAQDqPq9U47rna6xu60to4v/XS1tldIke6T8g/P6VrP/Z7wEA/jugeRZfnyyA
W2WxhZXWWc13GR0Vx9ySBlvrwgTy/A0=
=qiFq
-----END PGP SIGNATURE-----

--=-lcoIbt6gV8L3KOHuxPSh--
