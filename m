Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48182CAB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CC889E7C;
	Tue,  6 Aug 2019 07:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BA389E47
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 15:52:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id B81422724B1
Date: Mon, 5 Aug 2019 08:52:09 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] drm/panfrost: Add madvise and shrinker support
Message-ID: <20190805155209.GA5909@kevin>
References: <20190805143358.21245-1-robh@kernel.org>
 <20190805143358.21245-2-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190805143358.21245-2-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: multipart/mixed; boundary="===============0424122457=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0424122457==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> +/* madvise provides a way to tell the kernel in case a buffers contents
> + * can be discarded under memory pressure, which is useful for userspace
> + * bo cache where we want to optimistically hold on to buffer allocate
> + * and potential mmap, but allow the pages to be discarded under memory
> + * pressure.
> + *
> + * Typical usage would involve madvise(DONTNEED) when buffer enters BO
> + * cache, and madvise(WILLNEED) if trying to recycle buffer from BO cache.
> + * In the WILLNEED case, 'retained' indicates to userspace whether the
> + * backing pages still exist.
> + */
> +#define PANFROST_MADV_WILLNEED 0	/* backing pages are needed, status returned in 'retained' */
> +#define PANFROST_MADV_DONTNEED 1	/* backing pages not needed */
> +
> +struct drm_panfrost_madvise {
> +	__u32 handle;         /* in, GEM handle */
> +	__u32 madv;           /* in, PANFROST_MADV_x */
> +	__u32 retained;       /* out, whether backing store still exists */
> +};

Just to clarify about the `retained` flag: if userspace does a
madvise(WILLNEED) and we find out that retained=0, what's supposed to
happen?

Should userspace evict the BO from its local cache and allocate one
fresh? Or just remmap? Or something else?

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1IUKQACgkQ/v5QWgr1
WA0wGxAApszqbE07z+dt/XAQEmOxefWDBCJxhFI86Oigt8Z/UcfR1UhvH1GgdbDW
pJ+9L3YlNkpKUOmESOiiUifAcZhOxdJwuw5IfDkVBzFiHhQKKETL6CLC8Hi99gF4
xlv+uoVHO7fKHoHnEYBmLwZyFoQg4yW/oFGX1o6CcTcjF+gkBOnyKEsBOt8cGAEV
z+GJRkFt2YZVWRNDLlsP/LIGE6wvzbDfdvZnvWPSdre8PG3geXRSeCBWGHaA1yev
m52SazyQaE9HN1fiiIGkqQcFzuF7JyvOgUJvCeZERj31v3m/+o4RmPzuqqJfLQoY
1M7PT+oYAsjRxgv37zJf/yX6eNSaBHVlPwCNpIljYcX9E3GLYYUD/ioqJXR3Z6cq
a/LEon3L26esDKiWgQhMArrmj3rJ6+b4CZArvBe20Gqm9vXjF1JMfCac92SWT6kQ
7LCBdE0Fkglfths71yYN4Gvj0jwK+KjYO4nWe1DaItiCo6Qnxz9msEKmuTHahECJ
Jmh/d8/wyrUSfXBqekgxscPkX56JT3UrrAp8B6e4eHv/qB+ywCRBa+e9r/mHknvY
CYiutIOd/nSk0N8C+/7+pRl8Ewu/h8g2vxqrHA3mJIwl7NRVG+h6bXX6RoDYm6es
N4THbFx/PDU+uCfhTGvvHiuRLHSvjvuKS2K2cGGfxQR/IhXwZq4=
=7sIZ
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--

--===============0424122457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0424122457==--
