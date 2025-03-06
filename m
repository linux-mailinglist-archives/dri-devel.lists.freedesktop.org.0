Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EC3A55537
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B740310EA6D;
	Thu,  6 Mar 2025 18:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dz5YVN7+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C1910EA6D
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 18:41:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526IPgN0020243;
 Thu, 6 Mar 2025 18:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gGvb+cLgwAMNdv6S9CL4FzRoeKB/SVHph7VfgeFWJKk=; b=dz5YVN7+rPeGna99
 RrxUkGI+liPi0FpJ4HFDrev+r8D/EY/tTFSwoCwN67daZtnutCrGMFcSNLjGd1ZU
 NkdjWs+Kxz0sfF4V5U29wZ6cCoHPsuDW0eJ94H6TRlfArVtjLk/MXzkItI/hB8IZ
 UzQ0sxtJU1VDUT5gQ2Egse5bkpv1rW7uepx0QxgTg8d0DUiSI7tEpgcmKQCztvEi
 j1aESvrUz6+FTLTI1lszqihwQZb6OGwAfBR8TlQa+jYNrCFEPBSem7JKY2ck7KhZ
 7kNvID51ABVPAj0Y9lJiugo7Lidw6nX4AcwU2lMs/hTEjiQL8YJV/NZkniscfp0Y
 svH7uQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456xcuk9je-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Mar 2025 18:41:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526IfWPB030258
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Mar 2025 18:41:32 GMT
Received: from [10.232.155.112] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 10:41:30 -0800
Message-ID: <47ca5351-c51a-4649-b33e-6e005bc7ac50@quicinc.com>
Date: Thu, 6 Mar 2025 18:41:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix possible data corruption in BOs > 2G
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
 <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Youssef Samir <quic_yabdulra@quicinc.com>
In-Reply-To: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JgAzlb-JlROBxHJBYPEkJ4vrYDsd0uSb
X-Proofpoint-GUID: JgAzlb-JlROBxHJBYPEkJ4vrYDsd0uSb
X-Authority-Analysis: v=2.4 cv=eeXHf6EH c=1 sm=1 tr=0 ts=67c9ec5d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=jm2NUAHTRls9H0omj-oA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060141
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



On 3/6/2025 5:19 PM, Jeff Hugo wrote:
> From: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> When slicing a BO, we need to iterate through the BO's sgt to find the
> right pieces to construct the slice. Some of the data types chosen for
> this process are incorrectly too small, and can overflow. This can
> result in the incorrect slice construction, which can lead to data
> corruption in workload execution.
> 
> The device can only handle 32-bit sized transfers, and the scatterlist
> struct only supports 32-bit buffer sizes, so our upper limit for an
> individual transfer is an unsigned int. Using an int is incorrect due to
> the reservation of the sign bit. Upgrade the length of a scatterlist
> entry and the offsets into a scatterlist entry to unsigned int for a
> correct representation.
> 
> While each transfer may be limited to 32-bits, the overall BO may exceed
> that size. For counting the total length of the BO, we need a type that
> can represent the largest allocation possible on the system. That is the
> definition of size_t, so use it.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Reviewed-by: Youssef Samir <quic_yabdulra@quicinc.com>

