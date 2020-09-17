Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C426DD8C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD13F6EC31;
	Thu, 17 Sep 2020 14:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A43D6EA31
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 12:04:02 +0000 (UTC)
Received: from kevin (unknown [IPv6:2607:fea8:55f:a950::68f4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C9FB029AEF5;
 Thu, 17 Sep 2020 13:03:47 +0100 (BST)
Date: Thu, 17 Sep 2020 08:03:37 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
Message-ID: <20200917120337.GA1684@kevin>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
 <20200916170409.GA2543@kevin>
 <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
 <d135f546-41aa-a6e2-52fe-7707d379c793@arm.com>
MIME-Version: 1.0
In-Reply-To: <d135f546-41aa-a6e2-52fe-7707d379c793@arm.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 14:07:28 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Will Deacon <will@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============0072472457=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0072472457==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> The DDK blob has the ability to mark only certain areas of memory as
> coherent for performance reasons. For simple things like kmscube I would
> expect that it's basically write-only from the CPU and almost all memory the
> GPU touches isn't touched by the CPU. I.e. coherency isn't helping and the
> coherency traffic is probably expensive. Whether the complexity is worth it
> for "real" content I don't know - it may just be silly benchmarks that
> benefit.

Right, Panfrost userspace specifically assumes GPU reads to be expensive
and treats GPU memory as write-only *except* for a few special cases
(compute-like workloads, glReadPixels, some blits, etc).

The vast majority of the GPU memory - everything used in kmscube - will be
write-only to the CPU and fed directly into the display zero-copy (or
read by the GPU later as a dmabuf).

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9jUJAACgkQ/v5QWgr1
WA2dWg/+OmkKrIz3I3zxUDFk1aW47mEA/JzLjdkrFq+J1K67FPajUIaqzgLjYq1b
wB3a51QSJoN70Aw9O9jrV/GkEbpSf8QWObN4NtZqYcD58fECprh5oXmEfgD0u5gZ
6Gkoijp15utLoOirt2LkEJpYAxrOjfA9n5+WQLn8qQY1QPwO2AjtNxXWlWNhYqvh
CQwDQGoO9FiWNSRPZpx1yHEYP/aDMTW8MqwQ8JsQu2G42TS6ErQUC9OMMZjJ/TYS
GLKA4ybkdSnlNwQH0h+7g6LX0Y3WGUUn1xxbd4P7OPFZapV+87+cQS8sottqH7tS
Rrja9cH4d7/DjKmn1xjT5ftnagxGkzoJ9eYf13DTedymUAQxMGV5TdZhCeUT0HFz
5es9SnkTjOFAQyKZbjiM5t5Sia0eUHLIKUwX6FFKnWxMTtLF4z8XGhizHQrZ8M5I
tQW8f7BzInUEGN5H3FV6spp+P5tL7AkdTEGJ4p87EnoyJfTq2mxWAfTxxN9R01FQ
3yDMyx9bUXif0CNnJjAyTN0WJt17twGKuqAnGu5+oLtK6BXuC5wv9yPyQZ5Zvwgv
HnXnb+s10WYXgdOHRNebUvFnDYsIZTp8/qFXiAdKaHT/r7aL/UKm2XQqwz48O40W
doi8CBItWk7+SxVkj3w5nxnyl9vhu0Md9HkBvGZEH3wfnPGu4/w=
=k8jL
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

--===============0072472457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0072472457==--
