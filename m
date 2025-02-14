Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546ACA3651C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3DF10E05B;
	Fri, 14 Feb 2025 17:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KJKbUgu/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D7710E05B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:59:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E9pKpC002169;
 Fri, 14 Feb 2025 17:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 95Oz7J2UXbcHNAMPL8PmAOz71f7kFynJFDvPVgbxI8w=; b=KJKbUgu/0Ax0pMqe
 sxYStn/kCyCxgHcAqSFAhsJYRN13/UEfEKB7oj8/nCwBn4pnQXtfT0IkvvpmjAF8
 HKpVsjHO2xkalmop7Gk4PCPf4Sf0qlsoTiUtH0Itp3wxVH+6Kk/S+O63kysi4XOY
 MxcQ4OCMR3nwk7YL24/03Cbd4TBqWX2lQtkfFl8cZ8EiaJPGcNlpmarPyPqoCP1Q
 vtJN68LqXJGunMQHT/DtWXZRb2f/ztUwOAv+5dnjFjl1OK7vqvj7RzHkaWwo2lKt
 uGDMxZjORU8faUEdOvBHC9BRNRhXKUQ7vR7MFMlBbsyDcBPNhBnVt8SGmEAaADT5
 6L9hIQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s5w4dre9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 17:59:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51EHxdnZ017214
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 17:59:39 GMT
Received: from [10.110.113.56] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 09:59:39 -0800
Message-ID: <b50c604c-806c-4a8f-a21f-a592479c2671@quicinc.com>
Date: Fri, 14 Feb 2025 09:59:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <manivannan.sadhasivam@linaro.org>, 
 <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
 <quic_thanson@quicinc.com>, <dan.carpenter@linaro.org>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <mhi@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
References: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
From: Carl Vanderlip <quic_carlv@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: m9NbBbHR6vnSIqCR4FhYkiTAz1H86mV0
X-Proofpoint-ORIG-GUID: m9NbBbHR6vnSIqCR4FhYkiTAz1H86mV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140124
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


On 2/14/2025 8:21 AM, Jeffrey Hugo wrote:
> If mhi_fw_load_handler() bails out early because the EE is not capable
> of loading firmware, we may reference fw_load_type in cleanup which is
> uninitialized at this point. The cleanup code checks fw_load_type as a
> proxy for knowing if fbc_image was allocated and needs to be freed, but
> we can directly test for that. This avoids the possible uninitialized
> access and appears to be clearer code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
> Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
