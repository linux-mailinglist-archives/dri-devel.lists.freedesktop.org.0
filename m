Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB5EAAC14C
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 12:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1293010E343;
	Tue,  6 May 2025 10:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBIK9XuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE7310E343;
 Tue,  6 May 2025 10:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746527119; x=1778063119;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ER3+WX6Fn7TizF7Fs+zanDiEtNNqVrG5KKHsKgWbPvo=;
 b=OBIK9XuMuG+yaP9kePKp6Zgy5ecTLP5X8D3tXLLR/a2lcxT0r47KGOct
 RcaX++J/3oWyEiZ+lgEbcRjMgxXo8S1JdhaOUCBHQAX+/wQXUxcpm5Kpi
 41gcmehlBpjlYwk0+N9kfvCowAYM4dzRXqcM3nVaQ21Mf6NMSh+D4SL/C
 +Lg3zCwHZl5XVDSHpY3EjeVuQ1nDU0WnMxa4Lw+RFc0sEWFvt3uBFeG70
 bDnPRQrdRCjxFJAPQ/tStfwoSpFxiTjbsJE1REbNRprp1DGdSwUBa8G37
 MSM+vCxsI4e0zILy5UWW5tOH7xtNtRKgR8LjgElVyiRxhZL5ZqGw/EZZj g==;
X-CSE-ConnectionGUID: znVwSICqQvCks3aajZZUPA==
X-CSE-MsgGUID: 52Vvl0ypSSioa9PodyCyKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="51993568"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="51993568"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:25:18 -0700
X-CSE-ConnectionGUID: Ck10n3cyRsacHwt1VjnfGw==
X-CSE-MsgGUID: 3lF5rXSWRaSZ0eaBD3MM2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="158825654"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.221])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 03:25:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jeff Layton <jlayton@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jeff
 Layton <jlayton@kernel.org>
Subject: Re: [PATCH v7 09/10] i915: add ref_tracker_dir symlinks for each
 tracker
In-Reply-To: <20250505-reftrack-dbgfs-v7-9-f78c5d97bcca@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250505-reftrack-dbgfs-v7-0-f78c5d97bcca@kernel.org>
 <20250505-reftrack-dbgfs-v7-9-f78c5d97bcca@kernel.org>
Date: Tue, 06 May 2025 13:25:10 +0300
Message-ID: <87zffqujcp.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 05 May 2025, Jeff Layton <jlayton@kernel.org> wrote:
> Now that there is the ability to create a symlink for each tracker, do
> so for the i915 entries.

I haven't tried this, but

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  drivers/gpu/drm/i915/intel_runtime_pm.c | 1 +
>  drivers/gpu/drm/i915/intel_wakeref.c    | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i915/intel_runtime_pm.c
> index 3fdab3b44c08cea16ac2f73aafc2bea2ffbb19e7..94315e952ead9be276298fb2a0200d102005a0c1 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -61,6 +61,7 @@ static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
>  {
>  	ref_tracker_dir_init(&rpm->debug, INTEL_REFTRACK_DEAD_COUNT,
>  			     "intel_runtime_pm", dev_name(rpm->kdev));
> +	ref_tracker_dir_symlink(&rpm->debug, "intel_runtime_pm-%s", dev_name(rpm->kdev));
>  }
>  
>  static intel_wakeref_t
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
> index 5269e64c58a49884f5d712557546272bfdeb8417..2e0498b3fa7947f994de1339d4d2bed93de1a795 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.c
> +++ b/drivers/gpu/drm/i915/intel_wakeref.c
> @@ -115,6 +115,7 @@ void __intel_wakeref_init(struct intel_wakeref *wf,
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
>  	ref_tracker_dir_init(&wf->debug, INTEL_REFTRACK_DEAD_COUNT, "intel_wakeref", name);
> +	ref_tracker_dir_symlink(&wf->debug, "intel_wakeref-%s", name);
>  #endif
>  }

-- 
Jani Nikula, Intel
