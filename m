Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3B54C05A0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 00:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9493B10E206;
	Tue, 22 Feb 2022 23:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DD410E206;
 Tue, 22 Feb 2022 23:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645574136; x=1677110136;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tYgaWv6WfZ0FOsgSVokq4FS/wwrsSmaAJ13BslMvT2A=;
 b=a6qy41XoBaBL3uc0lhPUBEdUhhptQrLgBKFupam6fXewuXWVAFwQdEjk
 EN1go7jvDnY/NiiwlgH9BAg+Bt5A3X5uW4qxdMBFRNgatIDlfHT6+RnLb
 Q8fpDXctRhMBUWgvHqW+6lTIdCQEGJZUH1NzcE0bZ1wRElrsp7aOVsNvc 4=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 22 Feb 2022 15:55:36 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 15:55:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 22 Feb 2022 15:55:34 -0800
Received: from [10.110.64.217] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Tue, 22 Feb
 2022 15:55:33 -0800
Message-ID: <a5410cc6-54da-5f7f-325a-850a1aa2a83c@quicinc.com>
Date: Tue, 22 Feb 2022 15:55:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v8 3/4] drm/msm/dpu: revise timing engine programming to
 support widebus feature
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
 <1645133788-5057-4-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n51Rewcp7uefTBJ2HwJN7gp-aTxrWe71XQ-RKosqw8uq8Q@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n51Rewcp7uefTBJ2HwJN7gp-aTxrWe71XQ-RKosqw8uq8Q@mail.gmail.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/18/2022 6:53 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-02-17 13:36:27)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 0d315b4..0c22839 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -217,6 +219,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>          15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>   };
>>
>> +
>> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc)
> const?
>
>> +{
>> +       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> const?
>
>> +
>> +       return dpu_enc->wide_bus_en;
>> +}
>> +
>>   static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>>   {
>>          struct dpu_hw_dither_cfg dither_cfg = { 0 };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index 99a5d73..893d74d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -168,4 +168,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
>>    */
>>   int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
>>
>> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc);
> const drm_enc?
>
>> +
>>   #endif /* __DPU_ENCODER_H__ */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index c2cd185..4e4fa56 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -147,17 +156,36 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>          hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>>          display_hctl = (hsync_end_x << 16) | hsync_start_x;
>>
>> -       if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
>> +       /*
>> +        * DATA_HCTL_EN controls data timing which can be different from
>> +        * video timing. It is recommended to enable it for all cases, except
>> +        * if compression is enabled in 1 pixel per clock mode
>> +        */
>> +       if (p->wide_bus_en)
>> +               intf_cfg2 |= (INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN);
> Drop useless parenthesis please.
>
>> +
>> +       data_width = p->width;
>> +
>> +       hsync_data_start_x = hsync_start_x;
>> +       hsync_data_end_x =  hsync_start_x + data_width - 1;
>> +
>> +       display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
>> +
>> +       if (dp_intf) {
>> +               /* DP timing adjustment */
>> +               display_v_start += p->hsync_pulse_width + p->h_back_porch;
>> +               display_v_end   -= p->h_front_porch;
> Is this code movement intentional?
yes, this timing adjustment is required for DP/eDP
>
>> +
>>                  active_h_start = hsync_start_x;
>>                  active_h_end = active_h_start + p->xres - 1;
>>                  active_v_start = display_v_start;
> display_v_start is different now.
>
>>                  active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>>
>> -               display_v_start += p->hsync_pulse_width + p->h_back_porch;
>> -               display_v_end   -= p->h_front_porch;
>> -
>>                  active_hctl = (active_h_end << 16) | active_h_start;
>>                  display_hctl = active_hctl;
>> +
>> +               intf_cfg |= INTF_CFG_ACTIVE_H_EN;
>> +               intf_cfg |= INTF_CFG_ACTIVE_V_EN;
> 		  intf_cfg |= INTF_CFG_ACTIVE_H_EN | INTF_CFG_ACTIVE_V_EN;
>
> would be one less line.
