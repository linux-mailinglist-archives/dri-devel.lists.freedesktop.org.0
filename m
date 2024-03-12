Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23446879D16
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 21:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088BE10ED54;
	Tue, 12 Mar 2024 20:50:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q3KpBxgN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF2D10EB34;
 Tue, 12 Mar 2024 20:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710276601; x=1741812601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VFMRSQKdUMwPfeCwMiU1+0F+7PNO1K6kfl4Elf7RG9I=;
 b=Q3KpBxgNWtuyuH2g80kV5rrgaFlPlNCKmqdZgoWxQQngCxaVVUOh6cWH
 7kZZkcFT85zqALN32ErxVpuvtwk4HGsX4POL1vLQcUxPb+sV/CTBRO6qG
 F/UU9/Xat8lspKKSBnXTHm+xeqf3YiT7fY7hV7m068yJTYn7MpcMST40s
 l01eBMhj/cc89QYyrXNbpC6PJFDlekm8g8WXayfDd3uihUZCvFLhRhOxA
 /Hs2ZRsJYkd9fR4C+ZT+c+ZzKBS2LNVQfd1CRZEgXspqaLNOrwOeasGP1
 z6Hpnvkc+XKtOFtTaUMxXzzMEqRXrTslaCsksog4M9mvB/jCF3ZfdqY/P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8832988"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8832988"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12267870"
Received: from unknown (HELO intel.com) ([10.247.118.142])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 13:49:46 -0700
Date: Tue, 12 Mar 2024 21:49:39 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v5 2/4] drm/i915/gt: Refactor uabi engine class/instance
 list creation
Message-ID: <ZfC_4ztSF7Nv0F1m@ashyti-mobl2.lan>
References: <20240308202223.406384-1-andi.shyti@linux.intel.com>
 <20240308202223.406384-3-andi.shyti@linux.intel.com>
 <20240312170833.GL718896@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170833.GL718896@mdroper-desk1.amr.corp.intel.com>
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

On Tue, Mar 12, 2024 at 10:08:33AM -0700, Matt Roper wrote:
> On Fri, Mar 08, 2024 at 09:22:17PM +0100, Andi Shyti wrote:
> > For the upcoming changes we need a cleaner way to build the list
> > of uabi engines.
> > 
> > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: <stable@vger.kernel.org> # v6.2+
> 
> I don't really see why we need patches 2 & 3 in this series. 

For patch number '2' We had a round of review with Tvrtko and we
wanted to avoid the change I pasted at the bottom[*], which would
decrease something that was increased earlier.

> If we want
> to restrict the platform to a single CCS engine for now (and give that
> single engine access to all of the cslices), it would be much simpler to
> only create a single intel_engine_cs which which would then cause both
> i915 and userspace to only consider a single engine, even if more than
> one is physically present.  That could be done with a simple adjustment
> to engine_mask_apply_compute_fuses() to mask off extra bits from the
> engine mask such that only a single CCS can get returned rather than the
> mask of all CCSs that are present.
> 
> Managing all of the engines in the KMD but only exposing one (some) of
> them to userspace might be something we need if you want to add extra
> functionality down to road to "hotplug" extra engines, or to allow
> userspace to explicitly request multi-CCS mode.  But none of that seems
> necessary for this series, especially for something you're backporting
> to stable kernels.

It's true, it would even be easier to mask out all the CCS
engines after the first. I thought of this.

On one hand hand, adding a for_each_available_engine() throught
the stable path its a bit of abusing, but it's functional to the
single CCS mode.

I was aiming for a longer term solution. If I add a patch to mask
off CCS engines, then I will need to revert it quite soon for
the stable release.

I'm not sure which one is better, though.

Thanks,
Andi

[*]
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 833987015b8b..7041acc77810 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -243,6 +243,15 @@  void intel_engines_driver_register(struct drm_i915_private *i915)
 		if (engine->uabi_class == I915_NO_UABI_CLASS)
 			continue;

+		/*
+		 * Do not list and do not count CCS engines other than the first
+		 */
+		if (engine->uabi_class == I915_ENGINE_CLASS_COMPUTE &&
+		    engine->uabi_instance > 0) {
+			i915->engine_uabi_class_count[engine->uabi_class]--;
+			continue;
+		}
+
 		rb_link_node(&engine->uabi_node, prev, p);
 		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);
