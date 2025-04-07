Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96326A7DB3D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 12:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72A10E41F;
	Mon,  7 Apr 2025 10:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XRpXyxfi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C4010E41D;
 Mon,  7 Apr 2025 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744021824;
 bh=5xJ6/MRvAgqaafqhcbFQ0suIwFHqaSsWKo7hABkc/NA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XRpXyxfirkK2czU/Ktb1AKIu6Z13NjaqcpAp+z2AyPXegkuvxVDGHrU+sNwVMEooa
 wWcwKaU7L8FCu7NXk9sfkTprn4eHoKKCHvn6dmREAy+8WEt7JKDboGsiWtIJcZNKIN
 8XLYtaCPY4ofO3kJSV6BtflI2/Ll32q6g3H4zfDZ/HLbgnNcUiU/lFduIZ1X+FKwtd
 hX8oAek/ykJhBhvP3gduiZTTjCQGtF1e+O8uDmiBUgq7tsvpKJt0uJqoq22HbHOnwl
 JxrCt1KHnCs2Fr81GgDIaELuMPM7rNI24wpyBXxDFp0kFOFqisJMhxhixePprLMis9
 D8ZanfsvR3qoQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D805617E001E;
 Mon,  7 Apr 2025 12:30:23 +0200 (CEST)
Date: Mon, 7 Apr 2025 12:30:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, Danilo Krummrich <dakr@redhat.com>, Boris
 Brezillon <bbrezillon@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 16/32] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
Message-ID: <20250407123018.77f7aa94@collabora.com>
In-Reply-To: <20250407101719.3350996-17-himal.prasad.ghimiray@intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-17-himal.prasad.ghimiray@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon,  7 Apr 2025 15:47:03 +0530
Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> wrote:

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
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> 
> ---
> RFC Link:
> https://lore.kernel.org/intel-xe/20250314080226.2059819-1-himal.prasad.ghimiray@intel.com/T/#mb706bd1c55232110e42dc7d5c05de61946982472
> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++------
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
>  drivers/gpu/drm/xe/xe_vm.c             |  1 +
>  include/drm/drm_gpuvm.h                | 25 ++++++-
>  4 files changed, 98 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..9d09d177b9fa 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2102,10 +2102,13 @@ static int
>  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  		   const struct drm_gpuvm_ops *ops, void *priv,
>  		   u64 req_addr, u64 req_range,
> +		   enum drm_gpuvm_sm_map_ops_flags flags,
>  		   struct drm_gem_object *req_obj, u64 req_offset)

Not exactly related to this series, but I've been playing with Lina's
series[1] which is hooking up flag propagation from _map() calls to
drm_gpuva, and I think we should pass all map args through a struct so
we don't have to change all call-sites anytime we add one a new optional
argument. Here's a patch [2] doing that.

[1]https://lore.kernel.org/lkml/4a431b98-cccc-495e-b72e-02362828c96b@asahilina.net/T/
[2]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/0587c15b9b81ccae1e37ad0a5d524754d8455558
