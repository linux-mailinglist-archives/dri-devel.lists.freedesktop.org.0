Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5114C7960
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471D810E876;
	Mon, 28 Feb 2022 20:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EE910E866;
 Mon, 28 Feb 2022 20:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646078525; x=1677614525;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Wc3dLk+2WGuSwSeJItFUAF/PAymWGtjjoR5UXEjwf54=;
 b=T9ZL4OuR4WwE2w64rKKcefoXE8n5oXbtnIQaT2FbQ5vlNph+xCJaw9Mw
 uJsvBSyEIo+JjswOEckK2kaupqQ6jSxb1E9en/rI23gl1eNxCGHxUdStq
 ohbbGkgc0wsdYoK6UmlnIGQ1EHRB/8MRc3WM51JVDDFiVXSMnnGq4cvDB
 7MxNklnbEQq0EaHM3//KiJFMG8pB+Q1K11v6erOnUzTk8AywT5todT/uC
 q5ir7hIQ4hV6F8ySvFsFF93jrT6XrCKSdjoewRI2MIsR+k9BZe32QvTdz
 Xnvkcw7gHtha8EhsRsOd1EIILAdIhOJMPy3LK23B2D+XEEMNsn+xm3Wkb w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="252901129"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="252901129"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 12:02:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="685461368"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2022 12:02:02 -0800
Received: from [10.249.130.171] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.130.171])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 21SK21iC013844; Mon, 28 Feb 2022 20:02:01 GMT
Message-ID: <5cf0034a-fa60-0d80-b538-f070a166614c@intel.com>
Date: Mon, 28 Feb 2022 21:02:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH v5 3/7] drm/i915/gt: add gt_is_root() helper
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-4-andi.shyti@linux.intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20220217144158.21555-4-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2022 15:41, Andi Shyti wrote:
> The "gt_is_root(struct intel_gt *gt)" helper return true if the
> gt is the root gt, which means that its id is 0. Return false
> otherwise.
> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 915d6192079b..f17f51e2d394 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -19,6 +19,11 @@ struct drm_printer;
>  		  ##__VA_ARGS__);					\
>  } while (0)
>  
> +static inline bool gt_is_root(struct intel_gt *gt)
> +{
> +	return !gt->info.id;
> +}
> +

we could squash this patch with prev one, where it can be used in:

 intel_gt_tile_cleanup(struct intel_gt *gt)
 {
 	intel_uncore_cleanup_mmio(gt->uncore);

-	if (gt->info.id) {
+	if (!gt_is_root(gt)) {
 		kfree(gt->uncore);
 		kfree(gt);
 	}
 }

or just use it this way in this patch, with that:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  static inline struct intel_gt *uc_to_gt(struct intel_uc *uc)
>  {
>  	return container_of(uc, struct intel_gt, uc);
