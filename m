Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF6A83B46D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 23:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7826210EA98;
	Wed, 24 Jan 2024 22:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9A310EA6D;
 Wed, 24 Jan 2024 22:01:46 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40OKub20024285; Wed, 24 Jan 2024 22:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=T36vvmdBaye5dMkfKQLOf6XkNJoI15q5WQoR3Stfb3c=; b=AL
 fkKJI0xKmNHGEpX7NrT9JPbIaVE9C2NDOpmOvf0ot/4boMs39EPwoYPHoqWJTG+0
 rgdazfO+dMeLYgYlPMyBBGXNFWaVqv9JrnnAyfJ+KtPeyo7/YSyFfzLUr0ppABZs
 7YofjQpCpVsFLj83u4uXFd4cqsxDZWBSS1uFJ7XnFaAzrwSfM8iI6Ms1GmHX6dfk
 vWLFV9SVjeaQzchesNXlRyZMZdg31r9oMWgide3lij65T+ltnx3kOn/w1+3UtzVl
 6grFayXmCmXk/Q5+2xfi7BKIcBrW7EHP3wZACRHjjv+tp7+mvrAUUJstDJiU/7eM
 AxGZdzp0CMWTcW25zUBg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmh0ty8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jan 2024 22:01:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40OM1cgD019658
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jan 2024 22:01:39 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 14:01:38 -0800
Message-ID: <e125a0dc-21a8-3aa5-ac83-db6015d61625@quicinc.com>
Date: Wed, 24 Jan 2024 14:01:37 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] drm/msms/dp: fixed link clock divider bits be over
 written in BPC unknown case
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, <dri-devel@lists.freedesktop.org>, 
 <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
References: <1704917931-30133-1-git-send-email-quic_khsieh@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1704917931-30133-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Mg2qkFV045zLwWOjlpuadpmFGlf4rgKn
X-Proofpoint-ORIG-GUID: Mg2qkFV045zLwWOjlpuadpmFGlf4rgKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_10,2024-01-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240160
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/10/2024 12:18 PM, Kuogee Hsieh wrote:
> Since the value of DP_TEST_BIT_DEPTH_8 is already left shifted, in the
> BPC unknown case, the additional shift causes spill over to the other
> bits of the [DP_CONFIGURATION_CTRL] register.
> Fix this by changing the return value of dp_link_get_test_bits_depth()
> in the BPC unknown case to (DP_TEST_BIT_DEPTH_8 >> DP_TEST_BIT_DEPTH_SHIFT).
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c |  5 -----
>   drivers/gpu/drm/msm/dp/dp_link.c | 10 +++++++---
>   2 files changed, 7 insertions(+), 8 deletions(-)
> 

Checkpatch complained about this error:

CHECK: Alignment should match open parenthesis
#61: FILE: drivers/gpu/drm/msm/dp/dp_link.c:1203:
+               drm_dbg_dp(link->drm_dev, "bpp=%d not supported, use 
bpc=8\n",
+                         bpp);


I will fix it while applying ... no need to spin another version for this.
