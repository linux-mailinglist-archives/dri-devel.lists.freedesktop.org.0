Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C346FE6A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 11:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E8E610E21D;
	Fri, 10 Dec 2021 10:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE6289815
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 10:06:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="238263625"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="238263625"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 02:06:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; d="scan'208";a="602070300"
Received: from mpcorrig-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.4.173])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 02:06:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kees Cook <keescook@chromium.org>, Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH] drm/dp: Actually read Adjust Request Post Cursor2 register
In-Reply-To: <202112091539.6B349AC@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211203084354.3105253-1-keescook@chromium.org>
 <87o85r4a4f.fsf@intel.com> <202112082220.81ECDC63D@keescook>
 <2b7d760c-9ab8-b607-efc6-1ed276d67668@amd.com>
 <202112091539.6B349AC@keescook>
Date: Fri, 10 Dec 2021 12:06:20 +0200
Message-ID: <87a6h83hb7.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
> On Thu, Dec 09, 2021 at 05:20:45PM -0500, Harry Wentland wrote:
>> 
>> 
>> On 2021-12-09 01:23, Kees Cook wrote:
>> > On Wed, Dec 08, 2021 at 01:19:28PM +0200, Jani Nikula wrote:
>> >> On Fri, 03 Dec 2021, Kees Cook <keescook@chromium.org> wrote:
>> >>> The link_status array was not large enough to read the Adjust Request
>> >>> Post Cursor2 register. Adjust the size to include it. Found with a
>> >>> -Warray-bounds build:
>> >>>
>> >>> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
>> >>> drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
>> >>>    59 |         return link_status[r - DP_LANE0_1_STATUS];
>> >>>       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>> >>> drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
>> >>>   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>> >>>       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> >>>
>> >>> Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
>> >>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> >>
>> >> Using DP_ADJUST_REQUEST_POST_CURSOR2 has been deprecated since DP 1.3
>> >> published in 2014, and Tegra is the only user of
>> >> drm_dp_get_adjust_request_post_cursor().
>> > 
>> > I see POST_CURSOR2 is used here too:
>> > 
>> > drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
>> > 
>> 
>> Looks like we read and parse that in the admgpu driver without
>> using drm_dp_get_adjust_request_post_cursor.
>
> Right, and probably that could be switched to use it, but I'm not sure
> what the impact of the larger link_status read is.
>
>> 
>> I don't have a strong feeling but I liked your original
>> patch a bit better. I'm not sure what it means when part
>> of a spec is deprecated. Once a spec is written display
>> vendors might implement it. We should make sure that
>> displays like that are always handled in a sane manner.
>
> Jani, Dave, any guidance here? I'm fine with whatever, but the current
> code is for sure broken. ;)

Post Cursor2 was completely optional for the transmitter even before it
was deprecated.

And now we'd be adding 5 bytes extra to all link status reads. To fix
the only user of drm_dp_get_adjust_request_post_cursor() that apparently
has never worked as intended. I'm just not convinced.

I was trying to look through the implications of DP_LINK_STATUS_SIZE
increase, and at least drm_dp_dpcd_read_phy_link_status() comes across
as something probably needing attention.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
