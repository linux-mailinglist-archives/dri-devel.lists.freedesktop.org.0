Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E02F572A88
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 02:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78BD11BC96;
	Wed, 13 Jul 2022 00:58:08 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901FD12BEB3;
 Wed, 13 Jul 2022 00:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657673886; x=1689209886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K8UeEVqKQvclST9LdQ8qbdqwu5NPAVeofP5l7KtRuTI=;
 b=mAXrKx21/3vLbMXvrD1FOwdnlzhwXaZjrEcFzYl1GPu7KEyzN6MJtdEB
 RUHUK2VfsAas7nzR3j9i8YmyHX8AInDTG2gXUIEQw3BdOjJxXrLsWUJPo
 e/UbJ0PlUy6ND7J8lBdygfPnan6cAYVUOdcVu2rf16Xust2h56zvliecD
 R/uQWT2Cs9jaMhcfQaoM0i4M0grEySNInDXwruTPXiNzSUQ6IBOokNAib
 LKSpWYEbLT+Ba+hJPOftkHe1uY6cepivfTo0NDcHqz14kyq56i+wTOva+
 hKgkLmg3UZ+idHFveNVUeMwJnYHwmx5dVDBN5oYu3I1N4mQk+/fP8vXfu Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285103207"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285103207"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 17:58:05 -0700
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="592815233"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 17:58:05 -0700
Date: Tue, 12 Jul 2022 17:51:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [PATCH 07/12] drm/i915/guc: Route semaphores to GuC for Gen12+
Message-ID: <20220713005139.GA3027@jons-linux-dev-box>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-8-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712233136.1044951-8-John.C.Harrison@Intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Intel-GFX@Lists.FreeDesktop.Org,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 12, 2022 at 04:31:31PM -0700, John.C.Harrison@Intel.com wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> Since we're going to use semaphores in selftests (and eventually in
> regular GuC submission), let's route semaphores to GuC.

I don't think this comment isn't correct, we have no plans to use
semaphores in GuC submission. Still if we want semaphores to work with
GuC submission they should be routed to the GuC.

> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>

Again John, add a SoB for any patch you post.

With a better commit message and SoB update:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h        |  4 ++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 ++++++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> index 8dc063f087eb1..a7092f711e9cd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
> @@ -102,6 +102,10 @@
>  #define   GUC_SEND_TRIGGER		  (1<<0)
>  #define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
>  
> +#define GEN12_GUC_SEM_INTR_ENABLES	_MMIO(0xc71c)
> +#define   GUC_SEM_INTR_ROUTE_TO_GUC	BIT(31)
> +#define   GUC_SEM_INTR_ENABLE_ALL	(0xff)
> +
>  #define GUC_NUM_DOORBELLS		256
>  
>  /* format of the HW-monitored doorbell cacheline */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 40f726c61e951..7537459080278 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -3953,13 +3953,27 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>  
>  void intel_guc_submission_enable(struct intel_guc *guc)
>  {
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
> +	/* Enable and route to GuC */
> +	if (GRAPHICS_VER(gt->i915) >= 12)
> +		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES,
> +				   GUC_SEM_INTR_ROUTE_TO_GUC |
> +				   GUC_SEM_INTR_ENABLE_ALL);
> +
>  	guc_init_lrc_mapping(guc);
>  	guc_init_engine_stats(guc);
>  }
>  
>  void intel_guc_submission_disable(struct intel_guc *guc)
>  {
> +	struct intel_gt *gt = guc_to_gt(guc);
> +
>  	/* Note: By the time we're here, GuC may have already been reset */
> +
> +	/* Disable and route to host */
> +	if (GRAPHICS_VER(gt->i915) >= 12)
> +		intel_uncore_write(gt->uncore, GEN12_GUC_SEM_INTR_ENABLES, 0x0);
>  }
>  
>  static bool __guc_submission_supported(struct intel_guc *guc)
> -- 
> 2.36.0
> 
