Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E28AC4C40
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 12:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C22810E41C;
	Tue, 27 May 2025 10:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="LT7pL6kP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1EE10E41C;
 Tue, 27 May 2025 10:31:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R2pbhK022688;
 Tue, 27 May 2025 10:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F1bgB2FK7oLEgPNn4ucv+o5riitoxqanMosI74lK2KI=; b=LT7pL6kPaR3rocfE
 lcFM6OtXYkEdftD+KFV06NxNGddUPRqOzhv0e+E6z61rCQK2GT/SrbXyz4+iwQoU
 BaT19yJUbP69nhMn6tWUvLYMsTVYbezl2RAyqvTt9oDUt1iYmjeJ95/iw4zh8E7J
 5lfwguNaB6zjwjXa0VQjgrozQaMho6qX34Jt3XI6nBVrmx/le9DKLGM4HV2OB7p3
 BGs+2IN2XpSFHggvZvOHA8yJZ4btcZErq8+Rgb/1xj/7Yeh9Szddn93bPOVl+rnn
 Wyi1Lm44c9i0SYHQTZvDDt07Vby69+uV8R5VB2iTGjtigYTNEwN4jUjSfV5N5rNI
 Z6svvA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p6gn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 10:30:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54RATxgn018670
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 May 2025 10:29:59 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 May
 2025 03:29:52 -0700
Message-ID: <318ee4bc-b39a-43d3-abcb-22588a9a765c@quicinc.com>
Date: Tue, 27 May 2025 18:29:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/45] drm/msm/dp: add dp_mst_drm to manage DP MST bridge
 operations
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>, Rob Clark
 <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-31-f8618d42a99a@quicinc.com>
 <4unizv5vi7ve7qdpzmcxj6vvxwxrpcppg3y72csi7ga2jqwhrm@5eu74nuopyqf>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <4unizv5vi7ve7qdpzmcxj6vvxwxrpcppg3y72csi7ga2jqwhrm@5eu74nuopyqf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5Zwk3cXVTc20KtmS3RIp09AVNMUzD8L1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NiBTYWx0ZWRfX1SxCI+WKwRRZ
 s27t8mlE4eeVTIfCvfW5Crz/FO6rZYIcFMASkaglPQJ09wKrQEZfnLGTCzLrf9ocTcKBzDy66vs
 z0p/tpxKNai3M7B8JYNpr/JxXlcIKIfiFMexUNP+WwzDv+HjCGqtRKhDX84XqPtWxJefTdNKoWn
 cOFHPAZXzndVvcvQWlS7JC4ygMqgSn/zohoW/n25hkEMrQjbTDjcDRkHkx7OjnkoDlArG2V4mNq
 J2SX3gBgRa6jfS+f2SQlsco7kqPYGYHv5ziOcwxkaFWYjqlGRxh/wsQy1uWxxMfg9g/pam84PPy
 vXE7LavBtPtIlAcd+zOoQiK2+i0uDvRww0CA4KrbzDHTy3mwqy2c3dwRbbMrI4GuE2TZR8O5uUP
 TBRBsDNEslkbcFKsLpcn8WFDlv/jwjQSreS8fidydWn0kEkp75wRckZEfkIZIXHS05fz9odS
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=68359428 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=E1RuHaTfsJbKgmNQtpgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5Zwk3cXVTc20KtmS3RIp09AVNMUzD8L1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270086
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



On 2024/12/6 18:12, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 08:32:02PM -0800, Abhinav Kumar wrote:
>> Add a new file dp_mst_drm to manage the DP MST bridge operations
>> similar to the dp_drm file which manages the SST bridge operations.
>> Each MST encoder creates one bridge and each bridge is bound to its
>> own dp_panel abstraction to manage the operations of its pipeline.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/Makefile        |   3 +-
>>   drivers/gpu/drm/msm/dp/dp_display.h |   2 +
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 490 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h | 102 ++++++++
>>   4 files changed, 596 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
>> index f274d9430cc311405f890074c1466ffe2ec45ac9..b1e01b3123d9afc4818f059c5d4e7ca70dca3754 100644
>> --- a/drivers/gpu/drm/msm/Makefile
>> +++ b/drivers/gpu/drm/msm/Makefile
>> @@ -142,7 +142,8 @@ msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>>   	dp/dp_link.o \
>>   	dp/dp_panel.o \
>>   	dp/dp_audio.o \
>> -	dp/dp_utils.o
>> +	dp/dp_utils.o \
>> +	dp/dp_mst_drm.o
>>   
>>   msm-display-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 6ab14e969bce0fd07b3a550bae17e99652479232..a5d4893f689c6afbbe622c9b7dfa98d23d754831 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -7,6 +7,7 @@
>>   #define _DP_DISPLAY_H_
>>   
>>   #include "dp_panel.h"
>> +#include "dp_mst_drm.h"
>>   #include <sound/hdmi-codec.h>
>>   #include "disp/msm_disp_snapshot.h"
>>   
>> @@ -26,6 +27,7 @@ struct msm_dp {
>>   	bool is_edp;
>>   	bool internal_hpd;
>>   
>> +	struct msm_dp_mst *msm_dp_mst;
>>   	hdmi_codec_plugged_cb plugged_cb;
>>   
>>   	struct msm_dp_audio *msm_dp_audio;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e66bd1e565aeb4da3d636eb5f4aa75504d60fd40
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
>> @@ -0,0 +1,490 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +/*
>> + * Copyright © 2014 Red Hat.
>> + *
>> + * Permission to use, copy, modify, distribute, and sell this software and its
>> + * documentation for any purpose is hereby granted without fee, provided that
>> + * the above copyright notice appear in all copies and that both that copyright
>> + * notice and this permission notice appear in supporting documentation, and
>> + * that the name of the copyright holders not be used in advertising or
>> + * publicity pertaining to distribution of the software without specific,
>> + * written prior permission.  The copyright holders make no representations
>> + * about the suitability of this software for any purpose.  It is provided "as
>> + * is" without express or implied warranty.
>> + *
>> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
>> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
>> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
>> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
>> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
>> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
>> + * OF THIS SOFTWARE.
>> + */
>> +
>> +#include "dp_mst_drm.h"
>> +
>> +static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
>> +{
>> +	struct msm_dp_mst_bridge_state *state;
>> +
>> +	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
>> +	if (!state)
>> +		return NULL;
>> +
>> +	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
>> +
>> +	return &state->base;
>> +}
>> +
>> +static void msm_dp_mst_destroy_bridge_state(struct drm_private_obj *obj,
>> +					    struct drm_private_state *state)
>> +{
>> +	struct msm_dp_mst_bridge_state *priv_state =
>> +		to_msm_dp_mst_bridge_priv_state(state);
>> +
>> +	kfree(priv_state);
>> +}
>> +
>> +static const struct drm_private_state_funcs msm_dp_mst_bridge_state_funcs = {
>> +	.atomic_duplicate_state = msm_dp_mst_duplicate_bridge_state,
>> +	.atomic_destroy_state = msm_dp_mst_destroy_bridge_state,
>> +};
>> +
>> +/**
>> + * dp_mst_find_vcpi_slots() - Find VCPI slots for this PBN value
>> + * @mgr: manager to use
>> + * @pbn: payload bandwidth to convert into slots.
>> + *
>> + * Calculate the number of VCPI slots that will be required for the given PBN
>> + * value.
>> + *
>> + * RETURNS:
>> + * The total slots required for this port, or error.
>> + */
>> +static int msm_dp_mst_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, int pbn)
>> +{
>> +	int num_slots;
>> +	struct drm_dp_mst_topology_state *state;
>> +
>> +	state = to_drm_dp_mst_topology_state(mgr->base.state);
>> +	num_slots = DIV_ROUND_UP(pbn, dfixed_trunc(state->pbn_div));
> 
> drm_dp_atomic_find_time_slots() uses slightly different maths here, with
> the different precision. Can we use the data that is set by that function
> instead (payload->time_slots)?
> 
Note that drm_dp_atomic_find_time_slots all call in atomic_check func, 
not in other place.So can we call this func in atomic_pre_enable? Also, 
amg driver also have similar usage pattern.
>> +
>> +	/* max. time slots - one slot for MTP header */
>> +	if (num_slots > 63)
>> +		return -ENOSPC;
>> +	return num_slots;
>> +}
>> +
>> +static void _msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
>> +					 struct msm_dp_mst_bridge *mst_bridge,
>> +					 struct drm_dp_mst_port *port)
>> +{
>> +	int i;
>> +	struct msm_dp_mst_bridge *msm_dp_bridge;
>> +	struct drm_dp_mst_topology_state *mst_state;
>> +	struct drm_dp_mst_atomic_payload *payload;
>> +	int prev_start = 0;
>> +	int prev_slots = 0;
>> +
>> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
>> +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
>> +
>> +	if (!payload) {
>> +		DRM_ERROR("mst bridge [%d] update_timeslots failed, null payload\n",
>> +			  mst_bridge->id);
>> +		return;
>> +	}
>> +
>> +	for (i = 0; i < mst->max_streams; i++) {
>> +		msm_dp_bridge = &mst->mst_bridge[i];
>> +		if (mst_bridge == msm_dp_bridge) {
>> +			/*
>> +			 * When a payload was removed make sure to move any payloads after it
>> +			 * to the left so all payloads are aligned to the left.
>> +			 */
> 
> Please don't. drm_dp_remove_payload_part2() should take care of that for
> us. What is the reason for caching the data if we have to manually
> handle the cache?
> 
MST framework is managing the port's bandwidth, but we have a bridhge 
for each stream, so we need to keep track of the payload allcation 
status for each bridge, how much we used and how much we left. So maybe 
they are manage two different part.
>> +			if (payload->vc_start_slot < 0) {
>> +				// cache the payload
>> +				prev_start = msm_dp_bridge->start_slot;
>> +				prev_slots = msm_dp_bridge->num_slots;
>> +				msm_dp_bridge->pbn = 0;
>> +				msm_dp_bridge->start_slot = 1;
>> +				msm_dp_bridge->num_slots = 0;
>> +				msm_dp_bridge->vcpi = 0;
>> +			} else { //add payload
>> +				msm_dp_bridge->pbn = payload->pbn;
>> +				msm_dp_bridge->start_slot = payload->vc_start_slot;
>> +				msm_dp_bridge->num_slots = payload->time_slots;
>> +				msm_dp_bridge->vcpi = payload->vcpi;
>> +			}
>> +		}
>> +	}
>> +
>> +	// Now commit all the updated payloads
>> +	for (i = 0; i < mst->max_streams; i++) {
>> +		msm_dp_bridge = &mst->mst_bridge[i];
>> +
>> +		//Shift payloads to the left if there was a removed payload.
>> +		if (payload->vc_start_slot < 0 && msm_dp_bridge->start_slot > prev_start)
>> +			msm_dp_bridge->start_slot -= prev_slots;
>> +
>> +		msm_dp_display_set_stream_info(mst->msm_dp, msm_dp_bridge->msm_dp_panel,
>> +					       msm_dp_bridge->id, msm_dp_bridge->start_slot,
>> +					       msm_dp_bridge->num_slots,
>> +					       msm_dp_bridge->pbn, msm_dp_bridge->vcpi);
>> +		drm_dbg_dp(mst->msm_dp->drm_dev,
>> +			   "conn:%d vcpi:%d start_slot:%d num_slots:%d, pbn:%d\n",
>> +			   DP_MST_CONN_ID(msm_dp_bridge), msm_dp_bridge->vcpi,
>> +			   msm_dp_bridge->start_slot,
>> +			   msm_dp_bridge->num_slots, msm_dp_bridge->pbn);
>> +	}
>> +}
>> +
>> +static int _msm_dp_mst_bridge_pre_enable_part1(struct msm_dp_mst_bridge *dp_bridge,
>> +					       struct drm_bridge_state *bridge_state)
>> +{
>> +	struct msm_dp *msm_dp = dp_bridge->display;
>> +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
>> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
>> +	struct drm_dp_mst_port *port = mst_conn->mst_port;
>> +	struct drm_dp_mst_topology_state *mst_state;
>> +	struct drm_dp_mst_atomic_payload *payload;
>> +	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;
>> +	int pbn, slots;
>> +	int rc = 0;
>> +
>> +	mst_state = drm_atomic_get_new_mst_topology_state(bridge_state->base.state,
>> +							  &mst->mst_mgr);
>> +
>> +	pbn = drm_dp_calc_pbn_mode(dp_panel->msm_dp_mode.drm_mode.clock,
>> +				   (mst_conn->connector.display_info.bpc * 3) << 4);
>> +
>> +	slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, pbn);
>> +
>> +	drm_dbg_dp(msm_dp->drm_dev, "conn:%d pbn:%d, slots:%d\n", DP_MST_CONN_ID(dp_bridge),
>> +		   pbn, slots);
>> +
>> +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
>> +	if (!payload || payload->time_slots <= 0) {
>> +		DRM_ERROR("time slots not allocated for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
>> +		rc = -EINVAL;
>> +		return rc;
>> +	}
>> +
>> +	drm_dp_mst_update_slots(mst_state, DP_CAP_ANSI_8B10B);
>> +
>> +	rc = drm_dp_add_payload_part1(&mst->mst_mgr, mst_state, payload);
>> +	if (rc) {
>> +		DRM_ERROR("payload allocation failure for conn:%d\n", DP_MST_CONN_ID(dp_bridge));
>> +		return rc;
>> +	}
>> +
>> +	_msm_dp_mst_update_timeslots(mst, dp_bridge, port);
>> +
>> +	return rc;
>> +}
>> +
>> +static void _msm_dp_mst_bridge_pre_enable_part2(struct msm_dp_mst_bridge *dp_bridge,
>> +						struct drm_bridge_state *bridge_state)
>> +{
>> +	struct msm_dp *msm_dp = dp_bridge->display;
>> +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
>> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
>> +	struct drm_dp_mst_port *port = mst_conn->mst_port;
>> +	struct drm_dp_mst_topology_state *mst_state;
>> +	struct drm_dp_mst_atomic_payload *payload;
>> +
>> +	drm_dp_check_act_status(&mst->mst_mgr);
>> +
>> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);
>> +	payload = drm_atomic_get_mst_payload_state(mst_state, port);
>> +
>> +	if (!payload) {
>> +		DRM_ERROR("mst bridge [%d] null payload\n", dp_bridge->id);
>> +		return;
>> +	}
>> +
>> +	if (!payload->port) {
>> +		DRM_ERROR("mst bridge [%d] null port\n", dp_bridge->id);
>> +		return;
>> +	}
>> +
>> +	if (!payload->port->connector) {
>> +		DRM_ERROR("mst bridge [%d] part-2 failed, null connector\n",
>> +			  dp_bridge->id);
>> +		return;
>> +	}
>> +
>> +	if (payload->vc_start_slot == -1) {
>> +		DRM_ERROR("mst bridge [%d] part-2 failed, payload alloc part 1 failed\n",
>> +			  dp_bridge->id);
>> +		return;
>> +	}
>> +
>> +	drm_dp_add_payload_part2(&mst->mst_mgr, payload);
>> +
>> +	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre enable part-2 complete\n",
>> +		   dp_bridge->id);
>> +}
>> +
>> +static void _msm_dp_mst_bridge_pre_disable_part1(struct msm_dp_mst_bridge *dp_bridge,
>> +						 struct drm_bridge_state *bridge_state)
>> +{
>> +	struct msm_dp *msm_dp = dp_bridge->display;
>> +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
>> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(dp_bridge->connector);
>> +	struct drm_dp_mst_port *port = mst_conn->mst_port;
>> +	struct drm_dp_mst_topology_state *old_mst_state;
>> +	struct drm_dp_mst_topology_state *new_mst_state;
>> +	const struct drm_dp_mst_atomic_payload *old_payload;
>> +	struct drm_dp_mst_atomic_payload *new_payload;
>> +
>> +	old_mst_state = drm_atomic_get_old_mst_topology_state(bridge_state->base.state,
>> +							      &mst->mst_mgr);
>> +
>> +	new_mst_state = drm_atomic_get_new_mst_topology_state(bridge_state->base.state,
>> +							      &mst->mst_mgr);
>> +
>> +	old_payload = drm_atomic_get_mst_payload_state(old_mst_state, port);
>> +	new_payload = drm_atomic_get_mst_payload_state(new_mst_state, port);
>> +
>> +	if (!old_payload || !new_payload) {
>> +		DRM_ERROR("mst bridge [%d] _pre disable part-1 failed, null payload\n",
>> +			  dp_bridge->id);
>> +		return;
>> +	}
>> +
>> +	drm_dp_remove_payload_part1(&mst->mst_mgr, new_mst_state, new_payload);
>> +	drm_dp_remove_payload_part2(&mst->mst_mgr, new_mst_state, old_payload, new_payload);
>> +
>> +	_msm_dp_mst_update_timeslots(mst, dp_bridge, port);
>> +
>> +	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre disable part-1 complete\n",
>> +		   dp_bridge->id);
>> +}
>> +
>> +static void _msm_dp_mst_bridge_pre_disable_part2(struct msm_dp_mst_bridge *dp_bridge)
>> +{
>> +	struct msm_dp *msm_dp = dp_bridge->display;
>> +	struct msm_dp_mst *mst = msm_dp->msm_dp_mst;
>> +
>> +	drm_dp_check_act_status(&mst->mst_mgr);
>> +
>> +	drm_dbg_dp(msm_dp->drm_dev, "mst bridge [%d] _pre disable part-2 complete\n",
>> +		   dp_bridge->id);
>> +}
>> +
>> +static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
>> +						struct drm_bridge_state *old_bridge_state)
>> +{
>> +	int rc = 0;
>> +	struct msm_dp_mst_bridge *bridge;
>> +	struct msm_dp *dp;
>> +	struct msm_dp_mst_bridge_state *msm_dp_bridge_state;
>> +
>> +	if (!drm_bridge) {
>> +		DRM_ERROR("Invalid params\n");
>> +		return;
>> +	}
>> +
>> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
>> +	msm_dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
>> +	dp = bridge->display;
>> +
>> +	/* to cover cases of bridge_disable/bridge_enable without modeset */
>> +	bridge->connector = msm_dp_bridge_state->connector;
>> +	bridge->msm_dp_panel = msm_dp_bridge_state->msm_dp_panel;
>> +
>> +	if (!bridge->connector) {
>> +		DRM_ERROR("Invalid connector\n");
>> +		return;
>> +	}
>> +
>> +	msm_dp_display_atomic_prepare(dp);
>> +
>> +	rc = _msm_dp_mst_bridge_pre_enable_part1(bridge, old_bridge_state);
>> +	if (rc) {
>> +		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
>> +		msm_dp_display_unprepare(dp);
>> +		return;
>> +	}
>> +
>> +	msm_dp_display_enable_helper(dp, bridge->msm_dp_panel);
>> +
>> +	_msm_dp_mst_bridge_pre_enable_part2(bridge, old_bridge_state);
>> +
>> +	drm_dbg_dp(dp->drm_dev, "conn:%d mode:%s fps:%d vcpi:%d slots:%d to %d\n",
>> +		   DP_MST_CONN_ID(bridge), bridge->drm_mode.name,
>> +		   drm_mode_vrefresh(&bridge->drm_mode),
>> +		   bridge->vcpi, bridge->start_slot,
>> +		   bridge->start_slot + bridge->num_slots);
>> +}
>> +
>> +static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
>> +					     struct drm_bridge_state *old_bridge_state)
>> +{
>> +	struct msm_dp_mst_bridge *bridge;
>> +	struct msm_dp *dp;
>> +
>> +	if (!drm_bridge) {
>> +		DRM_ERROR("Invalid params\n");
>> +		return;
>> +	}
>> +
>> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
>> +	if (!bridge->connector) {
>> +		DRM_ERROR("Invalid connector\n");
>> +		return;
>> +	}
>> +
>> +	dp = bridge->display;
>> +
>> +	_msm_dp_mst_bridge_pre_disable_part1(bridge, old_bridge_state);
>> +
>> +	msm_dp_display_disable_helper(dp, bridge->msm_dp_panel);
>> +
>> +	_msm_dp_mst_bridge_pre_disable_part2(bridge);
>> +
>> +	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d disable complete\n", bridge->id,
>> +		   DP_MST_CONN_ID(bridge));
>> +}
>> +
>> +static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>> +						  struct drm_bridge_state *old_bridge_state)
>> +{
>> +	int conn = 0;
>> +	struct msm_dp_mst_bridge *bridge;
>> +	struct msm_dp *dp;
>> +
>> +	if (!drm_bridge) {
>> +		DRM_ERROR("Invalid params\n");
>> +		return;
>> +	}
>> +
>> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
>> +	if (!bridge->connector) {
>> +		DRM_ERROR("Invalid connector\n");
>> +		return;
>> +	}
>> +
>> +	conn = DP_MST_CONN_ID(bridge);
>> +
>> +	dp = bridge->display;
>> +
>> +	msm_dp_display_atomic_post_disable_helper(dp, bridge->msm_dp_panel);
>> +
>> +	if (!dp->mst_active)
>> +		msm_dp_display_unprepare(dp);
>> +
>> +	bridge->connector = NULL;
>> +	bridge->msm_dp_panel =  NULL;
>> +
>> +	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d post disable complete\n",
>> +		   bridge->id, conn);
>> +}
>> +
>> +static void msm_dp_mst_bridge_mode_set(struct drm_bridge *drm_bridge,
>> +				       const struct drm_display_mode *mode,
>> +				       const struct drm_display_mode *adjusted_mode)
>> +{
>> +	struct msm_dp_mst_bridge *bridge;
>> +	struct msm_dp_mst_bridge_state *dp_bridge_state;
>> +	struct msm_dp *dp;
>> +	struct msm_dp_panel *msm_dp_panel;
>> +
>> +	if (!drm_bridge || !mode || !adjusted_mode) {
>> +		DRM_ERROR("Invalid params\n");
>> +		return;
>> +	}
>> +
>> +	bridge = to_msm_dp_mst_bridge(drm_bridge);
>> +
>> +	dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
>> +	bridge->connector = dp_bridge_state->connector;
>> +	bridge->msm_dp_panel = dp_bridge_state->msm_dp_panel;
>> +
>> +	msm_dp_panel = bridge->msm_dp_panel;
>> +	dp = bridge->display;
>> +
>> +	memset(&bridge->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
>> +	memcpy(&bridge->drm_mode, adjusted_mode, sizeof(bridge->drm_mode));
>> +	msm_dp_display_mode_set_helper(dp, mode, adjusted_mode, bridge->msm_dp_panel);
>> +	msm_dp_panel->mst_caps.pbn = drm_dp_calc_pbn_mode(msm_dp_panel->msm_dp_mode.drm_mode.clock,
>> +							  (msm_dp_panel->msm_dp_mode.bpp << 4));
>> +	memcpy(&bridge->msm_dp_mode, &bridge->msm_dp_panel->msm_dp_mode,
>> +	       sizeof(struct msm_dp_display_mode));
> 
> No, you can't just memcpy the drm_mode struct.
> 
Got it.
>> +	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d mode set complete %s\n", bridge->id,
>> +		   DP_MST_CONN_ID(bridge), mode->name);
>> +}
>> +
>> +/* DP MST Bridge APIs */
>> +static const struct drm_bridge_funcs msm_dp_mst_bridge_ops = {
>> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>> +	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
>> +	.atomic_reset           = drm_atomic_helper_bridge_reset,
>> +	.atomic_pre_enable   = msm_dp_mst_bridge_atomic_pre_enable,
>> +	.atomic_disable      = msm_dp_mst_bridge_atomic_disable,
>> +	.atomic_post_disable = msm_dp_mst_bridge_atomic_post_disable,
>> +	.mode_set     = msm_dp_mst_bridge_mode_set,
>> +};
>> +
>> +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder)
>> +{
>> +	int rc = 0;
>> +	struct msm_dp_mst_bridge *bridge = NULL;
>> +	struct msm_dp_mst_bridge_state *state;
>> +	struct drm_device *dev;
>> +	struct msm_dp_mst *mst = dp->msm_dp_mst;
>> +	int i;
>> +
>> +	for (i = 0; i < mst->max_streams; i++) {
>> +		if (!mst->mst_bridge[i].in_use) {
>> +			bridge = &mst->mst_bridge[i];
>> +			bridge->encoder = encoder;
>> +			bridge->in_use = true;
>> +			bridge->id = i;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (i == mst->max_streams) {
>> +		DRM_ERROR("mst supports only %d bridges\n", i);
>> +		rc = -EACCES;
>> +		goto end;
>> +	}
>> +
>> +	dev = dp->drm_dev;
>> +	bridge->display = dp;
>> +	bridge->base.funcs = &msm_dp_mst_bridge_ops;
>> +	bridge->base.encoder = encoder;
>> +	bridge->base.type = dp->connector_type;
>> +	bridge->base.ops = DRM_BRIDGE_OP_MODES;
>> +	drm_bridge_add(&bridge->base);
>> +
>> +	rc = drm_bridge_attach(encoder, &bridge->base, NULL, 0);
>> +	if (rc) {
>> +		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
>> +		goto end;
>> +	}
>> +
>> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
>> +	if (!state) {
>> +		rc = -ENOMEM;
>> +		goto end;
>> +	}
>> +
>> +	drm_atomic_private_obj_init(dev, &bridge->obj,
>> +				    &state->base,
>> +				    &msm_dp_mst_bridge_state_funcs);
>> +
>> +	drm_dbg_dp(dp->drm_dev, "mst drm bridge init. bridge id:%d\n", i);
>> +
>> +	return 0;
>> +
>> +end:
>> +	return rc;
>> +}
>> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c2a82cd3c6d6e1951a8e5905d3aa39dfc691023b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
>> @@ -0,0 +1,102 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + *
>> + * Permission to use, copy, modify, distribute, and sell this software and its
>> + * documentation for any purpose is hereby granted without fee, provided that
>> + * the above copyright notice appear in all copies and that both that copyright
>> + * notice and this permission notice appear in supporting documentation, and
>> + * that the name of the copyright holders not be used in advertising or
>> + * publicity pertaining to distribution of the software without specific,
>> + * written prior permission.  The copyright holders make no representations
>> + * about the suitability of this software for any purpose.  It is provided "as
>> + * is" without express or implied warranty.
>> + *
>> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
>> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
>> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
>> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
>> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
>> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
>> + * OF THIS SOFTWARE.
>> + */
>> +
>> +#ifndef _DP_MST_DRM_H_
>> +#define _DP_MST_DRM_H_
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/init.h>
>> +#include <linux/errno.h>
>> +#include <linux/version.h>
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_bridge.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_fixed.h>
>> +#include <drm/drm_connector.h>
>> +#include <drm/display/drm_dp_helper.h>
>> +#include <drm/display/drm_dp_mst_helper.h>
>> +
>> +#include "dp_panel.h"
>> +#include "dp_display.h"
>> +
>> +#define DP_MST_CONN_ID(bridge) ((bridge)->connector ? \
>> +		(bridge)->connector->base.id : 0)
> 
> locking? Also connectors can easily be freed, so you can't just read
> into it.
Got it.
>> +
>> +struct msm_dp_mst_bridge {
>> +	struct drm_bridge base;
>> +	struct drm_private_obj obj;
>> +	u32 id;
>> +
>> +	bool in_use;
>> +
>> +	struct msm_dp *display;
>> +	struct drm_encoder *encoder;
>> +
>> +	struct drm_display_mode drm_mode;
> 
> Why? Where is this being set? Why can't you use the state objects instead?
> 
>> +	struct msm_dp_display_mode msm_dp_mode;
> 
> I don't see this being used. Please drop.
Got it. It stores a backup of msm_dp_mode from dp_panel, but there's 
really no need for two drm_mode instances here
> 
>> +	struct drm_connector *connector;
> 
> So, you have connector here and a connector in the state. Please drop
> one (I'd guess this one).
> 
Got it.
>> +	struct msm_dp_panel *msm_dp_panel;
>> +
>> +	int vcpi;
>> +	int pbn;
>> +	int num_slots;
>> +	int start_slot;
> 
> Which of the fields (including in_use) are long-lived and which are a
> part of the current state? Can we move all state ones to bridge's state?
> 
in_use only used in bridge_init, so it is long-lived. Looking at it 
together with the next patch, only num_slots changes during 
atomic_check, so it is in bridge_state. pbn/vcpi/start_slots only change 
during bridge enable/disable, so they are placed in the bridge.
>> +};
>> +
>> +struct msm_dp_mst_bridge_state {
>> +	struct drm_private_state base;
>> +	struct drm_connector *connector;
>> +	struct msm_dp_panel *msm_dp_panel;
>> +	int num_slots;
>> +};
>> +
>> +struct msm_dp_mst {
>> +	bool mst_initialized;
>> +	struct drm_dp_mst_topology_mgr mst_mgr;
>> +	struct msm_dp_mst_bridge *mst_bridge;
>> +	struct msm_dp *msm_dp;
>> +	bool mst_session_hpd_state;
>> +	u32 max_streams;
>> +};
>> +
>> +struct msm_dp_mst_connector {
>> +	struct drm_connector connector;
>> +	struct drm_dp_mst_port *mst_port;
>> +	struct msm_dp *msm_dp;
>> +	struct msm_dp_panel *dp_panel;
>> +};
>> +
>> +#define to_msm_dp_mst_bridge(x)     container_of((x), struct msm_dp_mst_bridge, base)
>> +#define to_msm_dp_mst_bridge_priv(x) \
>> +		container_of((x), struct msm_dp_mst_bridge, obj)
>> +#define to_msm_dp_mst_bridge_priv_state(x) \
>> +		container_of((x), struct msm_dp_mst_bridge_state, base)
>> +#define to_msm_dp_mst_bridge_state(x) \
>> +		to_msm_dp_mst_bridge_priv_state((x)->obj.state)
>> +#define to_msm_dp_mst_connector(x) \
>> +		container_of((x), struct msm_dp_mst_connector, connector)
>> +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>> +
>> +#endif /* _DP_MST_DRM_H_ */
>>
>> -- 
>> 2.34.1
>>
> 

