Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA21307E6F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 19:53:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2776E210;
	Thu, 28 Jan 2021 18:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-8.mailgun.net (m42-8.mailgun.net [69.72.42.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1326E210
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 18:53:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611859986; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=A3uJbsbReqIC2xWBCaCbZ26cdt1NNPaHfgT5Jx4zBlU=;
 b=fhA/2Gl0+afyxmf8Shw+1BTB/VfeQP75tObDKl18iYjBnxDtHPL93rp8mHY7GdOJVPuNpdDd
 +SYaenWMSNcR0MJSMc8Sgl0Ct0+PuwN5L3V+dErGGqS47gvkp+LVTf7UW9PstXs9tqBUhnKp
 KFpubbIWK3z3hwNd5dogdYYLCsU=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 601306d8e325600642a515a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 18:47:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 31646C43461; Thu, 28 Jan 2021 18:47:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DF80C433CA;
 Thu, 28 Jan 2021 18:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0DF80C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 28 Jan 2021 11:47:48 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/3] drm/msm: Fix races managing the OOB state for
 timestamp vs timestamps.
Message-ID: <20210128184748.GC29306@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Eric Anholt <eric@anholt.net>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20210127233946.1286386-1-eric@anholt.net>
 <20210127233946.1286386-2-eric@anholt.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127233946.1286386-2-eric@anholt.net>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 03:39:45PM -0800, Eric Anholt wrote:
> Now that we're not racing with GPU setup, also fix races of timestamps
> against other timestamps.  In CI, we were seeing this path trigger
> timeouts on setting the GMU bit, especially on the first set of tests
> right after boot (it's probably easier to lose the race than one might
> think, given that we start many tests in parallel, and waiting for NFS
> to page in code probably means that lots of tests hit the same point
> of screen init at the same time).
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> Cc: stable@vger.kernel.org # v5.9

The joys of not having a global mutex locking everything.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 7424a70b9d35..e8f0b5325a7f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1175,6 +1175,9 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	static DEFINE_MUTEX(perfcounter_oob);
> +
> +	mutex_lock(&perfcounter_oob);
>  
>  	/* Force the GPU power on so we can read this register */
>  	a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> @@ -1183,6 +1186,7 @@ static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
>  		REG_A6XX_RBBM_PERFCTR_CP_0_HI);
>  
>  	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_PERFCOUNTER_SET);
> +	mutex_unlock(&perfcounter_oob);
>  	return 0;
>  }
>  
> -- 
> 2.30.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
