Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A7D79D0DC
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 14:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B797A10E232;
	Tue, 12 Sep 2023 12:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FD510E414;
 Tue, 12 Sep 2023 12:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694520997; x=1726056997;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=xrcWnldaWQwjzXDP3YbSlyGeUmu/rx8EuqxZ8uUms7o=;
 b=ZmQHtEguz5ohu3PWX719u8YmXxpkb4mKNaGhdAmYGVbrgASNz0opm9HD
 xWdTaNIriYZgNm+0h06G5/hrWX7zOtrVT2zX0/Jiia2S6PSa+q421t+Iq
 Z56hbw4qoNfD2O/5EP88FI8ws2hwAVajYlt5E1gk+AhSLhE3wL6mFZl29
 G0FmPA0ep+DZusATqzzHQAbu4Cnr6qV5DP/n/TOYwyHF2GlXkHFfsD/oL
 3Hyd3kyVWjKwJhgio2jIoWjJSlvwthZZ2/yTdgUiJRoLnozro0qfDIApO
 FhhhiF0TK5gT/tmG2dLXzg8MiGGUs67k5F+j9UcHRfY99oTX82Uj/NE/3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="368614101"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="368614101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 05:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="809223237"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="809223237"
Received: from kscholl-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.206])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 05:16:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Boyd <swboyd@chromium.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dp: skip validity check for DP CTS EDID checksum
In-Reply-To: <CAE-0n52T4VGVVKqZCJwhpxe=vLUb7WNi=J0hdsHFOqA95u-Ymg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230901142034.580802-1-jani.nikula@intel.com>
 <CAE-0n52T4VGVVKqZCJwhpxe=vLUb7WNi=J0hdsHFOqA95u-Ymg@mail.gmail.com>
Date: Tue, 12 Sep 2023 15:16:30 +0300
Message-ID: <877covy4bl.fsf@intel.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Sep 2023, Stephen Boyd <swboyd@chromium.org> wrote:
> Quoting Jani Nikula (2023-09-01 07:20:34)
>> The DP CTS test for EDID last block checksum expects the checksum for
>> the last block, invalid or not. Skip the validity check.
>>
>> For the most part (*), the EDIDs returned by drm_get_edid() will be
>> valid anyway, and there's the CTS workaround to get the checksum for
>> completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
>> correct edid checksum after corrupted edid checksum read").
>>
>> This lets us remove one user of drm_edid_block_valid() with hopes the
>> function can be removed altogether in the future.
>>
>> (*) drm_get_edid() ignores checksum errors on CTA extensions.
>>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
>> Cc: Marijn Suijten <marijn.suijten@somainline.org>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: Stephen Boyd <swboyd@chromium.org>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: freedreno@lists.freedesktop.org
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks; is that enough to merge? I can't claim I would have been able to
test this.

>
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 42d52510ffd4..86a8e06c7a60 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -289,26 +289,9 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>>
>>  static u8 dp_panel_get_edid_checksum(struct edid *edid)
>
> It would be nice to make 'edid' const here in another patch.

Sure.

BR,
Jani.


-- 
Jani Nikula, Intel
