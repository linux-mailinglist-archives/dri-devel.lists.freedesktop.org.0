Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ECC7D6F9D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 16:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C29010E677;
	Wed, 25 Oct 2023 14:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EC510E677;
 Wed, 25 Oct 2023 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698245210; x=1729781210;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JGc53jRHX5a0WjRwZs090Qv4b3pXAy8VHopa16eb/is=;
 b=cdWU7LcCDuGdFkHHUEmLi1qEmYGnxg0o1C92FysgqnnCwy/vZKdr7m8m
 d12gTYaVZPuLwwZuVopf8sbVtYXP+0J1ZHy3tDq+ArL0/VEKitwf8nNCz
 ycCBOIC6I83AlvnB+uw2G0RhL7svrEWLgZsI/VNoT9uXhvCKJ25UigocF
 NuYNDCqjQWCvpkir3q7lupaY31OH6WhvTTWs8SNGtBsyoptWMNXE6YMdd
 Ovi677x7O3VaYRA8/a42hhWpFdV8SpTI4BpZBS+9PpiPFj0VU5hIiyDiJ
 +muW8ychOrGNiMk2O+7mCGOnq6eknprSmM+d+6F3hMKGomicFrWrWngtJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391191331"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="391191331"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="932371702"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="932371702"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.32.60])
 ([10.252.32.60])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 07:46:48 -0700
Message-ID: <35cd748f-1944-cc0f-bbd2-b1cd04ca44f0@linux.intel.com>
Date: Wed, 25 Oct 2023 16:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH v2 1/5] drm/i915/guc: Create the guc_to_i915()
 wrapper
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20231025143515.254468-1-andi.shyti@linux.intel.com>
 <20231025143515.254468-2-andi.shyti@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231025143515.254468-2-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 10/25/2023 4:35 PM, Andi Shyti wrote:
> Given a reference to "guc", the guc_to_i915() returns the
> pointer to "i915" private data.
>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.h                |  5 +++++
>   drivers/gpu/drm/i915/gt/uc/intel_guc.c            |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c    |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c         |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c        | 10 +++++-----
>   drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c         |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c       |  2 +-
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c |  4 ++--
>   8 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
> index 970bedf6b78a..12a638f05d63 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
> @@ -114,6 +114,11 @@ static inline struct intel_gt *gsc_to_gt(struct intel_gsc *gsc)
>   	return container_of(gsc, struct intel_gt, gsc);
>   }
>   
> +static inline struct drm_i915_private *guc_to_i915(struct intel_guc *guc)
> +{
> +	return guc_to_gt(guc)->i915;
> +}
> +

We don't want inline functions in headers files[1]. Otherwise the series 
looks fine to me:

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

[1] https://patchwork.freedesktop.org/series/124069/


Regards,

Nirmoy

>   void intel_gt_common_init_early(struct intel_gt *gt);
>   int intel_root_gt_init_early(struct drm_i915_private *i915);
>   int intel_gt_assign_ggtt(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 3f3df1166b86..2b450c43bbd7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -330,7 +330,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
>   
>   static u32 guc_ctl_devid(struct intel_guc *guc)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
>   
>   	return (INTEL_DEVID(i915) << 16) | INTEL_REVID(i915);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> index a4da0208c883..a1cd40d80517 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> @@ -355,7 +355,7 @@ guc_capture_alloc_steered_lists(struct intel_guc *guc,
>   static const struct __guc_mmio_reg_descr_group *
>   guc_capture_get_device_reglist(struct intel_guc *guc)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
>   	const struct __guc_mmio_reg_descr_group *lists;
>   
>   	if (GRAPHICS_VER(i915) >= 12)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index 89e314b3756b..4e147de5118f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -265,7 +265,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
>   	u32 *cmds;
>   	int err;
>   
> -	err = i915_inject_probe_error(guc_to_gt(guc)->i915, -ENXIO);
> +	err = i915_inject_probe_error(guc_to_i915(guc), -ENXIO);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index 55bc8b55fbc0..bf16351c9349 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -520,7 +520,7 @@ void intel_guc_log_init_early(struct intel_guc_log *log)
>   static int guc_log_relay_create(struct intel_guc_log *log)
>   {
>   	struct intel_guc *guc = log_to_guc(log);
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
>   	struct rchan *guc_log_relay_chan;
>   	size_t n_subbufs, subbuf_size;
>   	int ret;
> @@ -573,7 +573,7 @@ static void guc_log_relay_destroy(struct intel_guc_log *log)
>   static void guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   {
>   	struct intel_guc *guc = log_to_guc(log);
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
>   	intel_wakeref_t wakeref;
>   
>   	_guc_log_copy_debuglogs_for_relay(log);
> @@ -589,7 +589,7 @@ static void guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>   static u32 __get_default_log_level(struct intel_guc_log *log)
>   {
>   	struct intel_guc *guc = log_to_guc(log);
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
>   
>   	/* A negative value means "use platform/config default" */
>   	if (i915->params.guc_log_level < 0) {
> @@ -664,7 +664,7 @@ void intel_guc_log_destroy(struct intel_guc_log *log)
>   int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
>   {
>   	struct intel_guc *guc = log_to_guc(log);
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
>   	intel_wakeref_t wakeref;
>   	int ret = 0;
>   
> @@ -796,7 +796,7 @@ void intel_guc_log_relay_flush(struct intel_guc_log *log)
>   static void guc_log_relay_stop(struct intel_guc_log *log)
>   {
>   	struct intel_guc *guc = log_to_guc(log);
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
>   
>   	if (!log->relay.started)
>   		return;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> index 1adec6de223c..9df7927304ae 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
> @@ -14,7 +14,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
>   {
>   	/* GuC RC is unavailable for pre-Gen12 */
>   	return guc->submission_supported &&
> -		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
> +		GRAPHICS_VER(guc_to_i915(guc)) >= 12;
>   }
>   
>   static bool __guc_rc_selected(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 2dfb07cc4b33..3e681ab6fbf9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -34,7 +34,7 @@ static bool __detect_slpc_supported(struct intel_guc *guc)
>   {
>   	/* GuC SLPC is unavailable for pre-Gen12 */
>   	return guc->submission_supported &&
> -		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
> +		GRAPHICS_VER(guc_to_i915(guc)) >= 12;
>   }
>   
>   static bool __guc_slpc_selected(struct intel_guc *guc)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index d37698bd6b91..669f2892bf74 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -4624,12 +4624,12 @@ static bool __guc_submission_supported(struct intel_guc *guc)
>   {
>   	/* GuC submission is unavailable for pre-Gen11 */
>   	return intel_guc_is_supported(guc) &&
> -	       GRAPHICS_VER(guc_to_gt(guc)->i915) >= 11;
> +	       GRAPHICS_VER(guc_to_i915(guc)) >= 11;
>   }
>   
>   static bool __guc_submission_selected(struct intel_guc *guc)
>   {
> -	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	struct drm_i915_private *i915 = guc_to_i915(guc);
>   
>   	if (!intel_guc_submission_is_supported(guc))
>   		return false;
