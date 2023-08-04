Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF07703B0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 16:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B0D10E71B;
	Fri,  4 Aug 2023 14:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BA710E71B;
 Fri,  4 Aug 2023 14:56:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 374DUbND023322; Fri, 4 Aug 2023 14:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Yy63cY2c8mMV4uwlV+S8qlhtYkmmuk+gr2jKr7o2IPU=;
 b=pMI4XgUA5xhrLt3DGo2ghw09RUwBCeLOi3/UtHLrI8w/qYL7AOCl7dIyhcWGyIiVttMX
 AXXJVbqiV+gH/bI2Otx7wEr5ivJyjLM68rceUL9bLpxT6xNw88r9mQQlubBq2nGwGZ0c
 GO+7rz7YPplXXYlRmw6JtsE0i+ED4/tePPDfga7+Wq+mxErsmHysz1LzMShY/dosekNo
 dGTYvoXbt2ruv1JWOiLc/bTU/FRxmcx4mHr9WSE6VoWZuY+VMlaWHfMtJx87nTwwFsU4
 WVRrHA1Hxeiv2BvGVwplnY5WSN8taDUjxWl4RshlTGixtdXQBGj3eDKA0jPKj3Uu4TRP Tg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s8kfuspaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Aug 2023 14:56:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 374Euc6C012747
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Aug 2023 14:56:38 GMT
Received: from [10.110.124.174] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 4 Aug
 2023 07:56:37 -0700
Message-ID: <9b6a125c-707e-39eb-7773-679d8a516442@quicinc.com>
Date: Fri, 4 Aug 2023 07:56:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dpu: initialise clk_rate to 0 in
 _dpu_core_perf_get_core_clk_rate
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230804094804.36053-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ug2pjIj9bc4BNZTpU8rtLCrQuNFT1jY4
X-Proofpoint-ORIG-GUID: ug2pjIj9bc4BNZTpU8rtLCrQuNFT1jY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_14,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 bulkscore=0 clxscore=1011 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308040133
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
 Stephen Boyd <swboyd@chromium.org>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/4/2023 2:48 AM, Dmitry Baryshkov wrote:
> When removing the core perf tune overrides, I also occasionaly removed the
> initialisation of the clk_rate variable. Initialise it to 0 to let max()
> correctly calculate the maximum of requested clock rates.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: 6a4bc73915af ("drm/msm/dpu: drop separate dpu_core_perf_tune overrides")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 1 +
>   1 file changed, 1 insertion(+)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
