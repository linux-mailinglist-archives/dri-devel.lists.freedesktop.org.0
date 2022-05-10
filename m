Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF25222EF
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 19:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E5B10E28D;
	Tue, 10 May 2022 17:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA32810E23F;
 Tue, 10 May 2022 17:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652204386; x=1683740386;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FkyvDe+lg/6UUzc3a3RX0uzSgZKO1lAGbr6Xu1sBYnI=;
 b=kQMsueoNZK5SbvPlsCBOIoNIMgo0Sos82mEJNrLRT2dUBnbl26HCQ8M1
 tAImu4APL3OuCOfA7VD1M/UzJoADMERNT2K62DD53EWD03Q4w4DEoVmRT
 8mqBhqt29gmwXu7K/tGMQhHsiOS7ioq7Vdol3OpeI0T1QhpGCfzUvrQV5 4=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 10 May 2022 10:39:45 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 10:39:45 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 10:39:45 -0700
Received: from [10.38.241.82] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 10 May
 2022 10:39:42 -0700
Message-ID: <e205565a-e0f5-dca2-a287-a829056d9601@quicinc.com>
Date: Tue, 10 May 2022 10:39:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm: Fix fb plane offset calculation
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20220510165216.3577068-1-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220510165216.3577068-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/10/2022 9:52 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The offset got dropped by accident.
> 
> Fixes: d413e6f97134 ("drm/msm: Drop msm_gem_iova()")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/msm_fb.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 362775ae50af..4269da268a4a 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -118,7 +118,7 @@ uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
>   		struct msm_gem_address_space *aspace, int plane)
>   {
>   	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
> -	return msm_fb->iova[plane];
> +	return msm_fb->iova[plane] + fb->offsets[plane];
>   }
>   
>   struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane)
