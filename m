Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E08A66D69A3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E4910E714;
	Tue,  4 Apr 2023 16:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF1E10E714;
 Tue,  4 Apr 2023 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680627453; x=1712163453;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LKFIJzVqxQAC7UaogA+lbtNYuKa3ZBb4r7H4fYPVXsk=;
 b=RZqING8X0wysfTPcc02RKE9v6IXsvhibEOLSMd+XQ2KmRa2OjPndXy+n
 0kms9DFcyyAJ1lCWK+FtFa6ror5aVse2LbOlaQAUCvYeytiQuMD2aYPDJ
 HVdPCbOoKXkeIZ5m2ILzkQpm6GyP1Lsm32/2YOFJgfD3oVWPmimCWulzY
 8mI5slREoc0JMP6/S1bMbHGngCrE8stSLB/1NV9QAHBQbyhpJ0nnSenbV
 D15SBcdav34nlw/VaZITSjZAi926UKuDzNxJTRzxl9Dw3atnSl2bPGe+9
 hB9DxL2W5aXZ/MGwYTheq9Yqhx+PWxlLS97/OHgMrmpojTFZzK+uTwKPP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370062533"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="370062533"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="686436098"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="686436098"
Received: from vferra-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.196])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 09:57:29 -0700
Date: Tue, 4 Apr 2023 18:57:01 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 3/5] drm/i915: Add a function to mmap framebuffer obj
Message-ID: <ZCxW3WZCKFRchRAE@ashyti-mobl2.lan>
References: <20230404143100.10452-1-nirmoy.das@intel.com>
 <20230404143100.10452-3-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404143100.10452-3-nirmoy.das@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

[...]

> +int i915_gem_fb_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma)
> +{
> +	struct drm_i915_private *i915 = to_i915(obj->base.dev);
> +	struct drm_device *dev = &i915->drm;
> +	struct i915_mmap_offset *mmo = NULL;
> +	enum i915_mmap_type mmap_type;
> +	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
> +
> +	if (drm_dev_is_unplugged(dev))
> +		return -ENODEV;
> +
> +	/* handle ttm object */
> +	if (obj->ops->mmap_ops) {
> +		/*
> +		 * ttm fault handler, ttm_bo_vm_fault_reserved() uses fake offset
> +		 * to calculate page offset so set that up.
> +		 */
> +		vma->vm_pgoff += drm_vma_node_start(&obj->base.vma_node);

you could have kept my r-b. Good work here!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi

> +	} else {
> +		/* handle stolen and smem objects */
> +		mmap_type = i915_ggtt_has_aperture(ggtt) ? I915_MMAP_TYPE_GTT : I915_MMAP_TYPE_WC;
> +		mmo = mmap_offset_attach(obj, mmap_type, NULL);
> +		if (!mmo)
> +			return -ENODEV;
> +	}
> +
> +	/*
> +	 * When we install vm_ops for mmap we are too late for
> +	 * the vm_ops->open() which increases the ref_count of
> +	 * this obj and then it gets decreased by the vm_ops->close().
> +	 * To balance this increase the obj ref_count here.
> +	 */
> +	obj = i915_gem_object_get(obj);
> +	return i915_gem_object_mmap(obj, mmo, vma);
> +}
