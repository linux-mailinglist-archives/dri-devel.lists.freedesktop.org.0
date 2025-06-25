Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C10AE7A94
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 10:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D948910E6A9;
	Wed, 25 Jun 2025 08:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lNVrJck7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B2E10E6A9;
 Wed, 25 Jun 2025 08:44:11 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P0hSbO007242;
 Wed, 25 Jun 2025 08:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fCyBUr31GwUjVNOw1JrfARK8nDg07jSUAIW9Q3UeD0o=; b=lNVrJck7DOALz4sW
 vI/tnFzd5X4QBkRD0XkDItdDHmtqWyHyqqQLtOGzl+Kj3KDNqfgkwffswvb2i4NQ
 Bu5W4Rtx75aW3D/pyxDFeH+37JD8CIWiakNijQDB4wGhhcdAXYz80wx2smOXoVpH
 Hj0IM8ndqO8BMpyTfmQ2l4u14Sw/k+01gD85ToRA2qBSJ1Z688gpOQ18PIFOvhK2
 q+oblWuRY3qNFX5BFN6aYkCwSfN2F43hhGRA3OmPSNQMmHmabmArCgCcmhb0AhA/
 aLWNpFLW8xlLX3FxW0dZF9rkeg8IqGluqmXbBwbExh8q9KZ9iluw2a+UK/ckVzWQ
 zSA4fg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec269cn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jun 2025 08:44:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P8i1fT020356
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jun 2025 08:44:01 GMT
Received: from [10.253.74.126] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 25 Jun
 2025 01:43:57 -0700
Message-ID: <326bbd02-f414-48e3-a396-4b94f19054f7@quicinc.com>
Date: Wed, 25 Jun 2025 16:43:55 +0800
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
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <g6wqvbszbrw6gnvxz7cjmhx4rc53kyulcr5wjekfjaisontikl@723odzngtlnd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2NCBTYWx0ZWRfX3jWNZbWVTxVL
 ly/niwpImwcHTNjrDrrmCGew0lcbqsUWYeqIU6nDNuyG8o0nCEPh8oz707XZNaxy7LZ69ClUrvg
 2s4F2mQhlCIoAXhuZEYn0VyvChIdPE7a5BL28132ov/9cyTEtH5sh/rS8kvIcl/db8u1X+6ql0h
 taLKVqSJR3IiuMwiQUHXcspv9G5BPZwfvtfTQzncO7ivV5Nzjz9Xgkq5u9wyPsZxCwD/ve1LB0n
 4090Hl9GcShE9k75UseuVN9LT7CfrZEIj1T8j9aGxe4WawprSI2ikQd1zusTuJfgQHCUsE9e+ad
 haYJ9AuAvU6+UjC+Mgs7N1GIweA2SEFoefYbFGFtLNVghXGV50QRUEdhG8WKRdEABIQeojUjzt5
 90Qwi+O8uYHdMQYRhXm1OyFwGwphtjJofwYIpZWbHQlb7PpYcDylziqxZjiLPsGZ4+NMNPaR
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685bb6d2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=TqKEzCPVLb6d4rQsPy4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qVRLKYIYnueoOfiKRFMl2R8OqstgcvBU
X-Proofpoint-ORIG-GUID: qVRLKYIYnueoOfiKRFMl2R8OqstgcvBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250064
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



On 2025/6/9 20:41, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:20PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> In preparation of DP MST where link caps are read for the
>> immediate downstream device and the edid is read through
> 
> EDID, not edid. Please review all your patches for up/down case.
> 
Got it. Thanks~
>> sideband messaging, split the msm_dp_panel_read_sink_caps() into
>> two parts which read the link parameters and the edid parts
>> respectively. Also drop the panel drm_edid cached as we actually
>> don't need it.
> 
> Also => separate change.
> 
Got it.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++----
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 55 ++++++++++++++++++++-----------------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  6 ++--
>>   3 files changed, 40 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 6f05a939ce9e648e9601597155999b6f85adfcff..4a9b65647cdef1ed6c3bb851f93df0db8be977af 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -389,7 +389,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   
>>   	dp->link->lttpr_count = msm_dp_display_lttpr_init(dp, dpcd);
>>   
>> -	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
>> +	rc = msm_dp_panel_read_link_caps(dp->panel);
>> +	if (rc)
>> +		goto end;
>> +
>> +	rc = msm_dp_panel_read_edid(dp->panel, connector);
>>   	if (rc)
>>   		goto end;
>>   
>> @@ -720,7 +724,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>>   static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
>>   {
>>   	msm_dp_audio_put(dp->audio);
>> -	msm_dp_panel_put(dp->panel);
>>   	msm_dp_aux_put(dp->aux);
>>   }
>>   
>> @@ -783,7 +786,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>   		rc = PTR_ERR(dp->ctrl);
>>   		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
>>   		dp->ctrl = NULL;
>> -		goto error_ctrl;
>> +		goto error_link;
>>   	}
>>   
>>   	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->catalog);
>> @@ -791,13 +794,11 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>>   		rc = PTR_ERR(dp->audio);
>>   		pr_err("failed to initialize audio, rc = %d\n", rc);
>>   		dp->audio = NULL;
>> -		goto error_ctrl;
>> +		goto error_link;
>>   	}
>>   
>>   	return rc;
>>   
>> -error_ctrl:
>> -	msm_dp_panel_put(dp->panel);
>>   error_link:
>>   	msm_dp_aux_put(dp->aux);
>>   error:
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 4e8ab75c771b1e3a2d62f75e9993e1062118482b..d9041e235104a74b3cc50ff2e307eae0c4301ef3 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -118,14 +118,13 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>>   	return min_supported_bpp;
>>   }
>>   
>> -int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>> -	struct drm_connector *connector)
>> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	int rc, bw_code;
>>   	int count;
>>   	struct msm_dp_panel_private *panel;
>>   
>> -	if (!msm_dp_panel || !connector) {
>> +	if (!msm_dp_panel) {
>>   		DRM_ERROR("invalid input\n");
>>   		return -EINVAL;
>>   	}
>> @@ -160,26 +159,29 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>>   
>>   	rc = drm_dp_read_downstream_info(panel->aux, msm_dp_panel->dpcd,
>>   					 msm_dp_panel->downstream_ports);
>> -	if (rc)
>> -		return rc;
>> +	return rc;
>> +}
>>   
>> -	drm_edid_free(msm_dp_panel->drm_edid);
>> +int msm_dp_panel_read_edid(struct msm_dp_panel *msm_dp_panel, struct drm_connector *connector)
>> +{
>> +	struct msm_dp_panel_private *panel;
>> +	const struct drm_edid *drm_edid;
>> +
>> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>   
>> -	msm_dp_panel->drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>> +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>>   
>> -	drm_edid_connector_update(connector, msm_dp_panel->drm_edid);
>> +	drm_edid_connector_update(connector, drm_edid);
>>   
>> -	if (!msm_dp_panel->drm_edid) {
>> +	if (!drm_edid) {
>>   		DRM_ERROR("panel edid read failed\n");
>>   		/* check edid read fail is due to unplug */
>>   		if (!msm_dp_catalog_link_is_connected(panel->catalog)) {
>> -			rc = -ETIMEDOUT;
>> -			goto end;
>> +			return -ETIMEDOUT;
>>   		}
>>   	}
>>   
>> -end:
>> -	return rc;
>> +	return 0;
>>   }
>>   
>>   u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>> @@ -208,15 +210,20 @@ u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel,
>>   int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>>   	struct drm_connector *connector)
>>   {
>> +	struct msm_dp_panel_private *panel;
>> +	const struct drm_edid *drm_edid;
>> +
>>   	if (!msm_dp_panel) {
>>   		DRM_ERROR("invalid input\n");
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (msm_dp_panel->drm_edid)
>> -		return drm_edid_connector_add_modes(connector);
>> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>> +
>> +	drm_edid = drm_edid_read_ddc(connector, &panel->aux->ddc);
>> +	drm_edid_connector_update(connector, drm_edid);
> 
> If EDID has been read and processed after HPD high event, why do we need
> to re-read it again? Are we expecting that EDID will change?
> 
Here we indeed don't need to read the EDID again, so we can directly 
call drm_edid_connector_add_modes. Thanks.
>>   
>> -	return 0;
>> +	return drm_edid_connector_add_modes(connector);
>>   }
>>   
>>   static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
>> @@ -229,6 +236,7 @@ static u8 msm_dp_panel_get_edid_checksum(const struct edid *edid)
>>   void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	struct msm_dp_panel_private *panel;
>> +	const struct drm_edid *drm_edid;
>>   
>>   	if (!msm_dp_panel) {
>>   		DRM_ERROR("invalid input\n");
>> @@ -238,8 +246,13 @@ void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel)
>>   	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>>   
>>   	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
>> +		drm_edid = drm_edid_read_ddc(msm_dp_panel->connector, &panel->aux->ddc);
> 
> And again....
> 
Here we need the struct edid,since we drop the cached drm_edid, so we 
need to read it again. Or we can return the drm_edid from 
msm_dp_panel_read_edid and pass it to msm_dp_panel_handle_sink_request, 
then we don't need to read drm_edid here. Emm, I'm still a bit curious 
why we can't cache the drm_edid? It would help us to access it when 
needed. Emm, i see other drivers also cache it.
>> +
>> +		if (!drm_edid)
>> +			return;
>> +
>>   		/* FIXME: get rid of drm_edid_raw() */
>> -		const struct edid *edid = drm_edid_raw(msm_dp_panel->drm_edid);
>> +		const struct edid *edid = drm_edid_raw(drm_edid);
>>   		u8 checksum;
>>   
>>   		if (edid)
>> @@ -515,11 +528,3 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
>>   
>>   	return msm_dp_panel;
>>   }
>> -
>> -void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel)
>> -{
>> -	if (!msm_dp_panel)
>> -		return;
>> -
>> -	drm_edid_free(msm_dp_panel->drm_edid);
>> -}
> 
> Too many changes to be stuffed under the hood of "Also perform foo"
> 
Got it, thanks , will split  this patch and refactor the commit msg.
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index 4906f4f09f2451cfed3c1007f38b4db7dfdb1d90..7f139478e1012d5b8f1f745f0de5fc3943745428 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -32,7 +32,6 @@ struct msm_dp_panel {
>>   	u8 downstream_ports[DP_MAX_DOWNSTREAM_PORTS];
>>   
>>   	struct msm_dp_link_info link_info;
>> -	const struct drm_edid *drm_edid;
>>   	struct drm_connector *connector;
>>   	struct msm_dp_display_mode msm_dp_mode;
>>   	struct msm_dp_panel_psr psr_cap;
>> @@ -51,7 +50,9 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
>>   int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
>>   		struct drm_connector *connector);
>>   u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
>> -			u32 mode_pclk_khz);
>> +			      u32 mode_pclk_khz);
>> +int msm_dp_panel_read_link_caps(struct msm_dp_panel *dp_panel);
>> +int msm_dp_panel_read_edid(struct msm_dp_panel *dp_panel, struct drm_connector *connector);
>>   int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>>   		struct drm_connector *connector);
>>   void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
>> @@ -86,5 +87,4 @@ static inline bool is_lane_count_valid(u32 lane_count)
>>   
>>   struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
>>   			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
>> -void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
>>   #endif /* _DP_PANEL_H_ */
>>
>> -- 
>> 2.34.1
>>
> 

