Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E53C799A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 00:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5865A6E147;
	Tue, 13 Jul 2021 22:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68B76E141
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 22:25:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1626215121; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NrfFoaUg+uge8R5c62DK9xqyU2a37Zv+qz0iccvChbU=;
 b=imDMdjTV+MuzkGl/n1zgbO2cSOauU8GdySFiIVkY6je59Lm2HpARwdhgzowIGzIiEhy/naeP
 OPLG4OWuoVJb4dAJIfE+qoSp7Y4/zn/kaC2NwB2lxhQbKFKVzUHbChOhL/QjJ2kJeKgLGiVg
 oZd8iq84ua/kvBlIFoO3pCczV+Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60ee12bc5e3e57240b05ffb0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 22:25:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1B7FBC43217; Tue, 13 Jul 2021 22:25:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 18AD7C433D3;
 Tue, 13 Jul 2021 22:24:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 13 Jul 2021 15:24:58 -0700
From: khsieh@codeaurora.org
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v3] drm/dp_mst: Fix return code on sideband message failure
In-Reply-To: <87zguy7c5a.fsf@intel.com>
References: <1625585434-9562-1-git-send-email-khsieh@codeaurora.org>
 <87zguy7c5a.fsf@intel.com>
Message-ID: <a514c19f712a6feeddf854dc17cb8eb5@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: tzimmermann@suse.de, airlied@linux.ie, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, swboyd@chromium.org, rnayak@codeaurora.org,
 aravindh@codeaurora.org, sean@poorly.run, rsubbia@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-07 01:37, Jani Nikula wrote:
> On Tue, 06 Jul 2021, Kuogee Hsieh <khsieh@codeaurora.org> wrote:
>> From: Rajkumar Subbiah <rsubbia@codeaurora.org>
>> 
>> Commit 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
>> selftests") added some debug code for sideband message tracing. But
>> it seems to have unintentionally changed the behavior on sideband 
>> message
>> failure. It catches and returns failure only if DRM_UT_DP is enabled.
>> Otherwise it ignores the error code and returns success. So on an MST
>> unplug, the caller is unaware that the clear payload message failed 
>> and
>> ends up waiting for 4 seconds for the response. Fixes the issue by
>> returning the proper error code.
>> 
>> Changes in V2:
>> -- Revise commit text as review comment
>> -- add Fixes text
>> 
>> Changes in V3:
>> -- remove "unlikely" optimization
>> 
>> Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing + 
>> selftests")
>> 
>> Signed-off-by: Rajkumar Subbiah <rsubbia@codeaurora.org>
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> 
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> 
>> ---
Lyude,
Any comments from you?
Thanks,

>>  drivers/gpu/drm/drm_dp_mst_topology.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c 
>> b/drivers/gpu/drm/drm_dp_mst_topology.c
>> index 1590144..df91110 100644
>> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
>> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>> @@ -2887,11 +2887,13 @@ static int process_single_tx_qlock(struct 
>> drm_dp_mst_topology_mgr *mgr,
>>  	idx += tosend + 1;
>> 
>>  	ret = drm_dp_send_sideband_msg(mgr, up, chunk, idx);
>> -	if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {
>> -		struct drm_printer p = drm_debug_printer(DBG_PREFIX);
>> +	if (ret) {
>> +		if (drm_debug_enabled(DRM_UT_DP)) {
>> +			struct drm_printer p = drm_debug_printer(DBG_PREFIX);
>> 
>> -		drm_printf(&p, "sideband msg failed to send\n");
>> -		drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>> +			drm_printf(&p, "sideband msg failed to send\n");
>> +			drm_dp_mst_dump_sideband_msg_tx(&p, txmsg);
>> +		}
>>  		return ret;
>>  	}
