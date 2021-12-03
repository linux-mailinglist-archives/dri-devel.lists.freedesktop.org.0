Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1F467ED3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 21:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4147BED7;
	Fri,  3 Dec 2021 20:30:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BB07B9EC;
 Fri,  3 Dec 2021 20:30:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="300435518"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="300435518"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 12:30:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="678223489"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 12:30:38 -0800
Date: Fri, 3 Dec 2021 12:25:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John.C.Harrison@Intel.com
Subject: Re: [Intel-gfx] [PATCH 2/5] drm/i915/guc: Increase GuC log size for
 CONFIG_DEBUG_GEM
Message-ID: <20211203202511.GA32650@jons-linux-dev-box>
References: <20211203183339.3276250-1-John.C.Harrison@Intel.com>
 <20211203183339.3276250-3-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203183339.3276250-3-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@Lists.FreeDesktop.Org, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 03, 2021 at 10:33:36AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Lots of testing is done with the DEBUG_GEM config option enabled but
> not the DEBUG_GUC option. That means we only get teeny-tiny GuC logs
> which are not hugely useful. Enabling full DEBUG_GUC also spews lots
> of other detailed output that is not generally desired. However,
> bigger GuC logs are extremely useful for almost any regression debug.
> So enable bigger logs for DEBUG_GEM builds as well.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
> index ac1ee1d5ce10..fe6ab7550a14 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.h
> @@ -15,9 +15,12 @@
>  
>  struct intel_guc;
>  
> -#ifdef CONFIG_DRM_I915_DEBUG_GUC
> +#if defined(CONFIG_DRM_I915_DEBUG_GUC)
>  #define CRASH_BUFFER_SIZE	SZ_2M
>  #define DEBUG_BUFFER_SIZE	SZ_16M
> +#elif defined(CONFIG_DRM_I915_DEBUG_GEM)
> +#define CRASH_BUFFER_SIZE	SZ_1M
> +#define DEBUG_BUFFER_SIZE	SZ_2M
>  #else
>  #define CRASH_BUFFER_SIZE	SZ_8K
>  #define DEBUG_BUFFER_SIZE	SZ_64K
> -- 
> 2.25.1
> 
