Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B7A7F6EDE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23BE10E7B9;
	Fri, 24 Nov 2023 08:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A15810E7B9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:49:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E0A49CE0FD0;
 Fri, 24 Nov 2023 08:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B774C433CB;
 Fri, 24 Nov 2023 08:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700815743;
 bh=ts0KYH2uDH1q8ALGoS/p959d2Z3AhGWJPg58oHHCRiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DPkLbo7WvA5ps/jIBO4P0QiKaOtmRQvI+hrI43BegqFBdXQ0euxanJoeOutDImOzZ
 26rKPC2WhMG2dFM6otNzxvJxKZ9ucdxy5MbV8I94wwaCOzlYMCBzEhYQ0xtznrkJi3
 brGuMwgvz6TTB5x50Ggg57G8n40J6dSlvfaEijB+Cv5ptnROBVXgy9l43PcGPp6zoV
 2NWARGz6wntemBdtMKqNV+Xt7OFKIwKE0R3whpBkYfuXrmqTAGyKkasar+T2QRsnbo
 RBDdftQw/wva2ea2uW42I821gm8uFZ7OIAHU7WkhUgCMzVwmBjIuYOiU1Xowyll51U
 rj+QjC1pXZLLw==
Date: Fri, 24 Nov 2023 09:49:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marco Pagani <marpagan@redhat.com>
Subject: Re: [PATCH v4] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <dkh6t5cya7tw4wz5aqrgvnqqnyzzgvbyvezxexy6pyspju5qbd@cdl4vvs7kvnt>
References: <20231123100147.212645-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rtvjqun5bfrvozeq"
Content-Disposition: inline
In-Reply-To: <20231123100147.212645-1-marpagan@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Christian Koenig <christian.koenig@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rtvjqun5bfrvozeq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Nov 23, 2023 at 11:01:46AM +0100, Marco Pagani wrote:
> +static int drm_gem_shmem_test_init(struct kunit *test)
> +{
> +	struct device *dev;
> +	struct fake_dev {
> +		struct drm_device drm_dev;
> +	} *fdev;
> +

[...]

> +
> +	/*
> +	 * The DRM core will automatically initialize the GEM core and create
> +	 * a DRM Memory Manager object which provides an address space pool
> +	 * for GEM objects allocation.
> +	 */
> +	fdev = drm_kunit_helper_alloc_drm_device(test, dev, struct fake_dev,
> +						 drm_dev, DRIVER_GEM);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);

Sorry I missed it earlier, but you don't need the intermediate structure
if you use

struct drm_device *drm;

drm = __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0, DRIVER_GEM);
KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);

Maxime

--rtvjqun5bfrvozeq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWBjfAAKCRDj7w1vZxhR
xXUQAP9od+klgBILfGLPVPTSdxphG1xUGLo3XXyblMPTgFMz7gEAxqV2NxcgWYJO
vkBCPIX+LUVttVYWyhQvIJ3y+kFqogM=
=eplg
-----END PGP SIGNATURE-----

--rtvjqun5bfrvozeq--
