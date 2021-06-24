Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256DC3B3368
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 18:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F02F6EC5C;
	Thu, 24 Jun 2021 16:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6788F6EC6F;
 Thu, 24 Jun 2021 16:03:14 +0000 (UTC)
IronPort-SDR: guIEO1fyO7ROiSk4tgHaefcKRk4Mj5/k+50BRMT/iQ1ZNplg7OSRY7NIdCai6A1Ucvfyz7MQRE
 kHGyVW1XB4qQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207438313"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="207438313"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 09:02:40 -0700
IronPort-SDR: fxiyLJ3nj04w4B9JM/3mo3sxPoVcz9kSXvKbi9b2sm3Ticrej1Q7cR7/oH4FyYTaWf/JYwcrEc
 0DaaN6O4BLsA==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="639837319"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 09:02:39 -0700
Date: Thu, 24 Jun 2021 08:55:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 39/47] drm/i915/guc: Don't complain about
 reset races
Message-ID: <20210624155557.GA3540@sdutt-i7>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-40-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624070516.21893-40-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 12:05:08AM -0700, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> It is impossible to seal all race conditions of resets occurring
> concurrent to other operations. At least, not without introducing
> excesive mutex locking. Instead, don't complain if it occurs. In
> particular, don't complain if trying to send a H2G during a reset.
> Whatever the H2G was about should get redone once the reset is over.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 5 ++++-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c     | 3 +++
>  drivers/gpu/drm/i915/gt/uc/intel_uc.h     | 2 ++
>  3 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index dd6177c8d75c..3b32755f892e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -727,7 +727,10 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>  	int ret;
>  
>  	if (unlikely(!ct->enabled)) {
> -		WARN(1, "Unexpected send: action=%#x\n", *action);
> +		struct intel_guc *guc = ct_to_guc(ct);
> +		struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
> +
> +		WARN(!uc->reset_in_progress, "Unexpected send: action=%#x\n", *action);
>  		return -ENODEV;
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index b523a8521351..77c1fe2ed883 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -550,6 +550,7 @@ void intel_uc_reset_prepare(struct intel_uc *uc)
>  {
>  	struct intel_guc *guc = &uc->guc;
>  
> +	uc->reset_in_progress = true;
>  
>  	/* Nothing to do if GuC isn't supported */
>  	if (!intel_uc_supports_guc(uc))
> @@ -579,6 +580,8 @@ void intel_uc_reset_finish(struct intel_uc *uc)
>  {
>  	struct intel_guc *guc = &uc->guc;
>  
> +	uc->reset_in_progress = false;
> +
>  	/* Firmware expected to be running when this function is called */
>  	if (intel_guc_is_fw_running(guc) && intel_uc_uses_guc_submission(uc))
>  		intel_guc_submission_reset_finish(guc);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> index eaa3202192ac..91315e3f1c58 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
> @@ -30,6 +30,8 @@ struct intel_uc {
>  
>  	/* Snapshot of GuC log from last failed load */
>  	struct drm_i915_gem_object *load_err_log;
> +
> +	bool reset_in_progress;
>  };
>  
>  void intel_uc_init_early(struct intel_uc *uc);
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
