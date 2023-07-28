Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B746C766F8B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C3810E704;
	Fri, 28 Jul 2023 14:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B6710E704
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690554842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gb7183QGxKk1uYRzJRc/TINsdZCiZq0w8RkiWiGcSnQ=;
 b=BBU0FsGeJQFnbtTlRGT/xZ7YwxwYaHPzoamoi3dUG7EGbuD1VTU+oHBn1+6ci7nKb3F6rp
 ndrBiXvIJc7lffHB6XlE6l0+mbs1789rALPncVoQaVxy6fOeSMkvbdj1sEmREvkMuOkgTH
 lcCbCQm4Xh4HpDTjqecayMJ6uy8QaRs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-K1mUHOAMMqKKateZ9kKc7Q-1; Fri, 28 Jul 2023 10:34:00 -0400
X-MC-Unique: K1mUHOAMMqKKateZ9kKc7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fd2dec82a6so12720455e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690554839; x=1691159639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gb7183QGxKk1uYRzJRc/TINsdZCiZq0w8RkiWiGcSnQ=;
 b=hxzOyXsP+Zv6btAUtvjf0etNZsMSgDHhY1sBKosYPZRrgebocD8dAcCjJHjEoJfAlg
 XVFcWFcVc1BayfS0rWkASqRCqy1FFmEqWf0W1hdO7WUcGsybfxZI4SnFhMD8LCXcsuHJ
 bo1Y6hE2v9kSxpKaWKqqSP4HbMe+5nt/KR2dnhnPDvT3Bord9/bcx/XsJlMrgkBlK14Y
 ttYg1IDOXdmOFwuSyn324eLlc+3htP+NG15PoUFrER/5IjwTLy8BvlR2wYe6W6gn2XKP
 7/ysEw9HZlihPu2OwYABuLzHFPeeesmUuBeXbVgUeHmRxQO6RuscWLhs4N67O2Dt4zTj
 deeA==
X-Gm-Message-State: ABy/qLZQ3ENw8jgOC+GZvMOZsXqmkMnagZPlcw7rKHl9f0F131kRkkpl
 8VDkJvAqO6ELXWTE8BN8e08NwbMZby0naO76Bx8Q/bhsquB8ySlmblFnou8v2y4Zs50ZVo1mPYy
 lPvNujYeNCTptdJqpg5F4IkicEIA4
X-Received: by 2002:a05:600c:2208:b0:3f5:146a:c79d with SMTP id
 z8-20020a05600c220800b003f5146ac79dmr2015092wml.15.1690554838778; 
 Fri, 28 Jul 2023 07:33:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFXvv6dXFo/6jYLQiNa4fXv3ZFxGfSG6zjuhsWIIKFCbIdNtIWgO7IzTqg2MRdcNi8iu4BkaA==
X-Received: by 2002:a05:600c:2208:b0:3f5:146a:c79d with SMTP id
 z8-20020a05600c220800b003f5146ac79dmr2015073wml.15.1690554838441; 
 Fri, 28 Jul 2023 07:33:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a05600c20c400b003fd2e89620asm7012376wmm.40.2023.07.28.07.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 07:33:58 -0700 (PDT)
Date: Fri, 28 Jul 2023 16:33:57 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Subject: Re: [PATCH] drm/tests: Alloc drm_device on drm_exec tests
Message-ID: <2qt3go2ark5swawiponvvrlnq6tdxtyivaif2svzba4ajoo2zm@bhuv2qsjtytm>
References: <20230727192259.237935-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2wgxx5pld3lzcqyu"
Content-Disposition: inline
In-Reply-To: <20230727192259.237935-1-arthurgrillo@riseup.net>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 tales.aparecida@gmail.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, boris.brezillon@collabora.com, dakr@redhat.com,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2wgxx5pld3lzcqyu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 27, 2023 at 04:22:59PM -0300, Arthur Grillo wrote:
> The drm_exec tests where crashing[0] because of a null dereference. This
> is caused by a new access of the `driver` attribute of `struct
> drm_driver` on drm_gem_private_object_init(). Alloc the drm_device to
> fix that.
>=20
> [0]
> [15:05:24] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_exe=
c (6 subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [15:05:24] [PASSED] sanitycheck
> ^CERROR:root:Build interruption occurred. Cleaning console.
> [15:05:50] [ERROR] Test: drm_exec: missing expected subtest!
> [15:05:50] BUG: kernel NULL pointer dereference, address: 00000000000000b0
> [15:05:50] #PF: supervisor read access in kernel mode
> [15:05:50] #PF: error_code(0x0000) - not-present page
> [15:05:50] PGD 0 P4D 0
> [15:05:50] Oops: 0000 [#1] PREEMPT NOPTI
> [15:05:50] CPU: 0 PID: 23 Comm: kunit_try_catch Tainted: G               =
  N 6.4.0-rc7-02032-ge6303f323b1a #69
> [15:05:50] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.=
16.2-1.fc37 04/01/2014
> [15:05:50] RIP: 0010:drm_gem_private_object_init+0x60/0xc0
>=20
> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>

You should Cc the list of people returned by scripts/get_maintainers.pl
for all your patches.

> ---
>  drivers/gpu/drm/tests/drm_exec_test.c | 36 +++++++++++++++++++++------
>  1 file changed, 29 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/test=
s/drm_exec_test.c
> index 727ac267682e..df31f89a7945 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -12,11 +12,31 @@
> =20
>  #include <drm/drm_exec.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_kunit_helpers.h>
> =20
>  #include "../lib/drm_random.h"
> =20
> -static struct drm_device dev;
> +static struct device *dev;
> +static struct drm_device *drm;
> +
> +static int test_init(struct kunit *test)
> +{
> +	dev =3D drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	drm =3D __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0,
> +						  DRIVER_MODESET);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> +
> +	return 0;
> +}
> +
> +static void test_exit(struct kunit *test)
> +{
> +	drm_kunit_helper_free_device(test, dev);
> +}

You shouldn't be using a global variable here. test->priv is meant for
those kind of things.

Maxime

--2wgxx5pld3lzcqyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMPR1QAKCRDj7w1vZxhR
xUxYAP91NFC7/WqSYA80CdIl+pa+pyWlBGETODnw6j3fRe5X8QEA2lo3bepE5ClL
bvWSt1lSDcN/dITHr0lofoFe/YnhkQQ=
=nGIk
-----END PGP SIGNATURE-----

--2wgxx5pld3lzcqyu--

