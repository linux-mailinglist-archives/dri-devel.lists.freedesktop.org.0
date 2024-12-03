Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D24B9E117D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 03:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC0E10E60D;
	Tue,  3 Dec 2024 02:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="hpLHFksj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0FA10E238;
 Tue,  3 Dec 2024 02:53:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2IqtQ6012892;
 Tue, 3 Dec 2024 02:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bDZvvIJWx84Kcm3a88jA2sDh6+Ht6aJ3HkFmZEN1EwY=; b=hpLHFksj97CJZTRm
 wSxYjnh4aecnTuJ4XR//ua72gouF/Fqs0lEVEq9ZF6XmHXJ7cfhdyF4n0SEmK5y7
 X9AYyD44IH8gKSVJW8QSQOiD7PURe1+r418oZkn6tuPN2fdRosp0d7XaOP/sWrVV
 8i2n/fA2XGCvwSoCWAdXkMNX8pTmYAESjpBhj91cPzKDVJpyxRqnQEuCgQ/vdJZ8
 NDJrsfRVbDxtdTpQ4WBYM//rcDRdhEanCFo77kSe5cN7x5VHjevkYNJOEsJuDEcV
 YyB27qBIw/ld/Zd5/6ILzoAYnZKwjmKOZMt2KdgltC0N7PjyHNQFX9MaU6LYRLEW
 ToKtMA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mxuqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 02:53:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B32r7Ls011176
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Dec 2024 02:53:07 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 18:53:07 -0800
Message-ID: <19bef0bf-6dcb-4ffc-851e-eeda2c79a861@quicinc.com>
Date: Mon, 2 Dec 2024 18:53:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/hdmi: simplify code in pll_get_integloop_gain
To: Rex Nie <rex.nie@jaguarmicro.com>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <avrac@freebox.fr>
CC: <sean@poorly.run>, <marijn.suijten@somainline.org>,
 <jani.nikula@intel.com>, <mgonzalez@freebox.fr>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <angus.chen@jaguarmicro.com>
References: <20241112074101.2206-1-rex.nie@jaguarmicro.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241112074101.2206-1-rex.nie@jaguarmicro.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: uxxYULHB1BBzvzvJKI50aK5wrBHbRYml
X-Proofpoint-GUID: uxxYULHB1BBzvzvJKI50aK5wrBHbRYml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=777 clxscore=1011 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030023
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



On 11/11/2024 11:41 PM, Rex Nie wrote:
> In pll_get_integloop_gain(), digclk_divsel=1 or 2, base=63 or 196ULL,
> so the base may be 63, 126, 196, 392. The condition base <= 2046
> always true.
> 
> Fixes: caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
