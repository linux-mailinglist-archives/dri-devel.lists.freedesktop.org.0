Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30160B1C32F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC56810E739;
	Wed,  6 Aug 2025 09:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Ixq8Xwag";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9673210E2F3;
 Wed,  6 Aug 2025 09:22:43 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761emj9012364;
 Wed, 6 Aug 2025 09:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q6O00DOUo3z/65mvthWuChhehH49gjD7ABS3u85xnXI=; b=Ixq8Xwagob0Juhu7
 +TunaZdpy+grWCJ+p/HKcT60EUD5KA7ns6lxMQNftD/mhI2gzHWJ1/iNomFywz5U
 dmNhB1lbXGDJpBwfJUEeJn5BFi6fjXq17tK+6JEko+3+/lDRrEkFHkUc8W8ls410
 ZhBLmtRBT/jxweL9sWmwkocQ+N6mRig7yntDaEc25ORs+U0pg5ELELFR5Afn1ycz
 ty63B9dFGKiy05jnSY8twoMpf3edCEhN6kHRVSzr+3NSHC3RrzRCqEN/t2vXrR9G
 79ItzXg/71LxMqapgJWgSmAxHDyEZu+vnWl+wMFDCSsXnHLmBg95nR6yktL0/6yG
 tkXLIw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2t8c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Aug 2025 09:22:39 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5769McQH000315
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Aug 2025 09:22:38 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 6 Aug
 2025 02:22:34 -0700
Message-ID: <d55c1d20-fd55-4b43-b0cf-bcb2e7e3368e@quicinc.com>
Date: Wed, 6 Aug 2025 17:22:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/38] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-2-a54d8902a23d@quicinc.com>
 <kq6tb2wnte6v5z7uxgzc22kjwcevgvcdluzqbelvnbpbxlkotd@ltlv3u2guj4u>
 <1be2238d-7bb2-4ef9-9c7c-81dab0dcb559@quicinc.com>
 <4jrpa7iyygciuy2k4ydk7cpm5isdrddclljf6gbyvkiqc645tx@idyds4tkstkx>
 <9358a017-81ed-4db7-8e35-955922287c76@quicinc.com>
 <26f21464-022b-460a-92f2-0ea626cfd262@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <26f21464-022b-460a-92f2-0ea626cfd262@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=68931edf cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8
 a=COk6AnOGAAAA:8 a=6NGmDYjr-diiUQuua-UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PjkqvgjJieGFe_iKYvqdzxIo6SUWeCbu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX5lFhMp/PkvTQ
 LB2Z9UM6510Cn3TxTDdrVSBh5gLWKA9f6eAzuCPa37+Acqg6WZUo9EHw+UkNfvnSmWuAIwxRIBd
 tHm+iff0ryBbzvGjapPH4c2bUNHCkXo9EMIdFfK85Al5Q0QUfeSJS9QyENbFHSavR4vYbPjGCE/
 ZSAruHjkp4gIRYGUvX0HxAoclGAjLH6/fP/NkkkQ3DjWrUUarOfhbVQGGrK16pi+7rNdZx/+UEa
 nCgUmTRQlq6FWiXp/l/WbLW69mMLGo1n7y/v6BFA5XbpO7Rr7TO6AJKga8HX6S8qisR6qZLRFIT
 oFBer9fIx/oN/1PPZSVztFNJYJcubrlNBN+pBknA9zhwSaWsju7hWjAeaQ+GdpxVNlWv99kxKKu
 HGnj+Bd/
X-Proofpoint-GUID: PjkqvgjJieGFe_iKYvqdzxIo6SUWeCbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008
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



On 2025/6/27 20:44, Dmitry Baryshkov wrote:
> On 27/06/2025 11:40, Yongxing Mou wrote:
>>
>>
>> On 2025/6/25 22:03, Dmitry Baryshkov wrote:
>>> On Wed, Jun 25, 2025 at 08:34:18PM +0800, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 2025/6/9 20:48, Dmitry Baryshkov wrote:
>>>>> On Mon, Jun 09, 2025 at 08:21:21PM +0800, Yongxing Mou wrote:
>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>
>>>>>> dp_display caches the current display mode and then passes it onto
>>>>>> the panel to be used for programming the panel params. Remove this
>>>>>> two level passing and directly populated the panel's dp_display_mode
>>>>>> instead.
>>>>>
>>>>> - Why do we need to cache / copy it anyway? Can't we just pass the
>>>>>     corresponding drm_atomic_state / drm_crtc_state / 
>>>>> drm_display_mode ?
>>>>>
>>>> This part works as follows: .mode_set() copies the adjusted_mode into
>>>> msm_dp_display_private->msm_dp_display_mode, and also parses and stores
>>>> variables such as v_active_low/h_active_low/out_fmt_is_yuv_420 
>>>> and ... When
>>>> @drm_bridge_funcs.atomic_enable() is called, it copies
>>>> msm_dp_display->msm_dp_mode into dp_panel->msm_dp_mode and initializes
>>>> panel_info in msm_dp_display_set_mode(). Then when go to
>>>> msm_dp_ctrl_on_stream(), the parameters are updated into the 
>>>> corresponding
>>>> hardware registers.
>>>
>>> So, if we do everything during .atomic_enable(), there would be no need
>>> to store and/or copy anything. All the data is available and can be used
>>> as is.
>>>
>> Got it. Let me confirm—can we keep msm_dp_mode or drm_display_mode in 
>> msm_dp_panel? Mabey debug node will use this ..
> 
> Please don't. I really dislike storing drm_atomic_state-related 
> variables in a non-state structure. I think it makes it easier to 
> mistakenly update or to use a stale value.
> 
> Debug code already prints modes in debugfs/dri/N/state. If we need any 
> other state-related prints, they should go to the same file.
> 
Hi, I got this point.. i go through the driver. since lots of funcs used 
msm_dp_mode cached. so maybe it is not a very small change.. I’d like to 
prioritize MST first, and then submit this patch once I got time..

>>>>
>>>> This design has been in place since the first version of the DP 
>>>> driver and
>>>> has remained largely unchanged.
>>>
>>> Yes... The point is that you are touching this piece of code anyway,
>>> let's make it nicer.
>>>
>> Agree with this point.
>>>> Originally, the drm_mode would be passed in
>>>> two stages: from msm_dp_display->msm_dp_mode to dp_panel- 
>>>> >msm_dp_mode. Since
>>>> in MST mode each stream requires its own drm_mode and stored in 
>>>> dp_panel, we
>>>> simplified the two-stage transfer into a single step (.mode_set() do 
>>>> all
>>>> things and store in msm_dp_panel). Meanwhile we modified the
>>>> msm_dp_display_set_mode function to accept a msm_dp_panel parameter,
>>>> allowing the MST bridge funcs' mode_set() to reuse this part code.
>>>>
>>>> The following patches:
>>>> https://patchwork.freedesktop.org/patch/657573/?series=142207&rev=2 and
>>>> https://patchwork.freedesktop.org/patch/657593/?series=142207&rev=2,
>>>> introduce msm_dp_display_*_helper functions to help reuse common 
>>>> code across
>>>> MST/SST/eDP drm_bridge_funcs.
>>>>
>>>> If we drop msm_dp_mode from dp_panel and use drm_display_mode, it might
>>>> introduce a large number of changes that are not directly related to 
>>>> MST.
>>>> Actually i think the presence of msm_dp_display_mode seems to 
>>>> simplify the
>>>> work in msm_dp_panel_timing_cfg(), this patch series we want to 
>>>> focus on MST
>>>> parts, so would we consider optimizing them later?
>>>
>>> Sure... But then you have to change two places. If you optimize it
>>> first, you have to touch only place. And it can be even submitted
>>> separately.
>>>
>> Understood, that’s indeed the case. I just want to prioritize the MST 
>> patch and have it merged first, since it involves changes to lots of 
>> files. Thanks~~
>>>>
>>>> Thanks~
>>>>>>
>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 76 +++++++++++++ 
>>>>>> +-----------------------
>>>>>>    1 file changed, 29 insertions(+), 47 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/ 
>>>>>> drm/ msm/dp/dp_display.c
>>>>>> index 
>>>>>> 4a9b65647cdef1ed6c3bb851f93df0db8be977af..9d2db9cbd2552470a36a63f70f517c35436f7280 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> @@ -92,7 +92,6 @@ struct msm_dp_display_private {
>>>>>>        struct msm_dp_panel   *panel;
>>>>>>        struct msm_dp_ctrl    *ctrl;
>>>>>> -    struct msm_dp_display_mode msm_dp_mode;
>>>>>>        struct msm_dp msm_dp_display;
>>>>>>        /* wait for audio signaling */
>>>>>> @@ -806,16 +805,29 @@ static int msm_dp_init_sub_modules(struct 
>>>>>> msm_dp_display_private *dp)
>>>>>>    }
>>>>>>    static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>>>>>> -                   struct msm_dp_display_mode *mode)
>>>>>> +                   const struct drm_display_mode *adjusted_mode,
>>>>>> +                   struct msm_dp_panel *msm_dp_panel)
>>>>>>    {
>>>>>> -    struct msm_dp_display_private *dp;
>>>>>> +    u32 bpp;
>>>>>> -    dp = container_of(msm_dp_display, struct 
>>>>>> msm_dp_display_private, msm_dp_display);
>>>>>> +    drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, 
>>>>>> adjusted_mode);
>>>>>> +
>>>>>> +    if (msm_dp_display_check_video_test(msm_dp_display))
>>>>>> +        bpp = msm_dp_display_get_test_bpp(msm_dp_display);
>>>>>> +    else
>>>>>> +        bpp = msm_dp_panel->connector->display_info.bpc * 3;
>>>>>> +
>>>>>> +    msm_dp_panel->msm_dp_mode.bpp = bpp;
>>>>>> +
>>>>>> +    msm_dp_panel->msm_dp_mode.v_active_low =
>>>>>> +        !!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
>>>>>> +    msm_dp_panel->msm_dp_mode.h_active_low =
>>>>>> +        !!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
>>>>>> +    msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
>>>>>> +        drm_mode_is_420_only(&msm_dp_panel->connector- 
>>>>>> >display_info, adjusted_mode) &&
>>>>>> +        msm_dp_panel->vsc_sdp_supported;
>>>>>> -    drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode- 
>>>>>> >drm_mode);
>>>>>> -    dp->panel->msm_dp_mode.bpp = mode->bpp;
>>>>>> -    dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode- 
>>>>>> >out_fmt_is_yuv_420;
>>>>>> -    msm_dp_panel_init_panel_info(dp->panel);
>>>>>> +    msm_dp_panel_init_panel_info(msm_dp_panel);
>>>>>>        return 0;
>>>>>>    }
>>>>>> @@ -1431,10 +1443,13 @@ bool msm_dp_needs_periph_flush(const 
>>>>>> struct msm_dp *msm_dp_display,
>>>>>>    bool msm_dp_wide_bus_available(const struct msm_dp 
>>>>>> *msm_dp_display)
>>>>>>    {
>>>>>>        struct msm_dp_display_private *dp;
>>>>>> +    struct msm_dp_panel *dp_panel;
>>>>>>        dp = container_of(msm_dp_display, struct 
>>>>>> msm_dp_display_private, msm_dp_display);
>>>>>> -    if (dp->msm_dp_mode.out_fmt_is_yuv_420)
>>>>>> +    dp_panel = dp->panel;
>>>>>> +
>>>>>> +    if (dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>>>>>>            return false;
>>>>>>        return dp->wide_bus_supported;
>>>>>> @@ -1496,10 +1511,6 @@ void msm_dp_bridge_atomic_enable(struct 
>>>>>> drm_bridge *drm_bridge,
>>>>>>        bool force_link_train = false;
>>>>>>        msm_dp_display = container_of(dp, struct 
>>>>>> msm_dp_display_private, msm_dp_display);
>>>>>> -    if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
>>>>>> -        DRM_ERROR("invalid params\n");
>>>>>> -        return;
>>>>>> -    }
>>>>>>        if (dp->is_edp)
>>>>>>            msm_dp_hpd_plug_handle(msm_dp_display, 0);
>>>>>> @@ -1517,15 +1528,6 @@ void msm_dp_bridge_atomic_enable(struct 
>>>>>> drm_bridge *drm_bridge,
>>>>>>            return;
>>>>>>        }
>>>>>> -    rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
>>>>>> -    if (rc) {
>>>>>> -        DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>>>>>> -        mutex_unlock(&msm_dp_display->event_mutex);
>>>>>> -        return;
>>>>>> -    }
>>>>>
>>>>> It should be done other way around: keep this call and drop
>>>>> msm_dp_bridge_mode_set().
>>>>>
>>>> Emm as reply in last comments..
>>>
>>> Yep. Drop .mode_set, the callback is even described as deprecated.
>>>
>> Thanks, the documentation does state that.
>>>>>> -
>>>>>> -    hpd_state =  msm_dp_display->hpd_state;
>>>>>> -
>>>>>>        if (hpd_state == ST_CONNECTED && !dp->power_on) {
>>>>>>            msm_dp_display_host_phy_init(msm_dp_display);
>>>>>>            force_link_train = true;
>>>>>> @@ -1604,33 +1606,13 @@ void msm_dp_bridge_mode_set(struct 
>>>>>> drm_bridge *drm_bridge,
>>>>>>        msm_dp_display = container_of(dp, struct 
>>>>>> msm_dp_display_private, msm_dp_display);
>>>>>>        msm_dp_panel = msm_dp_display->panel;
>>>>>> -    memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct 
>>>>>> msm_dp_display_mode));
>>>>>> -
>>>>>> -    if (msm_dp_display_check_video_test(dp))
>>>>>> -        msm_dp_display->msm_dp_mode.bpp = 
>>>>>> msm_dp_display_get_test_bpp(dp);
>>>>>> -    else /* Default num_components per pixel = 3 */
>>>>>> -        msm_dp_display->msm_dp_mode.bpp = dp->connector- 
>>>>>> >display_info.bpc * 3;
>>>>>> -
>>>>>> -    if (!msm_dp_display->msm_dp_mode.bpp)
>>>>>> -        msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
>>>>>> -
>>>>>> -    drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, 
>>>>>> adjusted_mode);
>>>>>> -
>>>>>> -    msm_dp_display->msm_dp_mode.v_active_low =
>>>>>> -        !!(msm_dp_display->msm_dp_mode.drm_mode.flags & 
>>>>>> DRM_MODE_FLAG_NVSYNC);
>>>>>> -
>>>>>> -    msm_dp_display->msm_dp_mode.h_active_low =
>>>>>> -        !!(msm_dp_display->msm_dp_mode.drm_mode.flags & 
>>>>>> DRM_MODE_FLAG_NHSYNC);
>>>>>> -
>>>>>> -    msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
>>>>>> -        drm_mode_is_420_only(&dp->connector->display_info, 
>>>>>> adjusted_mode) &&
>>>>>> -        msm_dp_panel->vsc_sdp_supported;
>>>>>> +    msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
>>>>>>        /* populate wide_bus_support to different layers */
>>>>>> -    msm_dp_display->ctrl->wide_bus_en =
>>>>>> -        msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : 
>>>>>> msm_dp_display->wide_bus_supported;
>>>>>> -    msm_dp_display->catalog->wide_bus_en =
>>>>>> -        msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : 
>>>>>> msm_dp_display->wide_bus_supported;
>>>>>> +    msm_dp_display->ctrl->wide_bus_en = msm_dp_panel- 
>>>>>> >msm_dp_mode.out_fmt_is_yuv_420 ?
>>>>>> +        false : msm_dp_display->wide_bus_supported;
>>>>>> +    msm_dp_display->catalog->wide_bus_en = msm_dp_panel- 
>>>>>> >msm_dp_mode.out_fmt_is_yuv_420 ?
>>>>>> +        false : msm_dp_display->wide_bus_supported;
>>>>>>    }
>>>>>>    void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
>>>>>>
>>>>>> -- 
>>>>>> 2.34.1
>>>>>>
>>>>>
>>>>
>>>
>>
> 
> 

