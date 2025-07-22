Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE79B0DB03
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB6E10E68E;
	Tue, 22 Jul 2025 13:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JuHFATb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A7B10E68E;
 Tue, 22 Jul 2025 13:38:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F5B644204;
 Tue, 22 Jul 2025 13:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA620C4CEEB;
 Tue, 22 Jul 2025 13:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753191497;
 bh=6i38GbCoEIfx36oPXfWzoIRrb2lBFTrEGSWuKwnbeR4=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=JuHFATb88JnKCtgW82wm81Djxa/tWJd7ZmQerZH5RXmCmbcyIrrtOPDl4I5+vKz5G
 QFg+TCYN+C+l9FkgtHCNegOUdzV02nSoFRyBKJEE6XXuQ29EHpv+cSjIGSAM03Rgqi
 pOt+IVvwb9GPGfuJqIowy3R5EWA7s3rjAiiG1UhDgGnAlrZj+hXuUoN6Wo45JFHDXM
 yrdIbeJMBfFPwfQQbF98EmbCPf5ooRLRScwDxyGfjDVw9wW8cpIM7BUaF+wuSZj8pc
 FvgRKGhi1Idm32b3/EeCHDYHFAptGjiMEiuANUjIlZ4+3dzH1hpVsgKNeLBPT8B9fg
 DjOz5LiP06yFQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 15:38:14 +0200
Message-Id: <DBIMILMUUV20.YED53M3X50H5@kernel.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 01/23] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
Cc: <intel-xe@lists.freedesktop.org>, "Matthew Brost"
 <matthew.brost@intel.com>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Danilo Krummrich" <dakr@redhat.com>,
 "Boris Brezillon" <bbrezillon@kernel.org>, "Caterina Shablia"
 <caterina.shablia@collabora.com>, <dri-devel@lists.freedesktop.org>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250722133526.3550547-2-himal.prasad.ghimiray@intel.com>
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

(Cc: Caterina)

On Tue Jul 22, 2025 at 3:35 PM CEST, Himal Prasad Ghimiray wrote:
> - DRM_GPUVM_SM_MAP_NOT_MADVISE: Default sm_map operations for the input
>   range.
>
> - DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
>   drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> user-provided range and split the existing non-GEM object VMA if the
> start or end of the input range lies within it. The operations can
> create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to be
> used by the Xe driver to assign attributes to GPUVMA's within the
> user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
> the operation with this flag will never have UNMAPs and
> merges, and can be without any final operations.
>
> v2
> - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
>   ops_create (Danilo)
> - Add doc (Danilo)
>
> v3
> - Fix doc
> - Fix unmapping check
>
> v4
> - Fix mapping for non madvise ops
>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
>  drivers/gpu/drm/xe/xe_vm.c             |  1 +

What about the other drivers using GPUVM, aren't they affected by the chang=
es?

>  include/drm/drm_gpuvm.h                | 25 ++++++-
>  4 files changed, 98 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index e89b932e987c..c7779588ea38 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2103,10 +2103,13 @@ static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
>  		   u64 req_addr, u64 req_range,
> +		   enum drm_gpuvm_sm_map_ops_flags flags,

Please coordinate with Boris and Caterina here. They're adding a new reques=
t
structure, struct drm_gpuvm_map_req.

I think we can define it as

	struct drm_gpuvm_map_req {
		struct drm_gpuva_op_map map;
		struct drm_gpuvm_sm_map_ops_flags flags;
	}

eventually.

Please also coordinate on the changes in __drm_gpuvm_sm_map() below regardi=
ng
Caterina's series [1], it looks like they're conflicting.

[1] https://lore.kernel.org/all/20250707170442.1437009-1-caterina.shablia@c=
ollabora.com/

> +/**
> + * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge ops
> + */
> +enum drm_gpuvm_sm_map_ops_flags {
> +	/**
> +	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
> +	 */
> +	DRM_GPUVM_SM_MAP_NOT_MADVISE =3D 0,

Why would we name this "NOT_MADVISE"? What if we add more flags for other
purposes?

> +	/**
> +	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
> +	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> +	 * user-provided range and split the existing non-GEM object VMA if the
> +	 * start or end of the input range lies within it. The operations can
> +	 * create up to 2 REMAPS and 2 MAPs. Unlike drm_gpuvm_sm_map_ops_flags
> +	 * in default mode, the operation with this flag will never have UNMAPs=
 and
> +	 * merges, and can be without any final operations.
> +	 */
> +	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE =3D BIT(0),
> +};
