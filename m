Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D752B7D4CC7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C6410E313;
	Tue, 24 Oct 2023 09:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A9610E314
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:42:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 88FABB82479;
 Tue, 24 Oct 2023 09:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D283AC433C7;
 Tue, 24 Oct 2023 09:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698140569;
 bh=DFU09WW0O+MtYz9p3d26Rzb6brsgn66oo9v1uvK0fH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DcmICqZsThEMf0zt35VEjzkAUhcHCb4OOhpUVRZtG6Q3QiOyO64ChSSWa7tsSIjvu
 dM19FaD2UBHfywYmAP92cznf4/aUd/EPBrNKopEGjXSz+pLmJjCYmPajyoWw6bh3Eg
 6jjtQc+NKhZwJGnuzI8qaQquPrGTJZ9KtvOrZJHTic3n/mcwM9l9+25YJ1Uwha4913
 DR13Gam8EDbO7vMjqUHpODWUzaFQndG6LClgV1NoBI0NzBMADnj/S9fFBJBlG1KbJV
 q/moxhhwwy9F3F8Gn/r7Xi5BszyBlA8In9bFDjMShpRgf3moIrWu5dBBl4V/y2032B
 cZQsMBRx+YS0g==
Date: Tue, 24 Oct 2023 11:23:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marco Pagani <marpagan@redhat.com>
Subject: Re: [RFC PATCH] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <zakappnhljtx3axi2ovvis3evhju4cwqrena7j6gqn5kjdjtsb@mgrhkn5oboid>
References: <20231023164541.92913-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zwjf7egz7fyx5jnl"
Content-Disposition: inline
In-Reply-To: <20231023164541.92913-1-marpagan@redhat.com>
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
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Christian Koenig <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zwjf7egz7fyx5jnl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marco,

On Mon, Oct 23, 2023 at 06:45:40PM +0200, Marco Pagani wrote:
> This patch introduces an initial KUnit test suite for GEM objects
> backed by shmem buffers.
>=20
> Signed-off-by: Marco Pagani <marpagan@redhat.com>
> ---
>  drivers/gpu/drm/Kconfig                    |   1 +
>  drivers/gpu/drm/tests/Makefile             |   3 +-
>  drivers/gpu/drm/tests/drm_gem_shmem_test.c | 303 +++++++++++++++++++++
>  3 files changed, 306 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/tests/drm_gem_shmem_test.c
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3eee8636f847..f0a77e3e04d7 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -84,6 +84,7 @@ config DRM_KUNIT_TEST
>  	select DRM_EXPORT_FOR_TESTS if m
>  	select DRM_KUNIT_TEST_HELPERS
>  	select DRM_EXEC
> +	select DRM_GEM_SHMEM_HELPER

I know that DRM_EXEC already stands out, but these should be ordered
alphabetically, so it should be before DRM_KUNIT_TEST_HELPERS.

>  	default KUNIT_ALL_TESTS
>  	help
>  	  This builds unit tests for DRM. This option is not useful for
> diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makef=
ile
> index ba7baa622675..b8227aab369e 100644
> --- a/drivers/gpu/drm/tests/Makefile
> +++ b/drivers/gpu/drm/tests/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) +=3D \
>  	drm_plane_helper_test.o \
>  	drm_probe_helper_test.o \
>  	drm_rect_test.o	\
> -	drm_exec_test.o
> +	drm_exec_test.o \
> +	drm_gem_shmem_test.o

Ditto.

>  CFLAGS_drm_mm_test.o :=3D $(DISABLE_STRUCTLEAK_PLUGIN)
> diff --git a/drivers/gpu/drm/tests/drm_gem_shmem_test.c b/drivers/gpu/drm=
/tests/drm_gem_shmem_test.c
> new file mode 100644
> index 000000000000..0bf6727f08d2
> --- /dev/null
> +++ b/drivers/gpu/drm/tests/drm_gem_shmem_test.c
> @@ -0,0 +1,303 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit test suite for GEM objects backed by shmem buffers
> + *
> + * Copyright (C) 2023 Red Hat, Inc.
> + *
> + * Author: Marco Pagani <marpagan@redhat.com>
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/iosys-map.h>
> +#include <linux/sizes.h>
> +
> +#include <kunit/test.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_kunit_helpers.h>
> +
> +#define TEST_SIZE		SZ_1M
> +#define TEST_BYTE		0xae
> +
> +struct fake_dev {
> +	struct drm_device drm_dev;
> +	struct device *dev;
> +};
> +
> +/* Test creating a shmem GEM object */
> +static void drm_gem_shmem_test_obj_create(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +	KUNIT_ASSERT_EQ(test, shmem->base.size, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_NULL(test, shmem->base.filp);
> +	KUNIT_ASSERT_NOT_NULL(test, shmem->base.funcs);
> +
> +	drm_gem_shmem_free(shmem);
> +}
> +
> +/* Test creating a private shmem GEM object from a scatter/gather table =
*/

Thanks for documenting those tests. I believe we should also document
what we expect from the test: should the test succeed? fail? if it
fails, what is the cause of failure?

Based on the following test, I think something like the following would
be good:

Test that creating a private shmem GEM object from a previously
allocated sg_table succeeds and is properly initialized

Feel free to change it to something else if you find something missing.

> +static void drm_gem_shmem_test_obj_create_private(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct drm_gem_object *gem_obj;
> +	struct dma_buf buf_mock;
> +	struct dma_buf_attachment attach_mock;
> +	struct sg_table *sgt;
> +	char *buf;
> +	int ret;
> +
> +	/* Create a mock scatter/gather table */
> +	buf =3D kunit_kzalloc(test, TEST_SIZE, GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, buf);
> +
> +	sgt =3D kzalloc(sizeof(*sgt), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, sgt);
> +
> +	ret =3D sg_alloc_table(sgt, 1, GFP_KERNEL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	sg_init_one(sgt->sgl, buf, TEST_SIZE);
> +
> +	/* Init a mock DMA-BUF */
> +	buf_mock.size =3D TEST_SIZE;
> +	attach_mock.dmabuf =3D &buf_mock;
> +
> +	gem_obj =3D drm_gem_shmem_prime_import_sg_table(&fdev->drm_dev, &attach=
_mock, sgt);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gem_obj);
> +	KUNIT_ASSERT_EQ(test, gem_obj->size, TEST_SIZE);
> +	KUNIT_ASSERT_NULL(test, gem_obj->filp);
> +	KUNIT_ASSERT_NOT_NULL(test, gem_obj->funcs);
> +
> +	shmem =3D to_drm_gem_shmem_obj(gem_obj);
> +	KUNIT_ASSERT_PTR_EQ(test, shmem->sgt, sgt);
> +
> +	/* The scatter/gather table is freed by drm_gem_shmem_free */
> +	drm_gem_shmem_free(shmem);
> +}

KUNIT_ASSERT_* will stop the execution of the test on failure, you
should probably use a bit more of KUNIT_EXPECT_* calls otherwise you'll
leak resources.

You also probably want to use a kunit_action to clean up and avoid that
whole discussion

> +
> +/* Test pinning backing pages */
> +static void drm_gem_shmem_test_pin_pages(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	int i, ret;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +	KUNIT_ASSERT_NULL(test, shmem->pages);
> +	KUNIT_ASSERT_EQ(test, shmem->pages_use_count, 0);
> +
> +	ret =3D drm_gem_shmem_pin(shmem);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, shmem->pages);
> +	KUNIT_ASSERT_EQ(test, shmem->pages_use_count, 1);
> +
> +	for (i =3D 0; i < (shmem->base.size >> PAGE_SHIFT); i++)
> +		KUNIT_ASSERT_NOT_NULL(test, shmem->pages[i]);
> +
> +	drm_gem_shmem_unpin(shmem);
> +	KUNIT_ASSERT_NULL(test, shmem->pages);
> +	KUNIT_ASSERT_EQ(test, shmem->pages_use_count, 0);
> +
> +	drm_gem_shmem_free(shmem);
> +}
> +
> +/* Test creating a virtual mapping */
> +static void drm_gem_shmem_test_vmap(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct iosys_map map;
> +	int ret, i;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +	KUNIT_ASSERT_NULL(test, shmem->vaddr);
> +	KUNIT_ASSERT_EQ(test, shmem->vmap_use_count, 0);
> +
> +	ret =3D drm_gem_shmem_vmap(shmem, &map);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	KUNIT_ASSERT_NOT_NULL(test, shmem->vaddr);
> +	KUNIT_ASSERT_EQ(test, shmem->vmap_use_count, 1);
> +	KUNIT_ASSERT_FALSE(test, iosys_map_is_null(&map));
> +
> +	iosys_map_memset(&map, 0, TEST_BYTE, TEST_SIZE);
> +	for (i =3D 0; i < TEST_SIZE; i++)
> +		KUNIT_ASSERT_EQ(test, iosys_map_rd(&map, i, u8), TEST_BYTE);
> +
> +	drm_gem_shmem_vunmap(shmem, &map);
> +	KUNIT_ASSERT_NULL(test, shmem->vaddr);
> +	KUNIT_ASSERT_EQ(test, shmem->vmap_use_count, 0);
> +
> +	drm_gem_shmem_free(shmem);
> +}
> +
> +/* Test exporting a scatter/gather table */
> +static void drm_gem_shmem_test_get_pages_sgt(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct sg_table *sgt;
> +	struct scatterlist *sg;
> +	unsigned int si, len =3D 0;
> +	int ret;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +
> +	ret =3D drm_gem_shmem_pin(shmem);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	sgt =3D drm_gem_shmem_get_sg_table(shmem);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
> +	KUNIT_ASSERT_NULL(test, shmem->sgt);
> +
> +	for_each_sgtable_sg(sgt, sg, si) {
> +		KUNIT_ASSERT_NOT_NULL(test, sg);
> +		len +=3D sg->length;
> +	}
> +	KUNIT_ASSERT_GE(test, len, TEST_SIZE);
> +
> +	kfree(sgt);
> +	drm_gem_shmem_free(shmem);
> +}
> +
> +/* Test exporting a scatter/gather pinned table for PRIME */
> +static void drm_gem_shmem_test_get_sg_table(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct sg_table *sgt;
> +	struct scatterlist *sg;
> +	unsigned int si, len =3D 0;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +
> +	sgt =3D drm_gem_shmem_get_pages_sgt(shmem);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
> +	KUNIT_ASSERT_PTR_EQ(test, sgt, shmem->sgt);
> +
> +	for_each_sgtable_sg(sgt, sg, si) {
> +		KUNIT_ASSERT_NOT_NULL(test, sg);
> +		len +=3D sg->length;
> +	}
> +	KUNIT_ASSERT_GE(test, len, TEST_SIZE);
> +
> +	/* The scatter/gather table is freed by drm_gem_shmem_free */
> +	drm_gem_shmem_free(shmem);
> +}
> +
> +/* Test updating madvise status */
> +static void drm_gem_shmem_test_madvise(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	int ret;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +	KUNIT_ASSERT_EQ(test, shmem->madv, 0);
> +
> +	ret =3D drm_gem_shmem_madvise(shmem, 1);
> +	KUNIT_ASSERT_TRUE(test, ret);
> +	KUNIT_ASSERT_EQ(test, shmem->madv, 1);
> +
> +	ret =3D drm_gem_shmem_madvise(shmem, -1);
> +	KUNIT_ASSERT_FALSE(test, ret);
> +	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
> +
> +	ret =3D drm_gem_shmem_madvise(shmem, 0);
> +	KUNIT_ASSERT_FALSE(test, ret);
> +	KUNIT_ASSERT_EQ(test, shmem->madv, -1);
> +
> +	drm_gem_shmem_free(shmem);
> +}
> +
> +/* Test purging */
> +static void drm_gem_shmem_test_purge(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +	struct drm_gem_shmem_object *shmem;
> +	struct sg_table *sgt;
> +	int ret;
> +
> +	shmem =3D drm_gem_shmem_create(&fdev->drm_dev, TEST_SIZE);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shmem);
> +
> +	ret =3D drm_gem_shmem_is_purgeable(shmem);
> +	KUNIT_ASSERT_FALSE(test, ret);
> +
> +	ret =3D drm_gem_shmem_madvise(shmem, 1);
> +	KUNIT_ASSERT_TRUE(test, ret);
> +
> +	sgt =3D drm_gem_shmem_get_pages_sgt(shmem);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sgt);
> +
> +	ret =3D drm_gem_shmem_is_purgeable(shmem);
> +	KUNIT_ASSERT_TRUE(test, ret);
> +
> +	drm_gem_shmem_purge(shmem);
> +	KUNIT_ASSERT_TRUE(test, ret);
> +
> +	drm_gem_shmem_free(shmem);
> +}
> +
> +static int drm_gem_shmem_test_init(struct kunit *test)
> +{
> +	struct fake_dev *fdev;
> +	struct device *dev;
> +
> +	/* Allocate a parent device */
> +	dev =3D drm_kunit_helper_alloc_device(test);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +
> +	/*
> +	 * The DRM core will automatically initialize the GEM core and create
> +	 * a DRM Memory Manager object which provides an address space pool
> +	 * for GEM objects allocation.
> +	 */
> +	fdev =3D drm_kunit_helper_alloc_drm_device(test, dev, struct fake_dev,
> +						 drm_dev, DRIVER_GEM);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);
> +
> +	fdev->dev =3D dev;
> +	test->priv =3D fdev;
> +
> +	return 0;
> +}
> +
> +static void drm_gem_shmem_test_exit(struct kunit *test)
> +{
> +	struct fake_dev *fdev =3D test->priv;
> +
> +	drm_kunit_helper_free_device(test, fdev->dev);
> +}

You don't need to call drm_kunit_helper_free_device() anymore

Maxime

--zwjf7egz7fyx5jnl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTeNHgAKCRDj7w1vZxhR
xR+TAP9fGvnUSmgc17mDQSUA00Sty25BMPIWkcJCvBHpWSbJ0wD/SpZr2g3IdxkL
d2XMp9/PXzFV1RrNOhVyhCQ1Qc4ABQQ=
=wPem
-----END PGP SIGNATURE-----

--zwjf7egz7fyx5jnl--
