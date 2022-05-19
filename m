Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8152DF88
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 23:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EE210E15A;
	Thu, 19 May 2022 21:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E8510E15A;
 Thu, 19 May 2022 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652996804; x=1684532804;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Sa4M5VYb/V0ooZN0pwsFGyLhaPFaCG1gLYioyNINpss=;
 b=YAORx/0JXcB7irEgsHrZVuuxzJISYwYw1T/4ODXmte82bTldcLnS6IJr
 oUzSq/Fk1YD5CWf+dGynWWdKIq7uf74m6EP3fNF5Ul3OS/ed1PVVfmVqq
 Tem2lKUvQp/YPyVYTJBlLHQ9Y5v3DbDqq60FIw4EeRYm10pigkb7mMMgJ
 p1VLfQB5/YZuzHOptVlOtYAKo6D02zcKLryB6/iJBavIVznseigXmDXA6
 Q+Bb9X2l6kGvzusAvTn+3Mn+MnqF6karTaNGufZn846/gJcAQdHggCrUr
 ZfoVY/JRBPnzes6+u10LUQMMfTrkc52FnjKw+3plAfQEqmJUuWUysvTQp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="335439281"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="335439281"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 14:46:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; d="scan'208";a="570445189"
Received: from annahenx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.37.182])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 14:46:42 -0700
Date: Thu, 19 May 2022 23:46:38 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix vm use-after-free in vma
 destruction
Message-ID: <Yoa6vqN/BOfoF53j@intel.intel>
References: <20220512094045.792373-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220512094045.792373-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, May 12, 2022 at 11:40:45AM +0200, Thomas Hellström wrote:
> In vma destruction, the following race may occur:
> 
> Thread 1:	    		  Thread 2:
> i915_vma_destroy();
> 
>   ...
>   list_del_init(vma->vm_link);
>   ...
>   mutex_unlock(vma->vm->mutex);
> 				  __i915_vm_release();
> release_references();
> 
> And in release_reference() we dereference vma->vm to get to the
> vm gt pointer, leadin go a use-after free.

leading to

[...]

> -static void release_references(struct i915_vma *vma, bool vm_ddestroy)
> +static void release_references(struct i915_vma *vma, struct intel_gt *gt,
> +			       bool vm_ddestroy)
>  {
>  	struct drm_i915_gem_object *obj = vma->obj;
> -	struct intel_gt *gt = vma->vm->gt;
>  
>  	GEM_BUG_ON(i915_vma_is_active(vma));

but then we have

	if (vm_ddestroy)
		i915_vm_resv_put(vma->vm);

were we reference to a freed vm, right? Do we need to check it
here, as well?

Andi
