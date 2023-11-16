Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBED37EE6C4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 19:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CDF10E671;
	Thu, 16 Nov 2023 18:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7889510E660
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 18:31:30 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-672096e0e89so5812476d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1700159489; x=1700764289; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:references:cc:to:subject:from:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rU0Onv3SuE+K6mh1ouNAPCMkOiMWIv4TJL2AZdCOGUw=;
 b=WLeZ40ZxI9X1q/x5DAZ4lozrHmzrHsUO70S0rNVfLcAS4JepjKEk58ZxoPMm9xDdXw
 kRFJqIokYTtxrPo/558GvEJ91QlmQJchZnaYlmRbSuM0o9kyGr4SBrDTGIgEfZO05IgK
 hbWYLe+VSAXllY1jlGednOXKiqMKyxfxbqVvbHU06SNoVfvn7rLnc+FJAxfKz5KWlhXg
 LtrZfg1S+BzOaU5cEztQqz/BQBYZGgoQMREu9Iii/tt37pbscWJ4+spl7rad8vEjyJbl
 hqYvYiMy0ydseexfIol1Up1HRnWgJ1he1tgBbUhaHchar8IwfttvL5irzpFRADTIXNQ0
 UbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700159489; x=1700764289;
 h=content-transfer-encoding:content-language:in-reply-to:mime-version
 :user-agent:date:message-id:references:cc:to:subject:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rU0Onv3SuE+K6mh1ouNAPCMkOiMWIv4TJL2AZdCOGUw=;
 b=oDNvi6/3TMviLZluG2xtuId8vY44tFIEhYJZ3u5BcYH/owJ8KAaBuEaD8MhKEXJNgb
 g9/yPBNIWTQW9GKn4ULtujrCG9Kz7g01Wvb4q76AEL67DzWya9f+mFOEIOgAnVhLSOgn
 7u/YcOD8CxZ9ddwtC26p8prvjJBbCB+sb85GLuyO1KskBhFCjVCLCfZfKsrVJro0H7Bu
 UO0AJ0DPQVwLWruDyTMsiKnY9FZz5fRAaPCm3IzK8Smj5VWIMTYxZiIkcr6ULF74uL6A
 OEvzkFwXCq8xtawfNjqEUMrHNxqWO3+ErV/bQhZBYJrAA8wzNWGKZjvf0aVwVwOE3GZ/
 PViA==
X-Gm-Message-State: AOJu0YyeoMB8J0psri6vy4xYZaJBQqZxreQM7+pKMDJvoLhXnXhHzUL8
 Kl1Zcs7YlRxfjnId+ictL3W8QA==
X-Google-Smtp-Source: AGHT+IG1dtT861g2sp4EuKubGCs2MqPMYXbAKW0AsBqZnVTbe7Dwjir9T3SG6Z6PX3ZoTrHqa61+GQ==
X-Received: by 2002:a05:6214:1255:b0:66d:42d9:fc83 with SMTP id
 r21-20020a056214125500b0066d42d9fc83mr13813746qvv.10.1700159489365; 
 Thu, 16 Nov 2023 10:31:29 -0800 (PST)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca.
 [135.19.110.125]) by smtp.gmail.com with ESMTPSA id
 k13-20020a0cebcd000000b00670c15033aesm1528608qvq.144.2023.11.16.10.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 10:31:29 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 1/6] drm/msm/dpu: fix video mode DSC for DSI
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-2-jonathan@marek.ca>
 <CAA8EJpp0OGkgf0P6LcwE-H6BVN9kbtF_eRCsef+7NgDFmJOZfA@mail.gmail.com>
Message-ID: <d93a7c6f-a798-c9ec-6c10-08e4e5a70f4d@marek.ca>
Date: Thu, 16 Nov 2023 13:30:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAA8EJpp0OGkgf0P6LcwE-H6BVN9kbtF_eRCsef+7NgDFmJOZfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>,
 Arnaud Vrac <rawoul@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/15/23 3:53 AM, Dmitry Baryshkov wrote:
> On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> Add necessary DPU changes for DSC to work with DSI video mode.
>>
>> Note this changes the logic to enable HCTL to match downstream, it will
>> now be enabled for the no-DSC no-widebus case.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  2 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 11 +++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c         | 13 ++++++++++++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h         |  1 +
>>   5 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 1cf7ff6caff4..d745c8678b9d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -2477,7 +2477,7 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
>>          return INTF_MODE_NONE;
>>   }
>>
>> -unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
>> +unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc)
> 
> Why?
> 

drm_mode_to_intf_timing_params has "phys_enc" pointer declared as const, 
so one of them needs to change to call dpu_encoder_helper_get_dsc

>>   {
>>          struct drm_encoder *encoder = phys_enc->parent;
>>          struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index 6f04c3d56e77..7e27a7da0887 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -332,7 +332,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
>>    *   used for this encoder.
>>    * @phys_enc: Pointer to physical encoder structure
>>    */
>> -unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
>> +unsigned int dpu_encoder_helper_get_dsc(const struct dpu_encoder_phys *phys_enc);
>>
>>   /**
>>    * dpu_encoder_helper_split_config - split display configuration helper function
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> index a01fda711883..df10800a9615 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>> @@ -100,6 +100,8 @@ static void drm_mode_to_intf_timing_params(
>>          }
>>
>>          timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
>> +       if (dpu_encoder_helper_get_dsc(phys_enc))
>> +               timing->compression_en = true;
>>
>>          /*
>>           * for DP, divide the horizonal parameters by 2 when
>> @@ -112,6 +114,15 @@ static void drm_mode_to_intf_timing_params(
>>                  timing->h_front_porch = timing->h_front_porch >> 1;
>>                  timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
>>          }
>> +
>> +       /*
>> +        * for DSI, if compression is enabled, then divide the horizonal active
>> +        * timing parameters by compression ratio.
>> +        */
>> +       if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
>> +               timing->width = timing->width / 3; /* XXX: don't assume 3:1 compression ratio */
> 
> Is this /3 from bpp / compressed_bpp?
> 

It is the compression ratio of DSC for 8bpc (24bpp) compressed to 8bpp. 
DSI driver doesn't support any other cases so this assumption should be 
OK for now (the other common ratio is 3.75 for 10bpc compressed to 8bpp 
- from downstream driver it appears this would mean a division by 3.75 
here).

>> +               timing->xres = timing->width;
>> +       }
>>   }
>>
>>   static u32 get_horizontal_total(const struct dpu_hw_intf_timing_params *timing)
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> index e8b8908d3e12..d6fe45a6da2d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>> @@ -166,10 +166,21 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>>           * video timing. It is recommended to enable it for all cases, except
>>           * if compression is enabled in 1 pixel per clock mode
>>           */
>> +       if (!p->compression_en || p->wide_bus_en)
>> +               intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>> +
>>          if (p->wide_bus_en)
>> -               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>> +               intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
>>
>>          data_width = p->width;
>> +       if (p->wide_bus_en && !dp_intf)
>> +               data_width = p->width >> 1;
>> +
>> +       if (p->compression_en)
>> +               intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>> +
>> +       if (p->compression_en && dp_intf)
>> +               DPU_ERROR("missing adjustments for DSC+DP\n");
>>
>>          hsync_data_start_x = hsync_start_x;
>>          hsync_data_end_x =  hsync_start_x + data_width - 1;
> 
> This should go into a separate commit with the proper justification.
> 

All of it? setting the INTF_CFG2_DCE_DATA_COMPRESS flag at least doesn't 
make sense to make a separate patch. And DSI widebus is only used with 
DSC (and always used when available), so IMO also in the scope of this 
commit.

>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> index c539025c418b..15a5fdadd0a0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>> @@ -33,6 +33,7 @@ struct dpu_hw_intf_timing_params {
>>          u32 hsync_skew;
>>
>>          bool wide_bus_en;
>> +       bool compression_en;
>>   };
>>
>>   struct dpu_hw_intf_prog_fetch {
>> --
>> 2.26.1
>>
> 
> 
