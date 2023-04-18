Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869B26E5A07
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613B110E0BC;
	Tue, 18 Apr 2023 07:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEB210E0BC;
 Tue, 18 Apr 2023 07:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681801504; x=1713337504;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=790J5VzWmR6V8bEB2YdDcTx2yJNlxdWqdjD+8pJ+u40=;
 b=P1nb2Kp31QG6kh/supN0CvS6pIAXp26hAG2XryToLYBCxNaYpj7ee8xp
 VDGRD9W6j2WG+q3qWlQl4c0e1eY6Srg5k4vtE7GXDlGjF/ijNLfPgqqqR
 ES+y8incsCLZjX7pnON9c9dSXnnZ4EfnnrSlb73f9NgxqWf4yrLxoSVfT
 2qKHK6Plprbcepx3qJTTRrLxXjM1wJazFpni9B4+zBZffjHXgwnVzDR5Q
 QDHPeT2kEzPh0fTHqaiZ4b3W9TEQXmJYS6r3/DV+gJ4v/IcTCBxGs5Iyc
 EvTgfYNd8dzhdI5qao6cjbXrHcbFztVD3XUfmHcxLM42B3WjOvEEoVEUu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="346941713"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="346941713"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 00:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="760251538"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="760251538"
Received: from kniewcza-mobl.ger.corp.intel.com (HELO [10.213.6.70])
 ([10.213.6.70])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 00:04:59 -0700
Message-ID: <ff16430f-ee89-dc6c-fe4f-6597ea8423ba@intel.com>
Date: Tue, 18 Apr 2023 09:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20230417235356.1291060-1-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230417235356.1291060-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Matt Roper <matthew.d.roper@intel.com>, Andi Shyti <andi.shyti@kernel.org>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.04.2023 01:53, Andi Shyti wrote:
> In multi-gt systems IRQs need to be reset and enabled per GT.
> 
> This might add some redundancy when handling interrupts for
> engines that might not exist in every tile, but helps to keep the
> code cleaner and more understandable.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> ---
> Hi,
> 
> thanks Matt for the review.
> 
> Andi
> 
> Changelog
> =========
> v4 -> v5
>   - Another little cosmetic on the variable declaration. Go back
>     to v3 but using "&dev_priv->uncore" instead of
>     "to_gt(dev_priv)->uncore", which is much cleaner.
>   - Add Matt's r-b.
> v3 -> v4
>   - do not change the initial gt and uncore initialization in
>     order to gain a better understanding at a glance of the
>     purpose of all the local variables.
> v2 -> v3
>   - keep GUnit irq initialization out of the for_each_gt() loop as
>     the media GT doesn't have a GUnit.
> v1 -> v2
>   - improve description in the commit log.
> 
>   drivers/gpu/drm/i915/i915_irq.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
>   drivers/gpu/drm/i915/i915_irq.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)

Harmless duplication, I guess.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index dea1a117f3fa1..eead067f18c7a 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -2856,12 +2856,15 @@ static void gen11_irq_reset(struct drm_i915_private *dev_priv)
>   
>   static void dg1_irq_reset(struct drm_i915_private *dev_priv)
>   {
> -	struct intel_gt *gt = to_gt(dev_priv);
> -	struct intel_uncore *uncore = gt->uncore;
> +	struct intel_uncore *uncore = &dev_priv->uncore;
> +	struct intel_gt *gt;
> +	unsigned int i;
>   
>   	dg1_master_intr_disable(dev_priv->uncore.regs);
>   
> -	gen11_gt_irq_reset(gt);
> +	for_each_gt(gt, dev_priv, i)
> +		gen11_gt_irq_reset(gt);
> +
>   	gen11_display_irq_reset(dev_priv);
>   
>   	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
> @@ -3643,11 +3646,13 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
>   
>   static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
>   {
> -	struct intel_gt *gt = to_gt(dev_priv);
> -	struct intel_uncore *uncore = gt->uncore;
> +	struct intel_uncore *uncore = &dev_priv->uncore;
>   	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
> +	struct intel_gt *gt;
> +	unsigned int i;
>   
> -	gen11_gt_irq_postinstall(gt);
> +	for_each_gt(gt, dev_priv, i)
> +		gen11_gt_irq_postinstall(gt);
>   
>   	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
>   

