Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE5CB25E83
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 10:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C92210E28E;
	Thu, 14 Aug 2025 08:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TCoGRjBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB45510E214;
 Thu, 14 Aug 2025 08:14:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DLvfum002766;
 Thu, 14 Aug 2025 08:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uJLHSyRwMcxEA2wz9A/E2nc3nbXUEmdM0eGNEHTw7Xo=; b=TCoGRjBNi2UBJGKv
 uxMEEGYQI32/BcfYSPbYpJ+5OygxU0EzVKDLgzZQ2RJKxTD4QsUCVHhfsXPCth5t
 vVgf3Db1sqZTioI42RpvQfTrpL77aooON5OG9AsoizKX6z9GMvQ1kfbZg6pgj3u1
 zEGRCRFpqFyQzvdYj/TfkXB9NTN32o0+GYUG5dqfbaig7U9bArdSPmmzwhHkFOTb
 6QWFL7K/hJSQ8NPmWIKlt/h/JC0aXyWwLj39AsHlmCJHhdUTC4/CSWy1oSxiEMGe
 KTYl2BEDr01rKGuuCckOIFyJaGHfaB4dKQXLr+sszdk7f/sBO2WwhO/z6SaO2sTw
 pYDclg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv6wvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 08:14:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57E8El48031319
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Aug 2025 08:14:47 GMT
Received: from [10.133.33.43] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 01:14:43 -0700
Message-ID: <c532bb78-dca8-4922-9d8e-ae1346f73eee@quicinc.com>
Date: Thu, 14 Aug 2025 16:14:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
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
 <20250609-msm-dp-mst-v2-3-a54d8902a23d@quicinc.com>
 <gwib6zcvkxsxcz222cno5jbvsnt2abdoqfnymlxq7e6c6wdfvn@nlplodnco2sw>
 <48c61bce-21e6-488a-b976-da53004b6226@quicinc.com>
 <ftlaxwogzz72rg4plguaet4wi64pmdfmd62qve4xffamxq4fsu@ytd4edwv6ixm>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <ftlaxwogzz72rg4plguaet4wi64pmdfmd62qve4xffamxq4fsu@ytd4edwv6ixm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689d9af8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=SWdLHOgqrEU_Pm2j9X4A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aMQ9PDp31Enln-e_mZqrOB1z5pJMtIoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXyVyhGECUQbQr
 nXnoa7aSs7bmwFGIcBfkp11zTn+lX4e13KOnDyJ45w1dQ+/NtqwV8sKPaipll1xz40evMKDNs++
 f2nr69Qjy+2Hu2+7NXTV6KJxg2sMCl+3eCNRWv1yoEcJ7x05jRztRhmiBMSZaFmgmr3tcpEdzAk
 PQFVzpvgx9NfppDp2/PQYzZ9JGMZOsvA6zZ/vbzGXDTdh7yuVwSONBxMIR7nXeeNAjnB0350Ss7
 gMPv9vUDbxR5Q/0nxBFGSGUfGsPhOA4Y+Tk01lRdcQGDZA+ksjO8rctxo/qsmx9u36EgaLOqNh8
 bNYuedA9m5Jg3306rAx6zALXvzoptBxeYqz344Ewuu2l2fnlm2fxryAGtFAI0nEdcXmEtWG2nqU
 jr3PGbZz
X-Proofpoint-GUID: aMQ9PDp31Enln-e_mZqrOB1z5pJMtIoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
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



On 2025/8/13 20:59, Dmitry Baryshkov wrote:
> On Wed, Aug 13, 2025 at 05:36:10PM +0800, Yongxing Mou wrote:
>>
>>
>> On 2025/6/9 20:59, Dmitry Baryshkov wrote:
>>> On Mon, Jun 09, 2025 at 08:21:22PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> dp_display_enable() currently re-trains the link if needed
>>>> and then enables the pixel clock, programs the controller to
>>>> start sending the pixel stream. Splite these two parts into
>>>> prepare/enable APIs, to support MST bridges_enable inserte
>>>
>>> typos
>>>
>>>> the MST payloads funcs between enable stream_clks and programe
>>>> register.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 57 +++++++++++++--------
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 +-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 99 +++++++++++++++++++++++++++----------
>>>>    drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>    4 files changed, 111 insertions(+), 49 deletions(-)
>>>>
> 
>>>> @@ -831,7 +831,37 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>>>>    	return 0;
>>>>    }
>>>> -static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
>>>> +static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>>>> +{
>>>> +	int rc = 0;
>>>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>>> +	bool force_link_train = false;
>>>> +
>>>> +	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>>>> +	if (msm_dp_display->prepared) {
>>>> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
>>>> +		return 0;
>>>> +	}
>>>
>>> How can it be prepared here? It is called at the beginning of the
>>> .atomic_enable() only, so there is no way this can be true.
>>>
>> Emm, sorry for forget this case.. Whern MST enabled,
>> msm_dp_display_prepare() will be called from mst_bridge_atomic_pre_enable,
>> that means, when second stream called this func, it already prepared, so we
>> should skip here. so this condition will really hit in MST case..
> 
> Then it should be refcounted. And, ideally, this should come later as a
> part of one of MST-enablement patches, when it actually makes sense
> 
Okay. I will move this part to appropriate patch.
>>>> +
>>>> +	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
>>>> +	if (rc) {
>>>> +		DRM_ERROR("failed to pm_runtime_resume\n");
>>>> +		return rc;
>>>> +	}
>>>> +
>>>> +	if (dp->hpd_state == ST_CONNECTED && !msm_dp_display->power_on) {
>>>> +		msm_dp_display_host_phy_init(dp);
>>>> +		force_link_train = true;
>>>> +	}
>>>> +
> 

