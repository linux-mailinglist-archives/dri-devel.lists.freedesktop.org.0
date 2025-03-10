Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F09A5A273
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 19:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C9810E4B8;
	Mon, 10 Mar 2025 18:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jprl4nfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C8610E4B6;
 Mon, 10 Mar 2025 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741630818; x=1773166818;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LNDZJ+7y5MBSZnJGHD0q1rxxRrkJPUjKwnCjp934dho=;
 b=jprl4nfyyUWjJBxBLzw/7QVV4lofVbYRVXxzwOSkLja172n3zQGxPwQm
 7uwyUzKxRxvnQeoL7d/9T+Hs4QSv4EkrbKQPZYrR859ej3a0RtimuBMDw
 eLJ0pU20ifXkcxWjB+xVkXSl6KbZEsKR3Om/X0mw3q8iaPETlhGQBVovB
 ETluStnEyIU1z5x1DbPdnylonpLvWImqAVJL2AFu4aj44EiQOOg2wToAI
 SKrPENaUxsdP4rPHSn3fJqJJwfGcLezCrFMo4Fx9K9VXGtCzmJBV1hyqZ
 D8fOTwIrNWLfEwplK3Rrx3M0thFV1bkpJPSku40NoF27kkSjIZoQTQwiv g==;
X-CSE-ConnectionGUID: B2kQE4xtQZGYH+B6ZI30nQ==
X-CSE-MsgGUID: e1dICozvSfCxAXhWzCr/cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="41888089"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="41888089"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 11:20:17 -0700
X-CSE-ConnectionGUID: e+qzArRzRWqSxAl3vREP0Q==
X-CSE-MsgGUID: 1yJO7yvHS6G/GJ0tis6kYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="124670794"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 10 Mar 2025 11:20:14 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A2C6234974;
 Mon, 10 Mar 2025 18:20:13 +0000 (GMT)
Message-ID: <74c42086-2beb-429d-bf3b-6093e171aa77@intel.com>
Date: Mon, 10 Mar 2025 19:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] drm/xe/xe_gt_pagefault: Migrate pagefault struct
 to header
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
References: <20250310171834.78299-1-jonathan.cavitt@intel.com>
 <20250310171834.78299-3-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250310171834.78299-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 10.03.2025 18:18, Jonathan Cavitt wrote:
> Migrate the pagefault struct from xe_gt_pagefault.c to the

nit: we use "migrate" verb for different purposes.
maybe here (and in the title) the plain "move" will be better?

> xe_gt_pagefault.h header file, along with the associated enum values.

hmm, all other components have foo_types.h header file as place for own
types and use foo.h header only for function declarations.

why are we doing it differently here?

> 
> v2: Normalize names for common header (Matt Brost)
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 41 +++++-----------------------
>  drivers/gpu/drm/xe/xe_gt_pagefault.h | 28 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index a4e688e72efd..c8a9058aa09f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -23,33 +23,6 @@
>  #include "xe_trace_bo.h"
>  #include "xe_vm.h"
>  
> -struct pagefault {
> -	u64 page_addr;
> -	u32 asid;
> -	u16 pdata;
> -	u8 vfid;
> -	u8 access_type;
> -	u8 fault_type;
> -	u8 fault_level;
> -	u8 engine_class;
> -	u8 engine_instance;
> -	u8 fault_unsuccessful;
> -	bool trva_fault;
> -};
> -
> -enum access_type {
> -	ACCESS_TYPE_READ = 0,
> -	ACCESS_TYPE_WRITE = 1,
> -	ACCESS_TYPE_ATOMIC = 2,
> -	ACCESS_TYPE_RESERVED = 3,
> -};
> -
> -enum fault_type {
> -	NOT_PRESENT = 0,
> -	WRITE_ACCESS_VIOLATION = 1,
> -	ATOMIC_ACCESS_VIOLATION = 2,
> -};
> -
>  struct acc {
>  	u64 va_range_base;
>  	u32 asid;
> @@ -61,9 +34,9 @@ struct acc {
>  	u8 engine_instance;
>  };
>  
> -static bool access_is_atomic(enum access_type access_type)
> +static bool access_is_atomic(enum xe_pagefault_access_type access_type)
>  {
> -	return access_type == ACCESS_TYPE_ATOMIC;
> +	return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
>  }
>  
>  static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> @@ -205,7 +178,7 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
>  	return vm;
>  }
>  
> -static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> +static int handle_pagefault(struct xe_gt *gt, struct xe_pagefault *pf)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_vm *vm;
> @@ -237,7 +210,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  		goto unlock_vm;
>  	}
>  
> -	if (xe_vma_read_only(vma) && pf->access_type != ACCESS_TYPE_READ) {
> +	if (xe_vma_read_only(vma) && pf->access_type != XE_PAGEFAULT_ACCESS_TYPE_READ) {
>  		err = -EPERM;
>  		goto unlock_vm;
>  	}
> @@ -271,7 +244,7 @@ static int send_pagefault_reply(struct xe_guc *guc,
>  	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> -static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
> +static void print_pagefault(struct xe_device *xe, struct xe_pagefault *pf)
>  {
>  	drm_dbg(&xe->drm, "\n\tASID: %d\n"
>  		 "\tVFID: %d\n"
> @@ -291,7 +264,7 @@ static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
>  
>  #define PF_MSG_LEN_DW	4
>  
> -static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
> +static bool get_pagefault(struct pf_queue *pf_queue, struct xe_pagefault *pf)
>  {
>  	const struct xe_guc_pagefault_desc *desc;
>  	bool ret = false;
> @@ -378,7 +351,7 @@ static void pf_queue_work_func(struct work_struct *w)
>  	struct xe_gt *gt = pf_queue->gt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_guc_pagefault_reply reply = {};
> -	struct pagefault pf = {};
> +	struct xe_pagefault pf = {};
>  	unsigned long threshold;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> index 839c065a5e4c..33616043d17a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> @@ -11,6 +11,34 @@
>  struct xe_gt;
>  struct xe_guc;
>  
> +struct xe_pagefault {

shouldn't this be "xe_gt_pagefault" ?
all functions seem to be related to the gt

> +	u64 page_addr;
> +	u32 asid;
> +	u16 pdata;
> +	u8 vfid;
> +	u8 access_type;
> +	u8 fault_type;
> +	u8 fault_level;
> +	u8 engine_class;
> +	u8 engine_instance;
> +	u8 fault_unsuccessful;
> +	bool prefetch;
> +	bool trva_fault;
> +};

missing kernel-doc (for struct and members)
and for below enums

> +
> +enum xe_pagefault_access_type {
> +	XE_PAGEFAULT_ACCESS_TYPE_READ = 0,
> +	XE_PAGEFAULT_ACCESS_TYPE_WRITE = 1,
> +	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
> +	XE_PAGEFAULT_ACCESS_TYPE_RESERVED = 3,
> +};
> +
> +enum xe_pagefault_type {
> +	XE_PAGEFAULT_TYPE_NOT_PRESENT = 0,
> +	XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION = 1,
> +	XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION = 2,
> +};
> +
>  int xe_gt_pagefault_init(struct xe_gt *gt);
>  void xe_gt_pagefault_reset(struct xe_gt *gt);
>  int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);

