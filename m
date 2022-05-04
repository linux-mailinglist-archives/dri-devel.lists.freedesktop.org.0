Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CB651B389
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 01:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D5FA10F5AA;
	Wed,  4 May 2022 23:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87B510EC1E;
 Wed,  4 May 2022 23:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651707217; x=1683243217;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V8DN7hiINArvmBql69X4bcswhXZFwV1qi/fjI8rUQNQ=;
 b=SvrCIYoKI1/1BGAe3BpPK4D02Ea+sy2q/Rt1wmH+stlX5azw49asXnta
 jyF5VI5Omtwmc93Mx45Vbxcj8ocv8M+ASYVvrDm0V0ErzMst4p9VPRFtr
 zUyPGIkQ4Y+VPFPSo/DIWPyKxob5Vfr04lIYjZ3rimdaIs1b0FsJoJJJi s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 16:33:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 16:33:36 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 16:33:36 -0700
Received: from [10.38.244.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 4 May 2022
 16:33:32 -0700
Message-ID: <24844933-5711-87de-fe1c-21c8279d86e0@quicinc.com>
Date: Wed, 4 May 2022 16:33:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm: Fix shutdown
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220504154909.1.Iaebd35e60160fc0f2a50fac3a0bf3b298c0637c8@changeid>
 <62426006-b5a1-cbe7-9c3a-16f94334208f@quicinc.com>
 <CAA8EJppPqrvA6xz1ufTJf+QqwZ-6dzr4FGHQe+gKp1B8ALhjhg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppPqrvA6xz1ufTJf+QqwZ-6dzr4FGHQe+gKp1B8ALhjhg@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Lv Ruyi <lv.ruyi@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas
 Anderson <dianders@chromium.org>, Xu Wang <vulab@iscas.ac.cn>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org, Vinod
 Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/4/2022 4:30 PM, Dmitry Baryshkov wrote:
> On Thu, 5 May 2022 at 02:29, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 5/4/2022 3:49 PM, Douglas Anderson wrote:
>>> When rebooting on my sc7280-herobrine based device, I got a
>>> crash. Upon debugging, I found that I was in msm_drv_shutdown() and my
>>> "pdev" was the one associated with mdss_probe().
>>>
>>>   From source, I found that mdss_probe() has the line:
>>>     platform_set_drvdata(pdev, mdss);
>>> ...where "mdss" is of type "struct msm_mdss *".
>>>
>>> Also from source, I saw that in msm_drv_shutdown() we have the line:
>>>     struct msm_drm_private *priv = platform_get_drvdata(pdev);
>>>
>>> This is a mismatch and is the root of the problem.
>>>
>>> Further digging made it apparent that msm_drv_shutdown() is only
>>> supposed to be used for parts of the msm display framework that also
>>> call msm_drv_probe() but mdss_probe() doesn't call
>>> msm_drv_probe(). Let's remove the shutdown functon from msm_mdss.c.
>>>
>>> Digging a little further, code inspection found that two drivers that
>>> use msm_drv_probe() weren't calling msm_drv_shutdown(). Let's add it
>>> to them.
>>>
>>> Fixes: ecb23f2e3009 ("drm/msm: split the main platform driver")
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>
>> Makes sense to me, and issue should happen everytime we shutdown so not
>> sure how it didnt hit?
>>
>>> ---
>>>
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 +
>>>    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 1 +
>>>    drivers/gpu/drm/msm/msm_mdss.c           | 1 -
>>>    3 files changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index 143d6643be53..2b9d931474e0 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1350,6 +1350,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
>>>    static struct platform_driver dpu_driver = {
>>>        .probe = dpu_dev_probe,
>>>        .remove = dpu_dev_remove,
>>> +     .shutdown = msm_drv_shutdown,
>>>        .driver = {
>>>                .name = "msm_dpu",
>>>                .of_match_table = dpu_dt_match,
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> index 9b7bbc3adb97..3d5621a68f85 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
>>> @@ -1009,6 +1009,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
>>>    static struct platform_driver mdp5_driver = {
>>>        .probe = mdp5_dev_probe,
>>>        .remove = mdp5_dev_remove,
>>> +     .shutdown = msm_drv_shutdown,
>>>        .driver = {
>>>                .name = "msm_mdp",
>>>                .of_match_table = mdp5_dt_match,
>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>> index 20f154dda9cf..0454a571adf7 100644
>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>> @@ -397,7 +397,6 @@ MODULE_DEVICE_TABLE(of, mdss_dt_match);
>>>    static struct platform_driver mdss_platform_driver = {
>>>        .probe      = mdss_probe,
>>>        .remove     = mdss_remove,
>>> -     .shutdown   = msm_drv_shutdown,
>>
>> Question to doug/dmitry:
>>
>> Now that we removed msm_drv_shutdown, perhaps we should have a
>> mdss_shutdown instead and call msm_mdss_destroy() internally?
> 
> No need to. msm-mdss driver doesn't really need to be shutdown. It
> doesn't setup DMA, it doesn't setup video pipes, etc.

Alright,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
>>
>>>        .driver     = {
>>>                .name   = "msm-mdss",
>>>                .of_match_table = mdss_dt_match,
> 
> 
> 
