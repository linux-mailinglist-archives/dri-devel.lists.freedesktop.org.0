Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055A6A88A4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 19:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA6A10E276;
	Thu,  2 Mar 2023 18:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C4910E0FF;
 Thu,  2 Mar 2023 18:41:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322IcJhO030783; Thu, 2 Mar 2023 18:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bRyFc/Kw+nJ5cLiX0s250+UlY1w1KLIoKi80xX2p8XU=;
 b=VHleJXsE/Ppb1Bqfbi2HwWKWI99LfcpjKmTrWR97nwNA8FflU/DN0WqOEDQZ59g4hBcX
 0WdpgqqPh+fatjki/+tWXWf/HwRHVEa2IEz1Ofozr5oQKDuE1lnDdp6w9b3G/QBvuyV5
 qz9rd1PblUtsimSBDTo+S5Lcx3yllRymAavJjXYdUV1QzNJezrDlVYncLkVX7I0oiriu
 K3uTuy7wTjPwVyVHyAvQ1tqYJ/fXgLq0yj1fhCsyIj0bM3SbB0abwMwzFCtKzO+Myx23
 skDFE/UHX8y80ZC2XcrYs9jCtQGnvCe4jlrVtADIHCho4NkuPfbs6V95TfWqY7ogLi+z 6g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p2veerwb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 18:41:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 322IfbON001668
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Mar 2023 18:41:37 GMT
Received: from [10.110.57.196] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 2 Mar 2023
 10:41:36 -0800
Message-ID: <dddd3f2f-28e7-2188-5498-399cdb75adb4@quicinc.com>
Date: Thu, 2 Mar 2023 10:41:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/msm/dp: check core_initialized flag at both
 host_init() and host_deinit()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1677629817-18891-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpquZAhn+HswNxardN1fE8Zu1CKrCU5EiX=B8mGWuxfWnQ@mail.gmail.com>
 <38bf75b4-799a-9758-aae3-69a7e0fc3f58@quicinc.com>
 <86787af0-aa95-a2d8-d68c-555be54a3784@linaro.org>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <86787af0-aa95-a2d8-d68c-555be54a3784@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2_UMr3e9xJVKv31_Koa9X_PBO2l-oaHA
X-Proofpoint-GUID: 2_UMr3e9xJVKv31_Koa9X_PBO2l-oaHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_11,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020159
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/1/2023 1:15 PM, Dmitry Baryshkov wrote:
> On 01/03/2023 18:57, Kuogee Hsieh wrote:
>>
>> On 2/28/2023 6:16 PM, Dmitry Baryshkov wrote:
>>> On Wed, 1 Mar 2023 at 02:17, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>>> wrote:
>>>> There is a reboot/suspend test case where system suspend is forced
>>>> during system booting up. Since dp_display_host_init() of external
>>>> DP is executed at hpd thread context, this test case may created a
>>>> scenario that dp_display_host_deinit() from pm_suspend() run before
>>>> dp_display_host_init() if hpd thread has no chance to run during
>>>> booting up while suspend request command was issued. At this scenario
>>>> system will crash at aux register access at dp_display_host_deinit()
>>>> since aux clock had not yet been enabled by dp_display_host_init().
>>>> Therefore we have to ensure aux clock enabled by checking
>>>> core_initialized flag before access aux registers at pm_suspend.
>>> Can a call to dp_display_host_init() be moved from
>>> dp_display_config_hpd() to dp_display_bind()?
>>
>> yes,  Sankeerth's  "drm/msm/dp: enable pm_runtime support for dp 
>> driver" patch is doing that which is under review.
>>
>> https://patchwork.freedesktop.org/patch/523879/?series=114297&rev=1
>
> No, he is doing another thing. He is moving these calls to pm_runtime 
> callbacks, not to the dp_display_bind().
>
>>> Related question: what is the primary reason for having
>>> EV_HPD_INIT_SETUP and calling dp_display_config_hpd() via the event
>>> thread? Does DP driver really depend on DPU irqs being installed? As
>>> far as I understand, DP device uses MDSS interrupts and those IRQs are
>>> available and working at the time of dp_display_probe() /
>>> dp_display_bind().
>>
>> HDP gpio pin has to run through DP aux module 100ms denouncing logic 
>> and have its mask bits.
>>
>> Therefore DP irq has to be enabled to receive DP isr with mask bits set.
>
> So... DP irq is enabled by the MDSS, not by the DPU. Again, why does 
> DP driver depend on DPU irqs being installed?

sorry, previously i mis understand your question -- why does DP driver 
depend on DPU irqs being installed?

now, I think you are asking why  dpu_irq_postinstall() ==> 
msm_dp_irq_postinstall() ==> event_thread ==> dp_display_config_hdp() 
==> enable_irq(dp->irq)

With the below test i had run, i think the reason is to make sure 
dp->irq be requested before enable it.

I just run the execution timing order test and collect execution order 
as descending order at below,

1) dp_display_probe() -- start

2) dp_display_bind()

3) msm_dp_modeset_init()  ==> dp_display_request_irq() ==> 
dp_display_get_next_bridge()

4) dpu_irq_postinstall() ==> msm_dp_irq_postinstall() ==> 
enable_irq(dp->irq)

5) dp_display_probe() -- end

dp->irq is request at msm_dp_modeset_init() and enabled after.

That bring up the issue to move DP's dp_display_host_init() executed at 
dp_display_bind().

Since eDP have dp_dispaly_host_init() executed at 
dp_display_get_next_bridge() which executed after dp_display_bind().

If moved DP's dp_display_host_init() to dp_dispaly_bind() which means DP 
will be ready to receive HPD irq before eDP ready.

This may create some uncertainties at execution flow and complicate 
things up.


>
>> Similar mechanism is used for mdp, dsi, etc.
>
> And none of them uses irq_postinstall callback.
>
>>
>>
>>>> Changes in v2:
>>>> -- at commit text, dp_display_host_init() instead of host_init()
>>>> -- at commit text, dp_display_host_deinit() instead of host_deinit()
>>>>
>>>> Changes in v3:
>>>> -- re arrange to avoid commit text line over 75 chars
>>>>
>>>> Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until 
>>>> plugin interrupt received")
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++--------
>>>>   1 file changed, 12 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index bde1a7c..1850738 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -460,10 +460,12 @@ static void dp_display_host_init(struct 
>>>> dp_display_private *dp)
>>>>                  dp->dp_display.connector_type, dp->core_initialized,
>>>>                  dp->phy_initialized);
>>>>
>>>> -       dp_power_init(dp->power, false);
>>>> -       dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>>>> -       dp_aux_init(dp->aux);
>>>> -       dp->core_initialized = true;
>>>> +       if (!dp->core_initialized) {
>>>> +               dp_power_init(dp->power, false);
>>>> +               dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
>>>> +               dp_aux_init(dp->aux);
>>>> +               dp->core_initialized = true;
>>>> +       }
>>>>   }
>>>>
>>>>   static void dp_display_host_deinit(struct dp_display_private *dp)
>>>> @@ -472,10 +474,12 @@ static void dp_display_host_deinit(struct 
>>>> dp_display_private *dp)
>>>>                  dp->dp_display.connector_type, dp->core_initialized,
>>>>                  dp->phy_initialized);
>>>>
>>>> -       dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>>>> -       dp_aux_deinit(dp->aux);
>>>> -       dp_power_deinit(dp->power);
>>>> -       dp->core_initialized = false;
>>>> +       if (dp->core_initialized) {
>>>> +               dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
>>>> +               dp_aux_deinit(dp->aux);
>>>> +               dp_power_deinit(dp->power);
>>>> +               dp->core_initialized = false;
>>>> +       }
>>>>   }
>>>>
>>>>   static int dp_display_usbpd_configure_cb(struct device *dev)
>>>> -- 
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>>>> Forum,
>>>> a Linux Foundation Collaborative Project
>>>>
>>>
>
