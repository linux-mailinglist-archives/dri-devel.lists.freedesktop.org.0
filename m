Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E01A1532C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 16:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713DA10EB1E;
	Fri, 17 Jan 2025 15:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KzNBJa/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CF010EB1E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 15:50:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8EC4CA4313D;
 Fri, 17 Jan 2025 15:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B18C4CEE0;
 Fri, 17 Jan 2025 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737129046;
 bh=SNmLmfgsef/9hhNzsb3NMAAiFw78wbjyHEHDGGZVTtw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KzNBJa/LGzwlIOXkyY4rUtnXmhcOV2JNXuhC0RuL8uCeyH4hmT+nQxIjlgDVZmKpY
 fDnuwDEftr+qPF06VynyVVfbl1619ml6thyYxXwKLdtjhiruBc3KSr/81O/X7KUFg1
 DTZ7sLnfjTln0Ha9O5hS1bxsGe0uK+yXl/dck6Y7OwNpCm/ARLGvQe308zagho5Wz9
 3MA/xvj/8xrsVVycvreMbbOMEZXMdPZ/7Mh45W4LjwPtaZ9552rL81Gy6iv8tZqhwY
 VhGLFyNbniGEQ1wuuCeaL8TLx5+r8Q2vgCbii1DHPIRAqstO4P7JY9NKFFRB7TogsD
 luySxnIc7CLCg==
Date: Fri, 17 Jan 2025 15:50:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/1] regmap: Synchronize cache for the page selector
Message-ID: <9a4d70fc-7a57-486c-a30a-713c48a067e1@sirena.org.uk>
References: <20250116124303.3941583-1-andriy.shevchenko@linux.intel.com>
 <CGME20250117135754eucas1p1a8558792f9475c2acc009e1ba20c7109@eucas1p1.samsung.com>
 <a193bcb5-1b35-48ba-801b-925ab2f92d6f@samsung.com>
 <Z4pktkZ1ihfkZjHm@smile.fi.intel.com>
 <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4bPYUoLQjTBZs6fK"
Content-Disposition: inline
In-Reply-To: <Z4ppo8wV3nicOfAQ@smile.fi.intel.com>
X-Cookie: Q:	Are we not men?
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


--4bPYUoLQjTBZs6fK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 17, 2025 at 04:30:59PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 17, 2025 at 04:09:58PM +0200, Andy Shevchenko wrote:

> @@ -69,7 +69,7 @@ struct lt9611uxc {
>  static const struct regmap_range_cfg lt9611uxc_ranges[] = {
>  	{
>  		.name = "register_range",
> -		.range_min =  0,
> +		.range_min = 0x0100,
>  		.range_max = 0xd0ff,
>  		.selector_reg = LT9611_PAGE_CONTROL,
>  		.selector_mask = 0xff,

There's a bunch of other (generally broken) drivers with their ranges
overlapping their windows, we probably have to drop this for now.

--4bPYUoLQjTBZs6fK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeKfFAACgkQJNaLcl1U
h9AuFAf9Gwkwhe8emaEgIR1IOZrYepPeA1y0mzwm7wqnVHump2i5t5QxrxZpq11+
9l0TQ18vLT++tQBVblwQj0l5T/M4GElsLPDSdAM2QTHEI6wteNySa1su38YLNqBE
YuhRLbnZZwAiQqeZaNS8UcflJMXhXCzn+xqEo+awWcb46DtkDYApHV5xjwVI0Aud
o619nX0UTJiBv/3GFU5XIpiYBPVbTiJsNmi1TlI9pZC/4gfBflsdw2Lpj5KYfFg6
FpYA67ON/S0WYoUvjbAr5oPhHj5v9f/HKU5ryXVHkw+p4/YL1B+TQfyv6NP2eKMX
dX49LkQ89M1J3f2VmDI8DChxShB9KQ==
=TG93
-----END PGP SIGNATURE-----

--4bPYUoLQjTBZs6fK--
