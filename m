Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C986771887F
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFF410E509;
	Wed, 31 May 2023 17:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F3B010E500;
 Wed, 31 May 2023 17:29:34 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34VHNxNT012000; Wed, 31 May 2023 17:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lfvBv3wC++XoBknk5+vIpz7EOIutZoIqAL7pPkjlFWo=;
 b=dtWqYBgQsN2zpjqP9ofahfU8jQrOKN8egidoUZhs7sbYAh5lXHeKasJBAe9Wy1Qg+MKJ
 o4nlw3EmO3gyRJp5GVjlYrcJJAfzM7GH/w9Dzq2l0PGA/BmAq01YiMmHV1iGKK9PBm6A
 TyaG51oBYVgG6YkWPR+FypEM4uJ81krgIb51o8x2s/AAnlEBjl0H9MFlxG9gCNh2qgQb
 9XRUe0+iKFNNZIjdt/ztye2PEDBW8eLrjTWrXaZz5lmBgt/CAStIUxqMPZ/pImSS4FMd
 hQQRyIv6OO+9sH19C3rWITBLx9loJyo3o9WavIMVKUjnA1okclTgFxchys5lFdc1fQXi 9Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qx81x8fhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 17:29:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34VHTNis001025
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 17:29:23 GMT
Received: from [10.71.110.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 31 May
 2023 10:29:22 -0700
Message-ID: <e69f02b7-eba9-5f33-5ca1-eb0638928414@quicinc.com>
Date: Wed, 31 May 2023 10:29:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 2/3] drm/msm/dpu: retrieve DSI DSC struct at
 atomic_check()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-3-git-send-email-quic_khsieh@quicinc.com>
 <dfa12c8b-ccec-261c-9c83-54536e17c02d@linaro.org>
 <157e8219-7af2-c7ed-6d99-3caa6fbc11ba@quicinc.com>
 <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJponkEne2vVsNP=2Fxmv=Uc6i_LzAGBSEz9hPPotCEpGzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: L2NpBAR6-SXcCQwoJVAzmgNq9y_Lstt9
X-Proofpoint-ORIG-GUID: L2NpBAR6-SXcCQwoJVAzmgNq9y_Lstt9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_12,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310147
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
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/31/2023 10:12 AM, Dmitry Baryshkov wrote:
> On Wed, 31 May 2023 at 18:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>>
>>>>    +    if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
>>> INTF_DSI
>>>
>>>> +        struct drm_bridge *bridge;
>>>> +
>>>> +        if (!dpu_enc->dsc) {
>>> This condition is not correct. We should be updating the DSC even if
>>> there is one.
>>>
>>>> +            bridge = drm_bridge_chain_get_first_bridge(drm_enc);
>>>> +            dpu_enc->dsc = msm_dsi_bridge_get_dsc_config(bridge);
>>> This approach will not work for the hot-pluggable outputs. The dpu_enc
>>> is not a part of the state. It should not be touched before
>>> atomic_commit actually commits changes.
>> where can drm_dsc_config be stored?
> I'd say, get it during atomic_check (and don't store it anywhere).
> Then get it during atomic_enable (and save in dpu_enc).
got it.
>
>>> Also, I don't think I like the API. It makes it impossible for the
>>> driver to check that the bridge is the actually our DSI bridge or not.
>>> Once you add DP here, the code will explode.
>>>
>>> I think instead we should extend the drm_bridge API to be able to get
>>> the DSC configuration from it directly. Additional care should be put
>>> to design an assymetrical API. Theoretically a drm_bridge can be both
>>> DSC source and DSC sink. Imagine a DSI-to-DP or DSI-to-HDMI bridge,
>>> supporting DSC on the DSI side too.
>> Form my understanding, a bridge contains two interfaces.
>>
>> Therefore I would think only one bridge for dsi-to-dp bridge? and this
>> bridge should represent the bridge chip?
>>
>> I am thinking adding an ops function, get_bridge_dsc() to struct
>> drm_bridge_funcs to retrieve drm_dsc_config.
> So, for this DSI-to-DP bridge will get_bridge_dsc() return DSC
> configuration for  the DSI or for the DP side of the bridge?

I would think should be DP side. there is no reason to enable dsc on 
both DSI and DP fro a bridge chip.

drm_bridge_chain_get_first_bridge(drm_enc) should return the bridge of 
the controller.

In DSI-to-DP bridge chip case, this controller will be the bridge chip 
who configured to perform protocol conversion between DSI and DP.

If DSC enabled should be at DP size which connect to panel.

>
>> Do you have other suggestion?
> Let me think about it for a few days.
>
