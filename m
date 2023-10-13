Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A97C8636
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 14:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFE610E600;
	Fri, 13 Oct 2023 12:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489AD10E600;
 Fri, 13 Oct 2023 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697201765; x=1728737765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zMLD2+97ZJNhpw6RdKVyZ6wlpplAV7WG4TyReIqNY2M=;
 b=DnFS8BU6mFCpY/KdOsmDeBxm1+9FtB81KQBdO3UwEp72eudRtXVUfoje
 fuouNHvTdAhYaTEJxezej97dNFi5tMpeR5k7eETMmzCST7vUOXUtYJ5jQ
 DEirKXM3f9OIpZrbWwTWvUPPAssT+f9ulcV4K0jgftgYIxQ9rOi9slB4N
 rCDLql38NXjV7os+sPdyq+WdOChDnGMLdjCbjOgANIqSyi5YWwIxRevp/
 XxRxFqdUm/7GvxGJILr5wrfwb9vnilPtJYQwDQRU4AK5gcjehE0BovauC
 9h71ZudqYeZF6mVGzp47b51QR79/BoDlfaM37ovtS9B4tQ27KPtySFw+g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471413100"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="471413100"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 05:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="789857951"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="789857951"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 13 Oct 2023 05:56:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Oct 2023 15:55:59 +0300
Date: Fri, 13 Oct 2023 15:55:59 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Flush WC GGTT only on required platforms
Message-ID: <ZSk-X7oe2eVqmuW3@intel.com>
References: <20231013103140.12192-1-nirmoy.das@intel.com>
 <ZSkg47slZ25rSQK4@intel.com>
 <ae8d62c9-ddfb-8913-6b67-681d9cf70978@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae8d62c9-ddfb-8913-6b67-681d9cf70978@intel.com>
X-Patchwork-Hint: comment
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 02:28:21PM +0200, Nirmoy Das wrote:
> Hi Ville,
> 
> On 10/13/2023 12:50 PM, Ville Syrjälä wrote:
> > On Fri, Oct 13, 2023 at 12:31:40PM +0200, Nirmoy Das wrote:
> >> gen8_ggtt_invalidate() is only needed for limitted set of platforms
> >> where GGTT is mapped as WC
> > I know there is supposed to be some kind hw snooping of the ggtt
> > pte writes to invalidate the tlb, but are we sure GFX_FLSH_CNTL
> > has no other side effects we depend on?
> 
> I spent some time searching through the gfxspec. This GFX_FLSH_CNTL 
> register only seems to be for
> 
> invalidating TLB for GUnit  and (from git log ) we started to do that to 
> enable WC based GGTT updates.
> 
> 
> So if I am not missing anything obvious then this should be safe.

OK.

The only code related complaint I have is that you are now duplicating
that same platform check in two different places. It's always better to
have a single point of truth instead of two or more, so that there is
no risk of introducing bugs due to mismatches.

> 
> 
> Regards,
> 
> Nirmoy
> 
> >
> >> otherwise this can cause unwanted
> >> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
> >> valid.
> >>
> >> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >> Cc: John Harrison <john.c.harrison@intel.com>
> >> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> >> Cc: <stable@vger.kernel.org> # v6.2+
> >> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> >> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/gt/intel_ggtt.c | 6 +++++-
> >>   1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >> index 4d7d88b92632..c2858d434bce 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> >> @@ -197,13 +197,17 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
> >>   
> >>   static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
> >>   {
> >> +	struct drm_i915_private *i915 = ggtt->vm.i915;
> >>   	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
> >>   
> >>   	/*
> >>   	 * Note that as an uncached mmio write, this will flush the
> >>   	 * WCB of the writes into the GGTT before it triggers the invalidate.
> >> +	 *
> >> +	 * Only perform this when GGTT is mapped as WC, see ggtt_probe_common().
> >>   	 */
> >> -	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
> >> +	if (!IS_GEN9_LP(i915) && GRAPHICS_VER(i915) < 11)
> >> +		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
> >>   }
> >>   
> >>   static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
> >> -- 
> >> 2.41.0

-- 
Ville Syrjälä
Intel
