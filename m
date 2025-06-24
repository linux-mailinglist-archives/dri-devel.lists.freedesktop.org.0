Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A3EAE6197
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD93A10E0CF;
	Tue, 24 Jun 2025 09:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="M14xSa78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5120E10E06A;
 Tue, 24 Jun 2025 09:57:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O4NUMM026272;
 Tue, 24 Jun 2025 09:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vv/i1B2YHUYtVjVVDa+bTQ/lFUMzkmfR3ueGFmApgdA=; b=M14xSa78prPV5y87
 Dh03Gi8lNEiT6rJUPJutgamV5ho8/RZqbtUdopjqdYl/x45cg4Y01YFgdFpVrGyW
 bmKpF3ZCG7Xn8VXnTsVNGdt+0vJSb/+9/ELDSoLN+0dspUPHH8z9LhniaJBgP+3h
 wYOdPuB/UC+7KqBTsIYG/9vVwn0a2VNYI36zVQvX2AHn83mfQC3/3FwCZ53SwsCm
 bZTLGwIMbOgUe9bXTG9Ko+R+yEdfPOUe6ZbchmnBzzt6fiDGm/+CbACt+mDXFovJ
 3pt4CEtViy7oM6mPVBms2LuKlqPmOUGcyHl9/aDmQ7VbKUa8WUMUHiHh2Ir3CjsZ
 BvLHCg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymtn0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jun 2025 09:57:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55O9v25d025111
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Jun 2025 09:57:02 GMT
Received: from [10.253.9.139] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Jun
 2025 02:56:58 -0700
Message-ID: <69f0c53a-0ac3-4858-a644-373af0473ddd@quicinc.com>
Date: Tue, 24 Jun 2025 17:56:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/38] drm/msm/dp: add connector abstraction for DP MST
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
 <20250609-msm-dp-mst-v2-29-a54d8902a23d@quicinc.com>
 <bmzte2ywtlygl4rru73efnfb4vpi3vkveeq32jhonrmxbogp5h@kqaukhzvcxx3>
 <2ab43ae7-12b6-4d41-9ffd-dbea70e2a662@quicinc.com>
 <njz3apifgcv2k3kzlmti5rjgqpl43v5yvjqpu6qhpe2kw3bzlu@pqvnrh6ff2um>
 <35527541-30dc-44dd-a108-79f599ace831@quicinc.com>
 <bd0fba5c-9e38-4a40-adf9-cc70fa2d0f57@oss.qualcomm.com>
 <ad1db558-c33e-4788-9f25-cac6c21713f1@quicinc.com>
 <997c2a3a-44e7-4169-8664-7b600deaa618@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <997c2a3a-44e7-4169-8664-7b600deaa618@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NCBTYWx0ZWRfXwqB9hOS15ciu
 A7D/BoAnROQMRYAd4IdAIApT4yrsp6IlbUlX9mlSSDdUtbuxQfLXuJnCOYmkQqTFdw05Nk97MWe
 E6RWF/8NOTYqRpxyFbXei26eBpPT1PUC0E40Ys3nwisrntk5LEPcF0F466K/eWAjwibo/et4Lxi
 h3afO23Rk/cLJkktgZ/UeI8cHOUvQvy78wn2V1/QCDLwm2lNw++eom/nsfGkVFKUCiKhssUNpP+
 GbfqGh33udk13Zn3IolxwlSipEQlv1b4+Xb31vT+1Cs29Gtm/derOvnn9FHg60IzwfKB1tUOZg2
 wBKeyauzNCsHUfR/PB3E3YrQ81bAR/O888XXzV1/rvPbR85776FB4Z5W1wXRYxHgU5i0RlRa/pO
 lJpNuVwmDjXUOs5xgD0qkhZqjENdp0Ri3nUcMyLsYzvQupqgavbSykQgDnApIgQU2mrfoJI7
X-Proofpoint-ORIG-GUID: HZ3bAYbLFFNBtZqr3k_QZnwOv-hyHAFz
X-Proofpoint-GUID: HZ3bAYbLFFNBtZqr3k_QZnwOv-hyHAFz
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=685a766f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=ffadqE1oj2CIWO42M3EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240084
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



On 2025/6/19 19:33, Dmitry Baryshkov wrote:
> [initially I responded off-list by mistake, sorry for the confusion and 
> possible duplicates]
> 
> On 19/06/2025 12:26, Yongxing Mou wrote:
>>
>>
>> On 2025/6/16 22:41, Dmitry Baryshkov wrote:
>>> On 16/06/2025 17:09, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 2025/6/11 22:31, Dmitry Baryshkov wrote:
>>>>> On Wed, Jun 11, 2025 at 08:06:28PM +0800, Yongxing Mou wrote:
>>>>>>
>>>>>>
>>>>>> On 2025/6/9 23:44, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
>>>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>>
>>>>>>>> Add connector abstraction for the DP MST. Each MST encoder
>>>>>>>> is connected through a DRM bridge to a MST connector and each
>>>>>>>> MST connector has a DP panel abstraction attached to it.
>>>>>>>>
>>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 +++++++++++++++++++ 
>>>>>>>> + + + ++++++++++++++
>>>>>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>>>>>>>>    2 files changed, 518 insertions(+)
>>>>>>>
>>>>>>> It generally feels liks 80% of this patch is a generic code. Please
>>>>>>> extract generic DP MST connector and push it under drm/display. 
>>>>>>> Other DP
>>>>>>> MST drivers should be able to use it.
>>>>>>>
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/ 
>>>>>>>> drm/ msm/dp/dp_mst_drm.c
>>>>>>>> index 
>>>>>>>> a3ea34ae63511db0ac920cbeebe30c4e2320b8c4..489fa46aa518ff1cc5f4769b2153fc5153c4cb41 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>>>>>>>> @@ -25,8 +25,12 @@
>>>>>>>>     * OF THIS SOFTWARE.
>>>>>>>>     */
>>>>>>>> +#include <drm/drm_edid.h>
>>>>>>>> +#include <drm/drm_managed.h>
>>>>>>>>    #include "dp_mst_drm.h"
>>>>>>>> +#define MAX_DPCD_TRANSACTION_BYTES 16
>>>>>>>> +
>>>>>>>>    static struct drm_private_state 
>>>>>>>> *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
>>>>>>>>    {
>>>>>>>>        struct msm_dp_mst_bridge_state *state;
>>>>>>>> @@ -79,6 +83,61 @@ static int msm_dp_mst_find_vcpi_slots(struct 
>>>>>>>> drm_dp_mst_topology_mgr *mgr, int p
>>>>>>>>        return num_slots;
>>>>>>>>    }
>>>>>>>> +static int msm_dp_mst_get_mst_pbn_div(struct msm_dp_panel 
>>>>>>>> *msm_dp_panel)
>>>>>>>> +{
>>>>>>>> +    struct msm_dp_link_info *link_info;
>>>>>>>> +
>>>>>>>> +    link_info = &msm_dp_panel->link_info;
>>>>>>>> +
>>>>>>>> +    return link_info->rate * link_info->num_lanes / 54000;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int msm_dp_mst_compute_config(struct drm_atomic_state 
>>>>>>>> *state,
>>>>>>>> +                      struct msm_dp_mst *mst, struct 
>>>>>>>> drm_connector *connector,
>>>>>>>> +                      struct drm_display_mode *mode)
>>>>>>>> +{
>>>>>>>> +    int slots = 0, pbn;
>>>>>>>> +    struct msm_dp_mst_connector *mst_conn = 
>>>>>>>> to_msm_dp_mst_connector(connector);
>>>>>>>> +    int rc = 0;
>>>>>>>> +    struct drm_dp_mst_topology_state *mst_state;
>>>>>>>> +    int pbn_div;
>>>>>>>> +    struct msm_dp *dp_display = mst->msm_dp;
>>>>>>>> +    u32 bpp;
>>>>>>>> +
>>>>>>>> +    bpp = connector->display_info.bpc * 3;
>>>>>>>> +
>>>>>>>> +    pbn = drm_dp_calc_pbn_mode(mode->clock, bpp << 4);
>>>>>>>
>>>>>>> Is this going to change if DSC is in place? Will it bring 
>>>>>>> fractional BPP
>>>>>>> here?
>>>>>>>
>>>>>> Actually, in this patch series, MST not support DSC. So we just don't
>>>>>> consider this scenario.
>>>>>
>>>>> But you still can answer the question.
>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>> 1.Emm, for my current understanding, if DSC is enabled, the BPP 
>>>> should change and recaculated.
>>>> Will it bring fractional BPP here?
>>>
>>> That's what I am asking
>>>
>>>>  >>>I'm not entirely sure about this answer. I checked how other 
>>>> drivers call this function, and they all use bpp << 4, so can we 
>>>> assume that this way of calling it is valid?
>>>
>>> It is valid. I'm trying to understand the implications and future 
>>> changes.
>>>
>>>>>>>> +
>>>>>>>> +    return msm_dp_display_mode_valid(dp_display, &dp_display- 
>>>>>>>> >connector->display_info, mode);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static struct drm_encoder *
>>>>>>>> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, 
>>>>>>>> struct drm_atomic_state *state)
>>>>>>>
>>>>>>> Do we need this callback? Don't we have a fixed relationship between
>>>>>>> connectors and encoders?
>>>>>
>>>>> This was left unanswered.
>>>>>
>>>> Sorry, I didn't mean to skip any questions — I just planned to reply 
>>>> a bit later. Apologies for the confusion.
>>>> For this question, yes , we don't have the fixed relationship 
>>>> between them. Under the current codes, the Connector selects the 
>>>> available encoder and bridge in order from index 0 to 4 (up to 
>>>> max_streams) when the connector's status changes to 'connected'.
>>>
>>> Why? Can we have 1:1 relationship as we do with other bridges?
>>>
>> Emm, It may be because the number of MST connectors is not fixed, but 
>> rather determined by the number of output ports on the dongle. For 
>> example, in a 2-MST case, there are 2 encoders, but there could be 
>> four MST connectors if the dongle has four DP output ports. 
>> add_connector() creates MST connectors based on the number of outputs 
>> on the dongle, rather than the actual number of connected devices.
> 
> Ack, this should be a part of the commit message.
> 
>>>>>>>
>>>>>>>> +{
>>>>>>>> +    struct msm_dp_mst_connector *mst_conn = 
>>>>>>>> to_msm_dp_mst_connector(connector);
>>>>>>>> +    struct msm_dp *dp_display = mst_conn->msm_dp;
>>>>>>>> +    struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>>>>>>>> +    struct drm_encoder *enc = NULL;
>>>>>>>> +    struct msm_dp_mst_bridge_state *bridge_state;
>>>>>>>> +    u32 i;
>>>>>>>> +    struct drm_connector_state *conn_state = 
>>>>>>>> drm_atomic_get_new_connector_state(state,
>>>>>>>> +                                            connector);
>>>>>>>> +
>>>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>>>>>>>> +        if (WARN_ON(!old_conn_state->best_encoder)) {
>>>>>>>> +            rc = -EINVAL;
>>>>>>>> +            goto end;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        drm_bridge = 
>>>>>>>> drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
>>>>>>>
>>>>>>> This really looks like this should be a bridge's callback.
>>>>>
>>>>> And this one
>>>>>
>>>> Emm, the bridge does not implement atomic_check(). All MST-related 
>>>> checks (such as drm_dp_atomic_release_time_slots, 
>>>> drm_dp_mst_atomic_check, or others) are performed in the connector's 
>>>> atomic_check function. I believe this is because both num_slots and 
>>>> pbn are stored in the bridge, and we call this to get the drm_bridge..
>>>
>>> So, please split them into connector and bridge checks, calling them 
>>> from corresponding hooks. It might be easier to migrate completely to 
>>> the bridge's atomic_check(). At least it will save us from this 
>>> clumsy code getting the bridge for the connector.
>>>
>> Maybe we don't need to move to bridge's atomic_check(). Connector's 
>> atomic_check() do 2 things: 1.Call drm_dp_atomic_release_time_slots 
>> when unplug, 2. Call drm_dp_atomic_find_time_slots and 
>> drm_dp_mst_atomic_check when plug in.
> 
> Actually... I don't think you are calling it in a correct way. It should 
> be called from the drm_mode_config.atomic_check, not from connector's 
> atomic_check(). See how nouveau driver does it. Even documentation 
> insists that it should be called _after_ checking the rest of the state.
> 
In the documentation, drm_dp_atomic_find_time_slots should be placed in 
drm_encoder_helper_funcs.atomic_check(), 
drm_dp_atomic_release_time_slots in 
&drm_connector_helper_funcs.atomic_check(), and drm_dp_mst_atomic_check 
in &drm_mode_config_funcs.atomic_check(). So maybe we can move these 
atomic_check() calls back to their original positions as do, as 
recommended in the documenttation.
>> 3 functions need drm_atomic_state, but it seems that 
>> drm_bridge_funcs.atomic_check() does not pass in drm_atomic_state. 
> 
> You can get drm_atomic_state from bridge_state->base.state, crtc_state- 
>  >state, connector_state->state, that's not really an issue.
> 
>> Actually both 2 actions only occur when need modeset. Maybe we can 
>> optimize this function in the following ways: (1) reduce unnecessary 
>> references to drm_bridge, especially since bridge_state-  >num_slots 
>> can replace with payload->time_slots; (2)As your comments, split the 
>> function into smaller parts to better reflect the logic.
> 
> Yes, please. Getting rid of bridge_state->num_slots is a good path forward.
> 
Emm, even if we can drop bridge_state->num_slots, we still need to 
access bridge_state when clearing bridge_state->connector and 
bridge_state->msm_dp_panel, so it might not be possible to completely 
eliminate the use of bridge_state here.
>>>
>>>>>>>
>>>>>>>> +        if (WARN_ON(!drm_bridge)) {
>>>>>>>> +            rc = -EINVAL;
>>>>>>>> +            goto end;
>>>>>>>> +        }
>>>>>>>> +        bridge = to_msm_dp_mst_bridge(drm_bridge);
>>>>>>>> +
>>>>>>>> +        bridge_state = msm_dp_mst_br_priv_state(state, bridge);
>>>>>>>> +        if (IS_ERR(bridge_state)) {
>>>>>>>> +            rc = PTR_ERR(bridge_state);
>>>>>>>> +            goto end;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        if (WARN_ON(bridge_state->connector != connector)) {
>>>>>>>> +            rc = -EINVAL;
>>>>>>>> +            goto end;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        slots = bridge_state->num_slots;
>>>>>>>> +        if (slots > 0) {
>>>>>>>> +            rc = drm_dp_atomic_release_time_slots(state,
>>>>>>>> +                                  &mst->mst_mgr,
>>>>>>>> +                                  mst_conn->mst_port);
>>>>>>>> +            if (rc) {
>>>>>>>> +                DRM_ERROR("failed releasing %d vcpi slots 
>>>>>>>> %d\n", slots, rc);
>>>>>>>> +                goto end;
>>>>>>>> +            }
>>>>>>>> +            vcpi_released = true;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        if (!new_conn_state->crtc) {
>>>>>>>> +            /* for cases where crtc is not disabled the slots 
>>>>>>>> are not
>>>>>>>> +             * freed by drm_dp_atomic_release_time_slots. this 
>>>>>>>> results
>>>>>>>> +             * in subsequent atomic_check failing since 
>>>>>>>> internal slots
>>>>>>>> +             * were freed but not the dp mst mgr's
>>>>>>>> +             */
>>>>>>>> +            bridge_state->num_slots = 0;
>>>>>>>> +            bridge_state->connector = NULL;
>>>>>>>> +            bridge_state->msm_dp_panel = NULL;
>>>>>>>> +
>>>>>>>> +            drm_dbg_dp(dp_display->drm_dev, "clear best 
>>>>>>>> encoder: %d\n", bridge->id);
>>>>>>>> +        }
>>>>>>>> +    }
>>>>>>>
>>>>>>> This looks like there are several functions fused together. Please
>>>>>>> unfuse those into small and neat code blocks.
>>>>>
>>>>> And this :-D
>>>>>
>>>> Got it.. this code only do one thing, check and try to release 
>>>> time_slots.. we can try to package it into small functions..
>>>
>>> I still don't understand, why do we need to release time_slots here 
>>> instead of using MST helpers.
>>>
>> Emm , just as above reply.. when we need modeset, call 
>> drm_dp_atomic_release_time_slots to release payload and then clear 
>> bridge_state cached ..
> 
> I don't see other drivers limiting drm_dp_atomic_release_time_slots() to 
> the modeset case. Any reason for MSM driver to deviate from that?
> 
Actually, you are right. I think the drm_dp_atomic_release_time_slots 
function can handle the slots releases quite well by itself. This 
function can handle various changes in crtc_state quite well. These 
constraints are more about supporting the cleanup of 
bridge_state->connector and bridge_state->msm_dp_panel.
> 
> 
>>>>>>>
>>>>>>>> +
>>>>>>>> +mode_set:
>>>>>>>> +    if (!new_conn_state->crtc)
>>>>>>>> +        goto end;
>>>>>>>> +
>>>>>>>> +    crtc_state = drm_atomic_get_new_crtc_state(state, 
>>>>>>>> new_conn_state->crtc);
>>>>>>>> +
>>>>>>>> +    if (drm_atomic_crtc_needs_modeset(crtc_state) && 
>>>>>>>> crtc_state- >active) {
>>>>>>>
>>>>>>> Use of crtc_state->active doesn't look correct.
>>>>>
>>>>>
>>>>> ...
>>>>>
>>>> Sorry, I'm still not quite sure where the issue is. Could you please 
>>>> help point it out? Thanks~~
>>>
>>>
>>> Please refer to the documentation for drm_crtc_state::active. The 
>>> drivers are not supposed to use this field in checks.
>>>
>> Got it , so maybe drm_crtc_state::enable might more appropriate here..
> 
> Well, why do you need it in the first place? This will determine a 
> correct set of conditions.
> 
Got it. Let me look into whether this can be optimized.
> 
>>>>>>>
>>>>>>>> +        if (WARN_ON(!new_conn_state->best_encoder)) {
>>>>>>>> +            rc = -EINVAL;
>>>>>>>> +            goto end;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        drm_bridge = 
>>>>>>>> drm_bridge_chain_get_first_bridge(new_conn_state->best_encoder);
>>>>>>>> +        if (WARN_ON(!drm_bridge)) {
>>>>>>>> +            rc = -EINVAL;
>>>>>>>> +            goto end;
>>>>>>>> +        }
>>>>>>>> +        bridge = to_msm_dp_mst_bridge(drm_bridge);
>>>>>>>> +
>>>>>>>> +        bridge_state = msm_dp_mst_br_priv_state(state, bridge);
>>>>>>>> +        if (IS_ERR(bridge_state)) {
>>>>>>>> +            rc = PTR_ERR(bridge_state);
>>>>>>>> +            goto end;
>>>>>>>> +        }
>>>>>>>> +
>>>>>>>> +        if (WARN_ON(bridge_state->connector != connector)) {
>>>>>>>> +            rc = -EINVAL;
>>>>>>>> +            goto end;
>>>>>>>> +        }
>>>>>>>
>>>>>>> Can all of this actually happen?
>>>>>
>>>>> ...
>>>>>
>>>> Actually not, I haven't encountered it yet. I'm not sure how to 
>>>> trigger it, but it might occur under race conditions? Or we just 
>>>> remove it untill some case it really happen..
>>>
>>> No. You actually think whether this condition can happen, then keep 
>>> it if it can (and drop it if it can not happen).
>>>
>> Got it. Let me test a few different cases to see if these scenarios 
>> occur.
> 
> No. It's not about testing. It's about asserting if the scenario can 
> occur or not per your call stacks and per the design / contract.
> 
Got it. Let me check this part again. I don't think these errors would 
occur under the current design. But if the system enters a  inconsistent 
error state, this code could help improve our stability.
> 

