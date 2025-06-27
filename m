Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D8AEB081
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6EC10E1DB;
	Fri, 27 Jun 2025 07:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="SJPdx+gL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE6F10E1DB;
 Fri, 27 Jun 2025 07:50:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DFfZ028699;
 Fri, 27 Jun 2025 07:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zdkB40YhgP4G2OpaHQmOJCHVPGaOSXgufof3fjxY1K0=; b=SJPdx+gLxIINMNnA
 nMZe2DdW9yZ2Xv+SEg4Mh8J6DetODlWlFv7YmUK+tIelqT19SuB0fKP7IANak3GK
 nVMaDDy3bZF+cSgmwc1LK+pEWj3VyvnhelXE7RSVcRjubtnCmyucOTVoEPU6GMsL
 0qHBRMs3Y869V0IPjVS6dkieQu7rcqGHSmkrxCFsN/zbpDlQ2V2icDfLSQQmjtt0
 tWAfjg1TY/bKfb9Msu6ALXz6F0jFKWe6ClYe5M/tc72EMvsLn4qEckr3KPVKd7Af
 Sawct/qJ3OtRlvqxBr3yrziwxRDuyBmeLf+yiJOyC3J2LfbZFLuAKGI9aYnhcaGZ
 ANX/JA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4y7sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 07:50:03 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55R7o2iw031202
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 07:50:02 GMT
Received: from [10.253.74.126] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 27 Jun
 2025 00:49:58 -0700
Message-ID: <014d535e-ca9c-4707-9ff4-7afdd489b780@quicinc.com>
Date: Fri, 27 Jun 2025 15:49:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/38] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts and drop panel drm_edid
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
 <20250609-msm-dp-mst-v2-1-a54d8902a23d@quicinc.com>
 <g6wqvbszbrw6gnvxz7cjmhx4rc53kyulcr5wjekfjaisontikl@723odzngtlnd>
 <326bbd02-f414-48e3-a396-4b94f19054f7@quicinc.com>
 <buvgxzf5u5wkj2nxd6rquvcktjmxoclwrkkmxeih6pnikubqe3@yoytvnayvxtv>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <buvgxzf5u5wkj2nxd6rquvcktjmxoclwrkkmxeih6pnikubqe3@yoytvnayvxtv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685e4d2b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=E04JO-gUzBZdZbePgc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oMio7BAkI8NlZciJyRrtZ7PNPZKOXxWo
X-Proofpoint-ORIG-GUID: oMio7BAkI8NlZciJyRrtZ7PNPZKOXxWo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA2MiBTYWx0ZWRfX+WAfJBA6JyhX
 adNA6Rdnzil6sfWBefGRYQq6PsuFC8zTpPY2z6Z93uuM9z13rUkSUvycW5rvvIJPYlocmoUu5Qy
 xWNHLWh+Nc5Tp1n7XkVaNnUcY5bCuOZx2CmPVkc0BVS84nKh0qUbi1+IR+KS1iV2OVXIpBf47As
 +jRnm4FK7zDm5Lhrz3yxGfJ9J2sffPYTpgB7JU3ObZmsZec5YiQM2XqHvpMQt3TnxgrLgU1HfyA
 Rw0u9O3ao/b6JV4FXJ4JJEwFrY7lEwlKRevvuHrBA3tB7Y0LTAZDMfQz4DyJxyhHCFjC8E6SjKi
 0wzuOxOYR9a5pq/liYuEpuFsCDeQj87p+KX+/NxZACojPmNiIBi/a7iw4oQNIzhIMm3In+B44yf
 BqxFNzfoyZ46NjTXjgGAdWULhkY4dwIKmz7clmASeY4EejkpbN1HdvS8Qp6HebZiQD/gPLA+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_02,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270062
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



On 2025/6/25 21:32, Dmitry Baryshkov wrote:
> On Wed, Jun 25, 2025 at 04:43:55PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2025/6/9 20:41, Dmitry Baryshkov wrote:
>>> On Mon, Jun 09, 2025 at 08:21:20PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> In preparation of DP MST where link caps are read for the
>>>> immediate downstream device and the edid is read through
>>>
>>> EDID, not edid. Please review all your patches for up/down case.
>>>
>> Got it. Thanks~
>>>> sideband messaging, split the msm_dp_panel_read_sink_caps() into
>>>> two parts which read the link parameters and the edid parts
>>>> respectively. Also drop the panel drm_edid cached as we actually
>>>> don't need it.
>>>
>>> Also => separate change.
>>>
>> Got it.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++----
>>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 55 ++++++++++++++++++++-----------------
>>>>    drivers/gpu/drm/msm/dp/dp_panel.h   |  6 ++--
>>>>    3 files changed, 40 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 6f05a939ce9e648e9601597155999b6f85adfcff..4a9b65647cdef1ed6c3bb851f93df0db8be977af 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -389,7 +389,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>>>    	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
>>>> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>>>> +	rc = msm_dp_panel_read_link_caps(dp->panel);
>>>> +	if (rc)
>>>> +		goto end;
>>>> +
>>>> +	rc = msm_dp_panel_read_edid(dp->panel, connector);
>>>>    	if (rc)
>>>>    		goto end;
>>>> @@ -720,7 +724,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>>>>    static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
>>>>    {
>>>>    	msm_dp_audio_put(dp->audio);
>>>> -	msm_dp_panel_put(dp->panel);
>>>>    	msm_dp_aux_put(dp->aux);
>>>>    }
>>>> @@ -783,7 +786,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>>>    		rc = PTR_ERR(dp->ctrl);
>>>>    		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
>>>>    		dp->ctrl = NULL;
>>>> -		goto error_ctrl;
>>>> +		goto error_link;
>>>>    	}
>>>>    	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->catalog);
>>>> @@ -791,13 +794,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>>>    		rc = PTR_ERR(dp->audio);
>>>>    		pr_err("failed to initialize audio, rc = %d\n", rc);
>>>>    		dp->audio = NULL;
>>>> -		goto error_ctrl;
>>>> +		goto error_link;
>>>>    	}
>>>>    	return rc;
>>>> -error_ctrl:
>>>> -	msm_dp_panel_put(dp->panel);
>>>>    error_link:
>>>>    	msm_dp_aux_put(dp->aux);
>>>>    error:
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> index 4e8ab75c771b1e3a2d62f75e9993e1062118482b..d9041e235104a74b3cc50ff2e307eae0c4301ef3 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>>>> @@ -118,14 +118,13 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>>>>    	return min_supported_bpp;
>>>>    }
>>>> -int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>>>> -	struct drm_connector *connector)
>>>> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel)
>>>>    {
>>>>    	int rc, bw_code;
>>>>    	int count;
>>>>    	struct msm_dp_panel_private *panel;
>>>> -	if (!msm_dp_panel || !connector) {
>>>> +	if (!msm_dp_panel) {
>>>>    		DRM_ERROR("invalid input\n");
>>>>    		return -EINVAL;
>>>>    	}
>>>> @@ -160,26 +159,29 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>>>>    	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
>>>>    					 msm_dp_panel->downstream_ports);
>>>> -	if (rc)
>>>> -		return rc;
>>>> +	return rc;
>>>> +}
>>>> -	drm_edid_free(msm_dp_panel->drm_edid);
>>>> +int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, struct drm_connector *connector)
>>>> +{
>>>> +	struct msm_dp_panel_private *panel;
>>>> +	const struct drm_edid *drm_edid;
>>>> +
>>>> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>>> -	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>>>> +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>>>> -	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
>>>> +	drm_edid_connector_update(connector, drm_edid);
>>>> -	if (!msm_dp_panel->drm_edid) {
>>>> +	if (!drm_edid) {
>>>>    		DRM_ERROR("panel edid read failed\n");
>>>>    		/* check edid read fail is due to unplug */
>>>>    		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
>>>> -			rc = -ETIMEDOUT;
>>>> -			goto end;
>>>> +			return -ETIMEDOUT;
>>>>    		}
>>>>    	}
>>>> -end:
>>>> -	return rc;
>>>> +	return 0;
>>>>    }
>>>>    u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>>>> @@ -208,15 +210,20 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>>>>    int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>>>>    	struct drm_connector *connector)
>>>>    {
>>>> +	struct msm_dp_panel_private *panel;
>>>> +	const struct drm_edid *drm_edid;
>>>> +
>>>>    	if (!msm_dp_panel) {
>>>>    		DRM_ERROR("invalid input\n");
>>>>    		return -EINVAL;
>>>>    	}
>>>> -	if (msm_dp_panel->drm_edid)
>>>> -		return drm_edid_connector_add_modes(connector);
>>>> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>>> +
>>>> +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>>>> +	drm_edid_connector_update(connector, drm_edid);
>>>
>>> If EDID has been read and processed after HPD high event, why do we need
>>> to re-read it again? Are we expecting that EDID will change?
>>>
>> Here we indeed don't need to read the EDID again, so we can directly call
>> drm_edid_connector_add_modes. Thanks.
>>>> -	return 0;
>>>> +	return drm_edid_connector_add_modes(connector);
>>>>    }
>>>>    static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
>>>> @@ -229,6 +236,7 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
>>>>    void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
>>>>    {
>>>>    	struct msm_dp_panel_private *panel;
>>>> +	const struct drm_edid *drm_edid;
>>>>    	if (!msm_dp_panel) {
>>>>    		DRM_ERROR("invalid input\n");
>>>> @@ -238,8 +246,13 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
>>>>    	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>>>    	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
>>>> +		drm_edid = drm_edid_read_ddc(msm_dp_panel->connector, &panel->aux->ddc);
>>>
>>> And again....
>>>
>> Here we need the struct edid,since we drop the cached drm_edid, so we need
>> to read it again. Or we can return the drm_edid from msm_dp_panel_read_edid
>> and pass it to msm_dp_panel_handle_sink_request, then we don't need to read
>> drm_edid here. Emm, I'm still a bit curious why we can't cache the drm_edid?
>> It would help us to access it when needed. Emm, i see other drivers also
>> cache it.
> 
> Yes, they can cache EDID. However, in this case we don't even need it at
> all. This piece needs to be rewritten to use
> drm_dp_send_real_edid_checksum(), connector->real_edid_checksum.
> 
> Corresponding changes can be submitted separately.
> 
Got it, thanks, will separate this patch from MST patches..  Even if we 
use drm_dp_send_real_edid_checksum to send 
connector->real_edid_checksum, that’s only when the EDID state is incorrect.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c?h=v6.16-rc3#n1020 

  When the EDID is read correctly, it should send edid->checksum instead.
> 

