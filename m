Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D231D53959A
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 19:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB7A11277C;
	Tue, 31 May 2022 17:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFFA112779;
 Tue, 31 May 2022 17:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654019521; x=1685555521;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z9sgpsSPs9NDoq7xVy5L9QPtqJrdgsPFZQ+CXd/DLBo=;
 b=j+VKOB07Oc4knxUUAwCJ8alwu47bquthw/x27tKBffxFo00k3vICsXdc
 nwWCBM2Ij5LnrGU30k0UZvDhhrw0MMFN6REfACBM3boXsmsRogYj3FOuS
 tOIuhXm2LXmrfRBKlW06L5LLd7l2oDnUpBZ25mfIJ+X+zzPQRhIGOotTL E=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 31 May 2022 10:52:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 10:51:59 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 31 May 2022 10:51:59 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 31 May
 2022 10:51:57 -0700
Message-ID: <73f2e94b-daa5-b30e-4fa9-f6725ed1a686@quicinc.com>
Date: Tue, 31 May 2022 10:51:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: Fix pointer dereferenced before checking
Content-Language: en-US
To: Haowen Bai <baihaowen@meizu.com>, Rob Clark <robdclark@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 "David Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <1653877196-23114-1-git-send-email-baihaowen@meizu.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1653877196-23114-1-git-send-email-baihaowen@meizu.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/29/2022 7:19 PM, Haowen Bai wrote:
> The phys_enc->wb_idx is dereferencing before null checking, so move
> it after checking.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for 
writeback")

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 4829d1ce0cf8..59da348ff339 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -574,11 +574,11 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
>    */
>   static void dpu_encoder_phys_wb_destroy(struct dpu_encoder_phys *phys_enc)
>   {
> -	DPU_DEBUG("[wb:%d]\n", phys_enc->wb_idx - WB_0);
> -
>   	if (!phys_enc)
>   		return;
>   
> +	DPU_DEBUG("[wb:%d]\n", phys_enc->wb_idx - WB_0);
> +
>   	kfree(phys_enc);
>   }
>   
