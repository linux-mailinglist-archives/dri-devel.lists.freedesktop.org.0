Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E513485579
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 16:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9D010FB01;
	Wed,  5 Jan 2022 15:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06DA10FB01;
 Wed,  5 Jan 2022 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641395401; x=1672931401;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mP3/QTHrWgWCgHpSd6goe8Ut5pLrmAk1IoafXslOsJ4=;
 b=iVqVcQ9Cv8y1y2+vXNQ8QfOQXFZzA57kPtStvMtq/79kl7WpJsj5iHwV
 ZbFofejeUeEIXspdc53ItJ/Vn5dlRZzwNaNXJRN63jTwsrwrJj90eEDd0
 V08wMdEZWJWwhVpjZ0rBP6CNFsMMFBftnyhcqWuEvidmaShmHHSlECPMJ
 XvgyZVGthjxnw2h7yXPFvP2zJ+OYvCVtRvGUAFkNxBS72U2NszunnHjVs
 96kBRbnchMhvYTrDV2xjsE0RSZOpAcFQ5YhFKkH48IuTNIlRMfS62Jn3G
 D+SkOUGPR3L0uJrjwqvMoUraxP4sNeWhYNI/7ykvo6TCABZIffAVeiSW8 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242669182"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="242669182"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:09:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="512982033"
Received: from fhoeg-mobl1.ger.corp.intel.com (HELO [10.249.254.213])
 ([10.249.254.213])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:09:39 -0800
Message-ID: <f67ddfc050c94d530040d999878320ab1d60c9ff.camel@linux.intel.com>
Subject: Re: [PATCH 2/4] drm/i915/ttm: only fault WILLNEED objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Wed, 05 Jan 2022 16:09:36 +0100
In-Reply-To: <20220105145835.142950-2-matthew.auld@intel.com>
References: <20220105145835.142950-1-matthew.auld@intel.com>
 <20220105145835.142950-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-01-05 at 14:58 +0000, Matthew Auld wrote:
> Don't attempt to fault and re-populate purged objects. By some fluke
> this passes the dontneed-after-mmap IGT, but for the wrong reasons.
> 
> Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 923cc7ad8d70..8d61d4538a64 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -883,6 +883,11 @@ static vm_fault_t vm_fault_ttm(struct vm_fault
> *vmf)
>         if (ret)
>                 return ret;
>  
> +       if (obj->mm.madv != I915_MADV_WILLNEED) {
> +               dma_resv_unlock(bo->base.resv);
> +               return VM_FAULT_SIGBUS;
> +       }
> +
>         if (drm_dev_enter(dev, &idx)) {
>                 ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma-
> >vm_page_prot,
>                                               
> TTM_BO_VM_NUM_PREFAULT);


