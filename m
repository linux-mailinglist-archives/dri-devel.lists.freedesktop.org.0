Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4980427E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 00:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E1910E21B;
	Mon,  4 Dec 2023 23:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FDD10E21B;
 Mon,  4 Dec 2023 23:19:43 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B4MRjEC012015; Mon, 4 Dec 2023 23:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DC+2ehiG+QhLdNsiYr9idsrCJKNZnpUCf0UcTMrvdtw=;
 b=QacTz9nOUIgpCEoa+COdy+GeIliYq7I9/FsuE3HUFbqQqB8THVh5CSAbh3c7bhONBKvV
 51G+Xc2J1oTxwAQIwOKLxZnDH16kaZkelUhBpU7gE621hkgri4E7KDsRDlP1/guIINY/
 esO8iCn8fCTiQQ4aFuokoUQE1ns7Cv+vnD/aAHhaWxKExW+uxH7stj7MIvIpLtv054G5
 Mng25xCBdRhwvbWfTImaYwADaQjwtF4MBzdqODNrwW4O/KOBEEH24d7oweEvl5X/DirJ
 Lv8lEXHPva2M1/sp4lc9GeRVLQJN5hGv+cnBJPSdb5OHkTUxt8ihCHRnItKyzLNi5xt/ FQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usfu798wt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Dec 2023 23:19:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4NJaUP029117
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Dec 2023 23:19:36 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 15:19:35 -0800
Message-ID: <3997021e-81de-c776-0e9e-349735ed020b@quicinc.com>
Date: Mon, 4 Dec 2023 15:19:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 4/4] drm/msm/mdss: Handle the reg bus ICC path
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
 <20231202224247.1282567-5-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231202224247.1282567-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bHhHEkcpwuv75KnEfn9A6oevsI-pRhrO
X-Proofpoint-ORIG-GUID: bHhHEkcpwuv75KnEfn9A6oevsI-pRhrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_21,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=798 priorityscore=1501 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040183
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



On 12/2/2023 2:42 PM, Dmitry Baryshkov wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects, from none to otherwise
> inexplicable DSI timeouts.
> 
> Provide a way for MDSS driver to vote on this bus.
> 
> A note regarding vote values. Newer platforms have corresponding
> bandwidth values in the vendor DT files. For the older platforms there
> was a static vote in the mdss_mdp and rotator drivers. I choose to be
> conservative here and choose this value as a default.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 49 +++++++++++++++++++++++++++++++---
>   drivers/gpu/drm/msm/msm_mdss.h |  1 +
>   2 files changed, 46 insertions(+), 4 deletions(-)
> 

I checked the values with corresponding DT files and they match,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
