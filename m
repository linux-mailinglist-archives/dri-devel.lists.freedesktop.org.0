Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466959E15C0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2DC10E96C;
	Tue,  3 Dec 2024 08:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Lvk0Nskf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A3A10E21B;
 Mon,  2 Dec 2024 09:06:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B290TwE010338;
 Mon, 2 Dec 2024 09:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q+PjIrCert+/x3e/5SEkFOVcd9o7Q54etqy826imJuw=; b=Lvk0Nskf1gPfvfDw
 6oiXQJKJretf1FbX6tCF65Oin00bzsNqPMVLSqto5EjPwoOpWEPYgs+gRxPnYPvJ
 OugShnOB3gSM79fEDqRmEQ8XPhpWD3KqT1LC5gxg6NKa8wQee/sdLBKJLOJl84Ml
 z+puN4qOi2uAEjJAArl7BULURcrB2m5egdBKKGFp/IT0RtKVgs+rMAS1BZAtm56/
 9edM3NsNnYyqQnpTLI6H7otEPojliXVkq7xuuxMSf5t+cW/0HXwfYHh0sttMSi+0
 OipxLk/k6/UWv5z098AG+rtXMIaiTw8GXzuHuhrR3+ki+ByzTzCeacU2DFtjVHIh
 9ZfvvQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437v07m479-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Dec 2024 09:05:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B295qEj015760
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Dec 2024 09:05:52 GMT
Received: from [10.64.16.135] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 01:05:45 -0800
Message-ID: <95a78722-8266-4d5d-8d2f-e8efa1aa2e87@quicinc.com>
Date: Mon, 2 Dec 2024 17:05:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/msm/dp: Add maximum width limitation for modes
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
 <20241129-add-displayport-support-for-qcs615-platform-v1-6-09a4338d93ef@quicinc.com>
 <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com>
From: Xiangxu Yin <quic_xiangxuy@quicinc.com>
In-Reply-To: <CAA8EJpprTGRTxO+9BC6GRwxE4A3CuvmySsxS2Nh4Tqj0nDRT_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: GJp2ATP3aUD-3hgyB8FaFF86sI5EXzVQ
X-Proofpoint-GUID: GJp2ATP3aUD-3hgyB8FaFF86sI5EXzVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020079
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



On 11/29/2024 9:52 PM, Dmitry Baryshkov wrote:
> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>
>> Introduce a maximum width constraint for modes during validation. This
>> ensures that the modes are filtered based on hardware capabilities,
>> specifically addressing the line buffer limitations of individual pipes.
> 
> This doesn't describe, why this is necessary. What does "buffer
> limitations of individual pipes" mean?
> If the platforms have hw capabilities like being unable to support 8k
> or 10k, it should go to platform data
> 
It's SSPP line buffer limitation for this platform and only support to 2160 mode width.
Then, shall I add max_width config to struct msm_dp_desc in next patch? for other platform will set defualt value to ‘DP_MAX_WIDTH 7680'
>>
>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c |  3 +++
>>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 +++++++++++++
>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>>  4 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 4c83402fc7e0d41cb7621fa2efda043269d0a608..eb6fb76c68e505fafbec563440e9784f51e1894b 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -944,6 +944,9 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
>>         msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>>         link_info = &msm_dp_display->panel->link_info;
>>
>> +       if (mode->hdisplay > msm_dp_display->panel->max_dp_width)
>> +               return MODE_BAD;
>> +
>>         if (drm_mode_is_420_only(&dp->connector->display_info, mode) &&
>>             msm_dp_display->panel->vsc_sdp_supported)
>>                 mode_pclk_khz /= 2;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index ecbc2d92f546a346ee53adcf1b060933e4f54317..7a11f7eeb691976f06afc7aff67650397d7deb90 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -11,6 +11,7 @@
>>  #include "disp/msm_disp_snapshot.h"
>>
>>  #define DP_MAX_PIXEL_CLK_KHZ   675000
>> +#define DP_MAX_WIDTH   7680
>>
>>  struct msm_dp {
>>         struct drm_device *drm_dev;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 8654180aa259234bbd41f4f88c13c485f9791b1d..10501e301c5e073d8d34093b86a15d72e646a01f 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -4,6 +4,7 @@
>>   */
>>
>>  #include "dp_panel.h"
>> +#include "dp_display.h"
>>  #include "dp_utils.h"
>>
>>  #include <drm/drm_connector.h>
>> @@ -455,6 +456,16 @@ static u32 msm_dp_panel_link_frequencies(struct device_node *of_node)
>>         return frequency;
>>  }
>>
>> +static u32 msm_dp_panel_max_width(struct device_node *of_node)
>> +{
>> +       u32 max_width = 0;
>> +
>> +       if (of_property_read_u32(of_node, "max-width", &max_width))
>> +               max_width = DP_MAX_WIDTH;
>> +
>> +       return max_width;
> 
> msm_dp_panel->max_dp_width = DP_MAX_WIDTH;
> of_property_read_u32(of_node, "max-width", &msm_dp_panel->max_dp_width);
> 
>> +}
>> +
>>  static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>>  {
>>         struct msm_dp_panel_private *panel;
>> @@ -490,6 +501,8 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
>>         if (!msm_dp_panel->max_dp_link_rate)
>>                 msm_dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
>>
>> +       msm_dp_panel->max_dp_width = msm_dp_panel_max_width(of_node);
>> +
>>         return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index 7603b92c32902bd3d4485539bd6308537ff75a2c..61513644161209c243bbb623ee4ded951b2a0597 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -51,6 +51,7 @@ struct msm_dp_panel {
>>         u32 lane_map[DP_MAX_NUM_DP_LANES];
>>         u32 max_dp_lanes;
>>         u32 max_dp_link_rate;
>> +       u32 max_dp_width;
>>
>>         u32 max_bw_code;
>>  };
>>
>> --
>> 2.25.1
>>
> 
> 

