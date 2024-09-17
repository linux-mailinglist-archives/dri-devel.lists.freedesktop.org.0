Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FB897ACFA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 10:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DDE10E42F;
	Tue, 17 Sep 2024 08:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MsvaIlJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD0310E42F;
 Tue, 17 Sep 2024 08:40:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H7ImM1003647;
 Tue, 17 Sep 2024 08:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HNmVVqJ/mbN61tjwbZuFKzRaf2S3xTimJ/qqkaE6le4=; b=MsvaIlJ8nKVMp73M
 gZFoJ5kq3ThDXFvNHTLE7iG2pkTX54Tfp/2m4SVJyUyV67wt09i0J8hOM6sGJ0US
 UV26y5Vlq3Rv4+XzhAr8hh5xQD/WeC1fJ0km5TgH9CAO2/sF40faIUbZQuhv2zfS
 dJ6vsYxdqC2RbpuRUHk4GGnt++gJsspiGH71jPeMVR1LqOMAWsr1K6N+PiHzb/9k
 94zW2eBOif+1aAw2X34xxlWnsNoeHZ2BRtF3KbveocScCaG8811KDJ16t5oghEY/
 bWbmSM5zkP1EWiYhNZ3EShcylsMKmWOleu9uFcO09pMFeRS6/f4/EZCGQpajnb9V
 0UsyXw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hex8kd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 08:40:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48H8eM2a032454
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2024 08:40:22 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 01:40:13 -0700
Message-ID: <3ea1189b-8b06-45bb-9d60-178f69ee407d@quicinc.com>
Date: Tue, 17 Sep 2024 14:10:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] phy: qcom: edp: Introduce aux_cfg array for
 version specific aux settings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <konradybcio@kernel.org>,
 <andersson@kernel.org>, <simona@ffwll.ch>, <abel.vesa@linaro.org>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_khsieh@quicinc.com>,
 <konrad.dybcio@linaro.org>, <quic_parellan@quicinc.com>,
 <quic_bjorande@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <quic_riteshk@quicinc.com>,
 <quic_vproddut@quicinc.com>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-3-quic_mukhopad@quicinc.com>
 <CAA8EJppddLmzJ9WSkLLr-nwM-qe647Sm6jV8SpHdB=0vRQT-=Q@mail.gmail.com>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <CAA8EJppddLmzJ9WSkLLr-nwM-qe647Sm6jV8SpHdB=0vRQT-=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: EW7-YFs4rYSVK7VBeqBZUWpboj-UHtU3
X-Proofpoint-GUID: EW7-YFs4rYSVK7VBeqBZUWpboj-UHtU3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409170064
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


On 9/13/2024 5:12 PM, Dmitry Baryshkov wrote:
> On Fri, 13 Sept 2024 at 13:38, Soutrik Mukhopadhyay
> <quic_mukhopad@quicinc.com> wrote:
>> In order to support different HW versions, introduce aux_cfg array
>> to move v4 specific aux configuration settings.
>>
>> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>> ---
>> v2: Fixed review comments from Bjorn and Dmitry
>>          - Made aux_cfg array as const.
>>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 37 ++++++++++++++++++-----------
>>   1 file changed, 23 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index da2b32fb5b45..bcd5aced9e06 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -90,6 +90,7 @@ struct phy_ver_ops {
>>
>>   struct qcom_edp_phy_cfg {
>>          bool is_edp;
>> +       const u8 *aux_cfg;
>>          const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>>          const struct phy_ver_ops *ver_ops;
>>   };
>> @@ -186,11 +187,15 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
>>          .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
>>   };
>>
>> +static const u8 edp_phy_aux_cfg_v4[10] = {
>> +       0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
>> +};
>> +
>>   static int qcom_edp_phy_init(struct phy *phy)
>>   {
>>          struct qcom_edp *edp = phy_get_drvdata(phy);
>> +       u8 aux_cfg[10];
> Please define 10, so that there are no magic numbers (and less chance
> of damaging the stack if it gets changed in one place only.


Sure, we will update this in the next version.


>
>>          int ret;
>> -       u8 cfg8;
>>
>>          ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
>>          if (ret)
>> @@ -200,6 +205,8 @@ static int qcom_edp_phy_init(struct phy *phy)
>>          if (ret)
>>                  goto out_disable_supplies;
>>
>> +       memcpy(aux_cfg, edp->cfg->aux_cfg, sizeof(aux_cfg));
>> +
>>          writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
>>                 DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
>>                 edp->edp + DP_PHY_PD_CTL);
>> @@ -222,22 +229,20 @@ static int qcom_edp_phy_init(struct phy *phy)
>>           * even needed.
>>           */
>>          if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
>> -               cfg8 = 0xb7;
>> -       else
>> -               cfg8 = 0x37;
>> +               aux_cfg[8] = 0xb7;
>>
>>          writel(0xfc, edp->edp + DP_PHY_MODE);
>>
>> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
>> -       writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
>> -       writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
>> -       writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
>> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
>> -       writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
>> -       writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
>> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
>> -       writel(cfg8, edp->edp + DP_PHY_AUX_CFG8);
>> -       writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
>> +       writel(aux_cfg[0], edp->edp + DP_PHY_AUX_CFG0);
>> +       writel(aux_cfg[1], edp->edp + DP_PHY_AUX_CFG1);
>> +       writel(aux_cfg[2], edp->edp + DP_PHY_AUX_CFG2);
>> +       writel(aux_cfg[3], edp->edp + DP_PHY_AUX_CFG3);
>> +       writel(aux_cfg[4], edp->edp + DP_PHY_AUX_CFG4);
>> +       writel(aux_cfg[5], edp->edp + DP_PHY_AUX_CFG5);
>> +       writel(aux_cfg[6], edp->edp + DP_PHY_AUX_CFG6);
>> +       writel(aux_cfg[7], edp->edp + DP_PHY_AUX_CFG7);
>> +       writel(aux_cfg[8], edp->edp + DP_PHY_AUX_CFG8);
>> +       writel(aux_cfg[9], edp->edp + DP_PHY_AUX_CFG9);
> Replace this with a loop?


Can we use below approach for this :

#define DP_PHY_AUX_CFG(n)        (0x24 + (0x04 * (n)))

for (int i = 0; i < 10; i++)

     writel(aux_cfg[i], edp->edp + DP_PHY_AUX_CFG(i));


>
>>          writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
>>                 PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
>> @@ -519,16 +524,19 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>>   };
>>
>>   static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>> +       .aux_cfg = edp_phy_aux_cfg_v4,
>>          .ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>
>>   static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
>> +       .aux_cfg = edp_phy_aux_cfg_v4,
>>          .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>>          .ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>>
>>   static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
>>          .is_edp = true,
>> +       .aux_cfg = edp_phy_aux_cfg_v4,
>>          .swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
>>          .ver_ops = &qcom_edp_phy_ops_v4,
>>   };
>> @@ -707,6 +715,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>>   };
>>
>>   static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
>> +       .aux_cfg = edp_phy_aux_cfg_v4,
>>          .swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
>>          .ver_ops = &qcom_edp_phy_ops_v6,
>>   };
>> --
>> 2.17.1
>>
>
