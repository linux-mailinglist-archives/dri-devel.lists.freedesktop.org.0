Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45A6723B1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B2510E7A3;
	Wed, 18 Jan 2023 16:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D49910E79F;
 Wed, 18 Jan 2023 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1674060138; x=1705596138;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pT5clpHnRUqa+FGEMJ7uRQGCc9qWqKzX5/FHo083rzE=;
 b=hk+nSlMAuhyzT/TZg+f0U55OBm+KSHfewgGxlXwud6c3gcIQdRZbRDqQ
 7h8iDN7FKv3LrhXTeHhIwQkgQXVVw5EzrEB6zxinbE1yITPVaDsQcW4EC
 d4yAm4kqYpKyKfY0gkPbFubE7coEC253QddLuc7cnYew+ueEWCSPPyFwY Q=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Jan 2023 08:42:17 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:42:17 -0800
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 18 Jan
 2023 08:42:16 -0800
Message-ID: <2aa628b7-b54d-b5e8-14f9-c48119c08ae7@quicinc.com>
Date: Wed, 18 Jan 2023 08:42:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] drm/msm/dpu: Reapply CTM if modeset is needed
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230118021441.161-1-quic_jesszhan@quicinc.com>
 <CAA8EJpqP+JNXMoPqWrTOA9HT0wS22Uz807S1HndCnP7R4LZiHw@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJpqP+JNXMoPqWrTOA9HT0wS22Uz807S1HndCnP7R4LZiHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/17/2023 6:16 PM, Dmitry Baryshkov wrote:
> On Wed, 18 Jan 2023 at 04:14, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>
>> Add a !drm_atomic_crtc_needs_modeset() check to
>> _dpu_crtc_setup_cp_blocks() so that CTM is reapplied after a
>> suspend/resume.
> 
> .. or if the LM/DSPP blocks were reallocated by resource allocation
> during the modeset.

Hi Dmitry,

Acked -- will change the commit message in a v2.

Thanks,

Jessica Zhang

> 
>>
>> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 13ce321283ff..aa120a230222 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -748,7 +748,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
>>          int i;
>>
>>
>> -       if (!state->color_mgmt_changed)
>> +       if (!state->color_mgmt_changed && !drm_atomic_crtc_needs_modeset(state))
>>                  return;
>>
>>          for (i = 0; i < cstate->num_mixers; i++) {
>> --
>> 2.39.0
>>
> 
> 
> -- 
> With best wishes
> Dmitry
