Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C3C751326
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5941610E07C;
	Wed, 12 Jul 2023 22:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C322210E00C;
 Wed, 12 Jul 2023 22:02:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36CLUKws006401; Wed, 12 Jul 2023 22:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=naxOnz8/qeSY06oY2NExEIhHZQwTey8tGidAfP/IyPQ=;
 b=eh3ZlCR3KjJGEn0haPD4aecqG36eQOiBZVQ6sIwTKqQQcvQQ/XO53/w+XhAAZb0M9Jll
 EQd4N+rrYbYyrr3lS+XoyQvgmJwr/oheUBnE8qMb9xdFbSjOmhJA6zv3+2q0vxI63/iX
 oPuMbTZy+iVW9SFbUIHgxbq21y2GdRkb+7vDFwKV5soDMZqb/JmX2LidcKOOiLRvKvvB
 kpgvJbzVlVBJhQIEvsCbm1abRR3drYGtAAc4420X554CSpdG2lc5lmk+O4OIVrMBzX2w
 64QnhhaRYAT/8Nw/5Ehs3cBofeEKK6gYrOF3Q3aUd1qbMKbWaEcCe8obXZZfGr5FCNsJ xw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rsfeq2ms0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 22:02:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36CM2mmw027441
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 22:02:48 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 12 Jul
 2023 15:02:47 -0700
Message-ID: <9744c1a3-1e13-0c73-9add-4651c0401f8a@quicinc.com>
Date: Wed, 12 Jul 2023 15:02:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/8] drm/msm/mdss: correct UBWC programming for SM8550
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
 <20230712121145.1994830-3-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230712121145.1994830-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: QhHh8LP7LpxV0uGKrRb10xFILHTyx2Oj
X-Proofpoint-GUID: QhHh8LP7LpxV0uGKrRb10xFILHTyx2Oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-12_15,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=836 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307120194
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/12/2023 5:11 AM, Dmitry Baryshkov wrote:
> The SM8550 platform employs newer UBWC decoder, which requires slightly
> different programming.
> 
> Fixes: a2f33995c19d ("drm/msm: mdss: add support for SM8550")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Do we also need another fixes tag

Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")

Also, this was previously part of 
https://patchwork.freedesktop.org/series/118074/ .

In this one its after the bindings change.

For easier picking into -fixes, will you be moving this ahead of the 
bindings change and OR do you want to keep this part of the old series 
as it seems better suited there.

I think even if I pick this for -fixes, rest of this series can be 
rebased without issues. But let me know what you would prefer.
