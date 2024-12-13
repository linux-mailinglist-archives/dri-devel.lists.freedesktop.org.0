Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E09F1168
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 16:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDE810F064;
	Fri, 13 Dec 2024 15:53:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KcNlLmJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0BE10F064
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 15:53:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDEWlVt018037;
 Fri, 13 Dec 2024 15:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SgjwQ7TG8LiWgOhs16k2pg+Fg31HlunXa6a41Lz2QU8=; b=KcNlLmJSU1ytvN9J
 dQjWreE11M9sCgkRufGnnlSFw8OS5W4L+56cmodmgERHZZtaW3zcf2eISb5W08fg
 6kAHR9lZCXeJV0yyrUX1oEO+Z4hVPnpEhPpj4fIJToRZin590KHut0U+ZDedPy1N
 wFMLPILYs0uqfRxVvKWvaXr3G4ywV/13cDenZlqdUFooTb8cMUpNzA0azrhz3dRA
 70yehG54AqphKBtu5z9tSYK7Sfqs22n6XxhDUPi6rd+WJWbEMerDXImUNlAkxdZe
 4SStYej/5gdR9VybdOrUf3SqX3TJeozxTgwBBhRSKAxe4FScOI1+9dCK6ZqCc4WT
 cPA9Ig==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gdkn1trf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 15:53:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDFr7OB030760
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 15:53:07 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 07:53:06 -0800
Message-ID: <fd121014-e8b4-794c-52f8-de5488fd441e@quicinc.com>
Date: Fri, 13 Dec 2024 08:53:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/3] accel/ivpu: Fix memory leak in
 ivpu_mmu_reserved_context_init()
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, Karol Wachowski <karol.wachowski@intel.com>
References: <20241210130939.1575610-1-jacek.lawrynowicz@linux.intel.com>
 <20241210130939.1575610-3-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241210130939.1575610-3-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 0XzxBskxwO8MA8VNJhdd4Epl_69T5g3D
X-Proofpoint-ORIG-GUID: 0XzxBskxwO8MA8VNJhdd4Epl_69T5g3D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=773
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130113
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

On 12/10/2024 6:09 AM, Jacek Lawrynowicz wrote:
> Add appropriate error handling to ensure all allocated resources are
> released upon encountering an error.
> 
> Fixes: a74f4d991352 ("accel/ivpu: Defer MMU root page table allocation")
> Cc: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Karol Wachowski <karol.wachowski@intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
