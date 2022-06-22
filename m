Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CFE555246
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA4F10EEC1;
	Wed, 22 Jun 2022 17:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E611510E9A3;
 Wed, 22 Jun 2022 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655918667; x=1687454667;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+T1Ha1FXIGuZiI7WiovZ/I2vnWbuysSEufGaNGb5xFw=;
 b=firCLAb6ZP9PMGf5MAK6A5HHGsrZMBYrLW1HrAZybTT1McYdn/4BZUF3
 9+8mq+XZ12kGaBYVDLdw/+PPDTIybbtSre6tNnV/rJv/fCWbMu15DObj1
 zm9zHhHM3t2HYgaFpQQOwetdds5WzHDbu2Ed5f9c1vjg3YcV8orXwgaLQ I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jun 2022 10:24:26 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:24:25 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:24:25 -0700
Received: from [10.111.161.199] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:24:23 -0700
Message-ID: <b133b67f-0d99-af6b-94a5-d5ff4b5752f1@quicinc.com>
Date: Wed, 22 Jun 2022 10:24:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: Increment vsync_cnt before waking up
 userspace
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220622023855.2970913-1-swboyd@chromium.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220622023855.2970913-1-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, Mark Yacoub <markyacoub@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, Jessica Zhang <quic_jesszhan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/21/2022 7:38 PM, Stephen Boyd wrote:
> The 'vsync_cnt' is used to count the number of frames for a crtc.
> Unfortunately, we increment the count after waking up userspace via
> dpu_crtc_vblank_callback() calling drm_crtc_handle_vblank().
> drm_crtc_handle_vblank() wakes up userspace processes that have called
> drm_wait_vblank_ioctl(), and if that ioctl is expecting the count to
> increase it won't.
> 
> Increment the count before calling into the drm APIs so that we don't
> have to worry about ordering the increment with anything else in drm.
> This fixes a software video decode test that fails to see frame counts
> increase on Trogdor boards.
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Fixes: 885455d6bf82 ("drm/msm: Change dpu_crtc_get_vblank_counter to use vsync count.")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

This is right, we should increment before drm_crtc_handle_vblank() as 
that will query the vblank counter. This also matches what we do 
downstream, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

One small nit though, shouldnt the fixes tag be

25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

This code has been this way since that commit itself.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3a462e327e0e..a1b8c4592943 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1251,12 +1251,13 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   	DPU_ATRACE_BEGIN("encoder_vblank_callback");
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   
> +	atomic_inc(&phy_enc->vsync_cnt);
> +
>   	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
>   	if (dpu_enc->crtc)
>   		dpu_crtc_vblank_callback(dpu_enc->crtc);
>   	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>   
> -	atomic_inc(&phy_enc->vsync_cnt);
>   	DPU_ATRACE_END("encoder_vblank_callback");
>   }
>   
> 
> base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
