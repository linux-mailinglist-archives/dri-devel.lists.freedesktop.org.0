Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B1329C7BB
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 19:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6CE6EC15;
	Tue, 27 Oct 2020 18:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6E26EB82
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 18:49:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603824549; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=onN6cnFqDOSCbb9Mxt8SddPJFHmruGIv8WFUjOBVlaQ=;
 b=OXEbDdzlEJ6oVNm/MxGrhkl1Ztlg8SgZoA7mY5dRWBleWLMD0JhMoBkhcg0H0sqGWR+e0JgQ
 n8TcPWMGF/EKa+XKR7yCBbH8l7sounhFRcFnMKRyW5vxsilZX8mtpvjXCL0SnHyusLSyN290
 1If69JAkdEnPSrWvWErzwJFHevM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f986ba437949e554bb67f21 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 18:49:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 08DE8C433CB; Tue, 27 Oct 2020 18:49:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34CFFC433C9;
 Tue, 27 Oct 2020 18:49:07 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 27 Oct 2020 11:49:07 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: fix clock scaling on non-sc7180
 board
In-Reply-To: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
References: <20201027102304.945424-1-dmitry.baryshkov@linaro.org>
Message-ID: <20ac1894035103cc989cbfad3f07d885@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-27 03:23, Dmitry Baryshkov wrote:
> c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for
> display") has added support for handling bandwidth voting in kms path 
> in
> addition to old mdss path. However this broke all other platforms since
> _dpu_core_perf_crtc_update_bus() will now error out instead of properly
> calculating bandwidth and core clocks. Fix
> _dpu_core_perf_crtc_update_bus() to just skip bandwidth setting instead
> of returning an error in case kms->num_paths == 0 (MDSS is used for
> bandwidth management).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling
> for display")
> ---
Looks fine to me, thanks for the fix.
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 393858ef8a83..37c8270681c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -219,9 +219,6 @@ static int _dpu_core_perf_crtc_update_bus(struct
> dpu_kms *kms,
>  	int i, ret = 0;
>  	u64 avg_bw;
> 
> -	if (!kms->num_paths)
> -		return -EINVAL;
> -
>  	drm_for_each_crtc(tmp_crtc, crtc->dev) {
>  		if (tmp_crtc->enabled &&
>  			curr_client_type ==
> @@ -239,6 +236,9 @@ static int _dpu_core_perf_crtc_update_bus(struct
> dpu_kms *kms,
>  		}
>  	}
> 
> +	if (!kms->num_paths)
> +		return 0;
> +
>  	avg_bw = perf.bw_ctl;
>  	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
