Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5F5A3346B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 02:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB01F10E025;
	Thu, 13 Feb 2025 01:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KQnKBDoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E758D10E025;
 Thu, 13 Feb 2025 01:13:19 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CK7KHK027354;
 Thu, 13 Feb 2025 01:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gdZSs1LooZKS4D33/7PpTOqPdf5VBXBTBOdvjyD7guA=; b=KQnKBDoypdQiSxaE
 EFQYrD5Olhnbm+Zim8A+JlaBEAbTabipI8AHX1Nl4TTQMi9CfIhaD6pQh84MFk5H
 r34tIMuANMkPn/l70ZoaGU4uOhrPMFn91EChZzTMGW0lyJKt1S2EEenppxiXDxi4
 RWIUh3G44T1YOVtf6D1q/gteW916xphmas4iVSo2xRda2KMkuUQupiJGU9P7VNLq
 JjvAW3ZKIo2W+Sscm/LlXbC32jh+6DfmR9O0FuJkgsQogAchffAhLjw0kddnCJv4
 UEx8D7Z7y+kUa5Eg/fhvtog7dC4Rz7rU6i8eD0jNkTU6hBBnm63OacKzADZVJwki
 f4gQPw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j5detr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 01:13:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D1DANu023543
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Feb 2025 01:13:10 GMT
Received: from [10.71.110.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 17:13:09 -0800
Message-ID: <ca80bd37-3b3f-48d3-a57d-2440d20d0c6c@quicinc.com>
Date: Wed, 12 Feb 2025 17:13:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Vinod Koul <vkoul@kernel.org>, Simona Vetter
 <simona@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 <~postmarketos/upstreaming@lists.sr.ht>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Martin Botka
 <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
 <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
 <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>
 <x4jced57uhdfnq4d7tdqsozxbdosu2fcmsjlqtuuvh25ltx2rc@2eqsa7e4vcdv>
 <c5503020-0224-428a-9452-f8d668b47caf@quicinc.com>
Content-Language: en-US
In-Reply-To: <c5503020-0224-428a-9452-f8d668b47caf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: fqLmMU7Dou3M0N_l-bqIbzZ0cU7tOuZT
X-Proofpoint-GUID: fqLmMU7Dou3M0N_l-bqIbzZ0cU7tOuZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130007
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

Hi Marijn

On 2/10/2025 2:17 PM, Abhinav Kumar wrote:
> 
> 
> On 2/10/2025 6:24 AM, Dmitry Baryshkov wrote:
>> On Mon, Feb 10, 2025 at 01:54:29PM +0100, Marijn Suijten wrote:
>>> On 2025-02-10 01:11:59, Dmitry Baryshkov wrote:
>>>> On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
>>>>> Ordering issues here cause an uninitialized (default STANDALONE)
>>>>> usecase to be programmed (which appears to be a MUX) in some cases
>>>>> when msm_dsi_host_register() is called, leading to the slave PLL in
>>>>> bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
>>>>>
>>>>> This should seemingly not be a problem as the actual dispcc clocks 
>>>>> from
>>>>> DSI1 that are muxed in the clock tree of DSI0 are way further down, 
>>>>> this
>>>>> bit still seems to have an effect on them somehow and causes the right
>>>>> side of the panel controlled by DSI1 to not function.
>>>>>
>>>>> In an ideal world this code is refactored to no longer have such
>>>>> error-prone calls "across subsystems", and instead model the "PLL src"
>>>>> register field as a regular mux so that changing the clock parents
>>>>> programmatically or in DTS via `assigned-clock-parents` has the
>>>>> desired effect.
>>>>> But for the avid reader, the clocks that we *are* muxing into DSI0's
>>>>> tree are way further down, so if this bit turns out to be a simple mux
>>>>> between dsiXvco and out_div, that shouldn't have any effect as this
>>>>> whole tree is off anyway.
>>>>>
>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 ++++++++++++++++++ 
>>>>> +-----------
>>>>>   1 file changed, 19 insertions(+), 11 deletions(-)
>>>>
>>>>
>>>> Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
>>>
>>> I'm not exactly confident about that.  Abhinav pointed out in
>>> https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2375646 that
>>> msm_dsi_host_register() was not supposed to be enabling the PHY, which I
>>> provided a counter-stacktrace for to show that is indeed the case.
>>>
>>> Either this was always a problem that's only become visible now (and 
>>> it's an
>>> issue with that patch), or a different change causes 
>>> msm_dsi_host_register()
>>> to enable the PHY and program the usecase too early?
>>
>> As currently usecase is being programmed after the DSI host being
>> registered, there might be a race condition between panel driver probe
>> _and_ usecase programming.
>>
>>>
>>> What do you think?
>>>
>>> - Marijn
>>>
> 
> Yes I agree with Dmitry's explanation. The race condition between the 
> two can cause this. Hence I am also fine with this change.
> 
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/ 
>>>>> drm/msm/dsi/dsi_manager.c
>>>>> index 
>>>>> a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>>>> @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
>>>>>       int ret;
>>>>>       if (!IS_BONDED_DSI()) {
>>>>> +        /* Set the usecase before calling msm_dsi_host_register(), 
>>>>> which would
>>>>> +         * already program the PLL source mux based on a default 
>>>>> usecase.
>>>>> +         */
>>>>> +        msm_dsi_phy_set_usecase(msm_dsi->phy, 
>>>>> MSM_DSI_PHY_STANDALONE);
>>>>> +        msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>>>>> +
>>>>>           ret = msm_dsi_host_register(msm_dsi->host);
>>>>>           if (ret)
>>>>>               return ret;
>>>>> -
>>>>> -        msm_dsi_phy_set_usecase(msm_dsi->phy, 
>>>>> MSM_DSI_PHY_STANDALONE);
>>>>> -        msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>>>>>       } else if (other_dsi) {
>>>>>           struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
>>>>>                               msm_dsi : other_dsi;
>>>>>           struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
>>>>>                               other_dsi : msm_dsi;
>>>>> +
>>>>> +        /* PLL0 is to drive both DSI link clocks in bonded DSI mode.
>>>>> +         *
>>>>> +        /* Set the usecase before calling msm_dsi_host_register(), 
>>>>> which would
>>>>> +         * already program the PLL source mux based on a default 
>>>>> usecase.
>>>>> +         */

My compiler is throwing a warning here

drivers/gpu/drm/msm/dsi/dsi_manager.c: In function 
'dsi_mgr_setup_components':
drivers/gpu/drm/msm/dsi/dsi_manager.c:94:3: warning: "/*" within comment 
[-Wcomment]
    /* Set the usecase before calling msm_dsi_host_register(), which would
    ^
drivers/gpu/drm/msm/dsi/dsi_manager.c: At top level:

Can you pls address this one so that I can pick this one up?

Thanks

Abhinav

