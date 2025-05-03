Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F38AAA7ECB
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 08:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B34610E0D1;
	Sat,  3 May 2025 06:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ErK4dPjl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5383110E0D1;
 Sat,  3 May 2025 06:59:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434lcZm006376;
 Sat, 3 May 2025 06:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NgLeN5VZkeSiPFB2WCWDd93UA38Mb55ObzOHv882Vus=; b=ErK4dPjlum/vC5J/
 AU8ignha1YrYedgyxlDEq6GYYgXWxOacZV1Eo3XTJ+NituRu/8+WTcGkKaO5Ut8P
 9sprU88s50rSVa47ifn/EPTVQfRYJ3IARlMWF8nt1OBEIB37U+0E6foegsIMSfwW
 T7IqTIVlUERJS8D+xBMyhoMmcedzYYvBwSwslNO8+dj/imqQ0j2TPilBcrv3pjau
 axOPKfUILXiQA0oQqdIBEbtP9ih3d9+XgKdGN/z5QGvnFdBfglSFXJ5+dQb/zlnG
 j0y4CfLb0044T4+VSPcFsFpOViv4eplHQ2XwUP+MpFleqwqZLVJFsDRSlsfBSlou
 d9nQTw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce984d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 May 2025 06:59:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5436xjSr023814
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 3 May 2025 06:59:45 GMT
Received: from [10.216.30.160] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 May 2025
 23:59:38 -0700
Message-ID: <e070cce2-5037-4c22-af4e-5783bfaa51c5@quicinc.com>
Date: Sat, 3 May 2025 12:29:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] drm/msm: a6x: Rework qmp_get() error handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Maya Matuszczyk <maccraft123mc@gmail.com>, "Anthony
 Ruhier" <aruhier@mailbox.org>,
 Dmitry Baryshkov <lumag@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-3-8dbab23569e0@quicinc.com>
 <skrb5hkl66gt6vr6c42tx2ipfn62uuouztd2g37xlhreeq7nqj@r6ohzexpwmy7>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <skrb5hkl66gt6vr6c42tx2ipfn62uuouztd2g37xlhreeq7nqj@r6ohzexpwmy7>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA1OCBTYWx0ZWRfXxYx8NKd1jrlU
 3EhPj1LNv0deJSXgltdFpDVPEwfg63hVQHz8p35itW6qnOpswhvgxPlX4mcOzE53WJ1xFKFMZBr
 /IJRbpnfsflHCnQ5B1gg5yyZ7FzzkD/v3zO+YsFvQO0K8kiDf5Z51rn2asL8W/HfrNDfMZC+dEp
 4Lliax+8sYZq9w0aNcs7nttD9Q7OcFfYUAcw4ccMhvUKV3s5a/T2BvUVovH80fk3HdY4J/ZpG5D
 dsqss3+NFRKgDvZOq7ffUwHwrwBKNmXakmXq8BgI6CmAr+rRyXLhTkQJBxA/zjSkt7tQpr4xpxH
 z2C+TolToFuLe3NLdnr7aqBm2VnnBNFpz5ratY5oSxnqBTK6PwM51QcKa3/DFkXFXD1CM6Sew1w
 Dhgw8Oth9RTxNAp3JQ0FpWVZSZdXZAHCTbedYRqgvvzU+n6ds+fIY62GpnMse6zVFtXOJCtM
X-Proofpoint-ORIG-GUID: 9QGvogbD9ghAWpoHKMAQYvNAx3dHsIob
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6815bee2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8 a=KmM3JoVms-3i-2Ah5kEA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-GUID: 9QGvogbD9ghAWpoHKMAQYvNAx3dHsIob
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030058
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

On 4/23/2025 6:58 PM, Dmitry Baryshkov wrote:
> On Sat, Apr 19, 2025 at 08:21:32PM +0530, Akhil P Oommen wrote:
>> Fix the following for qmp_get() errors:
>>
>> 1. Correctly handle probe defer for A6x GPUs
>> 2. Ignore other errors because those are okay when GPU ACD is
>> not required. They are checked again during gpu acd probe.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> If this a fix for the existing commit, it should come first and have a
> proper Fixes: tag. If not, please squash it into the first patch.

This patch is dependent on the ACD support patch, so we can't reorder it
(mentioned in the added comment below). No Fixes tag because qmp
messaging was unused until now, so there is no point in backports. I
prefer to keep this patch separate because this looks logically separate
to me and we are changing the behavior for a6x gpu probe (removed
adreno_is_a7xx() check).

-Akhil

> 
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 6bd6d7c67f98b38cb1d23f926b5e6ccbd7f2ec53..48b4ca8894ba38176481b62b7fd1406472369df1 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -2043,9 +2043,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>>  		goto detach_cxpd;
>>  	}
>>  
>> +	/* Other errors are handled during GPU ACD probe */
>>  	gmu->qmp = qmp_get(gmu->dev);
>> -	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
>> -		ret = PTR_ERR(gmu->qmp);
>> +	if (PTR_ERR_OR_ZERO(gmu->qmp) == -EPROBE_DEFER) {
>> +		ret = -EPROBE_DEFER;
>>  		goto detach_gxpd;
>>  	}
>>  
>>
>> -- 
>> 2.48.1
>>
> 

