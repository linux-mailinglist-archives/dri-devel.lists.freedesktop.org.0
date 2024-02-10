Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F53850618
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 20:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E6110E281;
	Sat, 10 Feb 2024 19:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="W7piNZCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A44F10E281;
 Sat, 10 Feb 2024 19:20:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41AJ0lOg004776; Sat, 10 Feb 2024 19:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=rd9Y0Xc1b1A1FRkg3nQx8BqD1vYSBJ3I+TKY3Jjq5ds=; b=W7
 piNZCVgGmi+RfQXksBonE57JDR0kTH6WOXsXW/7Sn2e5WY0JnTz9mUffsEsiSraF
 r+h0xEsDl8NVDlWScV7Ymw7KVgFMqcox8i4Or6xcymX8Cxf2O0DrZiuf+R4pstdC
 btjvfPq0ekOn9MaLkAdMSubA+oFKq4oJVoABgK1/Y4qLJPEVCQnu7d5x+/ND+cfu
 m2UQwOsiofCm7ePu8wrypcJwfgHfqeHTeqvthK6l7+8ic4z/ZmNKOJuIc3yJq7+U
 0I2ttPJ+BkQzAqFqIo9lk9SlYY6gLTRTD7lLFKP7dXD0ylpgNmUgPWFxnqFu3ZRP
 BShx49BNJ+x375rRMykA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62r10v2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 19:19:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41AJJsIe023992
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 19:19:54 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 10 Feb
 2024 11:19:53 -0800
Message-ID: <56e521ab-ae57-9296-59a1-0bdbad60f882@quicinc.com>
Date: Sat, 10 Feb 2024 11:19:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Paloma Arellano
 <quic_parellan@quicinc.com>
CC: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-20-quic_parellan@quicinc.com>
 <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: BOg74nv_Prek1KWAPvv_EyoiuLRjgKR8
X-Proofpoint-ORIG-GUID: BOg74nv_Prek1KWAPvv_EyoiuLRjgKR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_18,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402100161
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



On 2/10/2024 3:33 AM, Dmitry Baryshkov wrote:
> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>
>> All the components of YUV420 over DP are added. Therefore, let's mark the
>> connector property as true for DP connector when the DP type is not eDP
>> and when there is a CDM block available.
>>
>> Changes in v2:
>>          - Check for if dp_catalog has a CDM block available instead of
>>            checking if VSC SDP is allowed when setting the dp connector's
>>            ycbcr_420_allowed parameter
>>
>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
>>   drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
>>   drivers/gpu/drm/msm/dp/dp_drm.c         | 8 ++++++--
>>   drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
>>   drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
>>   5 files changed, 16 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 723cc1d821431..beeaabe499abf 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>   {
>>          struct drm_encoder *encoder = NULL;
>>          struct msm_display_info info;
>> +       bool yuv_supported;
>>          int rc;
>>          int i;
>>
>> @@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>                          return PTR_ERR(encoder);
>>                  }
>>
>> -               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
>> +               yuv_supported = !!(dpu_kms->catalog->cdm);
> 
> Drop parentheses please.
> 
>> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
>>                  if (rc) {
>>                          DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>>                          return rc;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index ebcc76ef1d590..9b9f5f2921903 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>>   }
>>
>>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>> -                       struct drm_encoder *encoder)
>> +                       struct drm_encoder *encoder, bool yuv_supported)
>>   {
>>          struct dp_display_private *dp_priv;
>>          int ret;
>> @@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>>                  return ret;
>>          }
>>
>> -       dp_display->connector = dp_drm_connector_init(dp_display, encoder);
>> +       dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
>>          if (IS_ERR(dp_display->connector)) {
>>                  ret = PTR_ERR(dp_display->connector);
>>                  DRM_DEV_ERROR(dev->dev,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
>> index 46e6889037e88..ab0d0d13b5e2c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
>> @@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>>   }
>>
>>   /* connector initialization */
>> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
>> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
>> +                                           bool yuv_supported)
>>   {
>>          struct drm_connector *connector = NULL;
>>
>> @@ -361,8 +362,11 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
>>          if (IS_ERR(connector))
>>                  return connector;
>>
>> -       if (!dp_display->is_edp)
>> +       if (!dp_display->is_edp) {
>>                  drm_connector_attach_dp_subconnector_property(connector);
>> +               if (yuv_supported)
>> +                       connector->ycbcr_420_allowed = true;
> 
> Is there any reason to disallow YUV420 for eDP connectors?
> 
>> +       }
>>

Major reason was certainly validation but thinking about it more 
closely, I need to check whether CDM over eDP is even possible.

Historically, CDM could output only to HDMI OR WB using the bit we 
program while setting up CDM and the same HDMI path is being used by DP 
as well. But I need to check whether CDM can even output to eDP with the 
same DP path. I dont have any documentation on this part yet.
