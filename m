Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED18238E406
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 12:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7C16E160;
	Mon, 24 May 2021 10:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99DC6E160;
 Mon, 24 May 2021 10:30:18 +0000 (UTC)
IronPort-SDR: /GEKH3FuYQ6klncUUCE9/yajNCT+5cgqQ5WQOdGqwZ/ofhyxx6sWGsCI5Z/zLhRPMiLmqQk4zG
 ok6lkQcgm3uQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="189286200"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="189286200"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 03:30:17 -0700
IronPort-SDR: yGDo5CvTBkKx3+jXoVRzLuNVGqkrzqiPJdeCdfnN8HTX4PJnu2JLO1m7ZurgDjDQMKN4mXRA8r
 A/naeXi2FhcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="396901135"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga006.jf.intel.com with ESMTP; 24 May 2021 03:30:14 -0700
Received: from [10.249.134.123] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.134.123])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 14OAUD1S029632; Mon, 24 May 2021 11:30:13 +0100
Subject: Re: [RFC PATCH 05/97] drm/i915/guc: use probe_error log for CT
 enablement failure
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-6-matthew.brost@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <4619895f-0753-b77d-8d8f-679a794a33e6@intel.com>
Date: Mon, 24 May 2021 12:30:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210506191451.77768-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: tvrtko.ursulin@intel.com, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06.05.2021 21:13, Matthew Brost wrote:
> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> We have a couple of failure injection points in the CT enablement path,
> so we need to use i915_probe_error() to select the appropriate log level.
> A new macro (CT_PROBE_ERROR) has been added to the set of CT logging
> macros to be used in this scenario and upcoming ones.
> 
> While adding the new macros, fix the underlying logging mechanics used
> by the existing ones (DRM_DEV_* -> drm_*) and move the inlines to
> before they're used inside the macros.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 48 ++++++++++++-----------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index fa9e048cc65f..25618649048f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -7,14 +7,36 @@
>  #include "intel_guc_ct.h"
>  #include "gt/intel_gt.h"
>  
> +static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
> +{
> +	return container_of(ct, struct intel_guc, ct);
> +}
> +
> +static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
> +{
> +	return guc_to_gt(ct_to_guc(ct));
> +}
> +
> +static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
> +{
> +	return ct_to_gt(ct)->i915;
> +}
> +
> +static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
> +{
> +	return &ct_to_i915(ct)->drm;
> +}
> +
>  #define CT_ERROR(_ct, _fmt, ...) \
> -	DRM_DEV_ERROR(ct_to_dev(_ct), "CT: " _fmt, ##__VA_ARGS__)
> +	drm_err(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>  #ifdef CONFIG_DRM_I915_DEBUG_GUC
>  #define CT_DEBUG(_ct, _fmt, ...) \
> -	DRM_DEV_DEBUG_DRIVER(ct_to_dev(_ct), "CT: " _fmt, ##__VA_ARGS__)
> +	drm_dbg(ct_to_drm(_ct), "CT: " _fmt, ##__VA_ARGS__)
>  #else
>  #define CT_DEBUG(...)	do { } while (0)
>  #endif
> +#define CT_PROBE_ERROR(_ct, _fmt, ...) \
> +	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__);
>  
>  struct ct_request {
>  	struct list_head link;
> @@ -47,26 +69,6 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
>  	INIT_WORK(&ct->requests.worker, ct_incoming_request_worker_func);
>  }
>  
> -static inline struct intel_guc *ct_to_guc(struct intel_guc_ct *ct)
> -{
> -	return container_of(ct, struct intel_guc, ct);
> -}
> -
> -static inline struct intel_gt *ct_to_gt(struct intel_guc_ct *ct)
> -{
> -	return guc_to_gt(ct_to_guc(ct));
> -}
> -
> -static inline struct drm_i915_private *ct_to_i915(struct intel_guc_ct *ct)
> -{
> -	return ct_to_gt(ct)->i915;
> -}
> -
> -static inline struct device *ct_to_dev(struct intel_guc_ct *ct)
> -{
> -	return ct_to_i915(ct)->drm.dev;
> -}
> -
>  static inline const char *guc_ct_buffer_type_to_str(u32 type)
>  {
>  	switch (type) {
> @@ -264,7 +266,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
>  err_deregister:
>  	ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
>  err_out:
> -	CT_ERROR(ct, "Failed to open open CT channel (err=%d)\n", err);
> +	CT_PROBE_ERROR(ct, "Failed to open channel (err=%d)\n", err);

nit: while here we can start using %pe to print error

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  	return err;
>  }
>  
> 
