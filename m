Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14AAFFC57
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 10:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED4C10E0C1;
	Thu, 10 Jul 2025 08:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="K0RiQHIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 417 seconds by postgrey-1.36 at gabe;
 Thu, 10 Jul 2025 08:31:24 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8819810E0C1;
 Thu, 10 Jul 2025 08:31:24 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 167861C00A4; Thu, 10 Jul 2025 10:24:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1752135865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=pDDwx/8Xa9qxt/kIJD4o4HRI/VK/dHZbF4B5VrNxjo0=;
 b=K0RiQHIWBElKO73p34htQt7Pb7ZxY3ubIf0tapH7e59Cr7bzz+sphMPbWuMEIACfLhBezv
 erCQD4k2aJdKVkSu/sAeqar6JD9UYx8/gAgiamoD1G7l4lIFKaLobMcoU9oVlbFn1mGPKZ
 gK73YxOMaDlRlDONVISXqFKjqJkMLvs=
Date: Thu, 10 Jul 2025 10:24:24 +0200
From: Pavel Machek <pavel@ucw.cz>
To: kraxel@redhat.com, vivek.kasireddy@intel.com,
 dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel list <linux-kernel@vger.kernel.org>,
 laurent.pinchart@ideasonboard.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 etnaviv@lists.freedesktop.org, phone-devel@vger.kernel.org
Subject: DMA-BUFs always uncached on arm64, causing poor camera performance
 on Librem 5
Message-ID: <aG94uNDrL1MdHJPM@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Hy5IfTgkPzmMQMNi"
Content-Disposition: inline
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


--Hy5IfTgkPzmMQMNi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

It seems that DMA-BUFs are always uncached on arm64... which is a
problem.

I'm trying to get useful camera support on Librem 5, and that includes
recording vidos (and taking photos).

memcpy() from normal memory is about 2msec/1MB. Unfortunately, for
DMA-BUFs it is 20msec/1MB, and that basically means I can't easily do
760p video recording. Plus, copying full-resolution photo buffer takes
more than 200msec!

There's possibility to do some processing on GPU, and its implemented here:

https://gitlab.com/tui/tui/-/tree/master/icam?ref_type=3Dheads

but that hits the same problem in the end -- data is in DMA-BUF,
uncached, and takes way too long to copy out.

And that's ... wrong. DMA ended seconds ago, complete cache flush
would be way cheaper than copying single frame out, and I still have
to deal with uncached frames.

So I have two questions:

1) Is my analysis correct that, no matter how I get frame from v4l and
process it on GPU, I'll have to copy it from uncached memory in the
end?

2) Does anyone have patches / ideas / roadmap how to solve that? It
makes GPU unusable for computing, and camera basically unusable for
video.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--Hy5IfTgkPzmMQMNi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaG94uAAKCRAw5/Bqldv6
8pgQAKCIzyOsWHWgCDHHRvv8N/YvGO3c0QCdFeWLgWJbGw7+2Zf5gSBmRo2Gf5U=
=v0KO
-----END PGP SIGNATURE-----

--Hy5IfTgkPzmMQMNi--
