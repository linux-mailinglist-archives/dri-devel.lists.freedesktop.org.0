Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A419E6880
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6CB10F00A;
	Fri,  6 Dec 2024 08:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZqcnoTRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4460A10E12F;
 Thu,  5 Dec 2024 11:28:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59vcMR026540;
 Thu, 5 Dec 2024 11:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c6yBsYlk2hHbVT3Z1KXyd5EEqZ0mKQH8kRsKaEi4jcY=; b=ZqcnoTRBOHe3fARj
 rbD/lcrI9ZGSj5YVkiu5XHIqtXAO13ne+nQ+svWCw/+QnxdbJeu/0su1y5DLlv9W
 LbvRT3ijasmhin+7jiDw57KT0y1j3SJvTWJiVIYDWKK1vDD+z6fB1iaCvA0zFHf7
 lvQGzSsELIXp9aN5c7mUFf83VvcXRdA0bySXt8GhjBFsohtoNNdV9LPfiTW+5chz
 GHdIxHKo2wvl3a0EKEFpO/FcPpwLv+XKXIXdZTyESpWnOeRMjaE33pZ97uyUjI91
 sZfaOLjdeT0jxyKFw857MVuRAjaChhHCg91xZKbahXl9FEOB+Z66vgAHX6a22zFk
 Fi8L5w==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kg81j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2024 11:28:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5BSUf2017587
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 5 Dec 2024 11:28:30 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 03:28:24 -0800
Message-ID: <93ddb63c-42da-43c8-9a77-c517ca5d6432@quicinc.com>
Date: Thu, 5 Dec 2024 19:28:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/msm/dp: Add support for lane mapping configuration
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
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
 <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
 <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
 <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: H_LCpRw1-Wm5UGBopzUOtJ16lxNUcf9k
X-Proofpoint-GUID: H_LCpRw1-Wm5UGBopzUOtJ16lxNUcf9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050082
X-Mailman-Approved-At: Fri, 06 Dec 2024 08:12:04 +0000
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



On 12/2/2024 6:46 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 04:40:05PM +0800, Xiangxu Yin wrote:
>>
>>
>> On 11/29/2024 9:50 PM, Dmitry Baryshkov wrote:
>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>
>>>> Add the ability to configure lane mapping for the DP controller. This is
>>>> required when the platform's lane mapping does not follow the default
>>>> order (0, 1, 2, 3). The mapping rules are now configurable via the
>>>> `data-lane` property in the devicetree. This property defines the
>>>> logical-to-physical lane mapping sequence, ensuring correct lane
>>>> assignment for non-default configurations.
>>>>
>>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
>>>>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
>>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
>>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
>>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
>>>>  5 files changed, 20 insertions(+), 11 deletions(-)
>>>>
> 
>>>> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>>>>         struct msm_dp_panel_private *panel;
>>>>         struct device_node *of_node;
>>>>         int cnt;
>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3};
>>>>
>>>>         panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>>>         of_node = panel->dev->of_node;
>>>> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>>>>                 cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>>>>         }
>>>>
>>>> -       if (cnt > 0)
>>>> +       if (cnt > 0) {
>>>> +               struct device_node *endpoint;
>>>> +
>>>>                 msm_dp_panel->max_dp_lanes = cnt;
>>>> -       else
>>>> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
>>>> +               of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
>>>> +       } else {
>>>>                 msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
>>>> +       }
>>>
>>> Why? This sounds more like dp_catalog or (after the refactoring at
>>> [1]) dp_ctrl. But not the dp_panel.
>>>
>>> [1] https://patchwork.freedesktop.org/project/freedreno/series/?ordering=-last_updated
>>>
>> We are used the same prop 'data-lanes = <3 2 0 1>' in mdss_dp_out to keep similar behaviour with dsi_host_parse_lane_data.
>> From the modules used, catalog seems more appropriate, but since the max_dp_lanes is parsed at dp_panel, it has been placed here.
>> Should lane_map parsing in msm_dp_catalog_get, and keep max_dp_lanes parsing at the dp_panel?
> 
> msm_dp_catalog_get() is going to be removed. Since the functions that
> are going to use it are in dp_ctrl module, I thought that dp_ctrl.c is
> the best place. A better option might be to move max_dp_lanes and
> max_dp_link_rate to dp_link.c as those are link params. Then
> lane_mapping also logically becomes a part of dp_link module.
> 
> But now I have a more important question (triggered by Krishna's email
> about SAR2130P's USB): if the lanes are swapped, does USB 3 work on that
> platform? Or is it being demoted to USB 2 with nobody noticing that?
> 
> If lanes 0/1 and 2/3 are swapped, shouldn't it be handled in the QMP
> PHY, where we handle lanes and orientation switching?
> 
I have checked the DP hardware programming guide and also discussed it with Krishna.

According to the HPG section '3.4.2 PN and Lane Swap: PHY supports PN swap for mainlink and AUX, but it doesn't support lane swap feature.' 

The lane swap mainly refers to the logical to physical mapping between the DP controller and the DP PHY. The PHY handles polarity inversion, and the lane map does not affect USB behavior.

On the QCS615 platform, we have also tested when DP works with lane swap, other USB 3.0 ports can works normally at super speed.

Additionally, if it were placed on the PHY side, the PHY would need access to dp_link’s domain which can access REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.
Therefore, we believe that the  max_dp_link_rate,max_dp_lanes and lane_map move to dp_link side is better.

>>>> +
>>>> +       memcpy(msm_dp_panel->lane_map, lane_map, msm_dp_panel->max_dp_lanes * sizeof(u32));
>>>>
>>>>         msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
>>>>         if (!msm_dp_panel->max_dp_link_rate)
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
>>>> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7603b92c32902bd3d4485539bd6308537ff75a2c 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>>>> @@ -11,6 +11,8 @@
>>>>  #include "dp_aux.h"
>>>>  #include "dp_link.h"
>>>>
>>>> +#define DP_MAX_NUM_DP_LANES    4
>>>> +
>>>>  struct edid;
>>>>
>>>>  struct msm_dp_display_mode {
>>>> @@ -46,6 +48,7 @@ struct msm_dp_panel {
>>>>         bool video_test;
>>>>         bool vsc_sdp_supported;
>>>>
>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES];
>>>>         u32 max_dp_lanes;
>>>>         u32 max_dp_link_rate;
>>>>
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>
>>>
>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 

