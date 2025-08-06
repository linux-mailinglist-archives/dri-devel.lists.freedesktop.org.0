Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640BB1C35C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF85510E743;
	Wed,  6 Aug 2025 09:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Hbf31e5q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0BC610E73C;
 Wed,  6 Aug 2025 09:30:20 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766LNdO010353;
 Wed, 6 Aug 2025 09:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nhlzl9xJTaja9TjhpOytlAtNv+97XEVdOQl6HdQYUas=; b=Hbf31e5q2B1+198f
 /EwhM38g4etaVun6v3/P0Zy787m6xG4Fz9HUtYuxu66M7ygUO8rWuqlVW66xCTlh
 5kETO+HnKFSz0BPe4m+H3Fg67LAt47NeKVsMhmmEEluh4uuR68saowsf+JsMTz51
 a0DRGPqvxnT2YoVXliCdkUh/pt9xKZNw4yReiTEwtWD7MLwNapSUbc/5bTIEiu1e
 Fg4nmbESJ6kT4Rnvo7gSJd/KdmnHQDLBOPaC3Cu/+DmorLktnRDKNnxWmyH1rwm8
 y0G/uExfxRGqiNFs06gjjY9eM5Sz/qbqsP5Db3NHrkkbguQBeq2XfTwThC4E7YDH
 sMXAMQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy7t6qg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Aug 2025 09:30:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5769UFt2020110
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Aug 2025 09:30:15 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 6 Aug
 2025 02:30:11 -0700
Message-ID: <6272a053-7499-454a-aa64-820e7a2a3a78@quicinc.com>
Date: Wed, 6 Aug 2025 17:30:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/38] drm/msm/dp: re-arrange dp_display_disable() into
 functional parts
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
 <20250609-msm-dp-mst-v2-4-a54d8902a23d@quicinc.com>
 <ikvsacoatahnmjff4c762cpq6lvmr6cavlbjw6z7oyrvuno5hp@mykq3ts2hhbw>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <ikvsacoatahnmjff4c762cpq6lvmr6cavlbjw6z7oyrvuno5hp@mykq3ts2hhbw>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Mftsu4/f c=1 sm=1 tr=0 ts=689320a8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=fKRfGShLRux2cQhKBnAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6QUst3N_yEtk5f4XynE9Jk9QbfktMR9O
X-Proofpoint-GUID: 6QUst3N_yEtk5f4XynE9Jk9QbfktMR9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX74INzkJMykrh
 xiuVs09VjyV2YXdvE64bzG0rB51TXarWNqFWuMQVHbogReco3fgfmeBHQHGVPQ5KcFILAbFgIQt
 6M30Z95ztLE6gSMi7X8HXb+OAJQfhvbqbVE7d+tw8wnTMcNk30EmHOXnOFZ0ksKZlD/i9NStQxS
 2p8Yal64IWCcabfYrcBm1kCSYs+5m16m2IIfZvhV1tN73HhF+QnALn/Tht7uQW/Ji8xk5yDCYzg
 X8iIDG6vA9MXgPHc4eUFz4n4GE2n7uZ96iGMPx+37dA6ofg9fudAhPL1VbD0ChOIAQhMSraOI3/
 c/FMQl0lHRyaI/ZaQLFuaTMoLoeq93jHAHQXkgjJSRtVOXXeWSa7FFvZKHWjanlJJWpGD20gS2T
 A97MAXEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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



On 2025/6/9 21:05, Dmitry Baryshkov wrote:
> On Mon, Jun 09, 2025 at 08:21:23PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> dp_display_disable() handles special case of when monitor is
>> disconnected from the dongle while the dongle stays connected
>> thereby needing a separate function dp_ctrl_off_link_stream()
>> for this. However with a slight rework this can still be handled
>> by keeping common paths same for regular and special case.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 29 +++++++++++++++--------------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>>   drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++++---------
>>   3 files changed, 26 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 1e13ca81b0155a37a4ed7a2e83c918293d703a37..1ce3cca121d0c56b493e282c76eb9202371564cf 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -2081,30 +2081,31 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>>   	return ret;
>>   }
>>   
>> -void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl)
>> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl)
>>   {
>>   	struct msm_dp_ctrl_private *ctrl;
>> -	struct phy *phy;
>>   
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> -	phy = ctrl->phy;
>> -
>>   	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
>> +}
>>   
>> -	/* set dongle to D3 (power off) mode */
>> -	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>> +void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl)
> 
> I'm not a fan of (almost) one-line wrappers.
> after reabse to latest code. Here can remove wrappers..

>> +{
>> +	struct msm_dp_ctrl_private *ctrl;
>>   
>> -	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>   
>> -	if (ctrl->stream_clks_on) {
>> -		clk_disable_unprepare(ctrl->pixel_clk);
>> -		ctrl->stream_clks_on = false;
>> -	}
>> +	/* set dongle to D3 (power off) mode */
>> +	msm_dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>> +}
>>   
>> -	dev_pm_opp_set_rate(ctrl->dev, 0);
>> -	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>> +void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl)
>> +{
>> +	struct msm_dp_ctrl_private *ctrl;
>> +	struct phy *phy;
>>   
>> -	phy_power_off(phy);
>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> +	phy = ctrl->phy;
>>   
>>   	/* aux channel down, reinit phy */
>>   	phy_exit(phy);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 42745c912adbad7221c78f5cecefa730bfda1e75..edbe5766db74c4e4179141d895f9cb85e514f29b 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -20,7 +20,6 @@ struct phy;
>>   int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
>>   int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>> -void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
>> @@ -42,4 +41,8 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl);
>>   int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
>>   void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
>>   
>> +void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl);
>> +void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
>> +void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>> +
>>   #endif /* _DP_CTRL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 5ac5dcf35b789f2bda052a2c17aae20aa48d8e18..a5ca498cb970d0c6a4095b0b7fc6269c2dc3ad31 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -925,17 +925,15 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>>   	if (!msm_dp_display->power_on)
>>   		return 0;
>>   
>> +	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl);
>> +
>> +	/* dongle is still connected but sinks are disconnected */
>>   	if (dp->link->sink_count == 0) {
>> -		/*
>> -		 * irq_hpd with sink_count = 0
>> -		 * hdmi unplugged out of dongle
>> -		 */
>> -		msm_dp_ctrl_off_link_stream(dp->ctrl);
>> +		msm_dp_ctrl_psm_config(dp->ctrl);
>> +		msm_dp_ctrl_off(dp->ctrl);
>> +		/* re-init the PHY so that we can listen to Dongle disconnect */
>> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
>>   	} else {
>> -		/*
>> -		 * unplugged interrupt
>> -		 * dongle unplugged out of DUT
>> -		 */
>>   		msm_dp_ctrl_off(dp->ctrl);
>>   		msm_dp_display_host_phy_exit(dp);
>>   	}
>>
>> -- 
>> 2.34.1
>>
> 

