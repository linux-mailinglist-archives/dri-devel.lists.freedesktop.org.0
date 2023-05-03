Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1604C6F6163
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 00:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2597F10E00A;
	Wed,  3 May 2023 22:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A524210E00A;
 Wed,  3 May 2023 22:42:43 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 343MSoCB028356; Wed, 3 May 2023 22:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZYUe9H1SvY9JcpCCKhrLIpuyPXgCdFHop1Nf9gzq7zY=;
 b=jurBKqQezznJTUijscHXj6u3iERfOJ48BpcNmc5ufOljxzA5v31vZWzAvIWTTMazEyHc
 CKqh8p8QVfHXoMHQkDzXXeVKJse44+0zsJ+MIelAEfbrWQZHXSIDzqcOAs3mkIsTjmUE
 YIOXsUAT4kGyGTUIDmGb6+uGQbE3BpiIge4UfB/7lCWy11+PntFrbUt8SG4ZK7D+SOUe
 uFN1oE3o2B9opwQfVQQ1CMAqujalsUwUW37gvUvq79EljIsNHQAmfNCF9AdYGG4O19W7
 K/TjkHEiiHivhB9Oqx+QRClI+HQjwUxsVHETQURPiEcF0pA17yCt6qJfcywO9u9ww/jY Ug== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbsr40vvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 22:42:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 343MgaTN016933
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 22:42:36 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 15:42:36 -0700
Message-ID: <18413e44-4d8a-fec7-9867-ab66a90b3334@quicinc.com>
Date: Wed, 3 May 2023 15:42:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify DPU encoder init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 8m7CgCeYxGSyxahviruaqmOwD7TxsP68
X-Proofpoint-ORIG-GUID: 8m7CgCeYxGSyxahviruaqmOwD7TxsP68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_14,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030195
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
> Rework dpu_encoder initialization code, simplifying calling sequences
> and separating common init parts.

Please mention that your series was made on top of 
https://patchwork.freedesktop.org/series/116530/.

Figured it out when I tried to apply it to my branch to test.

Validated writeback just in case with this, hence please use

Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280

> 
> Dmitry Baryshkov (7):
>    drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
>    drm/msm/dpu: drop dpu_encoder_early_unregister
>    drm/msm/dpu: separate common function to init physical encoder
>    drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
>    drm/msm/dpu: inline dpu_encoder_get_wb()
>    drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
>    drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 190 ++++++++----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  20 +-
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  55 ++---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  35 +---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  38 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 +++-----
>   7 files changed, 155 insertions(+), 284 deletions(-)
> 
