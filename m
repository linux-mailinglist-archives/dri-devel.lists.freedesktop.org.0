Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5C748EF94
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 19:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3B410E27E;
	Fri, 14 Jan 2022 18:00:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF8E10E1B5;
 Fri, 14 Jan 2022 18:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642183202; x=1673719202;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cMf8/2/PJ41uSKfkL7coxjRTx15r04R7Dj5oaGo0ieE=;
 b=QIW6zxws0m5MXYhSdCWIwkKL4MeB6NdEZmbstdyzkOTnWWpsE+d18w7u
 kyDAetsWisAYEZ5eSVEJqBBuLF5cu6AjwjirTogmUh1/4bGL4rbyc1tYo
 20h+DKNoduZ1QAB3+qgbM1ubJt4qzKzBWAmrZT8Q2t8RzufGAJIfCYcU8
 w8kYYhvhi+tXDC1Hk7vQVazm2004UNQ+b42h3HyvQKku1retQPBU5O2eI
 M92hOFsqu63Wo7TO76PK7bz0wTa0lbw7i+LVOcgyjrChIgwJfDUeEeUZ+
 oA8FPvXQNC0MZhQZQKOybE0T7Po2qkzro/uCoO7FaOnxJzCTY2jjCtH5g g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10227"; a="231646495"
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="231646495"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 10:00:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="530352791"
Received: from schruefk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.248])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2022 09:59:58 -0800
Date: Fri, 14 Jan 2022 19:59:54 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/2] drm/i915: Prepare for multiple GTs
Message-ID: <YeG6GrzU/QYUY1RH@intel.intel>
References: <20220112222031.82883-1-andi.shyti@linux.intel.com>
 <20220112222031.82883-2-andi.shyti@linux.intel.com>
 <YeGq/b6JjJaxSE0z@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeGq/b6JjJaxSE0z@mdroper-desk1.amr.corp.intel.com>
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Andi Shyti <andi@etezian.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

[...]

> > -int intel_uncore_setup_mmio(struct intel_uncore *uncore)
> > +int intel_uncore_setup_mmio(struct intel_uncore *uncore, phys_addr_t phys_addr)
> >  {
> >  	struct drm_i915_private *i915 = uncore->i915;
> > -	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> > -	int mmio_bar;
> >  	int mmio_size;
> >  
> > -	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
> >  	/*
> >  	 * Before gen4, the registers and the GTT are behind different BARs.
> >  	 * However, from gen4 onwards, the registers and the GTT are shared
> > @@ -2044,7 +2041,7 @@ int intel_uncore_setup_mmio(struct intel_uncore *uncore)
> >  	else
> >  		mmio_size = 2 * 1024 * 1024;
> >  
> > -	uncore->regs = pci_iomap(pdev, mmio_bar, mmio_size);
> > +	uncore->regs = ioremap(phys_addr, mmio_size);
> 
> Is there a specific reason we switch to ioremap() instead of
> pci_iomap_range()?  I.e., we could pass 'phys_offset' rather than
> 'phys_addr' and call
> 
>         pci_iomap_range(pdev, mmio_bar, phys_offset, mmio_size);
> 
> Not that it really matters too much either way as far as I can see;
> ioremap()/iounmap() should work fine too.

this was originally changed by Abdiel (I think) and I left as it
is as I tried to change as less as I could from the original
work.

> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thank you!

Andi
