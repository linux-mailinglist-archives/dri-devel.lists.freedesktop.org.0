Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1156BAC4F31
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 15:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DADD10E41A;
	Tue, 27 May 2025 13:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Si/NPXgd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183BA10E41A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 13:05:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6556761137;
 Tue, 27 May 2025 13:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB640C4CEE9;
 Tue, 27 May 2025 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748351111;
 bh=Ompy122E7fHKg2aBu7QUio5qAZ+AuN85g7YTBOJaKyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Si/NPXgd83sNoeKHHt6o4b0SsEwFNoMY1gMTUuBC5hYiTLDcCbgFB8ndUekZgLMIN
 GufD2uZnoWccEpfAvoIQ5W7US/1fV+tzdu39X8Wy4ZyXl5n3K/zUqztPlb1k1ZMk9a
 YR+BnKcygGqQ8+0LSqyk34Cr1bPmyXzjTQFZ5qFNne1GsEd7EKcKe3oWwRekAgNluw
 4HX17jP4ZSqJmT7uKOg5iWe1/WrKbCcx1w5RrxB5HjCsTqGzV/oPfhHfS1G8PtSACA
 qLd4GhMHxK1j/3VN8peAyDplQSYF6ywMyPTmfQ6Z442X0+zNDBC/JkvSPeI2fWqLkk
 b0jK0FaKigWvw==
Date: Tue, 27 May 2025 15:05:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jared Kangas <jkangas@redhat.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com, 
 christian.koenig@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <20250527-gainful-jaguar-of-honor-a72e15@houat>
References: <20250522191418.442390-1-jkangas@redhat.com>
 <20250522191418.442390-4-jkangas@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="r3bmleoevfwb3cbp"
Content-Disposition: inline
In-Reply-To: <20250522191418.442390-4-jkangas@redhat.com>
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


--r3bmleoevfwb3cbp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] dma-buf: heaps: Give default CMA heap a fixed name
MIME-Version: 1.0

Hi,

On Thu, May 22, 2025 at 12:14:18PM -0700, Jared Kangas wrote:
> The CMA heap's name in devtmpfs can vary depending on how the heap is
> defined. Its name defaults to "reserved", but if a CMA area is defined
> in the devicetree, the heap takes on the devicetree node's name, such as
> "default-pool" or "linux,cma". To simplify naming, unconditionally name
> it "default_cma_region", but keep a legacy node in place backed by the
> same underlying allocator for backwards compatibility.
>=20
> Signed-off-by: Jared Kangas <jkangas@redhat.com>
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst |  7 +++++--
>  drivers/dma-buf/heaps/Kconfig                 | 10 ++++++++++
>  drivers/dma-buf/heaps/cma_heap.c              | 20 ++++++++++++++++++-
>  3 files changed, 34 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 23bd0bd7b0654..1dfe5e7acd5a3 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,8 @@ following heaps:
>     usually created either through the kernel commandline through the
>     ``cma`` parameter, a memory region Device-Tree node with the
>     ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`=
` or
> -   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
> -   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs =
is
> +   ``default_cma_region``. For backwards compatibility, when the
> +   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
> +   created following legacy naming conventions; the legacy name might be
> +   ``reserved``, ``linux,cma``, or ``default-pool``.
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index a5eef06c42264..bb369b38b001a 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -12,3 +12,13 @@ config DMABUF_HEAPS_CMA
>  	  Choose this option to enable dma-buf CMA heap. This heap is backed
>  	  by the Contiguous Memory Allocator (CMA). If your system has these
>  	  regions, you should say Y here.
> +
> +config DMABUF_HEAPS_CMA_LEGACY
> +	bool "Legacy DMA-BUF CMA Heap"
> +	default y
> +	depends on DMABUF_HEAPS_CMA
> +	help
> +	  Add a duplicate CMA-backed dma-buf heap with legacy naming derived
> +	  from the CMA area's devicetree node, or "reserved" if the area is not
> +	  defined in the devicetree. This uses the same underlying allocator as
> +	  CONFIG_DMABUF_HEAPS_CMA.
> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma=
_heap.c
> index e998d8ccd1dc6..dfeccafc6ae3c 100644
> --- a/drivers/dma-buf/heaps/cma_heap.c
> +++ b/drivers/dma-buf/heaps/cma_heap.c
> @@ -9,6 +9,9 @@
>   * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
>   *	Andrew F. Davis <afd@ti.com>
>   */
> +
> +#define pr_fmt(fmt) "cma_heap: " fmt
> +
>  #include <linux/cma.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-heap.h>
> @@ -22,6 +25,7 @@
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> =20
> +#define DEFAULT_CMA_NAME "default_cma_region"
> =20
>  struct cma_heap {
>  	struct dma_heap *heap;
> @@ -394,15 +398,29 @@ static int __init __add_cma_heap(struct cma *cma, c=
onst char *name)
>  static int __init add_default_cma_heap(void)
>  {
>  	struct cma *default_cma =3D dev_get_cma_area(NULL);
> +	const char *legacy_cma_name;
>  	int ret;
> =20
>  	if (!default_cma)
>  		return 0;
> =20
> -	ret =3D __add_cma_heap(default_cma, cma_get_name(default_cma));
> +	ret =3D __add_cma_heap(default_cma, DEFAULT_CMA_NAME);
>  	if (ret)
>  		return ret;
> =20
> +	if (IS_ENABLED(CONFIG_DMABUF_HEAPS_CMA_LEGACY)) {
> +		legacy_cma_name =3D cma_get_name(default_cma);
> +		if (!strcmp(legacy_cma_name, DEFAULT_CMA_NAME)) {
> +			pr_warn("legacy name and default name are the same, skipping legacy h=
eap\n");
> +			return 0;
> +		}
> +
> +		ret =3D __add_cma_heap(default_cma, legacy_cma_name);
> +		if (ret)
> +			pr_warn("failed to add legacy heap: %pe\n",
> +				ERR_PTR(-ret));

Are you sure about the -ret? ret should already be a negative number if it =
failed?

With that fixed,

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--r3bmleoevfwb3cbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDW4hAAKCRAnX84Zoj2+
drI1AYCje0uQohcShZdmczyCGhShy69dOYUIKlNGxe50CzVnAnj5Dj376Hc/uoWi
/BLvaSoBfA+MFBNwCyZaxzRtUi9UC6/G0Wqz4e2xpBB8vDFuKRyiSYThzz3yJMSA
erPg189vdQ==
=m8g+
-----END PGP SIGNATURE-----

--r3bmleoevfwb3cbp--
