Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2814AB93B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD72110EF54;
	Mon,  7 Feb 2022 11:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFDC10EF54
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644231905; x=1675767905;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vKJ4QcP9fRqWs4tGoyWgQwEyJftVIBFH0F7ZDLnXbgE=;
 b=KvO/5ZYcimv1zStXQBdZts8b10SNNzIfEfizpiRAh5cwKkOrZDzkbPLw
 cwa2hBVUi4wB4q5GaA1YHoo8g8xqFi1S3YkMvgokaWts48o7mpgSPzMqh
 +MIxbdRWveAjszEzulkWU4sjmtIb4xOSFxAqON0OjfM1MXX5XURm25I95
 NE8LmXwIUJccYw96vlmFy5qmlKGNOqi6IL5/tzivPcNbaok9NSMiLPu8R
 TVzgP1HqWsolfAs9xluW8cUBdw1k30Dd9FJcr0cxdsZxrtaHwqTemcsdl
 tjKI4sSHlgJRFNoVTwRquDEPwLIqWAe2/mhvk9GRAFIEVe92pf69odBD2 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="335096447"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="335096447"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 03:05:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="628486542"
Received: from nbaca1-mobl.ger.corp.intel.com (HELO localhost) ([10.252.18.25])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 03:05:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kees Cook <keescook@chromium.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/dp: Remove common Post Cursor2 register handling
In-Reply-To: <202202041740.F368F91F5@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220105173507.2420910-1-keescook@chromium.org>
 <202202041740.F368F91F5@keescook>
Date: Mon, 07 Feb 2022 13:04:55 +0200
Message-ID: <87y22nq6nc.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Feb 2022, Kees Cook <keescook@chromium.org> wrote:
> Ping,
>
> This is a OOB read fix. Can someone please pick this up?

Daniel? Thierry?

As I said, I reviewed this but I'm not comfortable applying patches that
change the functionality of drivers I don't maintain.

BR,
Jani.


>
> -Kees
>
> On Wed, Jan 05, 2022 at 09:35:07AM -0800, Kees Cook wrote:
>> The link_status array was not large enough to read the Adjust Request
>> Post Cursor2 register, so remove the common helper function to avoid
>> an OOB read, found with a -Warray-bounds build:
>> 
>> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
>> drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
>>    59 |         return link_status[r - DP_LANE0_1_STATUS];
>>       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
>>   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>>       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> 
>> Replace the only user of the helper with an open-coded fetch and decode,
>> similar to drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c.
>> 
>> Fixes: 79465e0ffeb9 ("drm/dp: Add helper to get post-cursor adjustments")
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>> This is the alternative to:
>> https://lore.kernel.org/lkml/20211203084354.3105253-1-keescook@chromium.org/
>> ---
>>  drivers/gpu/drm/drm_dp_helper.c | 10 ----------
>>  drivers/gpu/drm/tegra/dp.c      | 11 ++++++++++-
>>  include/drm/drm_dp_helper.h     |  2 --
>>  3 files changed, 10 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
>> index 23f9073bc473..c9528aa62c9c 100644
>> --- a/drivers/gpu/drm/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/drm_dp_helper.c
>> @@ -144,16 +144,6 @@ u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
>>  }
>>  EXPORT_SYMBOL(drm_dp_get_adjust_tx_ffe_preset);
>>  
>> -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>> -					 unsigned int lane)
>> -{
>> -	unsigned int offset = DP_ADJUST_REQUEST_POST_CURSOR2;
>> -	u8 value = dp_link_status(link_status, offset);
>> -
>> -	return (value >> (lane << 1)) & 0x3;
>> -}
>> -EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
>> -
>>  static int __8b10b_clock_recovery_delay_us(const struct drm_dp_aux *aux, u8 rd_interval)
>>  {
>>  	if (rd_interval > 4)
>> diff --git a/drivers/gpu/drm/tegra/dp.c b/drivers/gpu/drm/tegra/dp.c
>> index 70dfb7d1dec5..f5535eb04c6b 100644
>> --- a/drivers/gpu/drm/tegra/dp.c
>> +++ b/drivers/gpu/drm/tegra/dp.c
>> @@ -549,6 +549,15 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
>>  {
>>  	struct drm_dp_link_train_set *adjust = &link->train.adjust;
>>  	unsigned int i;
>> +	u8 post_cursor;
>> +	int err;
>> +
>> +	err = drm_dp_dpcd_read(link->aux, DP_ADJUST_REQUEST_POST_CURSOR2,
>> +			       &post_cursor, sizeof(post_cursor));
>> +	if (err < 0) {
>> +		DRM_ERROR("failed to read post_cursor2: %d\n", err);
>> +		post_cursor = 0;
>> +	}
>>  
>>  	for (i = 0; i < link->lanes; i++) {
>>  		adjust->voltage_swing[i] =
>> @@ -560,7 +569,7 @@ static void drm_dp_link_get_adjustments(struct drm_dp_link *link,
>>  				DP_TRAIN_PRE_EMPHASIS_SHIFT;
>>  
>>  		adjust->post_cursor[i] =
>> -			drm_dp_get_adjust_request_post_cursor(status, i);
>> +			(post_cursor >> (i << 1)) & 0x3;
>>  	}
>>  }
>>  
>> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
>> index 472dac376284..fdf3cf6ccc02 100644
>> --- a/include/drm/drm_dp_helper.h
>> +++ b/include/drm/drm_dp_helper.h
>> @@ -1528,8 +1528,6 @@ u8 drm_dp_get_adjust_request_pre_emphasis(const u8 link_status[DP_LINK_STATUS_SI
>>  					  int lane);
>>  u8 drm_dp_get_adjust_tx_ffe_preset(const u8 link_status[DP_LINK_STATUS_SIZE],
>>  				   int lane);
>> -u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>> -					 unsigned int lane);
>>  
>>  #define DP_BRANCH_OUI_HEADER_SIZE	0xc
>>  #define DP_RECEIVER_CAP_SIZE		0xf
>> -- 
>> 2.30.2
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
