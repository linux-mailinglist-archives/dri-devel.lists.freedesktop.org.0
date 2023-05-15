Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0507034BC
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 18:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EC310E10F;
	Mon, 15 May 2023 16:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA4D10E10F;
 Mon, 15 May 2023 16:51:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34FEg9Tq010168; Mon, 15 May 2023 16:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CR6WNOuQanOBsfeMYe5ogqppidE0l24femTKv/D2D1A=;
 b=Zt5eCctmxArL4KWaPTjAOkrEKPNm0poTBihFdchmQ3Vvs3Zc1yV0Ct1tGoelDCSOEEUI
 yj7wqyD+2cKsV0Fx6IjWU9wxzd1SkWmQ5YzL4pB9YIx8wKGEkYpB18+xZw+4fYhiBQWD
 o+z92r5gTV4SG8LpPyJpmWiAxR7O69ka88ZLeDubhTUHdmLnJzjIl2DUTsjqYCaZ0hjC
 8iiTuwm5YPYhB1eXCl0mBiPYHBHguYGoa+f316sdqlr7wFPZroNdC2koqgHWOdGfZM9T
 c3nJKAdwcDohy5BQryPa73Cg/GQamxJdoWWV0pSGFDylKO7GCj/sRszWB7poGRUm4zEL pQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkjscs68c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 16:51:52 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34FGppAb028739
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 May 2023 16:51:51 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 09:51:50 -0700
Message-ID: <e7bb6e20-f9d9-7f92-56dc-10af762db0f6@quicinc.com>
Date: Mon, 15 May 2023 09:51:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 1/8] drm/display/dsc: Add flatness and initial scale
 value calculations
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-1-4cb21168c227@quicinc.com>
 <ezijf6p7wbobl6upky56hb2q2ixhhg5hssesbqtibckqdm4pzr@2k762556kcpe>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <ezijf6p7wbobl6upky56hb2q2ixhhg5hssesbqtibckqdm4pzr@2k762556kcpe>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3d-URxA0Y_J-zqoUZpRsT02Ze_wx9BfE
X-Proofpoint-ORIG-GUID: 3d-URxA0Y_J-zqoUZpRsT02Ze_wx9BfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150140
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
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/13/2023 1:28 PM, Marijn Suijten wrote:
> On 2023-05-12 14:32:11, Jessica Zhang wrote:
>>
>> Add helpers to calculate det_thresh_flatness and initial_scale_value as
>> these calculations are defined within the DSC spec.
>>
>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   include/drm/display/drm_dsc_helper.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
>> index 0bb0c3afd740..060b22ec02eb 100644
>> --- a/include/drm/display/drm_dsc_helper.h
>> +++ b/include/drm/display/drm_dsc_helper.h
>> @@ -25,5 +25,15 @@ void drm_dsc_set_rc_buf_thresh(struct drm_dsc_config *vdsc_cfg);
>>   int drm_dsc_setup_rc_params(struct drm_dsc_config *vdsc_cfg, enum drm_dsc_params_kind kind);
>>   int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
>>   
>> +static inline int drm_dsc_initial_scale_value(const struct drm_dsc_config *dsc)
> 
> Should this truncate and return u8?

Hi Marijn,

Acked.

> 
>> +{
>> +	return 8 * dsc->rc_model_size / (dsc->rc_model_size - dsc->initial_offset);
>> +}
>> +
>> +static inline int drm_dsc_flatness_det_thresh(const struct drm_dsc_config *dsc)
> 
> Should this return u32?

Acked.

Thanks,

Jessica Zhang

> 
> - Marijn
> 
>> +{
>> +	return 2 << (dsc->bits_per_component - 8);
>> +}
>> +
>>   #endif /* _DRM_DSC_HELPER_H_ */
>>   
>>
>> -- 
>> 2.40.1
>>
