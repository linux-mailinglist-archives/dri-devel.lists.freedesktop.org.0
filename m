Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FDD71022A
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 03:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3C110E099;
	Thu, 25 May 2023 01:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AF210E099;
 Thu, 25 May 2023 01:05:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34P0TTaT017600; Thu, 25 May 2023 01:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=pDfMTnkiMJn6hVr7pJpuj8arEywvWOpepr9hBtJ4bUw=;
 b=BAlwZ54mGWPm7UOVTIK5AXd5DmBsM4lgBEz1YCyuEksXfXZDjUFwJHoED50Z0w2Gvvvv
 vxS2ieaX8NtzDkf3RqeG3n29GofHI36aG4e8waa47NbZj624vJJKHpZmboQVq9Rw7LSa
 5ikWZyGduwCPO+h5nNXQV5wUqqXm/zSfzEBqA+fFc57wfKvf6i8+WdCgn6rQgE3RYINi
 kqc4ZetZ2yErBBnabR4jCQ0Zte4hiwmO7mp5g0XPXetAE7uvt/TcgaSKKJl3Sk8AM3FX
 KQApvqt/T12CX7weidkzjrav2QF7CMvD5ck/hL0D+att0hjHwDSkhCZkoJhmNTfSRIOZ aA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qscgmjd53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 01:05:53 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34P15qL2029018
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 May 2023 01:05:52 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 18:05:51 -0700
Message-ID: <814707a6-4193-4834-9715-ff132ce3146e@quicinc.com>
Date: Wed, 24 May 2023 18:05:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/9] drm/display/dsc: Add flatness and initial scale
 value calculations
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-1-bafc7be95691@quicinc.com>
 <7yzn3lyxpdl447c2ujq3yfh37pbnfvv2t2bvrtziie3j3lxt5n@a6znq7ahjr2a>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <7yzn3lyxpdl447c2ujq3yfh37pbnfvv2t2bvrtziie3j3lxt5n@a6znq7ahjr2a>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: El0rOVlPsLbKQTntm_4yd5eSZb_Wq1dQ
X-Proofpoint-ORIG-GUID: El0rOVlPsLbKQTntm_4yd5eSZb_Wq1dQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_17,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305250008
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/24/2023 12:05 PM, Marijn Suijten wrote:
> On 2023-05-24 10:45:14, Jessica Zhang wrote:
>> Add helpers to calculate det_thresh_flatness and initial_scale_value as
>> these calculations are defined within the DSC spec.
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/display/drm_dsc_helper.c | 24 ++++++++++++++++++++++++
>>   include/drm/display/drm_dsc_helper.h     |  2 ++
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dsc_helper.c b/drivers/gpu/drm/display/drm_dsc_helper.c
>> index fc187a8d8873..4efb6236d22c 100644
>> --- a/drivers/gpu/drm/display/drm_dsc_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dsc_helper.c
>> @@ -1413,3 +1413,27 @@ int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg)
>>   	return 0;
>>   }
>>   EXPORT_SYMBOL(drm_dsc_compute_rc_parameters);
>> +
>> +/**
>> + * drm_dsc_initial_scale_value() - Calculate the initial scale value for the given DSC config
>> + * @dsc: Pointer to DRM DSC config struct
>> + *
>> + * Return: Calculated initial scale value
> 
> Perhaps just drop Calculated from Return:?
> 
>> + */
>> +u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
>> +{
>> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
>> +}
>> +EXPORT_SYMBOL(drm_dsc_initial_scale_value);
>> +
>> +/**
>> + * drm_dsc_flatness_det_thresh() - Calculate the flatness_det_thresh for the given DSC config
> 
> You've written out the word ("flatness det thresh" and "initial scale
> value") entirely elsewhere, why the underscores in the doc comment here?
> 
> Instead we should have the full meaning here (and in the Return: below),
> please correct me if I'm wrong but in VESA DSC v1.2a spec 6.8.5.1
> Encoder Flatness Decision I think this variable means "flatness
> determination threshold"?  If so, use that in the doc comment :)
> 
> (and drop the leading "the", so just "Calculate flatness determination
> threshold for the given DSC config")
> 
>> + * @dsc: Pointer to DRM DSC config struct
>> + *
>> + * Return: Calculated flatness det thresh value
> 
> Nit: perhaps we can just drop "calculated" here?


Hi Marijn,

Sure, I will make these changes if a v15 is necessary.

In the future, can we try to group comments on wording/grammar/patch 
formatting with comments on the code itself?

I really appreciate your feedback and help in improving the 
documentation around this feature, however I don't find it very 
productive to have revisions where the only changes are on (in my 
opinion) small wording details.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> + */
>> +u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
>> +{
>> +	return 2 << (dsc->bits_per_component - 8);
>> +}
>> +EXPORT_SYMBOL(drm_dsc_flatness_det_thresh);
>> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
>> index fc2104415dcb..71789fb34e17 100644
>> --- a/include/drm/display/drm_dsc_helper.h
>> +++ b/include/drm/display/drm_dsc_helper.h
>> @@ -24,6 +24,8 @@ void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
>>   void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>>   int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_type type);
>>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>> +u8 drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc);
>> +u32 drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc);
>>   
>>   #endif /* _DRM_DSC_HELPER_H_ */
>>   
>>
>> -- 
>> 2.40.1
>>
