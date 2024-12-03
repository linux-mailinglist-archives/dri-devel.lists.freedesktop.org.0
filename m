Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40239E2B16
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782BA10EB1E;
	Tue,  3 Dec 2024 18:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="Xnz7J3/S";
	dkim=pass (2048-bit key; secure) header.d=sapience.com header.i=@sapience.com header.b="QbfmX/CN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5358D10E1A0;
 Tue,  3 Dec 2024 11:34:28 +0000 (UTC)
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
 signature) header.d=sapience.com header.i=@sapience.com 
 header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
 header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by s1.sapience.com (Postfix) with ESMTPS id 70019480A24;
 Tue, 03 Dec 2024 06:34:27 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1733225667;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=FjIsCWIzubmEadMxCxRD+23+CAxaNUechI3CQvCtXx0=;
 b=Xnz7J3/SZzrB63AjCyC/ry6atBJQehY7fYwydCQgX7jrWYPxWYRpjNzFDdjvXm+3foesw
 3bFLEAE5r/03w0NCw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1733225667; 
 cv=none;
 b=Otf9ilu8vUl5mRseHp9NDhxlQgJRf+lp8QgAa1z8G1Ra1hmiwaPMRjjZabl9DEe+c4GNP34dYBudJOS/L3AhL0D1dzpA5qLjdX7xQ+zxUfohiz8c90O6Z07CCEa4p2Iit4c0DebSlFOnfsWOcP/QQWSQ7Scfy7uzy0lpC08o4O3DsxAe1zgrdTzVoNvJarofyvYQNZlmYpStcw1iJ2C/j1S0okE3FfDceoOI2bPiOaJ0QInt9UMRkDT2/vIiVJR8wYRYoyjgcm8Rqe0GrhIRQ/UFKjrAYV1aiHxcmxbC5BrDISkMJBTA241ByZKbY+ueEQyy5iPgX/afGMrnp+JppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
 t=1733225667; c=relaxed/simple;
 bh=HDQyOvsh2luRrVameeR+JVt226PJ1eteUZhAlxPdkoc=;
 h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
 MIME-Version;
 b=dmgoBp5/FloERMSBlsD8r/cs5B2lbP4lsnalIZ3vua6CdXvgdO3scrl07ZuPIddJV1YHPb/ArNloMwKfLgyjNhGTY1Dm9kycqmnhL3YOm4ZghI1CuuGZmUpmw9oJpyWYwi3XkwqSK4DWnjOK02M0n8ox4KCmk3161yDHh5PJab94c8oEtZ6IKgHmy2dT4FWeKxWfJ+OuC1oSZULvpXhPKrsBGQhP33aoibPy1e1W44x9TOJS7alm5crhxWRqUUjbVgmRA78Dg0C+vodHkUQKS96de+Qc77QgG+Q7fh8kemVJhMXSaur6YQ+fO5A7lmgt/HxiTvVk8vjdtXfxL+6ADw==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1733225667;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=FjIsCWIzubmEadMxCxRD+23+CAxaNUechI3CQvCtXx0=;
 b=QbfmX/CNmvbAKXRB8cjqJEhNjdEvgQl4tzCmynQJKZ7fyNPNAdDdlXGFsXTiP1QkQeDmD
 2FdoUApdeThn3lQ1vBgybGDPorKAh08nAm2XmRL4E3u8KcM03ecjyCS1JAfvqnRL8ZN7s8b
 cnPEXWOSO3xwU2icAgsIWNiC0+kRW1ZIF9Nc7kvcRKGhbLpAJqE3t9b4n2dARt9uk/R85FR
 842byfVDajfNaVbrDO+cGWKdVH9vffmYLVR+9PYrgWLaWAIMylCBh8obw/P33WGYtCNUNfL
 kov2m4byjg3+ikLmPSsCZGq0YuKX3Yl+NIjQhwv+xB8G6220uS8X/49sjHNg==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by srv8.sapience.com (Postfix) with ESMTPS id 44AB6280018;
 Tue, 03 Dec 2024 06:34:27 -0500 (EST)
Message-ID: <7db24095f935d874fae466853b0984103f97b40f.camel@sapience.com>
Subject: Re: 6.13-rc1 graphics fail
From: Genes Lists <lists@sapience.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 airlied@gmail.com, 	tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 06:34:25 -0500
In-Reply-To: <Z07Mg2_6y2MW22qV@intel.com>
References: <3b097dddd7095bccabe6791b90899c689f271a35.camel@sapience.com>
 <Z07Mg2_6y2MW22qV@intel.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
 protocol="application/pgp-signature"; boundary="=-JUlQ6gVOaBB9Bh5Ok49w"
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Dec 2024 18:39:38 +0000
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


--=-JUlQ6gVOaBB9Bh5Ok49w
Content-Type: multipart/alternative; boundary="=-itxtGDsHq12QHbd862EQ"

--=-itxtGDsHq12QHbd862EQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-12-03 at 11:16 +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > ...

> Probably
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13057
>=20
Very helpful.

I tested your patch set on Linus' tree commit
cdd30ebb1b9f36159d66f088b61aee264e649d7a :

=C2=A0 =C2=A0=C2=A0https://patchwork.freedesktop.org/series/141911/

and confirm that this fixes the problem=C2=A0

Thank you.


--=20
Gene


--=-itxtGDsHq12QHbd862EQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>On Tue, 2024-12-03 at 11:16 +0200, Ville Syrj=C3=
=A4l=C3=A4 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex=
; border-left:2px #729fcf solid;padding-left:1ex"><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><div>...</div></blockquote></blockquote><div><br></div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div>Probably <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13057">https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13057</a><br></div><div><br></div></blockquote><div>Very helpful.</div=
><div><br></div><div>I tested your patch set on Linus' tree commit cdd30ebb=
1b9f36159d66f088b61aee264e649d7a :</div><div><br></div><div>&nbsp; &nbsp;&n=
bsp;<a href=3D"https://patchwork.freedesktop.org/series/141911/">https://pa=
tchwork.freedesktop.org/series/141911/</a></div><div><br></div><div>and con=
firm that this fixes the problem&nbsp;</div><div><br></div><div style=3D"ca=
ret-color: rgb(238, 238, 236); color: rgb(238, 238, 236); font-family: Cant=
arell; font-style: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: r=
gba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">=
Thank you.</div><br class=3D"Apple-interchange-newline"><div><br></div><div=
><span><pre>-- <br></pre><div><span style=3D"background-color: inherit;">Ge=
ne</span></div><div><br></div></span></div></body></html>

--=-itxtGDsHq12QHbd862EQ--

--=-JUlQ6gVOaBB9Bh5Ok49w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ07swQAKCRA5BdB0L6Ze
2xjMAQCXYZGJ+24+9MzxNKobmrAdhhVfa3LEPOrGGTRQW0H2AwD/ZQgTxaBVaMvR
TNwZTZjXU8DbH1iFzCdt5600iRf7uAM=
=gz23
-----END PGP SIGNATURE-----

--=-JUlQ6gVOaBB9Bh5Ok49w--
