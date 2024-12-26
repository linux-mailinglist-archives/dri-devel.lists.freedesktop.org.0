Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA779FCEE3
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 23:51:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3CD10E191;
	Thu, 26 Dec 2024 22:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SpP0RDGk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B0510E145;
 Thu, 26 Dec 2024 22:51:31 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQMUPSN020542;
 Thu, 26 Dec 2024 22:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Iw6kf3dVj/6qBa561yQ08I+qH7Oou7xM9ylJJKShbUU=; b=SpP0RDGkZzQ8idBZ
 rM/kIjNJZk1oVMy+OGHqp27bMn32GL88zOsT1JspMCOXkJw0zzWqBhpgrx/sNtD7
 yo3CgNoqcZJUTs9N5gcF3nf4gjlmfieKwZWVTyKkufUcKBJZokIn14Cs6vN4Znuu
 8w0ZQtEJ6s3ijlsKBduHuwzJ3x2NghY4mNzy1fgVoxfZ3H/5NdDqPbjZI5j9ADC4
 U9PiStjCv5agHP6+6UWbLvFyb9jeXb/07aXhSC1Ag18Yv/h65jyx/P9tyErctoy+
 b5CqCET4/LCZ3nXOBia8nmLAlCWOfTsIM5WzwnWmoTPebTaKnabUJ5RK+qIx704Q
 WGbYzg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43s8dnhkht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 22:51:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BQMpO7w023124
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Dec 2024 22:51:24 GMT
Received: from [10.110.60.159] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 26 Dec
 2024 14:51:17 -0800
Message-ID: <ac1cbdd1-ffea-4643-83ed-c5a321e000e8@quicinc.com>
Date: Thu, 26 Dec 2024 14:51:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/25] drm/msm/dpu: Fail atomic_check if CWB and CDM
 are enabled
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, "David
 Airlie" <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, <quic_ebharadw@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@chromium.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-17-fe220297a7f0@quicinc.com>
 <qpy3yjnrq7ljsj7a2b2avbnd6cptyfr6vzxhm733dyaiso5lwg@txhr5zwjqtt7>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <qpy3yjnrq7ljsj7a2b2avbnd6cptyfr6vzxhm733dyaiso5lwg@txhr5zwjqtt7>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zC0P3iNte7f8_SA2cxQqq-t3zcmjZuDd
X-Proofpoint-ORIG-GUID: zC0P3iNte7f8_SA2cxQqq-t3zcmjZuDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412260205
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



On 12/19/2024 9:44 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 04:43:28PM -0800, Jessica Zhang wrote:
>> We cannot support both CWB and CDM simultaneously as this would require
>> 2 CDM blocks and currently our hardware only supports 1 CDM block at
>> most.
> 
> Why would CWB require a second CDM block? I think that YUV output over
> DP (needs_cdm = true) and RGB output over WB (cwb_enabled = true) should
> work. Am I wrong?

Hey Dmitry,

No, I think your usecase should work. In that case, I can change this so 
that it only fails if both DP and WB are requesting CDM simultaneously.

Thanks,

Jessica Zhang

> 
>>
>> Thus return an error if both CWB and CDM are enabled.
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 9bb920d28bae2706b3892c167fe2bec3fd8857f4..a6372eee916e8aba702bbefc3615d8882ddcaad9 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1261,6 +1261,10 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
>>   		return 0;
>>   
>>   	topology = dpu_crtc_get_topology(crtc, dpu_kms, crtc_state);
>> +
>> +	if (topology.cwb_enabled && topology.needs_cdm)
>> +		return -EINVAL;
>> +
>>   	ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>>   			     crtc, &topology);
>>   	if (ret)
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry

