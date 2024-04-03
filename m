Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F359897668
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 19:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF9C1127CA;
	Wed,  3 Apr 2024 17:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iMBZrW3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FAD1127C9;
 Wed,  3 Apr 2024 17:23:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 433FdDpU010610; Wed, 3 Apr 2024 17:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=Evvas4LlPsjILiFIJPPs0wzDYVlEKRNYnEOnCmyejpA=; b=iM
 BZrW3V0CZS4UD4JSErS+wbgnmtOUvxaE7SkPaBoqHNZv450paS9PdLrWtVCZ6c5I
 Q9UAW9MRtGfInuJg10gO625Tc4KT4wuLezCSSDUlPrafxxPy8AHHgMlY+I0pz3+o
 H39xD6XvB2AKg/jX4aUf3cPyR3qauK24bNqJ7IygKIRLR/evE2IIsyIxtHhUw57f
 Wx3hrO8jCXAK/3S8dbRwiiAnnHDid1uLEwK7PyVwIaCg4OIGMyyqBjLuzqVbC1G+
 G+PmuSysJoyuYSdscvKQ0mpMQal97hNeGaIfG31LFD0//EYhMKQRq84/KEYpQGRc
 743JVg5OOnEtLT8RI+mA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x99xm88fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Apr 2024 17:22:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433HMres015058
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Apr 2024 17:22:53 GMT
Received: from [10.110.67.196] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 10:22:52 -0700
Message-ID: <23f591d7-a5d6-c5d1-9ba1-1584e32e5164@quicinc.com>
Date: Wed, 3 Apr 2024 10:22:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <abel.vesa@linaro.org>, <andersson@kernel.org>
CC: <quic_abhinavk@quicinc.com>, <quic_jesszhan@quicinc.com>,
 <quic_sbillaka@quicinc.com>, <marijn.suijten@somainline.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: IQ9F3a4qewkpepkR5Uw0YBIjhXlF4ZkR
X-Proofpoint-ORIG-GUID: IQ9F3a4qewkpepkR5Uw0YBIjhXlF4ZkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_18,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030117
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

Dmitry,

Any more comments?

On 3/29/2024 12:50 PM, Kuogee Hsieh wrote:
> Currently qmp_combo_dp_power_on() always return 0 in regardless of
> return value of cfg->configure_dp_phy(). This patch propagate
> return value of cfg->configure_dp_phy() all the way back to caller.
>
> Changes in V3:
> -- add v2 changes log
>
> Changes in V2:
> -- add Fixes tag
> -- add dev_err() to qmp_v3_configure_dp_phy()
> -- add dev_err() to qmp_v4_configure_dp_phy()
>
> Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 36632fa..513d99d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2343,8 +2343,10 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
>   	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
>   
>   	ret = qmp_combo_configure_dp_clocks(qmp);
> -	if (ret)
> +	if (ret) {
> +		dev_err(qmp->dev, "dp phy configure failed, err=%d\n", ret);
>   		return ret;
> +	}
>   
>   	writel(0x04, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
>   	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> @@ -2519,8 +2521,10 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
>   	int ret;
>   
>   	ret = qmp_v456_configure_dp_phy(qmp);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		dev_err(qmp->dev, "dp phy configure failed, err=%d\n", ret);
>   		return ret;
> +	}
>   
>   	/*
>   	 * At least for 7nm DP PHY this has to be done after enabling link
> @@ -2754,6 +2758,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>   	void __iomem *tx = qmp->dp_tx;
>   	void __iomem *tx2 = qmp->dp_tx2;
> +	int ret;
>   
>   	mutex_lock(&qmp->phy_mutex);
>   
> @@ -2766,11 +2771,11 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>   	cfg->configure_dp_tx(qmp);
>   
>   	/* Configure link rate, swing, etc. */
> -	cfg->configure_dp_phy(qmp);
> +	ret = cfg->configure_dp_phy(qmp);
>   
>   	mutex_unlock(&qmp->phy_mutex);
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static int qmp_combo_dp_power_off(struct phy *phy)
