Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FF19FEAB3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 21:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365D510E09D;
	Mon, 30 Dec 2024 20:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="wnqHmIX2";
	dkim=pass (2048-bit key; secure) header.d=sapience.com header.i=@sapience.com header.b="oIk4sqIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1294810E09D;
 Mon, 30 Dec 2024 20:52:17 +0000 (UTC)
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
 signature) header.d=sapience.com header.i=@sapience.com 
 header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
 header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from srv8.sapience.com (srv8.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by s1.sapience.com (Postfix) with ESMTPS id DF1924800BC;
 Mon, 30 Dec 2024 15:52:15 -0500 (EST)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1735591935;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=bbGSg4GhK4xxBothwH6tadj+eztWku3yJgf8TE2I8vI=;
 b=wnqHmIX2O3dNhXN8cjxH4mC7eujdGB/RkvQ2O6hd9xD5Hd+c5AD6LzzIawHutTdbVAHWc
 xRkAZwNpSH2b+elAA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1735591935; 
 cv=none;
 b=eSinKhjDTyxmT9tp2tZ59T3hhLGe+EUrxeTA6+B6VPkwGZGDMRIXPBiZsSgruJOG43mZ84W27UYsBNeOdE9mW35B55yXhsogmyLgHRYs7opXDDgJuRQoqhRcnVrXIc6kKPJtA6Xa7oQvIPO6x5Kr3R39MLcZpGAFSTT7eDUYrAk789UhfilXoUYAAmaGB9ehkUPmfvQ33K89JN0fa5CqOnPWxduRsWnmQkCxLISRSYKxRRoZ8VpnKc0ytNOA/W2bMocPcypdxFVa1Y8aW9Xyt9P0FfJCb+gxtHBvlFXyWn2JJ3Ef11uuwEj6HF34ltlt3faSGAsM4zGnPP0Yp9df/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
 t=1735591935; c=relaxed/simple;
 bh=tr+wn1JNOkR5wnDP9TqkcJUvhBnuLKFwROhbfQC2su0=;
 h=DKIM-Signature:DKIM-Signature:Message-ID:Subject:From:To:Cc:Date:
 In-Reply-To:References:Autocrypt:Content-Type:User-Agent:
 MIME-Version;
 b=iP5QXpo4mkmmV5TyT7oNEBnDuy2DHsbl/GD4vX0nqxE6fYOuotMMNkWhO9JT7McAWiJLpXZLbfR1tlSKz8rKipsjn/jH6WpK3Mj/P3hh+E+LVFaqnI4NCXfdWzD8uDLGGBlfC5+iWcZTLI2iilQyjNDxT/Kqj9mJiPAAkPqDTqQCSe8IA9usxnVlT06vld2Bp61Xcu8uMSclCczT+d1QQKYm1Typ39Qni0b5Mz7g3Mta0JunUsnv/jO2w2u0o5Ta6ZewOb0LcLwvoavqYTDLd4R3YdbPPbiRGXUZmm0S9o3iLQZbhn9kB2fsKEA+SLkkba4ooZ6mu0mc2U5RPwEtXg==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1735591935;
 h=message-id : subject : from : to : cc : date : in-reply-to :
 references : content-type : mime-version : from;
 bh=bbGSg4GhK4xxBothwH6tadj+eztWku3yJgf8TE2I8vI=;
 b=oIk4sqIccCpkOO4MjOy9ydPOmBCNr728i/gMqRwJRQOylo/bckJ4GXUakP1vWZo6i30ec
 iB7Y9eYLYR2dPnWI3y7MWvy7jLE2N4XgZl39Tkz6pEB26683zaYfVnsDcCX1vkVnYPlVF9q
 8gVYI3x/fW6yMhOlIceZM5vyQIT8d67aOTQhPbeWMs5Lc+t/3Zi5uSTVcARQft/EcqPGyiG
 C07CZd/njsW85BMqwI0dQA5UXPW1G6l8md4PpWTBYjNXlQuTCtUTYxYEpAyboFZ3ffZtWpO
 D5+b0VwK/cSHwKIzDche1viXdIEPkwcPjOzAQ2d/hZ7C9+Pqlp6XXJBmvrjw==
Received: from lap7.sapience.com (lap7w.sapience.com [x.x.x.x])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (No client certificate requested)
 by srv8.sapience.com (Postfix) with ESMTPS id AF0DF28001A;
 Mon, 30 Dec 2024 15:52:15 -0500 (EST)
Message-ID: <5f756542aaaf241d512458f306707bda3b249671.camel@sapience.com>
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
From: Genes Lists <lists@sapience.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, stable@vger.kernel.org, 
 regressions@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 30 Dec 2024 15:52:14 -0500
In-Reply-To: <20241230145002.3cc11717@gandalf.local.home>
References: <2e9332ab19c44918dbaacecd8c039fb0bbe6e1db.camel@sapience.com>
 <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
 <20241230141329.5f698715@batman.local.home>
 <20241230145002.3cc11717@gandalf.local.home>
Autocrypt: addr=lists@sapience.com; prefer-encrypt=mutual;
 keydata=mDMEXSY9GRYJKwYBBAHaRw8BAQdAwzFfmp+m0ldl2vgmbtPC/XN7/k5vscpADq3BmRy5R
 7y0LU1haWwgTGlzdHMgKEwwIDIwMTkwNzEwKSA8bGlzdHNAc2FwaWVuY2UuY29tPoiWBBMWCAA+Ah
 sBBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEE5YMoUxcbEgQOvOMKc+dlCv6PxQAFAmPJfooFCRl
 vRHEACgkQc+dlCv6PxQAc/wEA/Dbmg91DOGXll0OW1GKaZQGQDl7fHibMOKRGC6X/emoA+wQR5FIz
 BnV/PrXbao8LS/h0tSkeXgPsYxrzvfZInIAC
Content-Type: multipart/signed; micalg="pgp-sha384";
 protocol="application/pgp-signature"; boundary="=-aG5nBaRMh2QNf1vAjb02"
User-Agent: Evolution 3.54.2 
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


--=-aG5nBaRMh2QNf1vAjb02
Content-Type: multipart/alternative; boundary="=-1YKqRDQ7HHC4p/IkiIeJ"

--=-1YKqRDQ7HHC4p/IkiIeJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-12-30 at 14:50 -0500, Steven Rostedt wrote:
> On Mon, 30 Dec 2024 14:13:29 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
>=20
> > I guess the "fix" would be to have the check code ignore pointer to
> > arrays, assuming they are "ok".
>=20
> Can you try this patch?
>=20
> -- Steve

Confirmed - all quiet now with 6.12.7 + your patch - I can test
mainline too but doesn't look that useful.

Thank you for sorting this out so quickly.


--=20
Gene


--=-1YKqRDQ7HHC4p/IkiIeJ
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
</style></head><body><div>On Mon, 2024-12-30 at 14:50 -0500, Steven Rostedt=
 wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-l=
eft:2px #729fcf solid;padding-left:1ex"><div>On Mon, 30 Dec 2024 14:13:29 -=
0500<br></div><div>Steven Rostedt &lt;<a href=3D"mailto:rostedt@goodmis.org=
">rostedt@goodmis.org</a>&gt; wrote:<br></div><div><br></div><blockquote ty=
pe=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;paddi=
ng-left:1ex"><div>I guess the "fix" would be to have the check code ignore =
pointer to<br></div><div>arrays, assuming they are "ok".<br></div></blockqu=
ote><div><br></div><div>Can you try this patch?<br></div><div><br></div><di=
v>-- Steve<br></div></blockquote><div><br></div><div>Confirmed - all quiet =
now with 6.12.7 + your patch - I can test mainline too but doesn't look tha=
t useful.</div><div><br></div><div>Thank you for sorting this out so quickl=
y.</div><div><br></div><div><br></div><div><span><pre>-- <br></pre><div><sp=
an style=3D"background-color: inherit;">Gene</span></div><div><br></div></s=
pan></div></body></html>

--=-1YKqRDQ7HHC4p/IkiIeJ--

--=-aG5nBaRMh2QNf1vAjb02
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYJAB0WIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCZ3MH/gAKCRA5BdB0L6Ze
20YWAQD426fHvasWKVtQmO38Z37cr1vL6KyZH0spe+jQI4usOwD+JVdpTiObJaOK
BcmTqwhPnj8gsMEZeDqnEO5weiQGlQU=
=eEzI
-----END PGP SIGNATURE-----

--=-aG5nBaRMh2QNf1vAjb02--
