Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D3162C1FA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADA810E083;
	Wed, 16 Nov 2022 15:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABC010E083;
 Wed, 16 Nov 2022 15:11:29 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGEneeX005649; Wed, 16 Nov 2022 15:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pIhDvtdkQeKfm95d4eKSzt0UrUR7I+3ffypY3ZTOQ4g=;
 b=LJoG9sepYOAXCfCEtp0040/XH84kCeyHBSNmoKTwqPGF286zqsxVM4ocOzF/T61JrmOj
 Dd9la9T9lcM7o7h3iOmV4aBDGf4/n4sg0S33xAcc7MoIdNXgj3i7Tm6KVgorOJULDKfJ
 XQfGQ4BSKPRZytag/LPew2t7WdiIZIXaSoI2NwALCA5UGaXumaBNHKIHFrtxUtWRoHBi
 6mVdKF3IlCZ75geiLefSo2ovkfCGJAnkvhixGJE4wxQU9frlNFGigYEvGZfQfS9OzyJz
 FjMgN+BjpTNUICOC6OaQti1s/7riArDbcPaMnxKM4ho4f9BPYYXk2LbiyhfLpxL+nKqh vw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kvyh2gb4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 15:11:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AGFBOhL019728
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 15:11:24 GMT
Received: from [10.216.25.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 16 Nov
 2022 07:11:20 -0800
Message-ID: <6b1907db-3fdb-8fe0-e5e3-21ea17021925@quicinc.com>
Date: Wed, 16 Nov 2022 07:11:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 2/3] drm/msm/disp/dpu1: add helper to know if display
 is pluggable
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Kalyan Thota
 <quic_kalyant@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
References: <1668609040-2549-1-git-send-email-quic_kalyant@quicinc.com>
 <1668609040-2549-3-git-send-email-quic_kalyant@quicinc.com>
 <e049f5b1-da41-6854-4731-b6697770ffde@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <e049f5b1-da41-6854-4731-b6697770ffde@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: D7LkRPspLYV_7_l_M4Das6kBg83zrcoa
X-Proofpoint-ORIG-GUID: D7LkRPspLYV_7_l_M4Das6kBg83zrcoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160106
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
Cc: robdclark@chromium.org, quic_vpolimer@quicinc.com, swboyd@chromium.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/16/2022 7:08 AM, Dmitry Baryshkov wrote:
> On 16/11/2022 17:30, Kalyan Thota wrote:
>> Since DRM encoder type for few encoders can be similar
>> (like eDP and DP) find out if the interface supports HPD
>> from encoder bridge to differentiate between builtin
>> and pluggable displays.
>>
>> Changes in v1:
>> - add connector type in the disp_info (Dmitry)
>> - add helper functions to know encoder type
>> - update commit text reflecting the change
>>
>> Changes in v2:
>> - avoid hardcode of connector type for DSI as it may not be true (Dmitry)
>> - get the HPD information from encoder bridge
>>
>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 9c6817b..be93269 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -15,6 +15,7 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_probe_helper.h>
>> +#include <drm/drm_bridge.h>
>>   #include "msm_drv.h"
>>   #include "dpu_kms.h"
>> @@ -217,6 +218,21 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>   };
>> +bool dpu_encoder_is_pluggable(struct drm_encoder *encoder)
>> +{
>> +    struct drm_bridge *bridge;
>> +    int ops = 0;
>> +
>> +    if (!encoder)
>> +        return false;
>> +
>> +    /* Get last bridge in the chain to determine pluggable state */
>> +    drm_for_each_bridge_in_chain(encoder, bridge)
>> +        if (!drm_bridge_get_next_bridge(bridge))
>> +            ops = bridge->ops;
>> +
>> +    return ops & DRM_BRIDGE_OP_HPD;
> 
> No. This is not what you should be checking (hint: polled connectors 
> also can be pluggable).
> 
> Please check the type of the actual connector connected to this encoder.
> 

Even if we check the connector type as DSI or eDP that does not 
necessarily mean its built-in.

We can even use DSI or eDP as a pluggable display.

Thats why we thought of this check.

>> +}
>>   bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
>>   {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index 9e7236e..691ab57 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -224,4 +224,10 @@ void dpu_encoder_cleanup_wb_job(struct 
>> drm_encoder *drm_enc,
>>    */
>>   bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
>> +/**
>> + * dpu_encoder_is_pluggable - find if the encoder is of type pluggable
>> + * @drm_enc:    Pointer to previously created drm encoder structure
>> + */
>> +bool dpu_encoder_is_pluggable(struct drm_encoder *drm_enc);
>> +
>>   #endif /* __DPU_ENCODER_H__ */
> 
