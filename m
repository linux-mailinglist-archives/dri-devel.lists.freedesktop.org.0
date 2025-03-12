Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB48A5D9D2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70FB10E73C;
	Wed, 12 Mar 2025 09:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bzOsvmh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1935E10E098;
 Wed, 12 Mar 2025 09:48:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BMHEeI023453;
 Wed, 12 Mar 2025 09:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NX2y5PH7HHchSP6DInXoXFhLZo5b/x0gIOdI+IPKbg8=; b=bzOsvmh82eQ0eGbZ
 bUdlIB3chv139IJn7Fm1/ThVFi460GvhJjpbzLppglz4WGer189gp4YjtgNV4zPN
 /GniT5k3yDQ53B7a8p9ny1wmHg2Qi1ImQ3t/cFBAJl6lGNAIvzL7AT/qpfrq3Zbs
 9trHjfwtkUdvhYbHjgWe5vfA8R5hMYYvgQk/GuxFYJDg4IAsJ7b06V4hf++lyG9g
 Fxn//XUFIO3AAxJxjCpd1r36L2wLpYnvuCW8FqpVWz3yZEZawUGHZnpqspeh8A1V
 s1r4LsqCwocDoaTQFGmxahHRO1f0qSNqB46TsSdoBcyAXfslSegaOH3x8j/xq3Jd
 PJMgSw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2mhwj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Mar 2025 09:47:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52C9lnUR007936
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Mar 2025 09:47:49 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 02:47:41 -0700
Message-ID: <da9f80e6-bb4e-4568-aa2c-d70383b12e3a@quicinc.com>
Date: Wed, 12 Mar 2025 15:17:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
To: Dmitry Baryshkov <lumag@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <andersson@kernel.org>,
 <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
 <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-10-quic_amakhija@quicinc.com>
 <6gdd6p3ca6w2gb2nbl6ydw4j7y2j5eflelbwntpc6ljztjuwzt@dqwafrtod5m5>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <6gdd6p3ca6w2gb2nbl6ydw4j7y2j5eflelbwntpc6ljztjuwzt@dqwafrtod5m5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: OCaLLDkZyziQl88JwuTVA-GTB1nk4AQ5
X-Authority-Analysis: v=2.4 cv=aKnwqa9m c=1 sm=1 tr=0 ts=67d15845 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8
 a=oL8KTtbDxmmEcXVMUPcA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OCaLLDkZyziQl88JwuTVA-GTB1nk4AQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120067
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

On 3/11/2025 9:11 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 11, 2025 at 05:54:44PM +0530, Ayushi Makhija wrote:
>> The anx7625_link_bridge() checks if a device is not a panel
>> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
>> the bridge operations. However, on port 1 of the anx7625
>> bridge, any device added is always treated as a panel
>> bridge, preventing connector_detect function from being
>> called. To resolve this, instead of just checking if it is a
>> panel bridge, verify the type of panel bridge
>> whether it is a DisplayPort or eDP panel. If the panel
>> bridge is not of the eDP type, add DRM_BRIDGE_OP_HPD and
>> DRM_BRIDGE_OP_DETECT to the bridge operations.
> 
> Are/were there any devices using anx7625, eDP panel _and_ not using the
> AUX bus? It would be better to use the precence of the 'aux' node to
> determine whether it is an eDP or a DP configuration.
> 
>>
>> In the anx7625_sink_detect(), the device is checked to see
>> if it is a panel bridge, and it always sends a "connected"
>> status to the connector. When adding the DP port on port 1 of the
>> anx7625, it incorrectly treats it as a panel bridge and sends an
>> always "connected" status. Instead of checking the status on the
>> panel bridge, it's better to check the hpd_status for connectors
>> like DisplayPort. This way, it verifies the hpd_status variable
>> before sending the status to the connector.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
>> index 764da1c1dc11..ad99ad19653f 100644
>> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
>> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
>> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>>  
>>  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>>  
>> -	if (ctx->pdata.panel_bridge)
>> -		return connector_status_connected;
>> -
>>  	return ctx->hpd_status ? connector_status_connected :
>>  				     connector_status_disconnected;
>>  }
>> @@ -2608,9 +2605,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
>>  	platform->bridge.of_node = dev->of_node;
>>  	if (!anx7625_of_panel_on_aux_bus(dev))
>>  		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
>> -	if (!platform->pdata.panel_bridge)
>> -		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
>> -					DRM_BRIDGE_OP_DETECT;
>> +	if (!platform->pdata.panel_bridge ||
>> +	    platform->pdata.panel_bridge->type != DRM_MODE_CONNECTOR_eDP) {
>> +		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
>> +	}

Hi Dmitry,

Thanks, for the review.

Yes, it is better to check the presence of the 'aux' node for eDP or DP configuration.
Will change it in next patch.

-	if (!platform->pdata.panel_bridge)
-		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
-					DRM_BRIDGE_OP_DETECT;
+	if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev)) {
+		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
+	}

Thanks,
Ayushi
