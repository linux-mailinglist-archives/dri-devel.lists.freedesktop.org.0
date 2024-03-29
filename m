Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7483892346
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 19:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25D610E7DE;
	Fri, 29 Mar 2024 18:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="O5o/hWK1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0210E7DE;
 Fri, 29 Mar 2024 18:24:27 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42THep9x004230; Fri, 29 Mar 2024 18:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Qh3m4g8y3ZINF4whjQq7eyoFI2/8iK7n4ltsiqUmFfM=; b=O5
 o/hWK1uLjJQgMce3C8zJLwBgFXFSzJ4UY4MV39JGvDwmHr8/te4jNwhtL6A+xFBD
 FaDe3XB0Roqm43K5jQSelFEZmlUxOWJp34mqevFG4NTSV1uJATjTK3XSyp/jMffi
 H8Kc+GgTDTcUZauzHXixKB537lv+pso8Vuz55IYerd2n39zSBgOq0vSa/cVnj48i
 cZhwFxI7XJvPe1hdX8caY1BgXBmX/XZ9Oh+kDFuY+DfgPiL9bhA8/vx9OB+MHivy
 M3ZDzIugO5HIKX8LjVIGa0WiKGbd/wmvq21YkUtciwo5z2TFWBqa5wONmniKpXuf
 l5pQErFttyJZUKLHcKEA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5xcy0m98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 18:24:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TIOIqA020876
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 18:24:18 GMT
Received: from [10.110.118.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 11:24:14 -0700
Message-ID: <6dcdc5f6-6e4a-f486-26fb-fd37f44316e8@quicinc.com>
Date: Fri, 29 Mar 2024 11:24:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, <dri-devel@lists.freedesktop.org>, 
 <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
 <andersson@kernel.org>
CC: <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
 <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1711730495-30330-1-git-send-email-quic_khsieh@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <1711730495-30330-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: j4A-oPxM-XLrv410vidVyQJhg8DWe4OF
X-Proofpoint-ORIG-GUID: j4A-oPxM-XLrv410vidVyQJhg8DWe4OF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=970 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290163
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



On 3/29/2024 9:41 AM, Kuogee Hsieh wrote:
> Currently qmp_combo_dp_power_on() always return 0 in regardless of
> return value of cfg->configure_dp_phy(). This patch propagate
> return value of cfg->configure_dp_phy() all the way back to caller.
> 
> Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 

Thanks for the cleanup!

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
