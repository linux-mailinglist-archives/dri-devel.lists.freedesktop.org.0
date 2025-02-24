Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D9FA430D7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 00:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C236310E088;
	Mon, 24 Feb 2025 23:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336CB10E05B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 21:52:26 +0000 (UTC)
Received: from [192.168.0.207] (catv-89-134-12-32.catv.fixed.one.hu
 [89.134.12.32])
 by c64.rulez.org (Postfix) with ESMTPSA id 9B124100C5;
 Mon, 24 Feb 2025 22:52:23 +0100 (CET)
Message-ID: <ccfdff32-fe91-900d-e7a0-81d4d407f648@c64.rulez.org>
Date: Mon, 24 Feb 2025 22:52:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250207041818.4031-1-soci@c64.rulez.org>
 <c4db73a2-12a7-41f4-a175-332c44f51bc4@suse.de>
 <8c0aa1f0-27f8-befa-2b27-76e9faf7fc6d@c64.rulez.org>
 <e07fbd60-e362-482d-8233-409a366c9b2f@suse.de>
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
Subject: Re: [PATCH RESEND 00/13] fbdev: core: Deduplicate cfb/sys drawing
 fbops
In-Reply-To: <e07fbd60-e362-482d-8233-409a366c9b2f@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iNe00QEpBepMAoAL3qlHyl0s"
X-Mailman-Approved-At: Mon, 24 Feb 2025 23:28:54 +0000
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iNe00QEpBepMAoAL3qlHyl0s
Content-Type: multipart/mixed; boundary="------------9gWubFacvy44Fclf2AYj0FzV";
 protected-headers="v1"
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <ccfdff32-fe91-900d-e7a0-81d4d407f648@c64.rulez.org>
Subject: Re: [PATCH RESEND 00/13] fbdev: core: Deduplicate cfb/sys drawing
 fbops
References: <20250207041818.4031-1-soci@c64.rulez.org>
 <c4db73a2-12a7-41f4-a175-332c44f51bc4@suse.de>
 <8c0aa1f0-27f8-befa-2b27-76e9faf7fc6d@c64.rulez.org>
 <e07fbd60-e362-482d-8233-409a366c9b2f@suse.de>
In-Reply-To: <e07fbd60-e362-482d-8233-409a366c9b2f@suse.de>

--------------9gWubFacvy44Fclf2AYj0FzV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Thomas!

Wanted to answer earlier but things took time, and a lot more than expect=
ed.

> First of all, commit 779121e9f175 ("fbdev: Support for byte-reversed
> framebuffer formats") isn't super complicated AFAICT. I can be
> implemented in the sys_ helpers as well. It seems like you initially di=
d
> that.

Meanwhile I found out that this implementation had corner cases. I also
expected original implementations be a bit more complete.

> About the series at hand: generating code by macro expansion is good fo=
r
> simple cases. I've done that in several places within fbdev myself, suc=
h
> as [1]. But if the generated code requires Turing-completeness, it
> becomes much harder to see through the macros and understand what is
> going on. This makes code undiscoverable; and discoverability is a
> requirement for maintenance.

In the new version I resorted to only generate tables with them, in
close proximity. The mentioned part made me think when I first run into
it, btw.

> Then there's type-safety and type-casting. The current series defeats i=
t
> by casting various pointers to whatever the macros define. For example,=

> looking at the copyarea patches, they use screen_base [2] from struct
> fb_info. The thing is, using screen_base is wrong for sys_copyarea().
> The function should use 'screen_buffer' instead. It works because both
> fields share the same bits of a union. Using screen_base is a bug in th=
e
> current implementation that should be fixed, while this patch series
> would set it in stone.

I've noticed the screen base vs. buffer issue back then and was already
corrected. But it's handled more cleanly now.

> Next, if you look through the commit history, you'll find that there ar=
e
> several commits with performance improvements. Memory access in the sys=

> variants is not guaranteed to be 32-bit aligned by default. The compile=
r
> has to assume unaligned access, which results in slower code. Hence,
> some manual intervention has to be done. It's too easy to accidentally
> mess this up by using nontransparent macros for access.

In the new version I made it very hard to get the alignment wrong.

> If you want to do meaningful work here, please do actual refactoring
> instead of throwing unrelated code together. First of all, never use
> macros, but functions. You can supply callback functions to access the
> framebuffer. Each callback should know whether it operates on
> screen_base or screen_buffer.

I've used such callbacks but not for the read/writes as that would have
made the parameter list huge, in terms of lines. Not to mention passing
them down to lowest level.

> But using callbacks for individual reads and writes can have runtime
> overhead. It's better to operate on complete scanlines. The current
> helpers are already organized that way. Again, from the copyarea helper=
:

If done slightly differently the compiler inlines these and there's no
overhead.

> The inner helper do_something_...() has to be written for various cfb
> and sys cases and can be given as function pointer to a generic helper.=

The vertical loops are small, but I kept them separate from the scanline
rendering part.

Thanks for the tips, that was really helpful and used them when applicabl=
e.

While the updated version is not quite so as described I hope it isn't
too bad either.

--------------9gWubFacvy44Fclf2AYj0FzV--

--------------iNe00QEpBepMAoAL3qlHyl0s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE8WlaH4v4aHNT2Bn0WOeEu4KftGsFAme86hsFAwAAAAAACgkQWOeEu4KftGvE
4Qf9Fdqsd4X9jOvVLvGSljiDsQnfz90C4el3Ohs+2E3np9H9JM0QCGU8FKEwTxyo+Pwx0hyNUIre
P1J1bb8gJQ4Mu7w/12g32WxB7vLVSNpKpWUqF5wLWfrDt61ljAs813wE7WJrT4Zp3Xh6Hz+LNFYp
pkC+FoyzuW6HyxffWo/IQgM8xY7gdjkty7uI63SPE9RI1n2kfjq+v5gAvJZ9PSbHMzz5P/IkAo+V
tZBQIPk5GhiC5m8JCB3+EL5TRnfWDhFQgkvsuPz7l6lQhZiF505e4oOl5KUdRlLdwdNBcUgec86h
B2qu+mWd+HxK6y8tWAoEQG7ccEobVJGSpgM2Z/632g==
=X0RA
-----END PGP SIGNATURE-----

--------------iNe00QEpBepMAoAL3qlHyl0s--
