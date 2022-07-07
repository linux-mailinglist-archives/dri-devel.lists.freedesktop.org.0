Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90A4569750
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 03:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 386A610E097;
	Thu,  7 Jul 2022 01:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF3B10E097;
 Thu,  7 Jul 2022 01:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657156701; x=1688692701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sLaiNhJKL0NiwNDXeatHS4ezKnMJZBmzbEvcbMl4feM=;
 b=RHcfhgQL1m1MQ+p6R7/UvsNYP4SkumU5+VYDE3fsbXtPBmOouZ7ptHQc
 LLHYpJD7pKSeQPJT3FXrHJJOJO3M8TqS16ZS4ODxDQfz+B58YqvdIG1Wt
 Y9D3mbnRI9mro0m0Bk9zO5/3g5+oXGZJPg0pbyflE/IWFJsOUbSPy1yDB
 k9R7UJOCQRCh8x9q8OvjtT7Y8//UH/g9JnPcT6G1dOdnre8T0JoSNLjuw
 arnTlQ6tX2eKUOJtuYuHCRA69+4bmhf8mipQvb5EzEdWa5UFn6fAxrDBt
 iRhPWITNhARCRM0FX8rTZXuafUb69LqD+izmq1t0Sr//cqUw4y1ocMi7G A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="285028170"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="285028170"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 18:18:20 -0700
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="650908998"
Received: from ncarvaja-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.32.228])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 18:18:18 -0700
Date: Thu, 7 Jul 2022 03:18:15 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [Intel-gfx] [RFC 01/10] drm/i915/vm_bind: Introduce VM_BIND ioctl
Message-ID: <YsY0V2JJgXNPjy1s@alfio.lan>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-2-niranjana.vishwanathapura@intel.com>
 <fbbba03a0a0d0f97136b1449276b763a70beb084.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbbba03a0a0d0f97136b1449276b763a70beb084.camel@intel.com>
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
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

[...]

> > +/*
> > + * VM_BIND feature version supported.
> > + *
> > + * The following versions of VM_BIND have been defined:
> > + *
> > + * 0: No VM_BIND support.
> > + *
> > + * 1: In VM_UNBIND calls, the UMD must specify the exact mappings
> > created
> > + *    previously with VM_BIND, the ioctl will not support unbinding
> > multiple
> > + *    mappings or splitting them. Similarly, VM_BIND calls will not
> > replace
> > + *    any existing mappings.
> > + *
> > + * 2: The restrictions on unbinding partial or multiple mappings is
> > + *    lifted, Similarly, binding will replace any mappings in the
> > given range.
> > + *
> > + * See struct drm_i915_gem_vm_bind and struct
> > drm_i915_gem_vm_unbind.
> > + */
> > +#define I915_PARAM_VM_BIND_VERSION     57
> 
> Perhaps clarify that new versions are always backwards compatible?

how is this 57 coherent with the description above?

Andi
