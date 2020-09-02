Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F15225A611
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 09:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659746E14A;
	Wed,  2 Sep 2020 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B756E14A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 07:06:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1599030409; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6Cz9IZCRGGiEi7abWV/jZoTNF8HL+CeKuusk0aLrQAA=;
 b=e8LgwM0oCjeyburk1JhYvG0pizkyBhbNg0Uc+tbLJ/KJF3XPhU3JhjDGu8xE9V/ITsRYxI0O
 aTnBYyWSgtxnln0uwVtrlXQ97/aF1brDh4yXbid/CuS6EZ7punZMpW284qmko3jTiDShtYZ6
 Q7snlDLZ+/Duk9rYrYqe28CguPw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f4f443b9bdf68cc0345b6ad (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 07:05:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3C068C43395; Wed,  2 Sep 2020 07:05:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CD84C433C6;
 Wed,  2 Sep 2020 07:05:30 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 02 Sep 2020 12:35:30 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
In-Reply-To: <20200901215942.2559119-2-swboyd@chromium.org>
References: <20200901215942.2559119-1-swboyd@chromium.org>
 <20200901215942.2559119-2-swboyd@chromium.org>
Message-ID: <b8ee3f88265f9aa510eef566f68532a0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 02 Sep 2020 07:07:59 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Sean Paul <sean@poorly.run>, linux-arm-msm-owner@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-02 03:29, Stephen Boyd wrote:
> The cstate->num_mixers member is only set to a non-zero value once
> dpu_encoder_virt_mode_set() is called, but the atomic check function 
> can
> be called by userspace before that. Let's avoid the div-by-zero here 
> and
> inside _dpu_crtc_setup_lm_bounds() by skipping this part of the atomic
> check if dpu_encoder_virt_mode_set() hasn't been called yet. This fixes
> an UBSAN warning:
> 
>  UBSAN: Undefined behaviour in 
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:860:31
>  division by zero
>  CPU: 7 PID: 409 Comm: frecon Tainted: G S                5.4.31 #128
>  Hardware name: Google Trogdor (rev0) (DT)
>  Call trace:
>   dump_backtrace+0x0/0x14c
>   show_stack+0x20/0x2c
>   dump_stack+0xa0/0xd8
>   __ubsan_handle_divrem_overflow+0xec/0x110
>   dpu_crtc_atomic_check+0x97c/0x9d4
>   drm_atomic_helper_check_planes+0x160/0x1c8
>   drm_atomic_helper_check+0x54/0xbc
>   drm_atomic_check_only+0x6a8/0x880
>   drm_atomic_commit+0x20/0x5c
>   drm_atomic_helper_set_config+0x98/0xa0
>   drm_mode_setcrtc+0x308/0x5dc
>   drm_ioctl_kernel+0x9c/0x114
>   drm_ioctl+0x2ac/0x4b0
>   drm_compat_ioctl+0xe8/0x13c
>   __arm64_compat_sys_ioctl+0x184/0x324
>   el0_svc_common+0xa4/0x154
>   el0_svc_compat_handler+0x
> 
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
