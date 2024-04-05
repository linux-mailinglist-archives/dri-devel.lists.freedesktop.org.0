Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB1D89A118
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D3810EB20;
	Fri,  5 Apr 2024 15:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Hg2KElQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1B010EB20
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 15:29:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 435EtSA8004968; Fri, 5 Apr 2024 15:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=XWLbok1JGXwyONtMGiH9Y4A89YnwGf1CyiXHkZxhqc4=; b=Hg
 2KElQ/exxh3B8yANvB+goY0FMjdGWLn1qI46xunUQYVftrTRVz8c2BzywN97efvJ
 TnttZTQMX1YjYAE5Mz2DiyqlX5RmQaCSkoUbnxnqiSl2XngS/oON3lhYLNe7p4nj
 ejd8RRajQ0oIeBwDCTJ6PKICO1TyNq+bIViEifSISC8aaHu7Qj2uo13polazaZsD
 d0AigFu6DYMsrDnP4XCyP1cfe6GyQdCyLVcg3ERYzcMsk9NWPHpwVPX3+0mCIppe
 36ufIx8Oh+iC7phikPoAbGg9Z1D9wMTnEFdsl97kNO+r+LCHMzf1LleSWrSnHLIW
 f4e4GZ0NWXJ04hJYZThQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xahgt0dg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Apr 2024 15:29:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435FTON3001401
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 Apr 2024 15:29:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 08:29:23 -0700
Message-ID: <1f579682-945e-2515-f303-349c6e8f38b0@quicinc.com>
Date: Fri, 5 Apr 2024 09:29:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 8/8] accel/ivpu: Fix deadlock in context_xa
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <stable@vger.kernel.org>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
 <20240402104929.941186-9-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240402104929.941186-9-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: q9gm0_yqXkx7rrLVRIUgen_TF_ODT1Gw
X-Proofpoint-ORIG-GUID: q9gm0_yqXkx7rrLVRIUgen_TF_ODT1Gw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_16,2024-04-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=899 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050111
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

On 4/2/2024 4:49 AM, Jacek Lawrynowicz wrote:
> ivpu_device->context_xa is locked both in kernel thread and IRQ context.
> It requires XA_FLAGS_LOCK_IRQ flag to be passed during initialization
> otherwise the lock could be acquired from a thread and interrupted by
> an IRQ that locks it for the second time causing the deadlock.
> 
> This deadlock was reported by lockdep and observed in internal tests.
> 
> Fixes: 35b137630f08 ("accel/ivpu: Introduce a new DRM driver for Intel VPU")
> Cc: <stable@vger.kernel.org> # v6.3+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
