Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF50146F8FB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 03:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9908C10E1C3;
	Fri, 10 Dec 2021 02:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD1E10E1C3;
 Fri, 10 Dec 2021 02:11:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="235764765"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="235764765"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 18:11:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="516570392"
Received: from steffens-ivm1.ger.corp.intel.com (HELO intel.com)
 ([10.252.53.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 18:11:04 -0800
Date: Fri, 10 Dec 2021 04:11:01 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 10/11] drm/i915: Use to_gt() helper for GGTT accesses
Message-ID: <YbK3FyffoS8jl+zM@intel.intel>
References: <20211209132512.47241-1-andi.shyti@linux.intel.com>
 <20211209132512.47241-11-andi.shyti@linux.intel.com>
 <20211210001858.GX2219399@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210001858.GX2219399@mdroper-desk1.amr.corp.intel.com>
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Andi Shyti <andi@etezian.org>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

> > GGTT is currently available both through i915->ggtt and gt->ggtt, and we
> > eventually want to get rid of the i915->ggtt one.
> > Use to_gt() for all i915->ggtt accesses to help with the future
> > refactoring.
> 
> I think we can also convert the two references in i915_drm_suspend() and
> i915_drm_resume(), right?  With those converted, I think the only
> remaining use of i915->ggtt will be the call to intel_gt_init_hw_early()
> during startup that assigns the gt->ggtt pointer.  Maybe we should just
> make that function assign a drmm_kzalloc() and drop the i915->ggtt
> completely?

I think calling directly drmm_kzalloc() and get rid of i915->ggtt
is a good idea.

Thanks,
Andi
