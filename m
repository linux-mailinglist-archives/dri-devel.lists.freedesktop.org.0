Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9107569F7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 19:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214B210E289;
	Mon, 17 Jul 2023 17:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F1F10E288;
 Mon, 17 Jul 2023 17:16:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36HEHfQZ012945; Mon, 17 Jul 2023 17:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=t+CibPKYMmmxXaBrz9AbPzPKG7TqeWT9CulsqR4PHuU=;
 b=ktWzQtnXTgPtTpqk/h46JCU14q9veHGxfLvKPUZBZmbJ/dmWS1xNVliWHBJyMR1+YAP4
 u6JmcDu7Ec9T/zBQiCpazBibibDjIpzTXZQQUdWiBVyQGL8nQgDrjFWmcPaIG0TDYs34
 LkUowx64FbvdZ2v6qWesVy9KsarUw8kYnkxUH9j+CoI54VJWbTh9PttVxR2vQiMkqv0/
 3HYfh5PCQ1h9LY0994I8hDKxT8N1lSdEdKby75r7neZAQyfK1eg8rDfNx7zJOsH31wB1
 bL55ixhSxHwj0NUkvpSS0/8pUaucYE8NiuadOwUrCMcdV+y4JYdHm/F/tTMTfeyQlMUK hA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run09v4qk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 17:16:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36HHGYA5028695
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 17:16:34 GMT
Received: from [10.71.108.91] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 17 Jul
 2023 10:16:33 -0700
Message-ID: <8bc82b4b-b169-a11b-9f5d-eb821b680af7@quicinc.com>
Date: Mon, 17 Jul 2023 10:16:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 4/5] drm/msm/dp: move relevant dp initialization code
 from bind() to probe()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <andersson@kernel.org>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-5-git-send-email-quic_khsieh@quicinc.com>
 <121f82ad-9d5d-6d7f-b4ae-9a371ab49ef7@linaro.org>
 <9df52052-93fd-75a4-b54c-02ed9554e15f@quicinc.com>
 <3fa812d6-9222-065a-8b40-95c2f2c808a6@linaro.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <3fa812d6-9222-065a-8b40-95c2f2c808a6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KAMvzj5dbS38MwgCxAlfxehCzfQaxPWO
X-Proofpoint-GUID: KAMvzj5dbS38MwgCxAlfxehCzfQaxPWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_13,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170159
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
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/10/2023 11:13 AM, Dmitry Baryshkov wrote:
> On 10/07/2023 19:57, Kuogee Hsieh wrote:
>>
>> On 7/7/2023 5:11 PM, Dmitry Baryshkov wrote:
>>> On 08/07/2023 02:52, Kuogee Hsieh wrote:
>>>> In preparation of moving edp of_dp_aux_populate_bus() to
>>>> dp_display_probe(), move dp_display_request_irq(),
>>>> dp->parser->parse() and dp_power_client_init() to dp_display_probe()
>>>> too.
>>>>
>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/dp/dp_display.c | 48 
>>>> +++++++++++++++++--------------------
>>>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 -
>>>>   2 files changed, 22 insertions(+), 27 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 44580c2..185f1eb 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -290,12 +290,6 @@ static int dp_display_bind(struct device *dev, 
>>>> struct device *master,
>>>>           goto end;
>>>>       }
>>>>   -    rc = dp_power_client_init(dp->power);
>>>> -    if (rc) {
>>>> -        DRM_ERROR("Power client create failed\n");
>>>> -        goto end;
>>>> -    }
>>>> -
>>>>       rc = dp_register_audio_driver(dev, dp->audio);
>>>>       if (rc) {
>>>>           DRM_ERROR("Audio registration Dp failed\n");
>>>> @@ -752,6 +746,12 @@ static int dp_init_sub_modules(struct 
>>>> dp_display_private *dp)
>>>>           goto error;
>>>>       }
>>>>   +    rc = dp->parser->parse(dp->parser);
>>>> +    if (rc) {
>>>> +        DRM_ERROR("device tree parsing failed\n");
>>>> +        goto error;
>>>> +    }
>>>> +
>>>>       dp->catalog = dp_catalog_get(dev, &dp->parser->io);
>>>>       if (IS_ERR(dp->catalog)) {
>>>>           rc = PTR_ERR(dp->catalog);
>>>> @@ -768,6 +768,12 @@ static int dp_init_sub_modules(struct 
>>>> dp_display_private *dp)
>>>>           goto error;
>>>>       }
>>>>   +    rc = dp_power_client_init(dp->power);
>>>> +    if (rc) {
>>>> +        DRM_ERROR("Power client create failed\n");
>>>> +        goto error;
>>>> +    }
>>>> +
>>>>       dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
>>>>       if (IS_ERR(dp->aux)) {
>>>>           rc = PTR_ERR(dp->aux);
>>>> @@ -1196,26 +1202,20 @@ static irqreturn_t 
>>>> dp_display_irq_handler(int irq, void *dev_id)
>>>>       return ret;
>>>>   }
>>>>   -int dp_display_request_irq(struct msm_dp *dp_display)
>>>> +static int dp_display_request_irq(struct dp_display_private *dp)
>>>>   {
>>>>       int rc = 0;
>>>> -    struct dp_display_private *dp;
>>>> -
>>>> -    if (!dp_display) {
>>>> -        DRM_ERROR("invalid input\n");
>>>> -        return -EINVAL;
>>>> -    }
>>>> -
>>>> -    dp = container_of(dp_display, struct dp_display_private, 
>>>> dp_display);
>>>> +    struct device *dev = &dp->pdev->dev;
>>>>   -    dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
>>>>       if (!dp->irq) {
>>>> -        DRM_ERROR("failed to get irq\n");
>>>> -        return -EINVAL;
>>>> +        dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
>>>> +        if (!dp->irq) {
>>>> +            DRM_ERROR("failed to get irq\n");
>>>> +            return -EINVAL;
>>>> +        }
>>>>       }
>>>
>>> Use platform_get_irq() from probe() function.
>>>
>>>>   -    rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
>>>> -            dp_display_irq_handler,
>>>> +    rc = devm_request_irq(dev, dp->irq, dp_display_irq_handler,
>>>>               IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
>>>
>>>
>>>>       if (rc < 0) {
>>>>           DRM_ERROR("failed to request IRQ%u: %d\n",
>>>> @@ -1290,6 +1290,8 @@ static int dp_display_probe(struct 
>>>> platform_device *pdev)
>>>>         platform_set_drvdata(pdev, &dp->dp_display);
>>>>   +    dp_display_request_irq(dp);
>>>> +
>>>
>>> Error checking?
>>> Are we completely ready to handle interrupts at this point?
>> not until dp_display_host_init() is called which will be called from 
>> pm_runtime_resume() later.
>
> But once you request_irq(), you should be ready for the IRQs to be 
> delivered right away.

At this point, the DP controller interrupts mask bit is not enabled yet.

Therefore interrupts will not happen until dp_bridge_hpd_enable() is 
called to initialize dp host  controller and then enabled mask bits.

>
>>>
>>>>       rc = component_add(&pdev->dev, &dp_display_comp_ops);
>>>>       if (rc) {
>>>>           DRM_ERROR("component add failed, rc=%d\n", rc);
>>>> @@ -1574,12 +1576,6 @@ int msm_dp_modeset_init(struct msm_dp 
>>>> *dp_display, struct drm_device *dev,
>>>>         dp_priv = container_of(dp_display, struct 
>>>> dp_display_private, dp_display);
>>>>   -    ret = dp_display_request_irq(dp_display);
>>>> -    if (ret) {
>>>> -        DRM_ERROR("request_irq failed, ret=%d\n", ret);
>>>> -        return ret;
>>>> -    }
>>>> -
>>>>       ret = dp_display_get_next_bridge(dp_display);
>>>>       if (ret)
>>>>           return ret;
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h 
>>>> b/drivers/gpu/drm/msm/dp/dp_display.h
>>>> index 1e9415a..b3c08de 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>>>> @@ -35,7 +35,6 @@ struct msm_dp {
>>>>   int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>>>>           hdmi_codec_plugged_cb fn, struct device *codec_dev);
>>>>   int dp_display_get_modes(struct msm_dp *dp_display);
>>>> -int dp_display_request_irq(struct msm_dp *dp_display);
>>>>   bool dp_display_check_video_test(struct msm_dp *dp_display);
>>>>   int dp_display_get_test_bpp(struct msm_dp *dp_display);
>>>>   void dp_display_signal_audio_start(struct msm_dp *dp_display);
>>>
>
