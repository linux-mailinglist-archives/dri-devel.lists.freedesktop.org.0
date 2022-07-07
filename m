Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D95697A0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 03:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4395710F161;
	Thu,  7 Jul 2022 01:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3079510F16A;
 Thu,  7 Jul 2022 01:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657158110; x=1688694110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2Vwg7twfDQc3KPy54GLLPn4tHAETR/efHApHyEXgyXQ=;
 b=lhAwpwci47wlEOZSATzlYJsqEN8A87Xz1i1z2NK92bpye/8yhgpnDTCa
 ul3gzTKG8mnvyBsBbRe+y7ESj97HVcwCHsIP277Se51BLlcMJpJcdMzZb
 NCnc+XEp7c9vtwUEkRtqT7RyHlfp8ye9LXtrBSK+iI47IIGVqC8l9w3/p
 6mhz5BBD8Rom8N2aTP7oR+6arcikgskOdkBY4bzWH7qghVnijCXvBLx5w
 zqDYnYzVUtm1filWgrmihA442eEiZTga9Izk3na2+wM+drgHrfNEquzyR
 qn8EuVCgaYaQDzCTMiP3UE7qaa0H4D710pJMQvFq6t436HwyCcnqPy07h A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="370224922"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="370224922"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 18:41:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="650914517"
Received: from ncarvaja-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.32.228])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 18:41:28 -0700
Date: Thu, 7 Jul 2022 03:41:26 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC 02/10] drm/i915/vm_bind: Bind and unbind mappings
Message-ID: <YsY5xoqu3VdZhHfY@alfio.lan>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-3-niranjana.vishwanathapura@intel.com>
 <8a21c7a72aeb74f80bd471496c3dcd7b6dcd1df1.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a21c7a72aeb74f80bd471496c3dcd7b6dcd1df1.camel@linux.intel.com>
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
 dri-devel@lists.freedesktop.org, matthew.auld@intel.com,
 daniel.vetter@intel.com,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

[...]

> > @@ -28,7 +28,6 @@ static u32 object_max_page_size(struct
> > intel_memory_region **placements,
> >                 max_page_size = max_t(u32, max_page_size, mr-
> > >min_page_size);
> >         }
> >  
> > -       GEM_BUG_ON(!max_page_size);
> >         return max_page_size;
> >  }
> 
> Should this change be separated out? It's not immediately clear to a
> reviewer why it is included.

no, it's not, indeed... and is it correct to assume that the
default size is I915_GTT_PAGE_SIZE_4K?

[...]

> > +#define assert_vm_bind_held(vm)   lockdep_assert_held(&(vm)-
> > >vm_bind_lock)
> > +
> > +static inline void i915_gem_vm_bind_lock(struct i915_address_space
> > *vm)
> > +{
> > +       mutex_lock(&vm->vm_bind_lock);
> > +}
> > +
> > +static inline int
> > +i915_gem_vm_bind_lock_interruptible(struct i915_address_space *vm)
> > +{
> > +       return mutex_lock_interruptible(&vm->vm_bind_lock);
> > +}
> > +
> > +static inline void i915_gem_vm_bind_unlock(struct i915_address_space
> > *vm)
> > +{
> > +       mutex_unlock(&vm->vm_bind_lock);
> > +}
> > +
> 
> Kerneldoc for the inlines.

do we really need these oneline wrappers?

Andi
