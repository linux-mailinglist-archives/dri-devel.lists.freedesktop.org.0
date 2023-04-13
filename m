Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F686E0B95
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 12:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C950110EABB;
	Thu, 13 Apr 2023 10:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4247F10EABB;
 Thu, 13 Apr 2023 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681382493; x=1712918493;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rEIGnPv+uIGkpgjR8IbmAiHPgpfkZMfFo0zP69MnIZo=;
 b=d+UbpcV+IcDXCxsaKxouPFAHfBlmSzmwgogtcz1G52uDkH/U05w57Cir
 IGu6byFSM//0cN58vmWydPR4CX3+J5Gvg0lNr9WikmVFMmdwZqurZcPPC
 xL7/osxLgNckK37nzVzqIB4p8ErZFmUgvL9DdtIq47cXRjEM3XkaZYjUh
 8JJ80NrmPyzy1A7qiVoMmITBNl2QjCGYpLG/PsCTkxbRBa5ICujh+Srg9
 y58qK/KzRLoB++J2ZydGhSpoxFstLbaFET7n6jAMfCGz5KAJdl9oIvPQy
 ZLBOpdEzHOQiU/pI4RjUjLaNJN+8+8mKEvS8CNWeZTrOKLxPWtDDX5wlW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342893357"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="342893357"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 03:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935548112"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="935548112"
Received: from mmcgar2x-mobl1.ger.corp.intel.com (HELO [10.213.231.135])
 ([10.213.231.135])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 03:41:30 -0700
Message-ID: <dc0042e0-8a4e-5c3d-922f-bd65402a154a@linux.intel.com>
Date: Thu, 13 Apr 2023 11:41:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: Make IRQ reset and postinstall
 multi-gt aware
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Paulo Zanoni <paulo.r.zanoni@intel.com>
References: <20230413092006.931861-1-andi.shyti@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230413092006.931861-1-andi.shyti@linux.intel.com>
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


On 13/04/2023 10:20, Andi Shyti wrote:
> From: Paulo Zanoni <paulo.r.zanoni@intel.com>
> 
> In multitile systems IRQ need to be reset and enabled per GT.
> 
> Although in MTL the GUnit misc interrupts register set are
> available only in GT-0, we need to loop through all the GT's
> in order to initialize the media engine which lies on a different
> GT.
> 
> Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
> Hi,
> 
> proposing again this patch, apparently GuC needs this patch to
> initialize the media GT.

What is the resolution for Matt's concern that this is wrong for MTL?

Regards,

Tvrtko

> Changelog
> =========
> v1 -> v2
>   - improve description in the commit log.
> 
>   drivers/gpu/drm/i915/i915_irq.c | 28 ++++++++++++++++++----------
>   1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index d24bdea65a3dc..524d64bf5d186 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -2764,14 +2764,19 @@ static void dg1_irq_reset(struct drm_i915_private *dev_priv)
>   {
>   	struct intel_gt *gt = to_gt(dev_priv);
>   	struct intel_uncore *uncore = gt->uncore;
> +	unsigned int i;
>   
>   	dg1_master_intr_disable(dev_priv->uncore.regs);
>   
> -	gen11_gt_irq_reset(gt);
> -	gen11_display_irq_reset(dev_priv);
> +	for_each_gt(gt, dev_priv, i) {
> +		gen11_gt_irq_reset(gt);
>   
> -	GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
> -	GEN3_IRQ_RESET(uncore, GEN8_PCU_);
> +		uncore = gt->uncore;
> +		GEN3_IRQ_RESET(uncore, GEN11_GU_MISC_);
> +		GEN3_IRQ_RESET(uncore, GEN8_PCU_);
> +	}
> +
> +	gen11_display_irq_reset(dev_priv);
>   }
>   
>   void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_priv,
> @@ -3425,13 +3430,16 @@ static void gen11_irq_postinstall(struct drm_i915_private *dev_priv)
>   
>   static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
>   {
> -	struct intel_gt *gt = to_gt(dev_priv);
> -	struct intel_uncore *uncore = gt->uncore;
>   	u32 gu_misc_masked = GEN11_GU_MISC_GSE;
> +	struct intel_gt *gt;
> +	unsigned int i;
>   
> -	gen11_gt_irq_postinstall(gt);
> +	for_each_gt(gt, dev_priv, i) {
> +		gen11_gt_irq_postinstall(gt);
>   
> -	GEN3_IRQ_INIT(uncore, GEN11_GU_MISC_, ~gu_misc_masked, gu_misc_masked);
> +		GEN3_IRQ_INIT(gt->uncore, GEN11_GU_MISC_, ~gu_misc_masked,
> +			      gu_misc_masked);
> +	}
>   
>   	if (HAS_DISPLAY(dev_priv)) {
>   		icp_irq_postinstall(dev_priv);
> @@ -3440,8 +3448,8 @@ static void dg1_irq_postinstall(struct drm_i915_private *dev_priv)
>   				   GEN11_DISPLAY_IRQ_ENABLE);
>   	}
>   
> -	dg1_master_intr_enable(uncore->regs);
> -	intel_uncore_posting_read(uncore, DG1_MSTR_TILE_INTR);
> +	dg1_master_intr_enable(to_gt(dev_priv)->uncore->regs);
> +	intel_uncore_posting_read(to_gt(dev_priv)->uncore, DG1_MSTR_TILE_INTR);
>   }
>   
>   static void cherryview_irq_postinstall(struct drm_i915_private *dev_priv)
