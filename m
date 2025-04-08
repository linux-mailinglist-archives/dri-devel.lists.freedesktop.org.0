Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7F4A81477
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 20:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A8A10E2C6;
	Tue,  8 Apr 2025 18:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fW34edki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F220610E2C6;
 Tue,  8 Apr 2025 18:21:37 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BFqCO027667;
 Tue, 8 Apr 2025 18:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yawypgTDfQmeut2IdACsl8MD5B/MwSN9qyvRnPW0+3w=; b=fW34edkiLmHxqdvA
 hdp4DF48388vpWiJco8svJxmUOIrT2jxt+nXbGm6GGCUgXi8ezbyhAjYqbaMZkGp
 fdJ3a3KKxvKifgMDSbrnXuP551mW53vZNw67Fan6BVzcLVT5CtfBd9zHdiC/n3uB
 yqwMxkKiSttMTxQAWUqjrlk/1gJLOYdtnevibnioA2DvNvKvRytsCt8Cs27cHh0M
 4vl4VH7rbbsuhxbwZ2UQww314HmhsoE3d5zSQKzMuYWclSrZKs+9qgkYgsBFjcL6
 wyB432R+iLBgyQV342x1N12Dsu+m1YGYhZtQUOl5IvPh6FJWY0nexzScx2CEXE5a
 HnuwYg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd00v9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Apr 2025 18:21:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538ILVCf015403
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Apr 2025 18:21:32 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 11:21:31 -0700
Message-ID: <181a3138-fce2-47cb-8258-ff08a00c2b3a@quicinc.com>
Date: Tue, 8 Apr 2025 11:21:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 RESEND] drm/msm/dpu: reorder pointer operations after
 sanity checks to avoid NULL deref
To: Qasim Ijaz <qasdev00@gmail.com>, <robdclark@gmail.com>, <lumag@kernel.org>,
 <sean@poorly.run>, <marijn.suijten@somainline.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <quic_jesszhan@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
References: <20250408172223.10827-1-qasdev00@gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250408172223.10827-1-qasdev00@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6ZAnYeOiOeNZTdojBCkaKPDn5qGs5enQ
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f5692d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=Ss2e1SayUNo6jylPtukA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6ZAnYeOiOeNZTdojBCkaKPDn5qGs5enQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_07,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080126
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



On 4/8/2025 10:22 AM, Qasim Ijaz wrote:
> _dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys"
> before the sanity checks which can lead to a NULL pointer dereference if
> phys is NULL.
>   
> Fix this by reordering the dereference after the sanity checks.
>   
> Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
> v2:
> - Moved Signed-off tag below Fixes tag
> - Moved dpu_enc declaration to the top and initialisation below sanity checks
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
