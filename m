Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BA036C715
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 15:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A166E15A;
	Tue, 27 Apr 2021 13:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD256E3B2;
 Tue, 27 Apr 2021 13:35:02 +0000 (UTC)
IronPort-SDR: K32mAnqVZJ9pQQ2LktTlcl5hZaiZNm0DQ3hAxBIhQ/kKhZv4NKh8DL1oUHoVGPIL3d3hN7O09R
 z5yvFpcEcC4w==
X-IronPort-AV: E=McAfee;i="6200,9189,9966"; a="176625811"
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="176625811"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 06:35:01 -0700
IronPort-SDR: 8EKA231MCcckDovFlfeCNFcTXdG76Nr9LourqnW6C0PCKOHMysBYbiZQWSegoWFLzN0YMOSDQ8
 AS6pzq3Y0s6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,254,1613462400"; d="scan'208";a="618926715"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga005.fm.intel.com with ESMTP; 27 Apr 2021 06:35:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Apr 2021 14:34:58 +0100
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2106.013;
 Tue, 27 Apr 2021 06:34:57 -0700
From: "Tang, CQ" <cq.tang@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 4/7] drm/i915/gtt/dgfx: place the PD in LMEM
Thread-Topic: [Intel-gfx] [PATCH v2 4/7] drm/i915/gtt/dgfx: place the PD in
 LMEM
Thread-Index: AQHXO0MCCiQcIWwXeUGbulJe/6BXVqrIXKOw
Date: Tue, 27 Apr 2021 13:34:57 +0000
Message-ID: <aa92aeecc0fb4b12b891885d5d3c6d98@intel.com>
References: <20210427085417.120246-1-matthew.auld@intel.com>
 <20210427085417.120246-4-matthew.auld@intel.com>
In-Reply-To: <20210427085417.120246-4-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
MIME-Version: 1.0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Auld
> Sent: Tuesday, April 27, 2021 1:54 AM
> To: intel-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Subject: [Intel-gfx] [PATCH v2 4/7] drm/i915/gtt/dgfx: place the PD in LMEM
> 
> It's a requirement that for dgfx we place all the paging structures in device
> local-memory.
> 
> v2: use i915_coherent_map_type()
> v3: improve the shared dma-resv object comment
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c |  5 ++++-
> drivers/gpu/drm/i915/gt/intel_gtt.c  | 30 +++++++++++++++++++++++++---
> drivers/gpu/drm/i915/gt/intel_gtt.h  |  1 +
>  3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index f83496836f0f..11fb5df45a0f 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -712,7 +712,10 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt
> *gt)
>  	 */
>  	ppgtt->vm.has_read_only = !IS_GEN_RANGE(gt->i915, 11, 12);
> 
> -	ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
> +	if (HAS_LMEM(gt->i915))
> +		ppgtt->vm.alloc_pt_dma = alloc_pt_lmem;

Here we might want to allocate lmem from the 'gt' in the argument,  however, below inside alloc_pt_lmem(), we always allocate lmem to tile0.
Is this desired?

--CQ

> +	else
> +		ppgtt->vm.alloc_pt_dma = alloc_pt_dma;
> 
>  	err = gen8_init_scratch(&ppgtt->vm);
>  	if (err)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c
> b/drivers/gpu/drm/i915/gt/intel_gtt.c
> index d386b89e2758..061c39d2ad51 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
> @@ -7,10 +7,26 @@
> 
>  #include <linux/fault-inject.h>
> 
> +#include "gem/i915_gem_lmem.h"
>  #include "i915_trace.h"
>  #include "intel_gt.h"
>  #include "intel_gtt.h"
> 
> +struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space
> +*vm, int sz) {
> +	struct drm_i915_gem_object *obj;
> +
> +	obj = i915_gem_object_create_lmem(vm->i915, sz, 0);
> +	/*
> +	 * Ensure all paging structures for this vm share the same dma-resv
> +	 * object underneath, with the idea that one object_lock() will lock
> +	 * them all at once.
> +	 */
> +	if (!IS_ERR(obj))
> +		obj->base.resv = &vm->resv;
> +	return obj;
> +}
> +
>  struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm,
> int sz)  {
>  	struct drm_i915_gem_object *obj;
> @@ -19,7 +35,11 @@ struct drm_i915_gem_object *alloc_pt_dma(struct
> i915_address_space *vm, int sz)
>  		i915_gem_shrink_all(vm->i915);
> 
>  	obj = i915_gem_object_create_internal(vm->i915, sz);
> -	/* ensure all dma objects have the same reservation class */
> +	/*
> +	 * Ensure all paging structures for this vm share the same dma-resv
> +	 * object underneath, with the idea that one object_lock() will lock
> +	 * them all at once.
> +	 */
>  	if (!IS_ERR(obj))
>  		obj->base.resv = &vm->resv;
>  	return obj;
> @@ -27,9 +47,11 @@ struct drm_i915_gem_object *alloc_pt_dma(struct
> i915_address_space *vm, int sz)
> 
>  int map_pt_dma(struct i915_address_space *vm, struct
> drm_i915_gem_object *obj)  {
> +	enum i915_map_type type;
>  	void *vaddr;
> 
> -	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
> +	type = i915_coherent_map_type(vm->i915, obj, true);
> +	vaddr = i915_gem_object_pin_map_unlocked(obj, type);
>  	if (IS_ERR(vaddr))
>  		return PTR_ERR(vaddr);
> 
> @@ -39,9 +61,11 @@ int map_pt_dma(struct i915_address_space *vm,
> struct drm_i915_gem_object *obj)
> 
>  int map_pt_dma_locked(struct i915_address_space *vm, struct
> drm_i915_gem_object *obj)  {
> +	enum i915_map_type type;
>  	void *vaddr;
> 
> -	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
> +	type = i915_coherent_map_type(vm->i915, obj, true);
> +	vaddr = i915_gem_object_pin_map(obj, type);
>  	if (IS_ERR(vaddr))
>  		return PTR_ERR(vaddr);
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h
> b/drivers/gpu/drm/i915/gt/intel_gtt.h
> index 40e486704558..44ce27c51631 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
> @@ -527,6 +527,7 @@ int setup_scratch_page(struct i915_address_space
> *vm);  void free_scratch(struct i915_address_space *vm);
> 
>  struct drm_i915_gem_object *alloc_pt_dma(struct i915_address_space *vm,
> int sz);
> +struct drm_i915_gem_object *alloc_pt_lmem(struct i915_address_space
> +*vm, int sz);
>  struct i915_page_table *alloc_pt(struct i915_address_space *vm);  struct
> i915_page_directory *alloc_pd(struct i915_address_space *vm);  struct
> i915_page_directory *__alloc_pd(int npde);
> --
> 2.26.3
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
