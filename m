Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA98143F368
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 01:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057966E852;
	Thu, 28 Oct 2021 23:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DBE6E852;
 Thu, 28 Oct 2021 23:22:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="316745495"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="316745495"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 16:20:55 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="724445682"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 16:20:55 -0700
Date: Thu, 28 Oct 2021 16:20:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi@etezian.org>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 08/11] drm/i915/xehp: Make IRQ reset and
 postinstall multi-tile aware
Message-ID: <20211028232053.GG602200@mdroper-desk1.amr.corp.intel.com>
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-9-matthew.d.roper@intel.com>
 <YXrQEb1Isc+n9dAO@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXrQEb1Isc+n9dAO@jack.zhora.eu>
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

On Thu, Oct 28, 2021 at 06:30:09PM +0200, Andi Shyti wrote:
> Hi Paulo and Matt,
> 
> [...]
> 
> > @@ -3190,14 +3190,19 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
> 
> mmmhhh... bad naming :/

Even though dg1 wasn't a multi-tile platform, it was the platform that
introduced the singleton "master tile interrupt" register that is
responsible for telling us which tile(s) had interrupts; we then proceed
to read the per-tile master register to find out what those interrupts
are.  So I think the name is accurate since the hardware introduced the
extra level of indirection, and we do need to use this handler on DG1
(we'll just never have more than a single GT to loop over in that case).

> 
> [...]
> 
> > -	dg1_master_intr_enable(uncore->regs);
> > -	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
> > +	dg1_master_intr_enable(dev_priv->gt.uncore->regs);
> > +	intel_uncore_posting_read(dev_priv->gt.uncore, DG1_MSTR_TILE_INTR);
> 
> I guess this should also go under a for_each_gt()

DG1_MSTR_TILE_INTR (0x190008) is the top-level, one-per-PCI device
interrupt register; we always access it via tile0's MMIO .  So in this
case we do want to do this outside the loop since it's not a per-tile
operation.

We could probably simplify the dev_priv->gt.uncore parameter to just
dev_priv->uncore to make this more obvious.


Matt

> 
> Andi

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
