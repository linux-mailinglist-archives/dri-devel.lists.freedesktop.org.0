Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE84501EEF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 01:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415C110EE9C;
	Thu, 14 Apr 2022 23:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41C810EE9C;
 Thu, 14 Apr 2022 23:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649978229; x=1681514229;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EyC410ZthwWL+moWS9YRoeZUViAPFGlXF0lN4c3wWSE=;
 b=Dr2fNWoP2BkeY6jKRN1d2Q0A6qZrof1S9fLP0b4PSbT4GkgI3XT56fyJ
 kYJljAhIY2YXMgxrDLFzYx2mMsGvv8Z54hSGLblmcKxrXqwmBjkJ5fCxK
 SltxpqvibOfqahH7JLUaYhqNd9NbDgHTzr2aquwmeeLd13AOoB1XmrIXs s=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 14 Apr 2022 16:17:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 16:17:08 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 14 Apr 2022 16:17:07 -0700
Received: from [10.111.169.145] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 14 Apr
 2022 16:17:05 -0700
Message-ID: <7a0d0584-3d86-8ec3-e1a7-cf8fccf8a882@quicinc.com>
Date: Thu, 14 Apr 2022 16:17:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 11/12] drm/msm/dpu: gracefully handle null fb commits for
 writeback
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-12-git-send-email-quic_abhinavk@quicinc.com>
 <28766af1-58c8-5930-9433-e6b1e3f5f284@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <28766af1-58c8-5930-9433-e6b1e3f5f284@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, swboyd@chromium.org, nganji@codeaurora.org,
 seanpaul@chromium.org, markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/4/2022 2:43 PM, Dmitry Baryshkov wrote:
> On 05/02/2022 00:17, Abhinav Kumar wrote:
>> kms_writeback test cases also verify with a null fb for the
>> writeback connector job. In addition there are also other
>> commit paths which can result in kickoffs without a valid
>> framebuffer like while closing the fb which results in the
>> callback to drm_atomic_helper_dirtyfb() which internally
>> triggers a commit.
>>
>> Add protection in the dpu driver to ensure that commits for
>> writeback encoders without a valid fb are gracefully skipped.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c            |  9 +++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 21 
>> +++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h         |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h    |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 12 ++++++++++++
>>   5 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index e7c9fe1..f7963b0 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -869,6 +869,13 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>>       DPU_ATRACE_BEGIN("crtc_commit");
>> +    drm_for_each_encoder_mask(encoder, crtc->dev,
>> +            crtc->state->encoder_mask) {
>> +        if (!dpu_encoder_has_valid_fb(encoder)) {
> 
> Two small comments here. First, let's probably rename the function to 
> dpu_encoder_is_valid() or dpu_encoder_is_valid_for_commit() (ugh, too 
> long). There might be other cases (in theory), why encoder is invalid at 
> this moment.

dpu_encoder_is_valid_for_commit() seems fine to me even if long.

> 
> Also (a minor nit): I think that we should commit if at least one of 
> encoders is valid. So we might want to create an encoder_valid_mask 
> basing on the calls to dpu_encoder. And then use it later for calling 
> dpu_encoder_prepare_for_kickoff() and dpu_encoder_kickoff().

Its not just these two calls. These can be easily skipped within the 
encoder itself. I had to bring this to the dpu_crtc level because of the 
frame_pending.

The issue is atomic_inc_return(&dpu_crtc->frame_pending)

We have to skip this call otherwise it leads to incorrect "frame done 
timeouts" because CRTC thinks frame was kicked off but it was actually 
skipped.

Maybe, what we can do is first prepare the mask.

if (hweight(crtc_encoder_mask)) {
	if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
         /* acquire bandwidth and other resources */
         DRM_DEBUG_ATOMIC("crtc%d first commit\n", crtc->base.id);
     	} else
         	DRM_DEBUG_ATOMIC("crtc%d commit\n", crtc->base.id);

   	dpu_crtc->play_count++;

     	dpu_vbif_clear_errors(dpu_kms);
}	
	
do the encoder_kickoff

if (hweight(crtc_encoder_mask))
	reinit_completion(&dpu_crtc->frame_done_comp);
	
calls to dpu_encoder_prepare_for_kickoff() and dpu_encoder_kickoff() can 
be protected by dpu_encoder_is_valid_for_commit() checks.

This is probably the best we can do here.

Let me know what you think.

> 
>> +            DRM_DEBUG_ATOMIC("invalid FB not kicking off crtc\n");
>> +            goto end;
>> +        }
>> +    }
>>       /*
>>        * Encoder will flush/start now, unless it has a tx pending. If 
>> so, it
>>        * may delay and flush at an irq event (e.g. ppdone)
>> @@ -891,6 +898,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>>           dpu_encoder_kickoff(encoder);
>>       reinit_completion(&dpu_crtc->frame_done_comp);
>> +
>> +end:
>>       DPU_ATRACE_END("crtc_commit");
>>   }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 3746432..e990dbc 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1832,6 +1832,27 @@ void dpu_encoder_prepare_for_kickoff(struct 
>> drm_encoder *drm_enc)
>>       }
>>   }
>> +bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc)
>> +{
>> +    struct dpu_encoder_virt *dpu_enc;
>> +    unsigned int i;
>> +    struct dpu_encoder_phys *phys;
>> +
>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
>> +
>> +    if (drm_enc->encoder_type == DRM_MODE_ENCODER_VIRTUAL) {
>> +        for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>> +            phys = dpu_enc->phys_encs[i];
>> +            if (phys->ops.has_valid_output_fb && 
>> !phys->ops.has_valid_output_fb(phys)) {
>> +                DPU_DEBUG("invalid FB not kicking off\n");
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
>>   {
>>       struct dpu_encoder_virt *dpu_enc;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index da5b6d6..63d90b8 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -187,4 +187,10 @@ void dpu_encoder_prepare_wb_job(struct 
>> drm_encoder *drm_enc,
>>   void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
>>           struct drm_writeback_job *job);
>> +/**
>> + * dpu_encoder_has_valid_fb - cleanup writeback job for the encoder.
>> + * @drm_enc:    Pointer to drm encoder structure
>> + */
>> +bool dpu_encoder_has_valid_fb(struct drm_encoder *drm_enc);
>> +
>>   #endif /* __DPU_ENCODER_H__ */
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> index 80da0a9..5b45b3c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>> @@ -151,6 +151,7 @@ struct dpu_encoder_phys_ops {
>>               struct drm_writeback_job *job);
>>       void (*cleanup_wb_job)(struct dpu_encoder_phys *phys_enc,
>>               struct drm_writeback_job *job);
>> +    bool (*has_valid_output_fb)(struct dpu_encoder_phys *phys_enc);
>>   };
>>   /**
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> index 783f83e..7eeed79 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>> @@ -717,6 +717,16 @@ static void 
>> dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
>>       wb_enc->wb_conn = NULL;
>>   }
>> +static bool dpu_encoder_phys_wb_has_valid_fb(struct dpu_encoder_phys 
>> *phys_enc)
>> +{
>> +    struct dpu_encoder_phys_wb *wb_enc = 
>> to_dpu_encoder_phys_wb(phys_enc);
>> +
>> +    if (wb_enc->wb_job)
>> +        return true;
>> +    else
>> +        return false;
>> +}
>> +
>>   /**
>>    * dpu_encoder_phys_wb_init_ops - initialize writeback operations
>>    * @ops:    Pointer to encoder operation table
>> @@ -738,6 +748,8 @@ static void dpu_encoder_phys_wb_init_ops(struct 
>> dpu_encoder_phys_ops *ops)
>>       ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
>>       ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
>>       ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
>> +    ops->has_valid_output_fb = dpu_encoder_phys_wb_has_valid_fb;
>> +
>>   }
>>   /**
> 
> 
