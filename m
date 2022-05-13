Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BA5269D0
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 21:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A729310E062;
	Fri, 13 May 2022 19:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE33D10E057;
 Fri, 13 May 2022 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652468634; x=1684004634;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=od5ts7YfisWgOnFB465C5qzUg8Eu9PE/N8z62d9GeWI=;
 b=KH2C6gcGVPQfyqs1zU4ziExWtZW9aUxZr+UjPaKjD6dPnehwQUMOsG3/
 MwiPopMk1wf6XNeNZO9HN9eowsYJjxjooygjy3n2QisYgORyqBkVe9oaL
 mAbwyn/AEv5XJPmKLRfGFM0CVOFckWYTCZ7lbh7YqEIcIQZVCRMPymK50 M=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 13 May 2022 12:03:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 12:03:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 13 May 2022 12:03:53 -0700
Received: from [10.38.247.112] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 13 May
 2022 12:03:51 -0700
Message-ID: <86c52d22-eda6-8a3f-cd21-cf0b89a0581e@quicinc.com>
Date: Fri, 13 May 2022 12:03:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 16/25] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <20220209172520.3719906-17-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220209172520.3719906-17-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/9/2022 9:25 AM, Dmitry Baryshkov wrote:
> Since layout is not cached anymore, drop comparison against previous
> layout and corresponding EAGAIN handling.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Isnt this preventing the usermode from programming the same address again?

I thought that this check is good in that way and has nothing to do with 
the caching as such.

So its the other way around, by caching we are ensuring that we dont get 
a new frame update for just updating the same src address.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 5 +----
>   2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 440ae93d7bd1..5c7d739143f0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -927,10 +927,6 @@ int dpu_format_populate_layout(
>   	else
>   		ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
>   
> -	/* check if anything changed */
> -	if (!ret && !memcmp(plane_addr, layout->plane_addr, sizeof(plane_addr)))
> -		ret = -EAGAIN;
> -
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index a521c0681af6..b2395f02f6d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1061,10 +1061,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>   
>   	ret = dpu_format_populate_layout(aspace, fb, &layout);
> -	if (ret == -EAGAIN) {
> -		DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
> -		update_src_addr = false;
> -	} else if (ret) {
> +	if (ret) {
>   		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>   		update_src_addr = false;
>   	}
