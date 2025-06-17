Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6009CADC3BC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 09:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D54010E53A;
	Tue, 17 Jun 2025 07:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="h3LRIu/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A91B10E514;
 Tue, 17 Jun 2025 07:53:00 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H6VKGQ026338;
 Tue, 17 Jun 2025 07:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3+OYCgy/JqPCdFzA5ntqnQBLIRY2eEPVF2Gfe6YJ3iA=; b=h3LRIu/ZdyDIfLgm
 +xo6RaxjGuQDJQspDNUgcfyHI5yiOm2mjehkJsciekUvA66C4uc8pQVMcgJdgbZ6
 Q0abIKy/eOcAsbDG7Ey/cZ4f2/B7A08nJ4OqDAXeEX6SxV95imjAKv/ipria3NDO
 ppCEYLFG2v52r/prEj9Cy450r4C2XRALiHebpGVJ+UDVBRjHmyoP/RxFmzrWJoHO
 6Xf2xLzvY/DSNDbfB7vAkJ4Z2BqWujWQiQclL4EbHVmFBnNChVKdOjSgUV6yp4Uh
 SBFaCkDhZitEL7EBus3P6klYQddIIG2t3+1Q5rHdggIQECHqM/1d/EMbiL7TFL6F
 jZgzSw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hffemr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jun 2025 07:52:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55H7qslA015321
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jun 2025 07:52:54 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 17 Jun
 2025 00:52:50 -0700
Message-ID: <19895a7d-4f30-44f1-bc5f-45d200666860@quicinc.com>
Date: Tue, 17 Jun 2025 15:52:47 +0800
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
 <fcmbo5qhiifo3erfnejgtu6es2nmeo3c5r4plbutj23gdtydng@xy3mqkhbsjia>
 <1c09642b-7a0c-4073-97d3-f6f6cddbde83@quicinc.com>
 <7r7vdbeols4suew7rlvogft4b5lmg22osipydxzkubxsychewi@lpyj6vmoapzb>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <7r7vdbeols4suew7rlvogft4b5lmg22osipydxzkubxsychewi@lpyj6vmoapzb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA2MSBTYWx0ZWRfX0PTC1Qs1yOGg
 nEUodtrhGfSZ4vXO406OzaW/FvPIi116JqeNGWWfAMNF/eDBvViiTPOa23cKmaHGl53Iy2Rdf3I
 s0a8J9TbH7qkRslbZbzwVvIRfWc70NvGEZj4OnF6cTEfrg3RzxjTBGKHxLA/TPgtfJ8ypfAJ6h2
 5ANkY3Dfiz3+i7U8hFXFSyRQTVK9GkIh9F/5CCD5syoqJoj7ckXYO4uFWlBAoczZcCCRl3RW/13
 auARNkGNiohbh+5hIzIMJDgCOdqGBId/UyAhUtyc3iUiSlvAKXyNewWOPey1lMhCl2yptdLJokh
 6Py74ejDR8VJz+OEO48uQKCfuTNykqLKG8eeJHB8OBQgu2KaBd1hPLlnSw4pE1Shh+f+Jb/9amp
 eDE59nfj5xwnclBH1JqK1meG5jIQad0dIsW+eRJt8DtBWTRatUz5e1Mn1CUeEwWYmyDqAMc4
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68511ed7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=T0zqKitVi8GbSOTiMt4A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dpUf98RlxOmI6yJpy5ItQ58e-UaXG3Tf
X-Proofpoint-ORIG-GUID: dpUf98RlxOmI6yJpy5ItQ58e-UaXG3Tf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170061
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



On 2025/6/16 21:48, Dmitry Baryshkov wrote:
> On Mon, Jun 16, 2025 at 08:43:40PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2025/6/9 23:51, Dmitry Baryshkov wrote:
>>> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Add connector abstraction for the DP MST. Each MST encoder
>>>> is connected through a DRM bridge to a MST connector and each
>>>> MST connector has a DP panel abstraction attached to it.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>>>>    2 files changed, 518 insertions(+)
>>>
>>>> +
>>>> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
>>>> +							    const struct drm_display_mode *mode)
>>>> +{
>>>> +	struct msm_dp_mst_connector *mst_conn;
>>>> +	struct msm_dp *dp_display;
>>>> +	struct drm_dp_mst_port *mst_port;
>>>> +	struct msm_dp_panel *dp_panel;
>>>> +	struct msm_dp_mst *mst;
>>>> +	u16 full_pbn, required_pbn;
>>>> +	int available_slots, required_slots;
>>>> +	struct msm_dp_mst_bridge_state *dp_bridge_state;
>>>> +	int i, slots_in_use = 0, active_enc_cnt = 0;
>>>> +	const u32 tot_slots = 63;
>>>> +
>>>> +	if (drm_connector_is_unregistered(connector))
>>>> +		return 0;
>>>> +
>>>> +	mst_conn = to_msm_dp_mst_connector(connector);
>>>> +	dp_display = mst_conn->msm_dp;
>>>> +	mst = dp_display->msm_dp_mst;
>>>> +	mst_port = mst_conn->mst_port;
>>>> +	dp_panel = mst_conn->dp_panel;
>>>> +
>>>> +	if (!dp_panel || !mst_port)
>>>> +		return MODE_ERROR;
>>>> +
>>>> +	for (i = 0; i < mst->max_streams; i++) {
>>>> +		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);
>>>> +		if (dp_bridge_state->connector &&
>>>> +		    dp_bridge_state->connector != connector) {
>>>> +			active_enc_cnt++;
>>>> +			slots_in_use += dp_bridge_state->num_slots;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (active_enc_cnt < DP_STREAM_MAX) {
>>>> +		full_pbn = mst_port->full_pbn;
>>>> +		available_slots = tot_slots - slots_in_use;
>>>> +	} else {
>>>> +		DRM_ERROR("all mst streams are active\n");
>>>> +		return MODE_BAD;
>>>> +	}
>>>> +
>>>> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
>>>> +
>>>> +	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
>>>> +
>>>> +	if (required_pbn > full_pbn || required_slots > available_slots) {
>>>> +		drm_dbg_dp(dp_display->drm_dev,
>>>> +			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
>>>> +			   mode->name, required_pbn, full_pbn,
>>>> +			   required_slots, available_slots);
>>>> +		return MODE_BAD;
>>>> +	}
>>>
>>> I almost missed this. Could you please point me, do other drivers
>>> perform mode_valid() check based on the current slots available or not?
>>> Could you please point me to the relevant code in other drivers? Because
>>> it doesn't look correct to me. The mode on the screen remains valid no
>>> matter if I plug or unplug other devices. The atomic_check() should fail
>>> if we don't have enough resources (which includes slots).
>>>
>> Currently, I haven't found other drivers checking available slots during
>> mode_valid(). Intel will check the PBN in here.
> 
> pointer? Also, what do AMD and nouveau do?
> 
Hi,here is the link:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/display/intel_dp_mst.c?h=v6.16-rc2#n1504

nouveau just check the mode_rate and ds_max_dotclock in MST connector 
mode_valid().
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nouveau/nouveau_dp.c?h=v6.16-rc2#n527

The AMD driver seems much more complex, and I can't understand all the 
logic. It looks like AMD always tries to enable DSC and use the smallest 
possible bandwidth.
>> This condition can help us
>> in the following case:
>>
>> Assume two downstream devices both support 4K 60Hz 10-bit. In MST mode, when
>> the first device occupies the 4Kx60Hzx10bit mode, the remaining bandwidth is
>> insufficient to support the same mode for the second device.
>>
>> If we check the slots in mode_valid(), the second device will reject the
>> 4Kx60Hzx10bit mode but accept 4Kx30Hzx10bit. However, if the check is done
>> in atomic_check(), the second device will display a black screen (because
>> 4Kx60Hzx10bit is considered valid in mode_valid() but failed in
>> atomic_check()).
> 
> If we filter modes in mode_valid(), then consider the following
> scenario: we plug monitor A, plug monitor B, then unplug monitor A. At
> this point we only have monitor B, but it has all modes filtered when A
> has been plugged. So, it is impossible to select 4k@60x10, even though
> it is a perfectly valid mode now.
> 
> Also, with the check happening in the atomic_check() the user will not
> get the black screen: the commit will get rejected, letting userspace to
> lower the mode for the second monitor.
> 
Oh, this scenario is indeed just as you described. So let's remove this 
part of the logic and let userspace decide the final mode.
>>>> +
>>>> +	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
>>>> +}
>>>> +
>>>
>>
> 

