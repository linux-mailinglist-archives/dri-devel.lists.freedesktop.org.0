Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689A346D205
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 12:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C006FFEF;
	Wed,  8 Dec 2021 11:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F046A6FFEF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 11:19:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="217835107"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="217835107"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:19:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="462729313"
Received: from cahanley-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.1])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:19:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kees Cook <keescook@chromium.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/dp: Actually read Adjust Request Post Cursor2 register
In-Reply-To: <20211203084354.3105253-1-keescook@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211203084354.3105253-1-keescook@chromium.org>
Date: Wed, 08 Dec 2021 13:19:28 +0200
Message-ID: <87o85r4a4f.fsf@intel.com>
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 03 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
> The link_status array was not large enough to read the Adjust Request
> Post Cursor2 register. Adjust the size to include it. Found with a
> -Warray-bounds build:
>
> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
> drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
>    59 |         return link_status[r - DP_LANE0_1_STATUS];
>       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
>   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
> Signed-off-by: Kees Cook <keescook@chromium.org>

Using DP_ADJUST_REQUEST_POST_CURSOR2 has been deprecated since DP 1.3
published in 2014, and Tegra is the only user of
drm_dp_get_adjust_request_post_cursor().

Instead of bumping the link status read size from 6 to 11 for all
drivers I'd much rather see some other (maybe Tegra specific) solution
to this.


BR,
Jani.


> ---
>  include/drm/drm_dp_helper.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 472dac376284..277643d2fe2c 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1517,7 +1517,15 @@ enum drm_dp_phy {
>  #define DP_MST_LOGICAL_PORT_0 8
>  
>  #define DP_LINK_CONSTANT_N_VALUE 0x8000
> -#define DP_LINK_STATUS_SIZE	   6
> +/*
> + * DPCD registers in link_status:
> + * Link Status:		0x202 through 0x204
> + * Sink Status:		0x205
> + * Adjust Request:	0x206 through 0x207
> + * Training Score:	0x208 through 0x20b
> + * AR Post Cursor2:	0x20c
> + */
> +#define DP_LINK_STATUS_SIZE	   11
>  bool drm_dp_channel_eq_ok(const u8 link_status[DP_LINK_STATUS_SIZE],
>  			  int lane_count);
>  bool drm_dp_clock_recovery_ok(const u8 link_status[DP_LINK_STATUS_SIZE],

-- 
Jani Nikula, Intel Open Source Graphics Center
