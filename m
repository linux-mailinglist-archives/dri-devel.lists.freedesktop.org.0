Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3280B7BEADD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 21:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC1A10E2DE;
	Mon,  9 Oct 2023 19:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7182A10E2D9;
 Mon,  9 Oct 2023 19:50:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399JGZpl018402; Mon, 9 Oct 2023 19:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8/PXjjuciQ0w4GvHV+JaaMpFs9iyNbXZxHW6oLLJcSM=;
 b=p1uEa9vwTiHuYoc/OaVURwSIeeWdvz85EEwwgPZxcFXWF20Zs40RWIQfraKOFg/FkkoE
 VLVQ2kCqme5QiNFiQ5y6eiOjZuBnkpp12lJGxfMTUmrf2mrOPDsKyqcbJNSNWItav01Z
 F1LbsdxwXVjPD/NkusUcoZd7PRr1qOpdkhlP/nQeDriAA8/4+5SMaSwQldDPt0flJyhr
 IWxAICJhewLhtDaRSywIOyFVLjBErhcwjX2CMpBoKMED1F+mUsyxPIGg2qYP/dAyJCS8
 /hPnBXStVKLLjrm1i48YH9fwift76XdRaJdwN8TF5gHGCHLEmetNlaEoHdi7RAeFqiKO 2g== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkh593bht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 19:50:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399Joidi029731
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Oct 2023 19:50:44 GMT
Received: from [10.110.90.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 9 Oct
 2023 12:50:43 -0700
Message-ID: <1c320947-c9dd-7ba9-bc40-d5d82cc478fb@quicinc.com>
Date: Mon, 9 Oct 2023 12:50:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 02/13] drm/msm/hdmi: switch to devm_drm_bridge_add()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-3-dmitry.baryshkov@linaro.org>
 <d56daed9-35ac-0ee3-a0b4-f8596b0490fc@quicinc.com>
 <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <aafb04ea-fde3-4c1b-aae4-5e7e50a945d6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CffDVlnv51yh5j4sb82MACS2_1mYqhnD
X-Proofpoint-GUID: CffDVlnv51yh5j4sb82MACS2_1mYqhnD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_17,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 mlxlogscore=771
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090160
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/9/2023 12:21 PM, Dmitry Baryshkov wrote:
> On 09/10/2023 22:19, Abhinav Kumar wrote:
>>
>>
>> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>>> Make MSM HDMI driver use devm_drm_bridge_add() instead of plain
>>> drm_bridge_add(). As the driver doesn't require any additional cleanup,
>>> stop adding created bridge to the priv->bridges array.
>>>
>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/hdmi/hdmi.c        | 22 +++++--------------
>>>   drivers/gpu/drm/msm/hdmi/hdmi.h        |  5 ++---
>>>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 30 ++++++++------------------
>>>   drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    |  3 +--
>>>   4 files changed, 17 insertions(+), 43 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c 
>>> b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> index b6bcb9f675fe..c8ebd75176bb 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>>> @@ -160,24 +160,16 @@ static int msm_hdmi_init(struct hdmi *hdmi)
>>>   int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>           struct drm_device *dev, struct drm_encoder *encoder)
>>>   {
>>> -    struct msm_drm_private *priv = dev->dev_private;
>>>       int ret;
>>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>>> -        return -ENOSPC;
>>> -    }
>>> -
>>>       hdmi->dev = dev;
>>>       hdmi->encoder = encoder;
>>>       hdmi_audio_infoframe_init(&hdmi->audio.infoframe);
>>> -    hdmi->bridge = msm_hdmi_bridge_init(hdmi);
>>> -    if (IS_ERR(hdmi->bridge)) {
>>> -        ret = PTR_ERR(hdmi->bridge);
>>> +    ret = msm_hdmi_bridge_init(hdmi);
>>> +    if (ret) {
>>>           DRM_DEV_ERROR(dev->dev, "failed to create HDMI bridge: 
>>> %d\n", ret);
>>> -        hdmi->bridge = NULL;
>>>           goto fail;
>>>       }
>>> @@ -215,16 +207,9 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>>>           goto fail;
>>>       }
>>> -    priv->bridges[priv->num_bridges++]       = hdmi->bridge;
>>> -
>>>       return 0;
>>>   fail:
>>> -    /* bridge is normally destroyed by drm: */
>>> -    if (hdmi->bridge) {
>>> -        msm_hdmi_bridge_destroy(hdmi->bridge);
>>> -        hdmi->bridge = NULL;
>>> -    }
>>>       if (hdmi->connector) {
>>>           hdmi->connector->funcs->destroy(hdmi->connector);
>>>           hdmi->connector = NULL;
>>> @@ -395,6 +380,9 @@ static void msm_hdmi_unbind(struct device *dev, 
>>> struct device *master,
>>>           if (priv->hdmi->audio_pdev)
>>>               platform_device_unregister(priv->hdmi->audio_pdev);
>>> +        if (priv->hdmi->bridge)
>>> +            msm_hdmi_hpd_disable(priv->hdmi);
>>> +
>>
>> Now is this the only place where hdmi->bridge is used?
>>
>> Why cant we just keep msm_hdmi_hpd_disable(priv->hdmi) here since its 
>> anyway protected by if (priv->hdmi) and drop hdmi->bridge completely?
> 
> Sure, sounds like a good idea, same followup as for the DSI.

Ok, this is fine then,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
>>
>>>           msm_hdmi_destroy(priv->hdmi);
>>>           priv->hdmi = NULL;
>>>       }
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h 
>>> b/drivers/gpu/drm/msm/hdmi/hdmi.h
>>> index e8dbee50637f..ec5786440391 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.h
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
>>> @@ -224,14 +224,13 @@ void msm_hdmi_audio_set_sample_rate(struct hdmi 
>>> *hdmi, int rate);
>>>    * hdmi bridge:
>>>    */
>>> -struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi);
>>> -void msm_hdmi_bridge_destroy(struct drm_bridge *bridge);
>>> +int msm_hdmi_bridge_init(struct hdmi *hdmi);
>>>   void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
>>>   enum drm_connector_status msm_hdmi_bridge_detect(
>>>           struct drm_bridge *bridge);
>>>   int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
>>> -void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge);
>>> +void msm_hdmi_hpd_disable(struct hdmi *hdmi);
>>>   /*
>>>    * i2c adapter for ddc:
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c 
>>> b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>>> index 9b1391d27ed3..0b7a6a56677e 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>>> @@ -11,14 +11,6 @@
>>>   #include "msm_kms.h"
>>>   #include "hdmi.h"
>>> -void msm_hdmi_bridge_destroy(struct drm_bridge *bridge)
>>> -{
>>> -    struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>>> -
>>> -    msm_hdmi_hpd_disable(hdmi_bridge);
>>> -    drm_bridge_remove(bridge);
>>> -}
>>> -
>>>   static void msm_hdmi_power_on(struct drm_bridge *bridge)
>>>   {
>>>       struct drm_device *dev = bridge->dev;
>>> @@ -317,7 +309,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
>>>   }
>>>   /* initialize bridge */
>>> -struct drm_bridge *msm_hdmi_bridge_init(struct hdmi *hdmi)
>>> +int msm_hdmi_bridge_init(struct hdmi *hdmi)
>>>   {
>>>       struct drm_bridge *bridge = NULL;
>>>       struct hdmi_bridge *hdmi_bridge;
>>> @@ -325,10 +317,8 @@ struct drm_bridge *msm_hdmi_bridge_init(struct 
>>> hdmi *hdmi)
>>>       hdmi_bridge = devm_kzalloc(hdmi->dev->dev,
>>>               sizeof(*hdmi_bridge), GFP_KERNEL);
>>> -    if (!hdmi_bridge) {
>>> -        ret = -ENOMEM;
>>> -        goto fail;
>>> -    }
>>> +    if (!hdmi_bridge)
>>> +        return -ENOMEM;
>>>       hdmi_bridge->hdmi = hdmi;
>>>       INIT_WORK(&hdmi_bridge->hpd_work, msm_hdmi_hotplug_work);
>>> @@ -341,17 +331,15 @@ struct drm_bridge *msm_hdmi_bridge_init(struct 
>>> hdmi *hdmi)
>>>           DRM_BRIDGE_OP_DETECT |
>>>           DRM_BRIDGE_OP_EDID;
>>> -    drm_bridge_add(bridge);
>>> +    ret = devm_drm_bridge_add(&hdmi->pdev->dev, bridge);
>>> +    if (ret)
>>> +        return ret;
>>>       ret = drm_bridge_attach(hdmi->encoder, bridge, NULL, 
>>> DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>>       if (ret)
>>> -        goto fail;
>>> +        return ret;
>>> -    return bridge;
>>> +    hdmi->bridge = bridge;
>>> -fail:
>>> -    if (bridge)
>>> -        msm_hdmi_bridge_destroy(bridge);
>>> -
>>> -    return ERR_PTR(ret);
>>> +    return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c 
>>> b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
>>> index bfa827b47989..9ce0ffa35417 100644
>>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
>>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
>>> @@ -147,9 +147,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
>>>       return ret;
>>>   }
>>> -void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
>>> +void msm_hdmi_hpd_disable(struct hdmi *hdmi)
>>>   {
>>> -    struct hdmi *hdmi = hdmi_bridge->hdmi;
>>>       const struct hdmi_platform_config *config = hdmi->config;
>>>       struct device *dev = &hdmi->pdev->dev;
>>>       int ret;
> 
