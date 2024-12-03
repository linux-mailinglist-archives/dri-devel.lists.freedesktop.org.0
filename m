Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045919E15B8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6772510E964;
	Tue,  3 Dec 2024 08:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ekr9OIgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4A610E943;
 Tue,  3 Dec 2024 08:13:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B38DHm7021372;
 Tue, 3 Dec 2024 08:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lyio5c/QsJpciT6SfoU0fRT+8D6R60aiIJYgWs6p97M=; b=ekr9OIgfslsb1awo
 JKMf8PrdseqcAamEcRBSfXr0t60vThSOxHPKUYOKNVQNge/ROrx2xjIYczxAOHJX
 c2XSjm2rA32/Kw7MR3b5Ms7y1eZIVFeae78357DdASe9spHdhiSYN+BTypIhVIO+
 XLK+4DFyVZ3xpJmcLABse6PrWFhlayAYlUQ2qxxYOqo6IYIp+658abNSQ9MJeLWI
 TRRixQrqmVl+7ZKErEDmDbvYmELIUuI6lxn+qDvBBIYBehoKxlfsGM2XqmVomdym
 K/2wieTsaSZc5auVtrriwoXgp+/rJGaRdqJkJGCkWqvSynUHymiHSeXduXrSXMC+
 1RaMhw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe79g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Dec 2024 08:13:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B38DV8n018083
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 3 Dec 2024 08:13:31 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 00:13:25 -0800
Message-ID: <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
Date: Tue, 3 Dec 2024 16:13:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
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
 <quic_fangez@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: t1dX3nC9GUAWYDcJWQ-NfbM5Ailiyc0r
X-Proofpoint-GUID: t1dX3nC9GUAWYDcJWQ-NfbM5Ailiyc0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030069
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



On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>
>> Add a mechanism to retry Link Training 2 by lowering the pattern level
>> when the link training #2 first attempt fails. This approach enhances
>> compatibility, particularly addressing issues caused by certain hub
>> configurations.
> 
> Please reference corresponding part of the standard, describing this lowering.
> 
Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
- All devices shall support TPS1 and TPS2
- HDR2-capable devices shall support TPS3
- HDR3-capable devices shall support TPS4
While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.

This experience suggests that implementing a flexible link training pattern downgrade mechanism can significantly improve compatibility with third-party, non-standard hubs and displays,
especially in scenarios where strict adherence to the highest training pattern might prevent successful connection.
>>
>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 34 ++++++++++++++++++++++++++++++----
>>  1 file changed, 30 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 49c8ce9b2d0e57a613e50865be3fe98e814d425a..b1862294cb98c9f756b0108b7670cb42de37bae4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -1220,7 +1220,7 @@ static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
>>  }
>>
>>  static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>> -                       int *training_step)
>> +                       int *training_step, bool downgrade)
>>  {
>>         int tries = 0, ret = 0;
>>         u8 pattern;
>> @@ -1243,6 +1243,28 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>>                 state_ctrl_bit = 2;
>>         }
>>
>> +       /*
>> +        * DP link training uses the highest allowed pattern by default.
>> +        * If it fails, the pattern is downgraded to improve cable and monitor compatibility.
>> +        */
>> +       if (downgrade) {
>> +               switch (pattern) {
>> +               case DP_TRAINING_PATTERN_4:
>> +                       pattern = DP_TRAINING_PATTERN_3;
>> +                       state_ctrl_bit = 3;
>> +                       break;
>> +               case DP_TRAINING_PATTERN_3:
>> +                       pattern = DP_TRAINING_PATTERN_2;
>> +                       state_ctrl_bit = 2;
>> +                       break;
>> +               default:
>> +                       break;
>> +               }
>> +       }
>> +
>> +       drm_dbg_dp(ctrl->drm_dev, "pattern(%d) state_ctrl_bit(%d) downgrade(%d)\n",
>> +               pattern, state_ctrl_bit, downgrade);
>> +
>>         ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
>>         if (ret)
>>                 return ret;
>> @@ -1311,10 +1333,14 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>         /* print success info as this is a result of user initiated action */
>>         drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
>>
>> -       ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
>> +       ret = msm_dp_ctrl_link_train_2(ctrl, training_step, false);
>>         if (ret) {
>> -               DRM_ERROR("link training #2 failed. ret=%d\n", ret);
>> -               goto end;
>> +               drm_dbg_dp(ctrl->drm_dev, "link training #2 failed, retry downgrade.\n");
>> +               ret = msm_dp_ctrl_link_train_2(ctrl, training_step, true);
>> +               if (ret) {
>> +                       DRM_ERROR("link training #2 failed. ret=%d\n", ret);
>> +                       goto end;
>> +               }
>>         }
>>
>>         /* print success info as this is a result of user initiated action */
>>
>> --
>> 2.25.1
>>
> 
> 

