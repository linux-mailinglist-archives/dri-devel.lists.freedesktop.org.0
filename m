Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA1C62C2B3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E36410E06A;
	Wed, 16 Nov 2022 15:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350FD10E06A;
 Wed, 16 Nov 2022 15:35:27 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AGDFiDp027890; Wed, 16 Nov 2022 15:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4bgSVWe2DupxOwRr4EOFbsHDsofmk+PFg9oISOvq07w=;
 b=AcC0d+H6Ykx45QyKTs91JvR5oMly//xnEMmuafbJ+4j5AFxQqRpBhfUI3lY3qBvo35U+
 w2tVbt3T66tD+Ep+qW3ZkpgjSikFo66wyZtdYgGVaD8PwpvmkCCd336cOSdWyxZfnQ4M
 Ar3WwuMqL9aOOQhxnO41GD6zp+hpdLrdriRjtnOdgSkQj4uC7LndSiM0kvzTHbMqXHzZ
 XVR9iQerh42i3I0+TNT2BrflTvF4cOOEGaFDyOhGC8PPouo4Op2/OMHyryA6juE16+27
 Vxnx1ZDH/LaQunuf9GW73GokZgHsU1esihFCQnR4bvRdhIBM/6n/Bcl6DxIl7L3kXSd1 Dw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kw03a8bcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 15:35:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AGFZNNY015031
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Nov 2022 15:35:23 GMT
Received: from [10.216.25.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 16 Nov
 2022 07:35:19 -0800
Message-ID: <0dd3e096-84ac-da81-ad43-bf07485e7b65@quicinc.com>
Date: Wed, 16 Nov 2022 07:35:16 -0800
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
 <6b1907db-3fdb-8fe0-e5e3-21ea17021925@quicinc.com>
 <bf14540a-745c-c378-520a-f8edfd3e3adf@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <bf14540a-745c-c378-520a-f8edfd3e3adf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nvibYndKs-Sx2SNACmfVRs8TtFf1DTqK
X-Proofpoint-ORIG-GUID: nvibYndKs-Sx2SNACmfVRs8TtFf1DTqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_03,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211160107
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



On 11/16/2022 7:18 AM, Dmitry Baryshkov wrote:
> On 16/11/2022 18:11, Abhinav Kumar wrote:
>>
>>
>> On 11/16/2022 7:08 AM, Dmitry Baryshkov wrote:
>>> On 16/11/2022 17:30, Kalyan Thota wrote:
>>>> Since DRM encoder type for few encoders can be similar
>>>> (like eDP and DP) find out if the interface supports HPD
>>>> from encoder bridge to differentiate between builtin
>>>> and pluggable displays.
>>>>
>>>> Changes in v1:
>>>> - add connector type in the disp_info (Dmitry)
>>>> - add helper functions to know encoder type
>>>> - update commit text reflecting the change
>>>>
>>>> Changes in v2:
>>>> - avoid hardcode of connector type for DSI as it may not be true 
>>>> (Dmitry)
>>>> - get the HPD information from encoder bridge
>>>>
>>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  6 ++++++
>>>>   2 files changed, 22 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> index 9c6817b..be93269 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>>> @@ -15,6 +15,7 @@
>>>>   #include <drm/drm_crtc.h>
>>>>   #include <drm/drm_file.h>
>>>>   #include <drm/drm_probe_helper.h>
>>>> +#include <drm/drm_bridge.h>
>>>>   #include "msm_drv.h"
>>>>   #include "dpu_kms.h"
>>>> @@ -217,6 +218,21 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>>>>       15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>>>>   };
>>>> +bool dpu_encoder_is_pluggable(struct drm_encoder *encoder)
>>>> +{
>>>> +    struct drm_bridge *bridge;
>>>> +    int ops = 0;
>>>> +
>>>> +    if (!encoder)
>>>> +        return false;
>>>> +
>>>> +    /* Get last bridge in the chain to determine pluggable state */
>>>> +    drm_for_each_bridge_in_chain(encoder, bridge)
>>>> +        if (!drm_bridge_get_next_bridge(bridge))
>>>> +            ops = bridge->ops;
>>>> +
>>>> +    return ops & DRM_BRIDGE_OP_HPD;
>>>
>>> No. This is not what you should be checking (hint: polled connectors 
>>> also can be pluggable).
>>>
>>> Please check the type of the actual connector connected to this encoder.
>>>
>>
>> Even if we check the connector type as DSI or eDP that does not 
>> necessarily mean its built-in.
>>
>> We can even use DSI or eDP as a pluggable display.
> 
> Well, I don't think so. eDP and DSI connectors are not pluggable per 
> design. One can use them so, but they are not thought to be used this 
> way. Unlike e.g. HDMI, DP, VGA, etc.
> 

We have had many products where we used HDMI as the primary display 
where the HPD line was disconnected in the design, so now if we 
generalize all HDMI connectors to be pluggable we can never enable color 
management on those even though DSI is not even used in that product.

Thats why I felt we should rely on the HPD_OPS as that way we know that 
it will be set only if HPD will be used.

Wouldnt it be just better to also check polling displays to complete 
this check? Is there a way to do it?

> I would say LVDS, eDP, DSI, DPI and SPI can be assumed to be constantly 
> plugged.
> 
> Compare this with Composite, SVIDEO, 9PinDIN, TV. They can be assumed to 
> be external even if they do not have the HPD (or even polling). And 
> these connectors usually don't have it.
> 
>>
>> Thats why we thought of this check.
>>
