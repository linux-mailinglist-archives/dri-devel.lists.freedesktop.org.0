Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA26695645
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 03:02:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AE010E02C;
	Tue, 14 Feb 2023 02:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B67C10E02C;
 Tue, 14 Feb 2023 02:02:30 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31E12GtI016457; Tue, 14 Feb 2023 02:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lJz5eGqaxgHQKzHuSFKlsdBxHRKjzQfoAz1ZMLpBdgQ=;
 b=j59b05SXJtA82s2SVnaym4Chl9LYdFjboQ3juXxQTwr30WbiWfpPh9CHxrWU3/DdnS2s
 TmXN33eeE6sXDga3gx6TFXyy8Jb9b607TxIA6hR7sZ1OMkp4RzLn5gS0lcDO4xEFsyvw
 aCw9xdtTpe/1DWi6jAhEXW2DDmRTyByMwYQmb/c5e6XZQ2TvjWNXzrF3ZciRfDq4scfP
 rQMsIHZ/T2S3Ncm0UrHSUNYDcpE3weSD/fbn+nV8Ab8jtul0yqIfPpnDRDEM3DlZh7+X
 +D0iUECcrF0Ky0/8xKYiGtrAQUzwABOpTmraHHxIwzntbxduCnF5awH85xxlAi46RpSt bQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nqtv08qv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 02:02:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31E227pn008665
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 02:02:15 GMT
Received: from [10.110.55.187] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 13 Feb
 2023 18:02:10 -0800
Message-ID: <1f204585-88e2-abae-1216-92f739ac9e91@quicinc.com>
Date: Mon, 13 Feb 2023 18:02:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [RFT PATCH v2 3/3] drm/msm/dsi: More properly handle
 errors in regards to dsi_mgr_bridge_power_on()
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
 <20230131141756.RFT.v2.3.I3c87b53c4ab61a7d5e05f601a4eb44c7e3809a01@changeid>
 <0419b0c8-fb30-f8df-1b9a-19e106680948@quicinc.com>
 <CAD=FV=Xk6qFokozxEa+MaCgii3zpSWZRDe52FoP17E-DOFXoyg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=Xk6qFokozxEa+MaCgii3zpSWZRDe52FoP17E-DOFXoyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gaKiNskB2BCdFws96mtY_2Uk_EMulKRp
X-Proofpoint-ORIG-GUID: gaKiNskB2BCdFws96mtY_2Uk_EMulKRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_01,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140014
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
Cc: Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Vinod Koul <vkoul@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

Sorry for the delayed response.

On 2/2/2023 2:46 PM, Doug Anderson wrote:
> Hi,
> 
> On Thu, Feb 2, 2023 at 2:37 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Hi Doug
>>
>> On 1/31/2023 2:18 PM, Douglas Anderson wrote:
>>> In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
>>> time") the error handling with regards to dsi_mgr_bridge_power_on()
>>> got a bit worse. Specifically if we failed to power the bridge on then
>>> nothing would really notice. The modeset function couldn't return an
>>> error and thus we'd blindly go forward and try to do the pre-enable.
>>>
>>> In commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time
>>> for parade-ps8640") we added a special case to move the powerup back
>>> to pre-enable time for ps8640. When we did that, we didn't try to
>>> recover the old/better error handling just for ps8640.
>>>
>>> In the patch ("drm/msm/dsi: Stop unconditionally powering up DSI hosts
>>> at modeset") we've now moved the powering up back to exclusively being
>>> during pre-enable. That means we can add the better error handling
>>> back in, so let's do it. To do so we'll add a new function
>>> dsi_mgr_bridge_power_off() that's matches how errors were handled
>>> prior to commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to
>>> modeset time").
>>>
>>> NOTE: Now that we have dsi_mgr_bridge_power_off(), it feels as if we
>>> should be calling it in dsi_mgr_bridge_post_disable(). That would make
>>> some sense, but doing so would change the current behavior and thus
>>> should be a separate patch. Specifically:
>>> * dsi_mgr_bridge_post_disable() always calls dsi_mgr_phy_disable()
>>>     even in the slave-DSI case of bonded DSI. We'd need to add special
>>>     handling for this if it's truly needed.
>>> * dsi_mgr_bridge_post_disable() calls msm_dsi_phy_pll_save_state()
>>>     midway through the poweroff.
>>> * dsi_mgr_bridge_post_disable() has a different order of some of the
>>>     poweroffs / IRQ disables.
>>> For now we'll leave dsi_mgr_bridge_post_disable() alone.
>>>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>> Changes in v2:
>>> - ("More properly handle errors...") new for v2.
>>>
>>>    drivers/gpu/drm/msm/dsi/dsi_manager.c | 32 ++++++++++++++++++++++-----
>>>    1 file changed, 26 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> index 2197a54b9b96..28b8012a21f2 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
>>> @@ -228,7 +228,7 @@ static void msm_dsi_manager_set_split_display(u8 id)
>>>        }
>>>    }
>>>
>>> -static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>> +static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>>    {
>>>        int id = dsi_mgr_bridge_get_id(bridge);
>>>        struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> @@ -268,14 +268,31 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
>>>        if (is_bonded_dsi && msm_dsi1)
>>>                msm_dsi_host_enable_irq(msm_dsi1->host);
>>>
>>> -     return;
>>> +     return 0;
>>>
>>>    host1_on_fail:
>>>        msm_dsi_host_power_off(host);
>>>    host_on_fail:
>>>        dsi_mgr_phy_disable(id);
>>>    phy_en_fail:
>>> -     return;
>>> +     return ret;
>>> +}
>>> +
>>> +static void dsi_mgr_bridge_power_off(struct drm_bridge *bridge)
>>> +{
>>> +     int id = dsi_mgr_bridge_get_id(bridge);
>>> +     struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
>>> +     struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
>>> +     struct mipi_dsi_host *host = msm_dsi->host;
>>> +     bool is_bonded_dsi = IS_BONDED_DSI();
>>> +
>>> +     msm_dsi_host_disable_irq(host);
>>> +     if (is_bonded_dsi && msm_dsi1) {
>>> +             msm_dsi_host_disable_irq(msm_dsi1->host);
>>> +             msm_dsi_host_power_off(msm_dsi1->host);
>>> +     }
>>
>> The order of disabling the IRQs should be opposite of how they were enabled.
>>
>> So while enabling it was DSI0 and then DSI1.
>>
>> Hence while disabling it should be DSI1 and then DSI0.
>>
>> So the order here should be
>>
>> DSI1 irq disable
>> DSI0 irq disable
>> DSI1 host power off
>> DSI0 host power off
> 
> Right. Normally you want to go opposite. I guess a few points, though:
> 
> 1. As talked about in the commit message, the order I have matches the
> order we had prior to commit 7d8e9a90509f ("drm/msm/dsi: move DSI host
> powerup to modeset time").
> 
> 2. I'd be curious if it matters. The order you request means we need
> to check for `(is_bonded_dsi && msm_dsi1)` twice. While that's not a
> big deal if it's important, it's nice not to have to do so.
> 
> 3. As talked about in the commit message, eventually we should
> probably resolve this order with the order of things in
> dsi_mgr_bridge_post_disable(), which is yet a different ordering.
> Ideally this resolution would be done by someone who actually has
> proper documentation of the hardware and how it's supposed to work
> (AKA not me).
> 
> So my preference would be to either land or drop ${SUBJECT} patch
> (either is fine with me) and then someone at Qualcomm could then take
> over further cleanup.
> 

I do think the ordering matters but you are right, this change brings 
back the ordering we had before so lets handle the re-ordering of all 
places in a separate change. I am okay with this change to go-in, hence

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

What is the plan to land the patches?

2 & 3 go in msm-next but 1 goes in drm-misc?

Thanks

Abhinav


> -Doug
