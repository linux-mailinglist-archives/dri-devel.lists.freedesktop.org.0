Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22CB3BB9DF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 11:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A37289838;
	Mon,  5 Jul 2021 09:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEF589838;
 Mon,  5 Jul 2021 09:07:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="196232574"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="196232574"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 02:07:47 -0700
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="485435002"
Received: from elang-mobl.ger.corp.intel.com (HELO localhost) ([10.252.59.138])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 02:07:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, lyude@redhat.com
Subject: Re: [PATCH v2] drm/dp_mst: Fix return code on sideband message failure
In-Reply-To: <1625008068-16458-1-git-send-email-khsieh@codeaurora.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1625008068-16458-1-git-send-email-khsieh@codeaurora.org>
Date: Mon, 05 Jul 2021 12:07:38 +0300
Message-ID: <87czrx9lid.fsf@intel.com>
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, rsubbia@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 29 Jun 2021, Kuogee Hsieh <khsieh@codeaurora.org> wrote:
> From: Rajkumar Subbiah <rsubbia@codeaurora.org>
>
> Commit 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
> selftests") added some debug code for sideband message tracing. But
> it seems to have unintentionally changed the behavior on sideband message
> failure. It catches and returns failure only if DRM_UT_DP is enabled.
> Otherwise it ignores the error code and returns success. So on an MST
> unplug, the caller is unaware that the clear payload message failed and
> ends up waiting for 4 seconds for the response. Fixes the issue by
> returning the proper error code.
>
> Changes in V2:
> -- Revise commit text as review comment
> -- add Fixes text
>
> Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing + selftests")
>
> Signed-off-by: Rajkumar Subbiah <rsubbia@codeaurora.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 1590144..8d97430 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -2887,11 +2887,13 @@ static int process_single_tx_qlock(struct drm_dp_mst_topology_mgr *mgr,
>  	idx += tosend + 1;
>  
>  	ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
> -	if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
> -		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
> +	if (unlikely(ret)) {
> +		if (drm_debug_enabled(DRM_UT_DP)) {
> +			struct drm_printer p = drm_debug_printer(DBG_PREFIX);
>  
> -		drm_printf(&p, "sideband msg failed to send\n");
> -		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> +			drm_printf(&p, "sideband msg failed to send\n");
> +			drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
> +		}
>  		return ret;
>  	}

Seems like a sensible thing to do.

(I'd probably rip out the "unlikely" while at it, as it feels like
unnecessary optimization, but *shrug*.)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel Open Source Graphics Center
