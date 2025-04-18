Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC27A9399C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6959410E219;
	Fri, 18 Apr 2025 15:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ACYhsWIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5B510E219
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:28:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2g9EV014784;
 Fri, 18 Apr 2025 15:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7q3NZYm/y/kmIzfJ+BWVhXq7DYINCCPsGZUSKpcwx7M=; b=ACYhsWIH5dao7eGx
 DJMEpFtJtHf1Xme+Hkl6CZaDSWEtS4XMdy/AlTuujsJF985/2grZBcVgV4iWOsB5
 1Dj4hJ39meXz/bx4NBeByJjyH9Y/HzrTFvKkutbSyaR2HY67vwn5vNNnDqX3C56Z
 NI4p/xt5IoPOwJgVmrQ0beWRi5OPK/NRB/sbX6edeT1CxUfcDE007YnVwVlP2/C7
 VR2sI1P44IuENhQ3NQkeZK5QfoPXKMjt6Lgvjqy4LySrMkEYPkpgvI54wh095oxJ
 6LfvbUFP3p51RNDMdE8mmRw95QQMuzbNbqWPuzWXFO6hyRBx2uZAiLr5L657bQUC
 ra87vg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6tcv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Apr 2025 15:27:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53IFRuKI007425
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Apr 2025 15:27:56 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Apr
 2025 08:27:55 -0700
Message-ID: <c6b4aaad-aa5f-4f46-948f-de150dfc60fe@quicinc.com>
Date: Fri, 18 Apr 2025 09:27:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Implement heartbeat-based TDR mechanism
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jacek.lawrynowicz@linux.intel.com>,
 <lizhi.hou@amd.com>, Karol Wachowski <karol.wachowski@intel.com>
References: <20250416102555.384526-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250416102555.384526-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: rnPQTzd6StFzADzeAaZLj0zC0F6E1b6r
X-Proofpoint-GUID: rnPQTzd6StFzADzeAaZLj0zC0F6E1b6r
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68026f7d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8
 a=IRmo4Fqx3i6jFQ_zk6YA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=637 suspectscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180114
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

On 4/16/2025 4:25 AM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Introduce a heartbeat-based Timeout Detection and Recovery (TDR) mechanism.
> The enhancement aims to improve the reliability of device hang detection by
> monitoring heartbeat updates.
> 
> Each progressing inference will update heartbeat counter allowing driver to
> monitor its progression. Limit maximum number of reschedules when heartbeat
> indicates progression to 30.

Code looks good.  However, why 30?  This would artificially limit how 
long a job could run, no?

-Jeff
