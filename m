Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 325C9A01409
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 12:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7AD10E109;
	Sat,  4 Jan 2025 11:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="AKMUUHfW";
	dkim=pass (2048-bit key; secure) header.d=sapience.com header.i=@sapience.com header.b="d3JNL/1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6782010E109;
 Sat,  4 Jan 2025 11:06:15 +0000 (UTC)
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
 signature) header.d=sapience.com header.i=@sapience.com 
 header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
 header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by s1.sapience.com (Postfix) with ESMTPS id 59C17480A13;
 Sat, 04 Jan 2025 06:06:14 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1735988774;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=5Z4RiwazAIutp2/IHEL06g4WrC8k8u+BNBzVA22Ci5Y=;
 b=AKMUUHfW8/qQZLcJt+lNhIpKPORNPHftPRIhaM+M7Uql7PO3ip9H/cWpV8qfa/qv92e5S
 aQMwBZkwfi0tDYgAw==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1735988774; 
 cv=none;
 b=ymJs3y2H0rHWTigHI39i00ynAzDyL0pplQ4kjRi8jTEWuhOqcA6ivWMWzbtlLEZiG03PSb3dcYU2aEinSCipF3syopjE6v8pq6gg30gjYymSbfKy+BeaxS9h/fL405IGinOHh3W96EXMCrGTMnkiU8FzxIPpZ4Ptc3AiWlw8EdC4b4T1sn6a3FeMtx6wo7otIdkaFUWpL0u6EH5xNYVqQNdGbK99kPHy1Wpfhr1+nZuSfmTC5prLzlhNtcU796TiJ+TPbpmykP3+ZjcyUE17XXyAIdBteeFVWex3jOfCEfvP6T9ulPMRGnsKp69jkBR5aGhBwvjG1LicVLpb8AVBqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
 t=1735988774; c=relaxed/simple;
 bh=823lCNg0/CmxOSvoh5Xx8jjiDQlyXZxaBTHuFqIdplA=;
 h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
 MIME-Version;
 b=HwEQW1HMhSkS0J84hAbCUMlQp5CnQp6CetMzoa2dd+9anDLZvVqvxKchwAWWkWT0Tiw7SsmdwOtkiSO8cQd6DizjBXDIlRBoUhRlZ2HFwoFoJ74Vc+1vE7dN9G/ANpw6BTfzrhcdf9+lFOySjOPRj8eKzLcYOfGFcANRVThRQNpu6QzY2VjVCoyh+Vg+70qQuiHVFtCIIrh/y+FU1IxJkIM4jSj8jhaljthY9tt6I6CsBMT2Lc2IK+an3sSFogasFzemXco/PuDFO/dEDRvzYpSnTiFPG4V1eMyoe//6bE1sd+YnNFdB7pEOoyzv84kIt/lbjo9TbBd6703tNdeP9g==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1735988774;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=5Z4RiwazAIutp2/IHEL06g4WrC8k8u+BNBzVA22Ci5Y=;
 b=d3JNL/1SdzBoxwtFW09SJmZOJPPQWcJieQyv7CHjFSqkO6c1qacLxoXpMsT35Eprvr1BC
 DuJyoY47jRzqSzKl5J/rQH4P8d1q+lMp+ZVunf31KwtHJ36qxNW0urQzC2+iJp49iir+cg0
 7rH7ySIstHXko77UXDMvTXcBGrqGaOjb+XbPs0A2GY2YNI5+FC6wAknA07xAgspUTn1A24l
 8ZwXrytQocoOB4l13UnL+AGtbx+LL8w+D58oHvlPj6eH/IEdvUOuZo6DyxqLLDjtsGLIuwl
 QfSHYCOyL7qpvkna+feJkEcRFzrqIlvGFswohcoF6n5MVnDbMA0lZohtbDvA==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by srv8.sapience.com (Postfix) with ESMTPS id 1CBBF280011;
 Sat, 04 Jan 2025 06:06:14 -0500 (EST)
Message-ID: <53757618ad585771809d0b37915c4d97fab06fdb.camel@sapience.com>
Subject: [REGRESSION] Re: 6.13-rc1 graphics fail
From: Genes Lists <lists@sapience.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, airlied@gmail.com, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Sat, 04 Jan 2025 06:06:13 -0500
In-Reply-To: <dd13efc9b3fe3e3acd599ca91b714fa92f6cb9a8.camel@sapience.com>
References: <3b097dddd7095bccabe6791b90899c689f271a35.camel@sapience.com>
 <Z07Mg2_6y2MW22qV@intel.com>
 <7db24095f935d874fae466853b0984103f97b40f.camel@sapience.com>
 <dd13efc9b3fe3e3acd599ca91b714fa92f6cb9a8.camel@sapience.com>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
 protocol="application/pgp-signature"; boundary="=-UrIByhuKGYEPCXDfloez"
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


--=-UrIByhuKGYEPCXDfloez
Content-Type: multipart/alternative; boundary="=-u28UiC0DxIsmDLkOwaKE"

--=-u28UiC0DxIsmDLkOwaKE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-12-13 at 07:14 -0500, Genes Lists wrote:
> On Tue, 2024-12-03 at 06:34 -0500, Genes Lists wrote:
> > On Tue, 2024-12-03 at 11:16 +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > > ...
> >=20
> > > Probably https://gitlab.freedesktop.org/drm/i915/kernel/-
> > > /issues/13057
> > >=20
> > Very helpful.
> >=20
> > I tested your patch set on Linus' tree commit
> > cdd30ebb1b9f36159d66f088b61aee264e649d7a :
> >=20
> > =C2=A0 =C2=A0=C2=A0https://patchwork.freedesktop.org/series/141911/
> >=20
> > and confirm that this fixes the problem=C2=A0
> >=20
> > Thank you.
> >=20
> >=20
>=20
> Just a CC to regressions list for tracking.
>=20
> First report here:=C2=A0
> https://lore.kernel.org/lkml/3b097dddd7095bccabe6791b90899c689f271a35.c
> amel@sapience.com/
>=20
> Fixed by patch set as noted above, but not yet in mainline or linux-
> next.
>=20
> Thank you again Ville for quickly coming up with a fix.
>=20

Follow up to check on where things stand with getting the fix into
mainline?=C2=A0

Obviously it would be really good to get this fixed before 6.13 gets
released.

Thanks and happy 2025!


--=20
Gene


--=-u28UiC0DxIsmDLkOwaKE
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
</style></head><body><div>On Fri, 2024-12-13 at 07:14 -0500, Genes Lists wr=
ote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left=
:2px #729fcf solid;padding-left:1ex"><div>On Tue, 2024-12-03 at 06:34 -0500=
, Genes Lists wrote:<br></div><blockquote type=3D"cite" style=3D"margin:0 0=
 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div>On Tue, 2024-=
12-03 at 11:16 +0200, Ville Syrj=C3=A4l=C3=A4 wrote:<br></div><blockquote t=
ype=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padd=
ing-left:1ex"><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"><div>...<br></div></blockquote></b=
lockquote><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8=
ex; border-left:2px #729fcf solid;padding-left:1ex"><div>Probably <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/">https://gitlab.freedes=
ktop.org/drm/i915/kernel/</a>-<br></div><div>/issues/13057<br></div><div><b=
r></div></blockquote><div>Very helpful.<br></div><div><br></div><div>I test=
ed your patch set on Linus' tree commit<br></div><div>cdd30ebb1b9f36159d66f=
088b61aee264e649d7a :<br></div><div><br></div><div>&nbsp; &nbsp;&nbsp;<a hr=
ef=3D"https://patchwork.freedesktop.org/series/141911/">https://patchwork.f=
reedesktop.org/series/141911/</a><br></div><div><br></div><div>and confirm =
that this fixes the problem&nbsp;<br></div><div><br></div><div>Thank you.<b=
r></div><div><br></div><div><br></div></blockquote><div><br></div><div>Just=
 a CC to regressions list for tracking.<br></div><div><br></div><div>First =
report here:&nbsp;<br></div><div><a href=3D"https://lore.kernel.org/lkml/3b=
097dddd7095bccabe6791b90899c689f271a35.c">https://lore.kernel.org/lkml/3b09=
7dddd7095bccabe6791b90899c689f271a35.c</a><br></div><div><a href=3D"mailto:=
amel@sapience.com">amel@sapience.com</a>/<br></div><div><br></div><div>Fixe=
d by patch set as noted above, but not yet in mainline or linux-<br></div><=
div>next.<br></div><div><br></div><div>Thank you again Ville for quickly co=
ming up with a fix.<br></div><div><br></div></blockquote><div><br></div><di=
v>Follow up to check on where things stand with getting the fix into mainli=
ne?&nbsp;</div><div><br></div><div>Obviously it would be really good to get=
 this fixed before 6.13 gets released.</div><div><br></div><div>Thanks and =
happy 2025!</div><div><br></div><div><br></div><div><span><pre>-- <br></pre=
><div><span style=3D"background-color: inherit;">Gene</span></div><div><br>=
</div></span></div></body></html>

--=-u28UiC0DxIsmDLkOwaKE--

--=-UrIByhuKGYEPCXDfloez
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ3kWJQAKCRA5BdB0L6Ze
27bCAQCxdJydOQANoGnlvKGF5h4dInjbzEPlmKhIu2ndAalMmAD/Tcrh/774UiS0
96MtBgVoCjykgCMlIdfhwnDDB4SdUAE=
=aWW8
-----END PGP SIGNATURE-----

--=-UrIByhuKGYEPCXDfloez--
