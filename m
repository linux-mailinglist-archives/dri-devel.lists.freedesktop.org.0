Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C638251596B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 02:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB6710E4D1;
	Sat, 30 Apr 2022 00:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D0810E4D1;
 Sat, 30 Apr 2022 00:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651279291; x=1682815291;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LSTCoZqI9/QZBt+9Buh0Y9OOyer1bIfs9SMrjNp56KI=;
 b=KKrggZ/xuNEIeEnWPl1XavRkk3LWIqeRXCcfRDHofUgO6bNCHTTc8N/d
 zg7K/Fg37+AVi+TG826BIuALKVmu47m3WntDUSKG1vv7go126l5E85Wli
 kDC4/Ygt20ALS5xVHLl2wQYQ4TbVmhIQJljqztP6eB//9NYe7tuCVuFMj I=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Apr 2022 17:41:30 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 17:41:30 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 17:41:30 -0700
Received: from [10.38.245.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 29 Apr
 2022 17:41:27 -0700
Message-ID: <ee50adbc-7b39-e586-53f6-3102b3b8c7ff@quicinc.com>
Date: Fri, 29 Apr 2022 17:41:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: Clean up CRC debug logs
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 <freedreno@lists.freedesktop.org>
References: <20220430003917.132-1-quic_jesszhan@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220430003917.132-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jessica

Please add reported by for dmitry and suggested-by for Rob.

Thanks

Abhinav

On 4/29/2022 5:39 PM, Jessica Zhang wrote:
> Currently, dpu_hw_lm_collect_misr returns EINVAL if CRC is disabled.
> This causes a lot of spam in the DRM debug logs as it's called for every
> vblank.
> 
> Instead of returning EINVAL when CRC is disabled in
> dpu_hw_lm_collect_misr, let's return ENODATA and add an extra ENODATA check
> before the debug log in dpu_crtc_get_crc.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5  (qrb5165)
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7763558ef566..16ba9f9b9a78 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -204,7 +204,8 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
>   		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
>   
>   		if (rc) {
> -			DRM_DEBUG_DRIVER("MISR read failed\n");
> +			if (rc != -ENODATA)
> +				DRM_DEBUG_DRIVER("MISR read failed\n");
>   			return rc;
>   		}
>   	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 86363c0ec834..462f5082099e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -138,7 +138,7 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
>   	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
>   
>   	if (!(ctrl & LM_MISR_CTRL_ENABLE))
> -		return -EINVAL;
> +		return -ENODATA;
>   
>   	if (!(ctrl & LM_MISR_CTRL_STATUS))
>   		return -EINVAL;
