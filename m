Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901777BEA1D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 20:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBF310E2CC;
	Mon,  9 Oct 2023 18:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D966410E2C7;
 Mon,  9 Oct 2023 18:51:40 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399EiUgn003163; Mon, 9 Oct 2023 18:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=emj3nK1Q6f+KnPtyRGL/3a6IOCTANRWXePViQYc/iYo=;
 b=WoI9Yn2PPn+dHQwKzzaMdEyNr8mXo/Y7bls5/EO9nchmHoqWTMtA4W7WDsZ7QMxoT3y2
 ez6u5vpJwFZOa3OCW9likT+vFJWA43gYZySQxTSDLUSrm1ooJAAYMak6lopQHOAfxQrb
 iPzIOTmVdDI9HqcfkI0i4hlwlms9iE6EzUWyG8B5IxuySCtgkauiKMPs+us8+wDlbMEG
 if08GtT6u2CxbYw+GOKWPAjMn1L14XIRGjbZ73NuM72NDS2SKXaqXL7HxgsXKK8PxBVs
 SNNZ7rgGV6rdLG6a9SGlMG+9PrPf615J9X0Hm6ibwsViZdI+eFP0Ck+Ktj2U9VUXwgUL sw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tmj2prsrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 18:51:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399IpYiK012529
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Oct 2023 18:51:34 GMT
Received: from [10.110.90.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 9 Oct
 2023 11:51:33 -0700
Message-ID: <e3208975-84cb-5c44-2397-c6b31103659b@quicinc.com>
Date: Mon, 9 Oct 2023 11:51:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 01/13] drm/msm/dsi: switch to devm_drm_bridge_add()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
 <20231009181040.2743847-2-dmitry.baryshkov@linaro.org>
 <9cd7fcd1-19c3-ed9b-568d-4b67b3649e86@quicinc.com>
 <0b201558-d794-4675-a20f-58d00a8b1a53@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <0b201558-d794-4675-a20f-58d00a8b1a53@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 5CpM0PTN19yz_z69mU-0yGnGOPl2I87l
X-Proofpoint-GUID: 5CpM0PTN19yz_z69mU-0yGnGOPl2I87l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_17,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090154
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/9/2023 11:46 AM, Dmitry Baryshkov wrote:
> On 09/10/2023 21:39, Abhinav Kumar wrote:
>>
>>
>> On 10/9/2023 11:10 AM, Dmitry Baryshkov wrote:
>>> Make MSM DSI driver use devm_drm_bridge_add() instead of plain
>>> drm_bridge_add(). As the driver doesn't require any additional cleanup,
>>> stop adding created bridge to the priv->bridges array.
>>>
>>> Reviewed-by: Rob Clark <robdclark@gmail.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi.c         | 28 +++++--------------------
>>>   drivers/gpu/drm/msm/dsi/dsi.h         |  3 +--
>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++------------------
>>>   3 files changed, 16 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi.c
>>> index d45e43024802..47f327e68471 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>>> @@ -215,20 +215,14 @@ void __exit msm_dsi_unregister(void)
>>>   int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device 
>>> *dev,
>>>                struct drm_encoder *encoder)
>>>   {
>>> -    struct msm_drm_private *priv = dev->dev_private;
>>>       int ret;
>>> -    if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>>> -        DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>>> -        return -ENOSPC;
>>> -    }
>>> -
>>>       msm_dsi->dev = dev;
>>>       ret = msm_dsi_host_modeset_init(msm_dsi->host, dev);
>>>       if (ret) {
>>>           DRM_DEV_ERROR(dev->dev, "failed to modeset init host: 
>>> %d\n", ret);
>>> -        goto fail;
>>> +        return ret;
>>>       }
>>>       if (msm_dsi_is_bonded_dsi(msm_dsi) &&
>>> @@ -242,32 +236,20 @@ int msm_dsi_modeset_init(struct msm_dsi 
>>> *msm_dsi, struct drm_device *dev,
>>>       msm_dsi->encoder = encoder;
>>> -    msm_dsi->bridge = msm_dsi_manager_bridge_init(msm_dsi->id);
>>> -    if (IS_ERR(msm_dsi->bridge)) {
>>> -        ret = PTR_ERR(msm_dsi->bridge);
>>> +    ret = msm_dsi_manager_bridge_init(msm_dsi);
>>> +    if (ret) {
>>>           DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: 
>>> %d\n", ret);
>>> -        msm_dsi->bridge = NULL;
>>> -        goto fail;
>>> +        return ret;
>>>       }
>>>       ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id);
>>>       if (ret) {
>>>           DRM_DEV_ERROR(dev->dev,
>>>               "failed to create dsi connector: %d\n", ret);
>>> -        goto fail;
>>> +        return ret;
>>>       }
>>> -    priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
>>> -
>>>       return 0;
>>> -fail:
>>> -    /* bridge/connector are normally destroyed by drm: */
>>> -    if (msm_dsi->bridge) {
>>> -        msm_dsi_manager_bridge_destroy(msm_dsi->bridge);
>>> -        msm_dsi->bridge = NULL;
>>> -    }
>>
>> We can drop msm_dsi_manager_bridge_destroy() now but dont we need to 
>> keep the part to reset msm_dsi->bridge to NULL in the fail tag if 
>> msm_dsi_manager_ext_bridge_init() fails?
> 
> What for? This field is not read in the error /unbinding path.
> I'll send a followup that drops msm_dsi->bridge completely.
> 

Not used in the error path. The behavior before this patch was, if 
msm_dsi_manager_ext_bridge_init failed, it was marking msm_dsi->bridge 
as NULL. Thats what I thought you would want to retain till you drop the 
msm_dsi->bridge.

OR you can even add that line in the if (ret) of 
msm_dsi_manager_ext_bridge_init(msm_dsi->id); failure.

>>
>>> -
>>> -    return ret;
>>>   }
>>>   void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct 
>>> msm_dsi *msm_dsi)
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h 
>>> b/drivers/gpu/drm/msm/dsi/dsi.h
>>> index d21867da78b8..a01c326774a6 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi.h
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
>>> @@ -56,8 +56,7 @@ struct msm_dsi {
>>>   };
>>>   /* dsi manager */
>>> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id);
>>> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge);
>>> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi);
>>>   int msm_dsi_manager_ext_bridge_init(u8 id);
>>>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
>>>   bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> index 28b8012a21f2..17aa19bb6510 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> @@ -466,9 +466,8 @@ static const struct drm_bridge_funcs 
>>> dsi_mgr_bridge_funcs = {
>>>   };
>>>   /* initialize bridge */
>>> -struct drm_bridge *msm_dsi_manager_bridge_init(u8 id)
>>> +int msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi)
>>>   {
>>> -    struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>>       struct drm_bridge *bridge = NULL;
>>>       struct dsi_bridge *dsi_bridge;
>>>       struct drm_encoder *encoder;
>>> @@ -476,31 +475,27 @@ struct drm_bridge 
>>> *msm_dsi_manager_bridge_init(u8 id)
>>>       dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
>>>                   sizeof(*dsi_bridge), GFP_KERNEL);
>>> -    if (!dsi_bridge) {
>>> -        ret = -ENOMEM;
>>> -        goto fail;
>>> -    }
>>> +    if (!dsi_bridge)
>>> +        return -ENOMEM;
>>> -    dsi_bridge->id = id;
>>> +    dsi_bridge->id = msm_dsi->id;
>>>       encoder = msm_dsi->encoder;
>>>       bridge = &dsi_bridge->base;
>>>       bridge->funcs = &dsi_mgr_bridge_funcs;
>>> -    drm_bridge_add(bridge);
>>> +    ret = devm_drm_bridge_add(&msm_dsi->pdev->dev, bridge);
>>> +    if (ret)
>>> +        return ret;
>>>       ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>>>       if (ret)
>>> -        goto fail;
>>> +        return ret;
>>> -    return bridge;
>>> +    msm_dsi->bridge = bridge;
>>> -fail:
>>> -    if (bridge)
>>> -        msm_dsi_manager_bridge_destroy(bridge);
>>> -
>>> -    return ERR_PTR(ret);
>>> +    return 0;
>>>   }
>>>   int msm_dsi_manager_ext_bridge_init(u8 id)
>>> @@ -557,11 +552,6 @@ int msm_dsi_manager_ext_bridge_init(u8 id)
>>>       return 0;
>>>   }
>>> -void msm_dsi_manager_bridge_destroy(struct drm_bridge *bridge)
>>> -{
>>> -    drm_bridge_remove(bridge);
>>> -}
>>> -
>>>   int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg)
>>>   {
>>>       struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
> 
