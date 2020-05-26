Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16D1E25F7
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 17:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C3589856;
	Tue, 26 May 2020 15:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E2489856
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 15:50:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590508216; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=l9+v5KTbmJ9FO+vcSKCZmMPOM+Wqw2LiKpZkkRVxaYY=;
 b=tKXgEuILdjj0CRMtsyS2FKTHpPna98m7QXfD88GJrLgHVrmIFN2rPRR6KBsflIvsX+wmrfRG
 HU+Zy4NJzUxKHradN3+TBwrpIpBfSmMnmgC0sLk4EYysn3fnFc5gyd67OsVXWbI5SHBXLSjx
 i8e9KcCIs9PZQXujHip3ya6GZic=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ecd3a8cc28b2cdd985be0fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 May 2020 15:49:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 876C7C433C6; Tue, 26 May 2020 15:49:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BA2E0C433C9;
 Tue, 26 May 2020 15:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BA2E0C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 26 May 2020 09:49:27 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2] drm/msm/a6xx: skip HFI set freq if GMU is powered down
Message-ID: <20200526154927.GB20960@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedreno.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200522221159.GA20960@jcrouse1-lnx.qualcomm.com>
 <20200522222909.27260-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522222909.27260-1-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedreno.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 22, 2020 at 06:29:08PM -0400, Jonathan Marek wrote:
> Also skip the newly added HFI set freq path if the GMU is powered down,
> which was missing because of patches crossing paths.

I saw the 5.8 pull later in my inbox so I'm not sure if this made it or not but
it qualifies as a -fix if it didn't.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 67c58345b26a..9851367a88cd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -110,13 +110,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	int ret;
>  
> -	/*
> -	 * This can get called from devfreq while the hardware is idle. Don't
> -	 * bring up the power if it isn't already active
> -	 */
> -	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
> -		return;
> -
>  	gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
>  
>  	gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
> @@ -141,7 +134,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
>  	 * for now leave it at max so that the performance is nominal.
>  	 */
>  	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> -	pm_runtime_put(gmu->dev);
>  }
>  
>  void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
> @@ -159,13 +151,21 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
>  			break;
>  
>  	gmu->current_perf_index = perf_index;
> +	gmu->freq = gmu->gpu_freqs[perf_index];
> +
> +	/*
> +	 * This can get called from devfreq while the hardware is idle. Don't
> +	 * bring up the power if it isn't already active
> +	 */
> +	if (pm_runtime_get_if_in_use(gmu->dev) == 0)
> +		return;
>  
>  	if (gmu->legacy)
>  		__a6xx_gmu_set_freq(gmu, perf_index);
>  	else
>  		a6xx_hfi_set_freq(gmu, perf_index);
>  
> -	gmu->freq = gmu->gpu_freqs[perf_index];
> +	pm_runtime_put(gmu->dev);
>  }
>  
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> -- 
> 2.26.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
