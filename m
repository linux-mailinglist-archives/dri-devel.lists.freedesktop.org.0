Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EFD603AF3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 09:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA9310F177;
	Wed, 19 Oct 2022 07:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477C910F177;
 Wed, 19 Oct 2022 07:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666165911; x=1697701911;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rWWHs2ECIi/neTcncyTpTkBknndbE497jczea1OBW0g=;
 b=MghysOjDEsTuw3kbIHmXUQJRA6GvoJprxluP6xZqPh/jglXkQ4oBOFAr
 /AlYdRlfjWXRqSFbD2NNtgtkL4aK2IW6Rtvl1IW1M924AfYwPWtpuEsm8
 vBHfZJ/L/f4oX8wzRcght6aN49dc6s+7bBwDqf22jyxGypPQQ4pdtwY4V
 s8erTx+hbc2zK9WtrpJ2tu8pdleUS2EadPFEVTh+Hv/dbS4CNkfrcA41k
 9trNsJH3VuA7UE4MlWgmsQV8QR9rmkUfZutWmYy7L4maYs01tZvAKL4lv
 I0qCWgzYoou6CDVkBwCMf+7NLhsBq9NAzQyxrSfXnMr0Tj93jtmk6FptN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="286053745"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="286053745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 00:51:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="629129343"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="629129343"
Received: from mosermix-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.50.2])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 00:51:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/i915/gt: Use RC6 residency types as arguments
 to residency functions
In-Reply-To: <20221019052043.3193842-4-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221019052043.3193842-1-ashutosh.dixit@intel.com>
 <20221019052043.3193842-4-ashutosh.dixit@intel.com>
Date: Wed, 19 Oct 2022 10:51:45 +0300
Message-ID: <87fsfki73i.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Oct 2022, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.h b/drivers/gpu/drm/i915/gt/intel_rc6.h
> index b6fea71afc223..3105bc72c096b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.h
> @@ -6,7 +6,7 @@
>  #ifndef INTEL_RC6_H
>  #define INTEL_RC6_H
>  
> -#include "i915_reg_defs.h"
> +#include "intel_rc6_types.h"
>  
>  struct intel_engine_cs;
>  struct intel_rc6;
> @@ -21,7 +21,9 @@ void intel_rc6_sanitize(struct intel_rc6 *rc6);
>  void intel_rc6_enable(struct intel_rc6 *rc6);
>  void intel_rc6_disable(struct intel_rc6 *rc6);
>  
> -u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, i915_reg_t reg);
> -u64 intel_rc6_residency_us(struct intel_rc6 *rc6, i915_reg_t reg);
> +u64 intel_rc6_residency_ns(struct intel_rc6 *rc6, enum intel_rc6_res_type id);
> +u64 intel_rc6_residency_us(struct intel_rc6 *rc6, enum intel_rc6_res_type id);
> +void intel_rc6_print_residency(struct seq_file *m, const char *title,
> +			       enum intel_rc6_res_type id);
>  
>  #endif /* INTEL_RC6_H */

Please apply this on top to avoid includes from includes.


diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.h b/drivers/gpu/drm/i915/gt/intel_rc6.h
index 3105bc72c096..456fa668a276 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.h
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.h
@@ -6,10 +6,11 @@
 #ifndef INTEL_RC6_H
 #define INTEL_RC6_H
 
-#include "intel_rc6_types.h"
+#include <linux/types.h>
 
-struct intel_engine_cs;
+enum intel_rc6_res_type;
 struct intel_rc6;
+struct seq_file;
 
 void intel_rc6_init(struct intel_rc6 *rc6);
 void intel_rc6_fini(struct intel_rc6 *rc6);



-- 
Jani Nikula, Intel Open Source Graphics Center
