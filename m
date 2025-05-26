Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E0AC3F54
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 14:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C8210E30D;
	Mon, 26 May 2025 12:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="esVvCT1S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1810A10E2FB;
 Mon, 26 May 2025 12:27:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q8dLu8002986;
 Mon, 26 May 2025 12:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Cx6XOn2PoFhzZ/6d8Eju1VmGVG5xuLEUSViIIS/j7Sw=; b=esVvCT1SOootMzHc
 +GkM2j0WSF8nAgdbCflLAcPhG0um4Bu6/FA90d+bywIe9qJZ24ybzUgLdifOCNJb
 JTunxW5iaqJgcgwSNhVKTlzokz9i9H9qTkfXzPgD6iyYf2QWHZOuo5wXCjlOxSHs
 lZ6wK+xh59vZ1zFFdpYhETVnSVzZGsxnO8vvb8qzt7Wue92yt0pVFRo9pKpmcaMt
 L8PkaG1jOsbkuL+tpJ3RnEo3WogNdxbfWzHDVrLw6UAnS9wSo/IxI88M9M8NigG0
 0cq1zYE6FP0/WMJRR062pdBnpCjPr2A3lBqKJVJjeoHkZn9AhlFvcqQAZGCNzfnU
 uGf3Ow==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmyugjey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 May 2025 12:26:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54QCQvYm002042
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 May 2025 12:26:57 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 26 May
 2025 05:26:50 -0700
Message-ID: <df3807e5-c381-4440-be64-9bd49a2ecd9d@quicinc.com>
Date: Mon, 26 May 2025 20:26:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/45] drm/msm/dp: add a helper to read mst caps for
 dp_panel
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
 <20241205-dp_mst-v1-5-f8618d42a99a@quicinc.com>
 <aksnudxy2oyojjzwm73i4mulftcxccdsnddcdamypmscn6skpq@ijtp7x76m3pt>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <aksnudxy2oyojjzwm73i4mulftcxccdsnddcdamypmscn6skpq@ijtp7x76m3pt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEwNSBTYWx0ZWRfX/FIVSfANFpKM
 TbLw24WJE/GtaexIp1kafrznpEDG8pRDs7YHXmtlRy1blgavVxP9ZrhTI/3PGRa58Dcn/NJRKeO
 IH+0cSmmxXkH3ktp07WdBFzwD1jjvwnkTdxw/Ynh/nDhSBxj1dkG2bksXzOTqPZlEvP8B0eOmEC
 htEHaPvb6Mi+A5W8DMRKDfpauHZZp5H7ToG6Gegjh7DmyGFWpyn1mXvCfQm9f6hiTBVhm+ZZAVq
 KZBs9E+cTNKbUaD5PEmGVLcbJk/t/iLZYQDCXg3rLt503eg4YSI8e1v0w3Y0gMtWopER0D4BdT9
 rSKAHjD6tyaHNXKQZQaizbSf1J9TqZfgSbqIZCW891qfiLQyLnRcIZEJbU5jF3DIJU0NcSoqsfi
 3PpV68qlapg7ptUuGMcThsVReWmiEioGN229ViB1Gy1Lt+5YArmSKwO12etUlgDluR2PQxeG
X-Authority-Analysis: v=2.4 cv=MsdS63ae c=1 sm=1 tr=0 ts=68345e12 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=BYOfdb0HyH0VPR54-rAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: q9peK1PaMGx0hbNCpzFdIcaJELhBfI3W
X-Proofpoint-ORIG-GUID: q9peK1PaMGx0hbNCpzFdIcaJELhBfI3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_06,2025-05-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260105
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



On 2024/12/6 16:52, Dmitry Baryshkov wrote:
> On Thu, Dec 05, 2024 at 08:31:36PM -0800, Abhinav Kumar wrote:
>> Add a helper to check whether a dp_panel is mst capable.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_aux.h   |  1 +
>>   drivers/gpu/drm/msm/dp/dp_panel.c | 14 ++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_panel.h |  1 +
>>   3 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
>> index 39c5b4c8596ab28d822493a6b4d479f5f786cdee..cb97a73cdd6ea74b612053bec578247a42214f23 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include "dp_catalog.h"
>>   #include <drm/display/drm_dp_helper.h>
>> +#include <drm/display/drm_dp_mst_helper.h>
>>   
>>   int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
>>   void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index d277e9b2cbc03688976b6aa481ee724b186bab51..172de804dec445cb08ad8e3f058407f483cd6684 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -108,6 +108,20 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
>>   	return min_supported_bpp;
>>   }
>>   
>> +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *msm_dp_panel)
>> +{
>> +	struct msm_dp_panel_private *panel;
>> +
>> +	if (!msm_dp_panel) {
>> +		DRM_ERROR("invalid input\n");
>> +		return 0;
>> +	}
>> +
>> +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
>> +
>> +	return drm_dp_read_mst_cap(panel->aux, msm_dp_panel->dpcd);
> 
> So, it's a one-line wrapper. Do we actually need it?
It beacuse the point of aux is in msm_dp_panel_private, so if we want to 
call drm_dp_read_mst_cap in other file, we need this wrapper.
> 
>> +}
>> +
>>   int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
>>   				struct drm_connector *connector)
>>   {
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index 7a38655c443af597c84fb78c6702b2a3ef9822ed..363b416e4cbe290f9c0e6171d6c0c5170f9fea62 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -67,6 +67,7 @@ int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
>>   		struct drm_connector *connector);
>>   void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
>>   void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
>> +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *dp_panel);
>>   
>>   /**
>>    * is_link_rate_valid() - validates the link rate
>>
>> -- 
>> 2.34.1
>>
> 

