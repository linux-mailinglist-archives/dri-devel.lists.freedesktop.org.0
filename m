Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80AA030A1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 20:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F62B10E9DA;
	Mon,  6 Jan 2025 19:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hSc+M8AW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E4210E2F2;
 Mon,  6 Jan 2025 19:32:52 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506HrmqI012208;
 Mon, 6 Jan 2025 19:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fEkajOg6ZoFU0sPYfi+oBvbYPQbEN4kxtOoBkXJnPLk=; b=hSc+M8AWqK8YnMN8
 7ipvooUeyuKD33dtQWUiapUd5E1rgucaCGDmcB3EnEGVWLirYHi+oC/phTPFXlCn
 0IGAf/ay2TVPMjvJXWOId2FvGaUXlSwKYi0cKQdSeuXoH9RimYMZEIc+nQCrg38B
 7yi9AX23tHTKdVWimGLYVcibho94aV0YX1YoeUjQhhlsy1DbN4L5+43d+G+Ij0y3
 8qHKE6D0eJmulrFDa7I1Tl/84I7Ew5arySKazgxMAQf52fRxMiY4MJu3mXG34eJt
 fcECOfxZik0V3ln3ZqeNHt5ZmBFtVabor8gvGgYtxrQnSnb+gs5ehIRKeOa7PRgK
 kwlybQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440kyqg6fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 19:32:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 506JWmlH002420
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Jan 2025 19:32:48 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 11:32:48 -0800
Message-ID: <dc7649bd-f237-458e-ada8-3f9fe0b43bcd@quicinc.com>
Date: Mon, 6 Jan 2025 11:32:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: correct LM pairing for SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Li Liu <quic_lliu6@quicinc.com>, Fange Zhang <quic_fangez@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241217-dpu-fix-sm6150-v2-1-9acc8f5addf3@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mSCcrWUGpC7i08ZzUnDRxfviZEb2LW7Y
X-Proofpoint-GUID: mSCcrWUGpC7i08ZzUnDRxfviZEb2LW7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=780 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060171
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



On 12/17/2024 4:35 AM, Dmitry Baryshkov wrote:
> The SM6150 platform doesn't have 3DMux (MERGE_3D) block, so it can not
> split the screen between two LMs. Drop lm_pair fields as they don't make
> sense for this platform.
> 
> Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Fixes: cb2f9144693b ("drm/msm/dpu: Add SM6150 support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Dropped lm_pair field as recommended by Abhinav.
> - Link to v1: https://lore.kernel.org/r/20241216-dpu-fix-sm6150-v1-1-9fd7ce2ff606@linaro.org
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 2 --
>   1 file changed, 2 deletions(-)
> 

Thanks!

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
