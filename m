Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB06B790B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 14:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D645410E13C;
	Mon, 13 Mar 2023 13:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AB010E11C;
 Mon, 13 Mar 2023 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678714383; x=1710250383;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DlDK/W+slnB5eS5zMwT1pay+GjWiBYISPVXThBBUE7U=;
 b=GAra2IDLi3frKD8vt6wqb1a2Mruv8NdVxLd39JycBRZRFI1krPPPmyX3
 4XKCdhaBq5OQZrRmVrQFZLYdaPyk2/BN9gSiixuxV086Q+CT8HKnqz8zq
 dWunXBOMDLMaGQolXky3I6mKClU0BSjLFBgWOm8sE2TLS1hXv9LU2fnHC
 PfY3HrUymWObGjbq+9Q2SHi+R+6xrf44C0/1GqMZRNRnTpgXAztSn93rO
 +lNa5i9DAsDxE/aRzcBfyt7qI07gQffJvyg/bxNzx10YFCoEje/pv51Xl
 PDj9LbNgKC//RczLBGS2NxUWiPbF5mEMku7aMSa1/xtp5n8hq7fzGKI67 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399737972"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="399737972"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 06:32:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="788934002"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="788934002"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga002.fm.intel.com with SMTP; 13 Mar 2023 06:32:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Mar 2023 15:32:40 +0200
Date: Mon, 13 Mar 2023 15:32:40 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Remove redundant check for DG1
Message-ID: <ZA8l+GmzALR2F0yb@intel.com>
References: <20230306204954.753739-1-lucas.demarchi@intel.com>
 <ZA7oghE7c6eM/Dkr@intel.com>
 <20230313132359.xahyrz3d4o2rgw7s@ldmartin-desk2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313132359.xahyrz3d4o2rgw7s@ldmartin-desk2.lan>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 06:23:59AM -0700, Lucas De Marchi wrote:
> On Mon, Mar 13, 2023 at 11:10:26AM +0200, Ville Syrjälä wrote:
> >On Mon, Mar 06, 2023 at 12:49:52PM -0800, Lucas De Marchi wrote:
> >> dg1_gt_workarounds_init() is only ever called for DG1, so there is no
> >> point checking it again.
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 12 +++---------
> >>  1 file changed, 3 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> >> index 32aa1647721a..eb6cc4867d67 100644
> >> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> >> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> >> @@ -1472,21 +1472,15 @@ gen12_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >>  static void
> >>  dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> >>  {
> >> -	struct drm_i915_private *i915 = gt->i915;
> >> -
> >
> >Looks like you pushed some stale version of this patch which
> >didn't remove this variable. Now the CONFIG_DRM_I915_WERROR=y
> >build is broken.
> >
> >Did you lose that from your pre-push build .config?
> 
> no, looks like a conflict between drm-intel-gt-next and drm-intel-next
> 
> 69ea87e1591a ("drm/i915/dg1: Drop support for pre-production steppings")
> merged in drm-intel-next dropped the only user.
> 
> This patch was merged in drm-intel-gt-next and I didn't realize the
> race was with the other branch rather than with the same branch due to
> taking a long time for me to apply. Let me rebuild drm-tip to fix it up.

I already fixed it. Just forgot to note that here.

-- 
Ville Syrjälä
Intel
