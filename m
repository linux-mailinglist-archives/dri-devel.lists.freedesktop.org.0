Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474389765D8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 11:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C494910EB32;
	Thu, 12 Sep 2024 09:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kPfXltKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2360E10EB31;
 Thu, 12 Sep 2024 09:39:48 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2L2fw029584;
 Thu, 12 Sep 2024 09:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CmakW4XfB0c67uSMneJWbWtjJCf22jONs64rRyD7XtE=; b=kPfXltKupHofrBBE
 P596+krg6BPz43D81L4pKPH9C0sB+DkN9s4huKy0YO6lUulnVOQSeyuTq20vPjUa
 2IKsdZ4V0DHGAqzoGyRO9kEIYlQzIuMfdGzoCdBbAWOzKnArbWR8MIUeMHOVUkT/
 6jXByVIN1RnSWPQXMnh85hKI8284LLEtgfnQAiJ9qOnRMf4Upw+G8W6xXXATuajb
 Kqdso3JgXWSRgu+404muc/RGpe7dPw1puSlIP0lWoHMA/9WWpOFIi21WawQd+hFA
 gQ3o9rWsiiHxnL6vnNVjzQbKBXeP5/fjvOcYQhUOlElYO53HjJa9QbCZXD7ATy65
 PEtxxg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5e3x5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 09:39:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C9dfuF028878
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 09:39:41 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Sep
 2024 02:39:32 -0700
Message-ID: <3bf16fae-60ae-4bd2-b631-3cd8bfef0609@quicinc.com>
Date: Thu, 12 Sep 2024 15:09:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] phy: qcom: edp: Introduce aux_cfg array for version
 specific aux settings
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <konradybcio@kernel.org>,
 <andersson@kernel.org>, <simona@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_khsieh@quicinc.com>,
 <konrad.dybcio@linaro.org>, <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <quic_riteshk@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
 <20240911100813.338-3-quic_mukhopad@quicinc.com>
 <ZuJHtXrZIRDd7Kyg@hu-bjorande-lv.qualcomm.com>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <ZuJHtXrZIRDd7Kyg@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mRF0ufnVtER2NYhWRQKJsB86gY3IUxIo
X-Proofpoint-GUID: mRF0ufnVtER2NYhWRQKJsB86gY3IUxIo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120067
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


On 9/12/2024 7:15 AM, Bjorn Andersson wrote:
> On Wed, Sep 11, 2024 at 03:38:10PM +0530, Soutrik Mukhopadhyay wrote:
>> In order to support different HW versions, introduce aux_cfg array
>> to move v4 specific aux configuration settings.
>>
>> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 34 +++++++++++++++++------------
>>   1 file changed, 20 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index da2b32fb5b45..0f860a807d1b 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -90,6 +90,7 @@ struct phy_ver_ops {
>>   
>>   struct qcom_edp_phy_cfg {
>>   	bool is_edp;
>> +	u8 *aux_cfg;
>>   	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>>   	const struct phy_ver_ops *ver_ops;
>>   };
>> @@ -186,11 +187,14 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>>   	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>>   };
>>   
>> +static u8 edp_phy_aux_cfg_v4[10] = {
>> +	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
>> +};
>> +
>>   static int qcom_edp_phy_init(struct phy *phy)
>>   {
>>   	struct qcom_edp *edp = phy_get_drvdata(phy);
>>   	int ret;
>> -	u8 cfg8;
>>   
>>   	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
>>   	if (ret)
>> @@ -222,22 +226,20 @@ static int qcom_edp_phy_init(struct phy *phy)
>>   	 * even needed.
>>   	 */
>>   	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
>> -		cfg8 = 0xb7;
>> -	else
>> -		cfg8 = 0x37;
>> +		edp->cfg->aux_cfg[8] = 0xb7;
> If you have multiple instances of the eDP PHY they will all point to the
> same edp_phy_aux_cfg_v4[], so making instance-specific modifications
> to that array will not be okay.
>
>
> Make edp_phy_aux_cfg_v4[] const to reduce the likelihood for someone
> else to make this mistake in the future and make a local copy of the
> array on the stack so that you can modify it.
>
> Regards,
> Bjorn


Sure, we will change edp_phy_aux_cfg_v4[] to const and use local copy to 
modify it.


>
>>   
>>   	writel(0xfc, edp->edp + DP_PHY_MODE);
>>   
>> -	writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
>> -	writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
>> -	writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
>> -	writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
>> -	writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
>> -	writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
>> -	writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
>> -	writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
>> -	writel(cfg8, edp->edp + DP_PHY_AUX_CFG8);
>> -	writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
>> +	writel(edp->cfg->aux_cfg[0], edp->edp + DP_PHY_AUX_CFG0);
>> +	writel(edp->cfg->aux_cfg[1], edp->edp + DP_PHY_AUX_CFG1);
>> +	writel(edp->cfg->aux_cfg[2], edp->edp + DP_PHY_AUX_CFG2);
>> +	writel(edp->cfg->aux_cfg[3], edp->edp + DP_PHY_AUX_CFG3);
>> +	writel(edp->cfg->aux_cfg[4], edp->edp + DP_PHY_AUX_CFG4);
>> +	writel(edp->cfg->aux_cfg[5], edp->edp + DP_PHY_AUX_CFG5);
>> +	writel(edp->cfg->aux_cfg[6], edp->edp + DP_PHY_AUX_CFG6);
>> +	writel(edp->cfg->aux_cfg[7], edp->edp + DP_PHY_AUX_CFG7);
>> +	writel(edp->cfg->aux_cfg[8], edp->edp + DP_PHY_AUX_CFG8);
>> +	writel(edp->cfg->aux_cfg[9], edp->edp + DP_PHY_AUX_CFG9);
>>   
>>   	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
>>   	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
>> @@ -519,16 +521,19 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>>   };
>>   
>>   static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>> +	.aux_cfg = edp_phy_aux_cfg_v4,
>>   	.ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>   
>>   static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
>> +	.aux_cfg = edp_phy_aux_cfg_v4,
>>   	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>>   	.ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>   
>>   static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>>   	.is_edp = true,
>> +	.aux_cfg = edp_phy_aux_cfg_v4,
>>   	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>>   	.ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>> @@ -707,6 +712,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>>   };
>>   
>>   static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>> +	.aux_cfg = edp_phy_aux_cfg_v4,
>>   	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>>   	.ver_ops = &qcom_edp_phy_ops_v6,
>>   };
>> -- 
>> 2.17.1
>>
