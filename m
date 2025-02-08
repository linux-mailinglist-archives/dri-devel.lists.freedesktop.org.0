Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B6A2DE2D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D8F10E496;
	Sun,  9 Feb 2025 13:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C2410E17E
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 00:51:36 +0000 (UTC)
Received: from [192.168.0.115] (unknown [89.134.11.189])
 by c64.rulez.org (Postfix) with ESMTPSA id 4C69B100F6;
 Sat,  8 Feb 2025 01:51:31 +0100 (CET)
Message-ID: <8c0aa1f0-27f8-befa-2b27-76e9faf7fc6d@c64.rulez.org>
Date: Sat, 8 Feb 2025 01:51:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250207041818.4031-1-soci@c64.rulez.org>
 <c4db73a2-12a7-41f4-a175-332c44f51bc4@suse.de>
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
Subject: Re: [PATCH RESEND 00/13] fbdev: core: Deduplicate cfb/sys drawing
 fbops
In-Reply-To: <c4db73a2-12a7-41f4-a175-332c44f51bc4@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zrCE9RTpZfdjfCQwIrX4E8p1"
X-Mailman-Approved-At: Sun, 09 Feb 2025 13:55:44 +0000
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
--------------zrCE9RTpZfdjfCQwIrX4E8p1
Content-Type: multipart/mixed; boundary="------------P5ZohRz3iLDhhg8Q65q191HU";
 protected-headers="v1"
From: =?UTF-8?Q?Kajt=c3=a1r_Zsolt?= <soci@c64.rulez.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <8c0aa1f0-27f8-befa-2b27-76e9faf7fc6d@c64.rulez.org>
Subject: Re: [PATCH RESEND 00/13] fbdev: core: Deduplicate cfb/sys drawing
 fbops
References: <20250207041818.4031-1-soci@c64.rulez.org>
 <c4db73a2-12a7-41f4-a175-332c44f51bc4@suse.de>
In-Reply-To: <c4db73a2-12a7-41f4-a175-332c44f51bc4@suse.de>

--------------P5ZohRz3iLDhhg8Q65q191HU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Thomas!

> No it's not. Major code abstractions behind preprocessor tokens are=20
> terrible to maintain.

Hmm, don't get me wrong but I'm not sure if the changes were really
checked in detail. At first sight it might look like I'm adding tons of
new macro ridden code in those header files replacing cleaner code.

While actually that's just how the I/O version currently is, copied and
white space cleaned (as it was requested) plus comment style matched
with sys.

The only new thing which hides the mentioned abstraction a little more
is FB_MEM, which replaced __iomem. But that's a tradeoff to be able to
use the same source for system as well.

Or the concern is that now system memory specific code might get mixed
in there by mistake?

It was not planned as the final version, the current maintainer asked
for addressing some pre-existing quality issues with further patches but
otherwise accepted the taken approach.

> It's also technically not possible to switch between system and I/O=20
> memory at will. These are very different things.

Yes, there are architectures where these two don't mix at all, I'm aware
of that. I need that on x86 only (for old hw), and there it seems
doable. Depending on the resolution either the aperture or the defio
memory is mapped. If the framebuffer is not remapped after a mode change
that's an application bug. Otherwise it's harmless as both are always
there and don't change.

I'd better like to find out problems sooner than later, so if you or
anyone else could share any concerns that'd be really helpful!

> If you want that pixel-reversing feature in sys_ helpers, please=20
> implement it there.

Actually that's what I did first. Then did it once more by adapting the
I/O version as that gave me more confidence that it'll work exactly the
same and there's less room for error.

--------------P5ZohRz3iLDhhg8Q65q191HU--

--------------zrCE9RTpZfdjfCQwIrX4E8p1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEE8WlaH4v4aHNT2Bn0WOeEu4KftGsFAmemqpIFAwAAAAAACgkQWOeEu4KftGth
1wgAkeHUwzAtvRl+xA+zG/saL4inUubQsNEu3Kdn7YGaiZuNcP7TTNCEdHhk7XfDvbT/M4ZQyc0x
jkmcoM2ABey1XQAl5LWnwL5lQMX5/ghDokLwTOnByiuxtWiptL6RfspDY79zr6tKoxE1LgSOOQKu
Idb+Md+pifxPdArgVpcUwb7hoSJf+ohMQ9wJO3I3J3n7FvM0sP6bawloxX8A30AtN8zktCZkOIGy
Sbipo+1iXQ1ls1rHEm6oYfS5TRikNrUxeI7U2aYjCs6k4+ukQw9byDBos0em5oXu1edcZRhjYnGV
S1+m2KTGsJWLVzRjES9dygAMESQOAFFxPQ6rdH3f5Q==
=Conf
-----END PGP SIGNATURE-----

--------------zrCE9RTpZfdjfCQwIrX4E8p1--
