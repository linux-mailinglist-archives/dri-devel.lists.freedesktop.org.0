Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4A2756C47
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 20:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F6310E2A5;
	Mon, 17 Jul 2023 18:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A903010E2A5;
 Mon, 17 Jul 2023 18:39:26 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36HCF0v9010797; Mon, 17 Jul 2023 18:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2XrcCt9dnVGVjvvdzjbjzXSRfAcB5g1H23Jcn75kWM0=;
 b=R05VuS/PYVzb5UWG6biRye3ITQPi6oTLpvXTLInKxyly+EfhnIj2pwTFLJ1iN/rlQG9q
 L4GCY1VIRCg2gMIS9xEsNkeSBAxmCH1VQfzBCNsU2ILfRWp7lKuXHbyN1yH0WY0tDEgE
 erw9QZ0GCwcNi4+ujsLIMuu1+wZrAkdD28RVExy5lRK1IOGvmZNZlfHkqn9Dpjv33Uy6
 BMFCGZAildvBC6dErqmWsCk36grDx5HIna06ZyUVYe2QA+J1ZhdTDQpMOiiCpj7Qe4if
 rbHWwHRN2woC6/CB4XFioVKe3S+cMmegkqP+H6SS24H52t0uldq5rKoXZB4r94ITEK8E Yw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run0avbvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 18:39:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36HIdJtj026070
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jul 2023 18:39:19 GMT
Received: from [10.110.91.201] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 17 Jul
 2023 11:39:19 -0700
Message-ID: <52f63ee3-be75-9ad2-822c-d9f0b1ba32b9@quicinc.com>
Date: Mon, 17 Jul 2023 11:39:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 07/11] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf
 code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
 <20230712221139.313729-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230712221139.313729-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: UB6AVDF_umgKWECnFLAjgxM6yX0hrKbt
X-Proofpoint-ORIG-GUID: UB6AVDF_umgKWECnFLAjgxM6yX0hrKbt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_13,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307170170
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/12/2023 3:11 PM, Dmitry Baryshkov wrote:
> Simplify dpu_core_perf code by using only dpu_perf_cfg instead of using
> full-featured catalog data.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 73 ++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
>   3 files changed, 35 insertions(+), 48 deletions(-)
> 

With dpu_core_rev as a separate struct, if we do need the dpu hw version 
in this module, we can just pass that instead. Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

