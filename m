Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5ACA55529
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22D610EA6B;
	Thu,  6 Mar 2025 18:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="XcIVfx/5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217CC10EA6B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 18:38:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 526BJgtQ005509;
 Thu, 6 Mar 2025 18:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 f+wIOxyulSbPfiowyGsy88XuPVPe/C3pRYyGf+R5mO4=; b=XcIVfx/5exVjWQoh
 Otf0NSVhylhYqQrY2LlIT7ueZ3Yl1jR/Fn2Ivk2ie/gMjNM9trJGHxFUq7fAJjyv
 udDIoQ+4BGNkL5oMCsV+0j5A9yKBH/4w88i11fj+N0M3qZr7l9HER1pAYbum60wl
 lpDADpO4BPa01lOQ7xdQ9nxphNrMbUfDpKmOHVSy9UtjYDf4sglXMZBHS5tA62EL
 zgga+XEkZofuPz2jq24deAlc7tHv4nDiKXIJlGJvMslKt8iV4JuR5zQfLPtHKUe8
 o/+7TxplSywHIJUfqQ4s1HBlg7GJtyiMShY1ulz2hZoVvl6ux77SNP3WP+0bSchx
 pcxANw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4571sdatu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Mar 2025 18:38:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526IcINw024623
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Mar 2025 18:38:18 GMT
Received: from [10.38.240.217] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 10:38:16 -0800
Message-ID: <019fee03-f608-4e1e-bcf9-eeeeae1940c9@quicinc.com>
Date: Thu, 6 Mar 2025 13:37:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix possible data corruption in BOs > 2G
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Troy Hanson <quic_thanson@quicinc.com>
In-Reply-To: <20250306171959.853466-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: koZKn34o5hE0dmv2YdWhIySmn2A2ez1d
X-Authority-Analysis: v=2.4 cv=W6PCVQWk c=1 sm=1 tr=0 ts=67c9eb9a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=jm2NUAHTRls9H0omj-oA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: koZKn34o5hE0dmv2YdWhIySmn2A2ez1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_06,2025-03-06_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060142
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



On 3/6/25 12:19 PM, Jeff Hugo wrote:
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

Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>

