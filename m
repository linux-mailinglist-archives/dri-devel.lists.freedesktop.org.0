Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B46C68880A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 21:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8174B10E61C;
	Thu,  2 Feb 2023 20:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA03710E619;
 Thu,  2 Feb 2023 20:10:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312K7Lj6001915; Thu, 2 Feb 2023 20:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=w9Xm2c23ybA3d5ETV1KVEB5XO3UXo1W7M3lqJi5nADQ=;
 b=NhM+ov+O8mN2uwrdN8u0TSayqnExrHn5MgDe3KkapBdN0PZrq1nFJWzM5Q0gYPvZQvK8
 7Rz7BoCQI5bmSI+dU6ITQzd6sGd1jHPQJjvL+02lbTx0Tv8gVXhi5uNOg1hMMk1eUoz5
 hhPlxVvB3r5QuEchQiWu/UcIMzwOHuioCR3BD1XmTn+sU/8H1yUsAh/0zORT2CBV3ty6
 +yRwaC5GLnyPfcHM7ldcBdUX8ZCQb3hwJK5oghHV80pGf0yIQwTPjHKDqmlIytyZaKy+
 G49+aDobKUFtJligZmtj40Tw+sbNHsw/RtT7yHRTuLUZVc6pPB/nxV0uRlmMWlgsZyr1 jg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfqt3kete-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 20:10:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 312KA6RF021373
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Feb 2023 20:10:06 GMT
Received: from [10.110.99.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 2 Feb 2023
 12:10:05 -0800
Message-ID: <74594853-6ab9-c44d-6f67-38d65fc46466@quicinc.com>
Date: Thu, 2 Feb 2023 12:10:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFT PATCH v2 2/3] drm/msm/dsi: Stop unconditionally powering up
 DSI hosts at modeset
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230131141756.RFT.v2.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
 <43095d93-29c8-b30a-08c0-0a452770c1ce@quicinc.com>
 <CAD=FV=X6A4aZVCaqhT9yP0tD82R3fnaDak67w+p8+Z=WkaRxfw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=X6A4aZVCaqhT9yP0tD82R3fnaDak67w+p8+Z=WkaRxfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: bfA7HV8UXRTuB82Wtoq4iHgIatb5n-Xn
X-Proofpoint-GUID: bfA7HV8UXRTuB82Wtoq4iHgIatb5n-Xn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_14,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302020180
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
Cc: freedreno@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/1/2023 6:33 AM, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jan 31, 2023 at 3:32 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> On 1/31/2023 2:18 PM, Douglas Anderson wrote:
>>> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
>>> time"), we moved powering up DSI hosts to modeset time. This wasn't
>>> because it was an elegant design, but there were no better options.
>>>
>>> That commit actually ended up breaking ps8640, and thus was born
>>> commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
>>> parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
>>> the old way of doing things. It turns out that ps8640 _really_ doesn't
>>> like its pre_enable() function to be called after
>>> dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
>>> because I have any inside knowledge), it looks like the assertion of
>>> "RST#" in the ps8640 runtime resume handler seems like it's not
>>> allowed to happen after dsi_mgr_bridge_power_on()
>>>
>>> Recently, Dave Stevenson's series landed allowing bridges some control
>>> over pre_enable ordering. The meaty commit for our purposes is commit
>>> 4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
>>> bridge init order"). As documented by that series, if a bridge doesn't
>>> set "pre_enable_prev_first" then we should use the old ordering.
>>>
>>> Now that we have the commit ("drm/bridge: tc358762: Set
>>> pre_enable_prev_first") we can go back to the old ordering, which also
>>> allows us to remove the ps8640 special case.
>>>
>>> One last note is that even without reverting commit 7d8e9a90509f
>>> ("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
>>> revert the ps8640 special case and try it out then it doesn't seem to
>>> fail anymore. I spent time bisecting / debugging this and it turns out
>>> to be mostly luck, so we still want this patch to make sure it's
>>> solid. Specifically the reason it sorta works these days is because
>>> we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
>>> "pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
>>> implemented means that we actually power the bridge chip up just a wee
>>> bit earlier and then the bridge happens to stay on because of
>>> autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().
>>>
>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>> Changes in v2:
>>> - Don't fold dsi_mgr_bridge_power_on() back into dsi_mgr_bridge_pre_enable()
>>>
>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 38 +--------------------------
>>>    1 file changed, 1 insertion(+), 37 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> index 1bbac72dad35..2197a54b9b96 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> @@ -34,32 +34,6 @@ static struct msm_dsi_manager msm_dsim_glb;
>>>    #define IS_SYNC_NEEDED()    (msm_dsim_glb.is_sync_needed)
>>>    #define IS_MASTER_DSI_LINK(id)      (msm_dsim_glb.master_dsi_link_id == id)
>>>
>>> -#ifdef CONFIG_OF
>>> -static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
>>> -{
>>> -     struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
>>> -
>>> -     /*
>>> -      * If the next bridge in the chain is the Parade ps8640 bridge chip
>>> -      * then don't power on early since it seems to violate the expectations
>>> -      * of the firmware that the bridge chip is running.
>>> -      *
>>> -      * NOTE: this is expected to be a temporary special case. It's expected
>>> -      * that we'll eventually have a framework that allows the next level
>>> -      * bridge to indicate whether it needs us to power on before it or
>>> -      * after it. When that framework is in place then we'll use it and
>>> -      * remove this special case.
>>> -      */
>>> -     return !(next_bridge && next_bridge->of_node &&
>>> -              of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
>>> -}
>>> -#else
>>> -static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
>>> -{
>>> -     return true;
>>> -}
>>> -#endif
>>> -
>>>    static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
>>>    {
>>>        return msm_dsim_glb.dsi[id];
>>> @@ -265,12 +239,6 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>>        int ret;
>>>
>>>        DBG("id=%d", id);
>>> -     if (!msm_dsi_device_connected(msm_dsi))
>>> -             return;
>>> -
>>> -     /* Do nothing with the host if it is slave-DSI in case of bonded DSI */
>>> -     if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
>>> -             return;
>>>
>>
>> Why are these two checks removed?
> 
> After this patch there is now one caller to this function and the one
> caller does those exact same two checks immediately before calling
> this function. Thus, they no longer do anything useful.
> 
> -Doug

Ack, understood. dsi_mgr_bridge_pre_enable() has the same checks. Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
