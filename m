Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4815F0B35
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 14:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D7110E222;
	Fri, 30 Sep 2022 12:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F37910E222;
 Fri, 30 Sep 2022 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664539229; x=1696075229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6fVJ0yxVKYuGBhuyCKaraJ5NgYzNje9iJ34fYNSSdRY=;
 b=HZdoPN2OXM2YjpnW4FheD4VesigXxFtQWtxxiliBZdaNvkhH2c6Nh1nH
 NEu/jIHrx+Kw6z8yaWoeFPpQo4wRhu2J8K3EiKpxt97hpCSZ0lskXTHAc
 giaweGbOejjwUar/ejGMbUwlJyH+XjNJZO6ZJC7rn7wUrb8DHUd8ge9uo
 xGsjracFxbW4QuSPoBbyANK0Sox0OPH760fJGjqGHjuelHUSMGSOiBWoh
 9XBpGVJC5Lpby+Cd3z6jy+NXlr73dNTaxXklaUK+e4Jnot14q34eDm0Zh
 puK0RIMZuruy3ZQK9kbZLt+gDS+uJe8a7Jkhqyv6RxbPg1MwVoSbExcql g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="328556023"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="328556023"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 05:00:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="726834648"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="726834648"
Received: from ashyti-mobl2.igk.intel.com (HELO intel.com) ([172.28.182.81])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 05:00:25 -0700
Date: Fri, 30 Sep 2022 14:00:23 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 08/16] drm/i915/vm_bind: Support persistent vma
 activeness tracking
Message-ID: <YzbaV6Pku0Oke9IB@ashyti-mobl2.lan>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-9-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928061918.6340-9-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com,
 lionel.g.landwerlin@intel.com, tvrtko.ursulin@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Niranjana,

On Tue, Sep 27, 2022 at 11:19:10PM -0700, Niranjana Vishwanathapura wrote:
> Do not use i915_vma activeness tracking for persistent vmas.
> 
> As persistent vmas are part of working set for each execbuf
> submission on that address space (VM), a persistent vma is
> active if the VM active. As vm->root_obj->base.resv will be
> updated for each submission on that VM, it correctly
> represent whether the VM is active or not.
> 
> Add i915_vm_is_active() and i915_vm_sync() functions based
> on vm->root_obj->base.resv with DMA_RESV_USAGE_BOOKKEEP
> usage. dma-resv fence list will be updated with this usage
> during each submission with this VM in the new execbuf3
> ioctl path.
> 
> Update i915_vma_is_active(), i915_vma_sync() and the
> __i915_vma_unbind_async() functions to properly handle
> persistent vmas.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
