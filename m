Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0788ADB079
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 14:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F1010E35F;
	Mon, 16 Jun 2025 12:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pi2tzzsn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFFC10E35F;
 Mon, 16 Jun 2025 12:44:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8lKt7004321;
 Mon, 16 Jun 2025 12:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 a5oO1qo73hKkbnLVV/jzEVM+2GsEeaJYPdF275S4nGY=; b=pi2tzzsnhRW7DipV
 1ZTBW2maRYi85fr9woOnQZymJYtSUreJd3TxGEznOxqE95leOi3O5P81mr0n8iuO
 15+uvgVwLX24w4U6+umYGwZpZA0B+HxtuzDR8VcZRKME1cgTAjsRgafqSkLpjsgR
 TcRU7DcF7O6ioQiN7/ZYqk3LEBoi271lAjW3mzdcVO2Njn7tMBlCFvBGvJhho9fi
 nr2r0KZM/igK37ZPJXBDE2G7H7OA2kLhKND18qxvGjcZZyosDAnu10AAEn5vVD9l
 QysL3vn7EJZU1DeSd3yJ9VV0ozkqjCtkQzRUOCwIGB8iy4PNtASMwT5deAi/F+2w
 v0Fncg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag230njy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 12:43:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55GChlED027287
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 12:43:47 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Jun
 2025 05:43:43 -0700
Message-ID: <1c09642b-7a0c-4073-97d3-f6f6cddbde83@quicinc.com>
Date: Mon, 16 Jun 2025 20:43:40 +0800
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
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <fcmbo5qhiifo3erfnejgtu6es2nmeo3c5r4plbutj23gdtydng@xy3mqkhbsjia>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: n-gg6bA6jRxgzECik29ZpGnikXtBBm-U
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68501184 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=nS5M5X4IFjjFUfIJem0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3OSBTYWx0ZWRfXwfur6E3PVpN3
 ZGzPHuNO565diGHsLpm03pddHh0cA+n7Mokg6eh2etyTGXQfdAuByVCU/JXgoBjjvi1cCPYQEIq
 jf8GjtI7o//Mcri+pM3Lu+psWE1Vv/A+BRCez84q5pV/6A8TBtTeoMTSL0wqHdOoRZKjFbjFzBH
 PMYVxwLzZTL8niQOlVtbzV+559r48uuz+PwaCHkUFnzY9pt2/ESkan68BzsJ+B4NzZgsfLt5H7C
 njWga/eesmZi1VU4L6BR+2s8z9K3wJipdWYxXdpbA2xeYqTYbDvoFz4SIOaKe/qr15//x7rWjA/
 P3rI6fU90NqQumGFh/TlONekuVerCMjLbHP028X0eTi0NlvmyIvo/dq0ib79MR4RXSyQLn/m9jV
 jAy77/1txLTKahq7JLG1FsuGnkm29yXpwelunO0HAypFSndTjRw+tRYa5EV2Ql8g06l04qkU
X-Proofpoint-GUID: n-gg6bA6jRxgzECik29ZpGnikXtBBm-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160079
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



On 2025/6/9 23:51, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:48PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Add connector abstraction for the DP MST. Each MST encoder
>> is connected through a DRM bridge to a MST connector and each
>> MST connector has a DP panel abstraction attached to it.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 515 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_mst_drm.h |   3 +
>>   2 files changed, 518 insertions(+)
> 
>> +
>> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
>> +							    const struct drm_display_mode *mode)
>> +{
>> +	struct msm_dp_mst_connector *mst_conn;
>> +	struct msm_dp *dp_display;
>> +	struct drm_dp_mst_port *mst_port;
>> +	struct msm_dp_panel *dp_panel;
>> +	struct msm_dp_mst *mst;
>> +	u16 full_pbn, required_pbn;
>> +	int available_slots, required_slots;
>> +	struct msm_dp_mst_bridge_state *dp_bridge_state;
>> +	int i, slots_in_use = 0, active_enc_cnt = 0;
>> +	const u32 tot_slots = 63;
>> +
>> +	if (drm_connector_is_unregistered(connector))
>> +		return 0;
>> +
>> +	mst_conn = to_msm_dp_mst_connector(connector);
>> +	dp_display = mst_conn->msm_dp;
>> +	mst = dp_display->msm_dp_mst;
>> +	mst_port = mst_conn->mst_port;
>> +	dp_panel = mst_conn->dp_panel;
>> +
>> +	if (!dp_panel || !mst_port)
>> +		return MODE_ERROR;
>> +
>> +	for (i = 0; i < mst->max_streams; i++) {
>> +		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);
>> +		if (dp_bridge_state->connector &&
>> +		    dp_bridge_state->connector != connector) {
>> +			active_enc_cnt++;
>> +			slots_in_use += dp_bridge_state->num_slots;
>> +		}
>> +	}
>> +
>> +	if (active_enc_cnt < DP_STREAM_MAX) {
>> +		full_pbn = mst_port->full_pbn;
>> +		available_slots = tot_slots - slots_in_use;
>> +	} else {
>> +		DRM_ERROR("all mst streams are active\n");
>> +		return MODE_BAD;
>> +	}
>> +
>> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
>> +
>> +	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
>> +
>> +	if (required_pbn > full_pbn || required_slots > available_slots) {
>> +		drm_dbg_dp(dp_display->drm_dev,
>> +			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
>> +			   mode->name, required_pbn, full_pbn,
>> +			   required_slots, available_slots);
>> +		return MODE_BAD;
>> +	}
> 
> I almost missed this. Could you please point me, do other drivers
> perform mode_valid() check based on the current slots available or not?
> Could you please point me to the relevant code in other drivers? Because
> it doesn't look correct to me. The mode on the screen remains valid no
> matter if I plug or unplug other devices. The atomic_check() should fail
> if we don't have enough resources (which includes slots).
> 
Currently, I haven't found other drivers checking available slots during 
mode_valid(). Intel will check the PBN in here. This condition can help 
us in the following case:

Assume two downstream devices both support 4K 60Hz 10-bit. In MST mode, 
when the first device occupies the 4Kx60Hzx10bit mode, the remaining 
bandwidth is insufficient to support the same mode for the second device.

If we check the slots in mode_valid(), the second device will reject the 
4Kx60Hzx10bit mode but accept 4Kx30Hzx10bit. However, if the check is 
done in atomic_check(), the second device will display a black screen 
(because 4Kx60Hzx10bit is considered valid in mode_valid() but failed in 
atomic_check()).
>> +
>> +	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
>> +}
>> +
> 

