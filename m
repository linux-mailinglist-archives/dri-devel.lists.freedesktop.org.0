Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2097A851F47
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478CB10E11C;
	Mon, 12 Feb 2024 21:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HdZP9eWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A883B10E098;
 Mon, 12 Feb 2024 21:13:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41CJ09e9000678; Mon, 12 Feb 2024 21:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=dqVmm3pBAhEns04UFo6H2VS6wl1oYOeegL/1Xdq6Lts=; b=Hd
 ZP9eWX+m9GIeZEedobdjRWIuhs141rg1Zx6OtGVnNf2FAkjuC6QeMPNDYgs8L7AM
 niZOS6ihAGJqdxqtnnv5uXqLBluuMHcznqHhAgLsAX1fzu4PV55Lo4iQ+WVNko1c
 c3xoWEHCsYki9n5iYG7lQZZM8hqnvMvXmkIeh322dgdQzyDHpkZrfyfhZYtNokA0
 SkrkDEi40laylfDCPOvo5XXQO/ySI6pYXTsU4FcC7KfQsqunBr/YUiLW3BYNES9a
 3y2/SW4t/+VsM1IOVld2Gz/8iARn0tqlHduq3+2agOtkzZvk40CTYtnw06IChMz0
 jIXTxCkoPwUFqoeOtxgA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7ju79880-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 21:13:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CLDaFE002811
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Feb 2024 21:13:36 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 13:13:36 -0800
Message-ID: <04df55f1-9430-727b-426b-81d762b3b2e6@quicinc.com>
Date: Mon, 12 Feb 2024 13:13:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-20-quic_parellan@quicinc.com>
 <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
 <56e521ab-ae57-9296-59a1-0bdbad60f882@quicinc.com>
 <CAA8EJprUeJvL_mP0x19YQCdTbErzy-RRF6GmSOK_eApsRiTALw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprUeJvL_mP0x19YQCdTbErzy-RRF6GmSOK_eApsRiTALw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: d5nEktbuKIA0eH7fp28CPtbVWIPVcDP7
X-Proofpoint-GUID: d5nEktbuKIA0eH7fp28CPtbVWIPVcDP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120164
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/10/2024 1:17 PM, Dmitry Baryshkov wrote:
> On Sat, 10 Feb 2024 at 21:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/10/2024 3:33 AM, Dmitry Baryshkov wrote:
>>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>
>>>> All the components of YUV420 over DP are added. Therefore, let's mark the
>>>> connector property as true for DP connector when the DP type is not eDP
>>>> and when there is a CDM block available.
>>>>
>>>> Changes in v2:
>>>>           - Check for if dp_catalog has a CDM block available instead of
>>>>             checking if VSC SDP is allowed when setting the dp connector's
>>>>             ycbcr_420_allowed parameter
>>>>
>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
>>>>    drivers/gpu/drm/msm/dp/dp_drm.c         | 8 ++++++--
>>>>    drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
>>>>    drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
>>>>    5 files changed, 16 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> index 723cc1d821431..beeaabe499abf 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>> @@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>>>    {
>>>>           struct drm_encoder *encoder = NULL;
>>>>           struct msm_display_info info;
>>>> +       bool yuv_supported;
>>>>           int rc;
>>>>           int i;
>>>>
>>>> @@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>>>                           return PTR_ERR(encoder);
>>>>                   }
>>>>
>>>> -               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
>>>> +               yuv_supported = !!(dpu_kms->catalog->cdm);
>>>
>>> Drop parentheses please.
>>>
>>>> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
>>>>                   if (rc) {
>>>>                           DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>>>>                           return rc;
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index ebcc76ef1d590..9b9f5f2921903 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>>>>    }
>>>>
>>>>    int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>>>> -                       struct drm_encoder *encoder)
>>>> +                       struct drm_encoder *encoder, bool yuv_supported)
>>>>    {
>>>>           struct dp_display_private *dp_priv;
>>>>           int ret;
>>>> @@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>>>>                   return ret;
>>>>           }
>>>>
>>>> -       dp_display->connector = dp_drm_connector_init(dp_display, encoder);
>>>> +       dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
>>>>           if (IS_ERR(dp_display->connector)) {
>>>>                   ret = PTR_ERR(dp_display->connector);
>>>>                   DRM_DEV_ERROR(dev->dev,
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>> index 46e6889037e88..ab0d0d13b5e2c 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>>>> @@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>>>>    }
>>>>
>>>>    /* connector initialization */
>>>> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
>>>> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
>>>> +                                           bool yuv_supported)
>>>>    {
>>>>           struct drm_connector *connector = NULL;
>>>>
>>>> @@ -361,8 +362,11 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
>>>>           if (IS_ERR(connector))
>>>>                   return connector;
>>>>
>>>> -       if (!dp_display->is_edp)
>>>> +       if (!dp_display->is_edp) {
>>>>                   drm_connector_attach_dp_subconnector_property(connector);
>>>> +               if (yuv_supported)
>>>> +                       connector->ycbcr_420_allowed = true;
>>>
>>> Is there any reason to disallow YUV420 for eDP connectors?
>>>
>>>> +       }
>>>>
>>
>> Major reason was certainly validation but thinking about it more
>> closely, I need to check whether CDM over eDP is even possible.
>>
>> Historically, CDM could output only to HDMI OR WB using the bit we
>> program while setting up CDM and the same HDMI path is being used by DP
>> as well. But I need to check whether CDM can even output to eDP with the
>> same DP path. I dont have any documentation on this part yet.
> 
> I had the feeling that the DP / eDP difference on the chips is mostly
> on the PHY and software side. So I assumed that it should be possible
> to output YUV data to the eDP port in the same way as it is done for
> the DP port.
> 

This is true. I was not worried about DP / eDP controller but mostly 
whether eDP spec really allows YUV. From what I can read, it does.

So this check shall remain only because CDM has not been validated with eDP.

Do you need a TODO here and if we ever get a eDP panel which supports 
that, we can validate and relax this.
