Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FFA563CE1
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 01:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6875D113B9B;
	Fri,  1 Jul 2022 23:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C14113B9B;
 Fri,  1 Jul 2022 23:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656719321; x=1688255321;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eQhl8oeK/JIKL4kEQnbmpAMWDR0UVka63EvSlJXmGO0=;
 b=BymgiJhg0ClIyjLV+C04LKkjqWofp2LwNq/kF59AmQKOOPcGh/lyDFWq
 bansAFlD+k6cVwr5Xov4qBme0MifoJsxJggh5AFAH5S/K3aZ1sHZHy+iM
 BL4DzdYHhGKehJqBDXj8SstRu7Ei6PihJzH/EJ0br4vHE8ffC6r7SGYtW
 6IQnDDBvBRvzNXvcy+5r94n9uR3nE5fMjKTgEAlh3D4vxHgJX/COw0Mqq
 ejT52sGpTsJnNWVb3XhOw9S9053GsObNL697wWtKjuzGRHwwUTJq7eHdL
 ylCfFw7tF+4VtStPcy2iAchvG6UwIYzSKaG00dy0S55cqUerKWaS1npoR A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="282796297"
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="282796297"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 16:48:40 -0700
X-IronPort-AV: E=Sophos;i="5.92,238,1650956400"; d="scan'208";a="648539182"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 16:48:40 -0700
Date: Fri, 1 Jul 2022 16:48:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [Intel-gfx] [PATCH v8 0/3] drm/doc/rfc: i915 VM_BIND feature
 design + uapi
Message-ID: <Yr+H1y4GIEX3RYZ6@mdroper-desk1.amr.corp.intel.com>
References: <20220701003110.24843-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701003110.24843-1-niranjana.vishwanathapura@intel.com>
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 chris.p.wilson@intel.com, thomas.hellstrom@intel.com,
 dri-devel@lists.freedesktop.org, daniel.vetter@intel.com,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 05:31:07PM -0700, Niranjana Vishwanathapura wrote:
> This is the i915 driver VM_BIND feature design RFC patch series along
> with the required uapi definition and description of intended use cases.
> 
> v2: Reduce the scope to simple Mesa use case.
>     Remove all compute related uapi, vm_bind/unbind queue support and
>     only support a timeline out fence instead of an in/out timeline
>     fence array.
> v3: Expand documentation on dma-resv usage, TLB flushing, execbuf3 and
>     VM_UNBIND. Add FENCE_VALID and TLB_FLUSH flags.
> v4: Remove I915_GEM_VM_BIND_TLB_FLUSH flag and add additional
>     uapi documentation for vm_bind/unbind.
> v5: Update TLB flushing documentation.
>     Add version support to stage implementation.
> v6: Define and use drm_i915_gem_timeline_fence structure for
>     execbuf3 and vm_bind/unbind timeline fences.
> v7: Rename I915_PARAM_HAS_VM_BIND to I915_PARAM_VM_BIND_VERSION.
>     Update documentation on async vm_bind/unbind and versioning.
>     Remove redundant vm_bind/unbind FENCE_VALID flag, execbuf3
>     batch_count field and I915_EXEC3_SECURE flag.
> v8: Remove I915_GEM_VM_BIND_READONLY and minor documentation
>     updates.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Paulo Zanoni <paulo.r.zanoni@intel.com>

Series applied to drm-intel-gt-next.  Thanks for the patches and
reviews.


Matt

> 
> Niranjana Vishwanathapura (3):
>   drm/doc/rfc: VM_BIND feature design document
>   drm/i915: Update i915 uapi documentation
>   drm/doc/rfc: VM_BIND uapi definition
> 
>  Documentation/gpu/rfc/i915_vm_bind.h   | 291 +++++++++++++++++++++++++
>  Documentation/gpu/rfc/i915_vm_bind.rst | 245 +++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst        |   4 +
>  include/uapi/drm/i915_drm.h            | 205 +++++++++++++----
>  4 files changed, 700 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst
> 
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
