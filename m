Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7A27783D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 20:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA106E314;
	Thu, 24 Sep 2020 18:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055DC6E314
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 18:06:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600970805; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ALhUP7sAqZrosBEby/VQO6Cy4FEeZWO8qfo6Ml+PqXc=;
 b=Cn16UYo1UmgdtX0jsYaUDiv/EVCR+bfMgt6I5JhEmon3Ifyxo+CN4pzhR365hgCIErMA7UV5
 zdjnTSLLQXytwaTWrqbe1ur9cFzyvk8CJ/cpUcpSUb1dDLM/J1yM8+27pbJI4xQI2VL6Z0PQ
 HL6J5rvtRqkYN/0CieNygMI6ecM=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f6ce02f1dcd99b9f253adef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Sep 2020 18:06:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 57D64C433FE; Thu, 24 Sep 2020 18:06:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C519C433CA;
 Thu, 24 Sep 2020 18:06:38 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 24 Sep 2020 11:06:38 -0700
From: abhinavk@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dp: fix incorrect function prototype of
 dp_debug_get()
In-Reply-To: <160092913200.310579.7777419545906412437@swboyd.mtv.corp.google.com>
References: <20200923232448.24516-1-abhinavk@codeaurora.org>
 <160092913200.310579.7777419545906412437@swboyd.mtv.corp.google.com>
Message-ID: <9b14d270ac94a7b17e13a2d4ac86ffdc@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 tanmay@codeaurora.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

Thanks for the review.

On 2020-09-23 23:32, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2020-09-23 16:24:48)
>> Fix the incorrect function prototype for dp_debug_get()
>> in the dp_debug module to address compilation warning.
>> 
>> Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to 
>> /sys/kernel/debug/dri/*/")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> Will the compliance testing parts be moved out of debugfs at some 
> point?
> Just curious what the plan is there.

No, the video pattern compliance testing parts will remain in debugfs as 
they use
IGT as the userspace entity which is debugfs based for DP compliance 
tests.

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
