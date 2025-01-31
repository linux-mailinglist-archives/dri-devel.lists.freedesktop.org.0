Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03B9A242E1
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 19:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35BE10E1AC;
	Fri, 31 Jan 2025 18:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="isRhMy0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE5510E1AC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 18:43:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VDLc7o007647;
 Fri, 31 Jan 2025 18:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 v8sqc3LkrV9Bte2Dvx/LzGBDbHOMtl5m6IyujNBGK2M=; b=isRhMy0gR5bkKK3c
 45fiVD1FDuUsGnACdYz+D5KzC04eLaBzAjh0Wpw7fUgWYT4SWtHSkMhi6qcn2aVN
 f+OE2vaIBUOKAsloA1ip6X6vsfqqvRYfvDboc7DkBTK39nPmXUyOsb7m4IS4SA5g
 mXxvrZfJ18xEh2gEpN7ky+GD87OhhT1x3rY9HVb33gbtKCBRSBJJoeG6FzxbAQw0
 Mek6XIlTINyn8vGZYi0gYB5zeXmlSDyiUBVH9q+t/Pt7MretTFPXcBv0TPjLZTEZ
 1ThppLdse9AUjdWLybHbgwKHhyFgBrBtZ9DTFgvShMf/B4QkzgwVFdcBFax9uH2n
 J/hqjg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gyaqrrkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 18:43:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50VIhNGd007909
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 18:43:23 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 Jan
 2025 10:43:23 -0800
Message-ID: <e791fe3d-1fa1-a6ff-fa27-5d0030f6d06a@quicinc.com>
Date: Fri, 31 Jan 2025 11:43:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/6] accel/ivpu: Update last_busy in IRQ handler
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <maciej.falkowski@linux.intel.com>, Karol
 Wachowski <karol.wachowski@intel.com>
References: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
 <20250129125636.1047413-3-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250129125636.1047413-3-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: B8rh-Of0i0CwlWbTGkXSkY4v3BodI7Zf
X-Proofpoint-GUID: B8rh-Of0i0CwlWbTGkXSkY4v3BodI7Zf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxlogscore=711
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310140
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

On 1/29/2025 5:56 AM, Jacek Lawrynowicz wrote:
> Call pm_runtime_mark_last_busy() in top half of IRQ handler to prevent
> device from being runtime suspended before bottom half is executed on
> a workqueue.
> 
> Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
