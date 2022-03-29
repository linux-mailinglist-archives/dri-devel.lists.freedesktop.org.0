Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D0E4EB53F
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 23:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDE610EED9;
	Tue, 29 Mar 2022 21:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FC510E0F8;
 Tue, 29 Mar 2022 21:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648589189; x=1680125189;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=d+l6zk+HBGJYVQnsOcVI6/lvAO3CQ/oEJX8wdFBB6EE=;
 b=Xzy9vm0nYOtbchx7v7Uki8nUxbcXZ4HsZ9yyYcF9ijChFWddoO8Y0+7H
 YvL4+9PYRWzbwIQucVHvojuEQhOAvJks/C0kZZydipvA8hOamVbDNAFAl
 y3J6a2+RU6/He+J/8dgyVGoJBaPeG5cMeULQJ0OSkvTZg7bGV3OnOZaQa M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Mar 2022 14:26:28 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 14:26:28 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 14:26:27 -0700
Received: from [10.110.122.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 14:26:27 -0700
Message-ID: <d82ffad8-46a7-853f-b379-7c548cd4fa0f@quicinc.com>
Date: Tue, 29 Mar 2022 14:26:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/3] drm/msm/dpu: fix error handling around
 dpu_hw_vbif_init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220217034502.464312-1-dmitry.baryshkov@linaro.org>
 <20220217034502.464312-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220217034502.464312-2-dmitry.baryshkov@linaro.org>
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



On 2/16/2022 7:45 PM, Dmitry Baryshkov wrote:
> Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
> the value is NULL, then the function will return 0 instead of a proper
> return code. Moreover dpu_hw_vbif_init() function can not return NULL.
> So, replace corresponding IS_ERR_OR_NULL() call with IS_ERR().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 81a35c8d62e7..f8f1bf3b511d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1102,10 +1102,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   
>   		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
>   				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
> -		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
> +		if (IS_ERR(dpu_kms->hw_vbif[vbif_idx])) {
>   			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
> -			if (!dpu_kms->hw_vbif[vbif_idx])
> -				rc = -EINVAL;
>   			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
>   			dpu_kms->hw_vbif[vbif_idx] = NULL;
>   			goto power_error;
