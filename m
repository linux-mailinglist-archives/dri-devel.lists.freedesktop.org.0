Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA234B2736
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 14:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005DA10EC2C;
	Fri, 11 Feb 2022 13:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C70010EC2C;
 Fri, 11 Feb 2022 13:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644586370; x=1676122370;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6bpC44FR2dUvpDFDk0vyLSxKoxzrW58Bd5nRgFtt9G4=;
 b=n0KFjuWcpKjveKme230JVCv80bVuCu7yhW+oE+5cF2NoftUEBINkIBeL
 suiSq8N/UllKgbwPnobZify1pZwNZGDp16ehvzYNRk4DzKUwBOUpf8iL9
 y4E6TK/35UU7jYprBOMCanR6q7cOocZyM2Czdm8Z2B7kGYATCPybCfPWu
 ZJqrbSL3/31glDc2GkYZqgR8pFJyKeHzgbLeAGsitGVkp9xlcxkrigmb9
 aXgpFhtHwxmdR1nYmWyaZ5+LcK4b58CQDjkLRCJKJblUtj6HFjDVkI1UZ
 UfCBVL9m4gB2qrfKRoOF4blDvzKf5VOQvZ9NDzsAq53v95auhHxCfOKv6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="237135382"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="237135382"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 05:32:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="634095526"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 05:32:47 -0800
Date: Fri, 11 Feb 2022 19:02:57 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 5/5] drm/i915/guc: Allow user to override
 driver load failure without GuC
Message-ID: <20220211133257.GB25847@intel.com>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
 <20220128185209.18077-6-ramalingam.c@intel.com>
 <68877a17-fff0-eef6-a2f2-a9b43dbdb5dc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68877a17-fff0-eef6-a2f2-a9b43dbdb5dc@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 dri-devel <dri-devel@lists.freedesktop.org>, "Ewins,
 Jon" <jon.ewins@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, "Harrison,
 John C" <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-07 at 08:55:20 -0800, Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/28/2022 10:52 AM, Ramalingam C wrote:
> > From: Stuart Summers <stuart.summers@intel.com>
> > 
> > The driver is set currently to fail modprobe when GuC is disabled
> > (enable_guc=0) after GuC has been loaded on a previous modprobe.
> > For GuC deprivilege, the BIOS is setting the locked bit, so the
> > driver always considers the GuC to have been loaded and thus does
> > not support enable_guc=0 on these platforms.
> > 
> > There are some debug scenarios where loading without GuC can be
> > interesting. Add a new feature flag for GuC deprivilege and a mode
> > (enable_guc=0x80) which can be exclusively set to skip the locked
> > bit check.
> 
> This is a debug-only patch, so IMO it should definitely not be merged as-is,
> because we don't want normal users having access to this option as it can
> lead to an hard gpu hangs if misused. I'm honestly not convinced we want
> this in the tree at all, because you can still run without GuC submission by
> setting enable_guc=2; the only thing this patch adds is the ability to skip
> the GuC/HuC load entirely. If you think there is still value in having this
> ability for debug, then the patch should be updated to only allow the new
> option when one of the debug flags is set; I'd go with DEBUG_GEM as we have
> that enabled by default in our CI builds.

Thank you daniele. Dropping this patch as i dont see any usecase as of
now.

Ram.
> 
> Daniele
> 
> > cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_uc.c | 17 +++++++++++++++--
> >   drivers/gpu/drm/i915/i915_params.h    |  1 +
> >   2 files changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > index da199aa6989f..a1376dbd04fe 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> > @@ -108,7 +108,7 @@ static void __confirm_options(struct intel_uc *uc)
> >   			 "Incompatible option enable_guc=%d - %s\n",
> >   			 i915->params.enable_guc, "GuC submission is N/A");
> > -	if (i915->params.enable_guc & ~ENABLE_GUC_MASK)
> > +	if (i915->params.enable_guc & ~(ENABLE_GUC_MASK | ENABLE_GUC_DO_NOT_LOAD_GUC))
> >   		drm_info(&i915->drm,
> >   			 "Incompatible option enable_guc=%d - %s\n",
> >   			 i915->params.enable_guc, "undocumented flag");
> > @@ -416,8 +416,21 @@ static bool uc_is_wopcm_locked(struct intel_uc *uc)
> >   	       (intel_uncore_read(uncore, DMA_GUC_WOPCM_OFFSET) & GUC_WOPCM_OFFSET_VALID);
> >   }
> > +static inline bool skip_lock_check(struct drm_i915_private *i915)
> > +{
> > +	/*
> > +	 * For platforms with GuC deprivilege, if a user *really* wants
> > +	 * to run without GuC, let that happen by setting enable_guc=0x80.
> > +	 */
> > +	return (HAS_GUC_DEPRIVILEGE(i915) &&
> > +		(i915->params.enable_guc & ENABLE_GUC_DO_NOT_LOAD_GUC) &&
> > +		!(i915->params.enable_guc & ~ENABLE_GUC_DO_NOT_LOAD_GUC));
> > +}
> > +
> >   static int __uc_check_hw(struct intel_uc *uc)
> >   {
> > +	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
> > +
> >   	if (!intel_uc_supports_guc(uc))
> >   		return 0;
> > @@ -426,7 +439,7 @@ static int __uc_check_hw(struct intel_uc *uc)
> >   	 * before on this system after reboot, otherwise we risk GPU hangs.
> >   	 * To check if GuC was loaded before we look at WOPCM registers.
> >   	 */
> > -	if (uc_is_wopcm_locked(uc))
> > +	if (uc_is_wopcm_locked(uc) && likely(!skip_lock_check(i915)))
> >   		return -EIO;
> >   	return 0;
> > diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> > index c9d53ff910a0..8996ba2cc3a8 100644
> > --- a/drivers/gpu/drm/i915/i915_params.h
> > +++ b/drivers/gpu/drm/i915/i915_params.h
> > @@ -32,6 +32,7 @@ struct drm_printer;
> >   #define ENABLE_GUC_SUBMISSION		BIT(0)
> >   #define ENABLE_GUC_LOAD_HUC		BIT(1)
> > +#define ENABLE_GUC_DO_NOT_LOAD_GUC	BIT(7)
> >   #define ENABLE_GUC_MASK			GENMASK(1, 0)
> >   /*
> 
