Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DB197AA08
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 02:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A2510E3FA;
	Tue, 17 Sep 2024 00:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pHsQjMx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD72610E0E0;
 Tue, 17 Sep 2024 00:44:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48GD52aE017283;
 Tue, 17 Sep 2024 00:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NmgZtn0AjKqWDAK7831W9QzjJFQ/IH6yd5+asW4vXDY=; b=pHsQjMx8ZCDjW8UY
 Bi9Ln1p76/+r+KfJcY18G031sWKt+H3M33uRWBc6GYx1LLNEUo5QWQGZQXukC2g+
 3EHS6I3jjAxn42HdSl05S1aGzntpnzIKJ/+4c6xKUVjjg/3DQgOFeL5i7ilJEp2x
 4DmDq9T0UP2ktiChHexFo/foOIsnxkIDCpIkE9ziIzXB/3+GCBy5ky0BP8ADeqOh
 qy6RZ0+NOJNzaIwvtfJg6sI3nOD3mYbdlnt6Vk012S28SYHxMN8m7/X74JuZMp1L
 C89uL3javzZ1+P3ISu5FFWhuGNqnspKajBP4cm/H2v/CkVPAsHluUoE+QI9e/w2Y
 g7eloQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4kjdh55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 00:44:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48H0irbe019099
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 00:44:53 GMT
Received: from [10.110.75.131] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Sep
 2024 17:44:52 -0700
Message-ID: <32340061-c864-4579-b557-b9a1e60baabd@quicinc.com>
Date: Mon, 16 Sep 2024 17:44:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/15] drm/msm/dpu: make sure phys resources are
 properly initialized
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
 <20240903-dpu-mode-config-width-v6-1-617e1ecc4b7a@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240903-dpu-mode-config-width-v6-1-617e1ecc4b7a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ehm73ebdUY5HJjNGzEQ8fSxmtDSG7Dqp
X-Proofpoint-ORIG-GUID: ehm73ebdUY5HJjNGzEQ8fSxmtDSG7Dqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=993 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409170002
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



On 9/2/2024 8:22 PM, Dmitry Baryshkov wrote:
> The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
> zero-init of the hw_ctl array, but didn't change the error condition,
> that checked for hw_ctl[i] being NULL. At the same time because of the
> early returns in case of an error dpu_encoder_phys might be left with
> the resources assigned in the previous state. Rework assigning of hw_pp
> / hw_ctl to the dpu_encoder_phys in order to make sure they are always
> set correctly.
> 
> Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 

Thanks,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
