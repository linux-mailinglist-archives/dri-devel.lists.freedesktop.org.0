Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A411E761E9F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 18:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4966C10E162;
	Tue, 25 Jul 2023 16:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7FE10E15D;
 Tue, 25 Jul 2023 16:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690303008; x=1721839008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HQcvA1zVeAzWy7RaVrJIa5yOfiJeZ+edCXEWZE6SZ9I=;
 b=mzOyZMPm7u1yfXEr41SRmVHWakLxxhf5LmaWwPXDFs/JLRwNCWDuX7hC
 1kV0iiyvxt77oHLWsQUFhUXjreiBeLqOYLuOu4YO3FenU+fvRbVzH/pk7
 gvMMpemIm/juuAeqm2X6IKHkqVEwyMp2l+DPDEvTmv6jSeaYo3HgutxVd
 Nhhoy/PV7nShdbmP67I5rEseKQWF96bctgcFxeJDdlMSyyDtkBDuIb7JS
 ArPb6K6UR7TjucuzDBHI4Z/ctrY09QmFujIXmnUFzv/ZKi6ZhQU/cbj/r
 aVWXeEj2q7A1yg/mYqJkGIN4yPoj1onuEL1Fr5MwN/fP+A5cGpUCU6My1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371392613"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="371392613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 09:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="869536497"
Received: from kshutemo-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.37.237])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 09:36:47 -0700
Date: Tue, 25 Jul 2023 18:36:43 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Replace i915->gt0 with to_gt(i915)
Message-ID: <ZL/6Gz4wfepIU8PC@ashyti-mobl2.lan>
References: <20230725103330.1041394-1-andi.shyti@linux.intel.com>
 <8b0015c1-54d8-a4ff-f5b0-cd7243131039@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b0015c1-54d8-a4ff-f5b0-cd7243131039@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 25, 2023 at 03:41:31PM +0200, Andrzej Hajda wrote:
> On 25.07.2023 12:33, Andi Shyti wrote:
> > Quite surprised to see that around i915 there are still i915->gt0
> > references. Replace them with the to_gt() helper.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_stolen.c       | 2 +-
> >   drivers/gpu/drm/i915/gt/intel_gt.c               | 2 +-
> >   drivers/gpu/drm/i915/gt/intel_region_lmem.c      | 2 +-
> >   drivers/gpu/drm/i915/pxp/intel_pxp.c             | 8 ++++----
> >   drivers/gpu/drm/i915/selftests/mock_gem_device.c | 2 +-
> >   5 files changed, 8 insertions(+), 8 deletions(-)
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks for your review! Pushed in drm-intel-gt-next.

Andi
