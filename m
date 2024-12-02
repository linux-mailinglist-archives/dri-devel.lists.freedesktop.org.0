Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E979E15BB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B49010E966;
	Tue,  3 Dec 2024 08:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="gPHIHzQA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B52310E6B3;
 Mon,  2 Dec 2024 10:32:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28PD8r030509;
 Mon, 2 Dec 2024 10:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V9JKIx72ZzU6OqC05+Y0cV4EzX/9xl6Xv4DQi1WQZEY=; b=gPHIHzQAq5b3PbBr
 5zksYJJH7AjoF0Cyyx4OcUXfLi2YtKe126piVvjWtAqQTkkwGaWWoiG4ziEvSaY9
 t7+xhLEOjKZyIldwADuzca1oFHHg7u6rEuqkdW6T9OjfWFzX35H01yfck7j6LTsD
 58sGy1dVSAaSrbC1JTAw4HS6NhGKJhn+jvu6dhzbkqsracwkV2SCqN875hebPIEV
 /U6HM5bawBWTrh4c9khrUgEWtnqmbcrztDA2i248cVi/gnLXZWWVG7CyG4fzNcCT
 IacBlmyiTWeO+QPXTN0gkvVhln2k4dLXJ9AaTivY8AamMAgOM6Se+N9V5rNePG9C
 /m9ujQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437sq64hfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2024 10:31:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2AVr7m000301
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Dec 2024 10:31:53 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 02:31:46 -0800
Message-ID: <22600892-3b0d-4b0f-9c46-e74241960dda@quicinc.com>
Date: Mon, 2 Dec 2024 18:31:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] phy: qcom: qmp-usbc: Add DP phy mode support on QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, <quic_lliu6@quicinc.com>,
 <quic_fangez@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-gpio@vger.kernel.org>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-3-09a4338d93ef@quicinc.com>
 <b310587f-c6c3-41dd-83bf-6affbcc65730@kernel.org>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <b310587f-c6c3-41dd-83bf-6affbcc65730@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ouCZElGXG-cUky1JI7neTh2rj2duVt65
X-Proofpoint-ORIG-GUID: ouCZElGXG-cUky1JI7neTh2rj2duVt65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020093
X-Mailman-Approved-At: Tue, 03 Dec 2024 08:28:29 +0000
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



On 11/29/2024 4:18 PM, Krzysztof Kozlowski wrote:
> On 29/11/2024 08:57, Xiangxu Yin wrote:
>> Extended DP support for QCS615 USB or DP phy. Differentiated between
>> USBC and DP PHY using the match table’s type, dynamically generating
>> different types of cfg and layout attributes during initialization based
>> on this type. Static variables are stored in cfg, while parsed values
>> are organized into the layout structure.
>>
>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |    1 +
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 1453 ++++++++++++++++++++++++----
>>  2 files changed, 1254 insertions(+), 200 deletions(-)
> 
> 
> 
> ...
> 
>> +	/* program default setting first */
>> +	writel(0x2A, tx + QSERDES_V3_TX_TX_DRV_LVL);
>> +	writel(0x20, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
>> +	writel(0x2A, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
>> +	writel(0x20, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
>> +
>> +	writel(voltage_swing_cfg, tx + QSERDES_V3_TX_TX_DRV_LVL);
>> +	writel(pre_emphasis_cfg, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
>> +	writel(voltage_swing_cfg, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
>> +	writel(pre_emphasis_cfg, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp)
>> +{
>> +	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
>> +	u32 status;
>> +
>> +	writel(0x01, layout->dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x05, layout->dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x01, layout->dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x09, layout->dp_phy + QSERDES_DP_PHY_CFG);
>> +
>> +	writel(0x20, layout->dp_serdes + QSERDES_COM_RESETSM_CNTRL);
>> +
>> +	// C_READY
> 
> Use Linux coding style.
> 
> Anyway, drop all useless comments. Say something useful or don't say
> anything.
> 
Ok, will update in next seperated patches.
>> +	if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_C_READY_STATUS,
>> +			status,
>> +			((status & BIT(0)) > 0),
>> +			500,
>> +			10000)) {
>> +		dev_err(qmp->dev, "C_READY not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	// FREQ_DONE
>> +	if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_CMN_STATUS,
>> +			status,
>> +			((status & BIT(0)) > 0),
>> +			500,
>> +			10000)){
>> +		dev_err(qmp->dev, "FREQ_DONE not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	// PLL_LOCKED
>> +	if (readl_poll_timeout(layout->dp_serdes + QSERDES_COM_CMN_STATUS,
>> +			status,
>> +			((status & BIT(1)) > 0),
>> +			500,
>> +			10000)){
>> +		dev_err(qmp->dev, "PLL_LOCKED not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	writel(0x19, layout->dp_phy + QSERDES_DP_PHY_CFG);
>> +	udelay(10);
>> +
>> +	// TSYNC_DONE
>> +	if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
>> +			status,
>> +			((status & BIT(0)) > 0),
>> +			500,
>> +			10000)){
>> +		dev_err(qmp->dev, "TSYNC_DONE not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	// PHY_READY
>> +	if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
>> +			status,
>> +			((status & BIT(1)) > 0),
>> +			500,
>> +			10000)){
>> +		dev_err(qmp->dev, "PHY_READY not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	writel(0x3f, layout->dp_tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
>> +	writel(0x10, layout->dp_tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
>> +	writel(0x0a, layout->dp_tx + QSERDES_V3_TX_TX_POL_INV);
>> +	writel(0x3f, layout->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
>> +	writel(0x10, layout->dp_tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
>> +	writel(0x0a, layout->dp_tx2 + QSERDES_V3_TX_TX_POL_INV);
>> +
>> +	writel(0x18, layout->dp_phy + QSERDES_DP_PHY_CFG);
>> +	writel(0x19, layout->dp_phy + QSERDES_DP_PHY_CFG);
>> +
>> +	if (readl_poll_timeout(layout->dp_phy + QSERDES_V3_DP_PHY_STATUS,
>> +			status,
>> +			((status & BIT(1)) > 0),
>> +			500,
>> +			10000)){
>> +		dev_err(qmp->dev, "PHY_READY not ready\n");
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp)
>> +{
>> +	static const u8 cfg1_settings[] = {0x13, 0x23, 0x1d};
>> +	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
>> +	u8 val;
>> +
>> +	layout->dp_aux_cfg++;
>> +	layout->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
>> +	val = cfg1_settings[layout->dp_aux_cfg];
>> +
>> +	writel(val, layout->dp_phy + QSERDES_DP_PHY_AUX_CFG1);
>> +
>> +	qmp_usbc_check_dp_phy(qmp, "pos_calibrate");
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmp_usbc_com_init(struct phy *phy)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> -	void __iomem *pcs = qmp->pcs;
>> +	int num_vregs;
>>  	u32 val = 0;
>>  	int ret;
>> +	unsigned int reg_pwr_dn;
>>  
>> -	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>> +	if (qmp->type == QMP_PHY_USBC_USB) {
> 
> 
> Sorry, all this code is unreviewable. Organize your changes in logical,
> reviewable chunks.
> 
Will create new patch list and seperate patchsets.
>> +		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
>> +
>> +		num_vregs = cfg->num_vregs;
>> +		reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
>> +	} else {
> 
> ...
> 
>> +		.compatible = "qcom,qcs615-qmp-dp-phy",
>> +		.data =  &(struct dev_cfg) {
>> +			.type = QMP_PHY_USBC_DP,
>> +			.cfg = &qcs615_dpphy_cfg,
>> +		},
>>  	}, {
>>  		.compatible = "qcom,sdm660-qmp-usb3-phy",
>> -		.data = &sdm660_usb3phy_cfg,
>> +		.data =  &(struct dev_cfg) {
>> +			.type = QMP_PHY_USBC_USB,
>> +			.cfg = &sdm660_usb3phy_cfg,
>> +		},
>>  	}, {
>>  		.compatible = "qcom,sm6115-qmp-usb3-phy",
>> -		.data = &qcm2290_usb3phy_cfg,
>> +		.data =  &(struct dev_cfg) {
>> +			.type = QMP_PHY_USBC_USB,
>> +			.cfg = &qcm2290_usb3phy_cfg,
>> +		},
>>  	},
>>  	{ },
>>  };
>> +
> 
> 
> You make some random changes all over this file. No, clean it up.
> 
>>  MODULE_DEVICE_TABLE(of, qmp_usbc_of_match_table);
>>  
>>  static struct platform_driver qmp_usbc_driver = {
>>
> 
> 
> Best regards,
> Krzysztof

