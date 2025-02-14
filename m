Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A3AA364DA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 18:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A712A10ED26;
	Fri, 14 Feb 2025 17:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Pv+deL1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6272D10ED26
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 17:41:50 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E9JNUP032747;
 Fri, 14 Feb 2025 17:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hZSLNz22LKvLiQ/OADVV5inCh0xMUwKjcIOfDJ08xJE=; b=Pv+deL1iwy3DDyD+
 mBTx2edjVYd3sYK/5qlqYAugqt/xCbq+0iwxmwLrHPBLfsrOadlsmyJDEto0l/pV
 Ncy4l4gG2QqVMJ9qof+NvSEJHNuppRV1waMf1cGwkrTsYhOFpx3pYKvVmbaegorr
 /K5V1yMGzQk1wtrsH2hvqqwu7uGLTKRyBjj5H/xsBOJwS86DavVKs3RQPdtnFI+V
 odReU7ERqrl0xoHjv4wuJmsYYETjBQ2+EOa8ic4xqPVRMI+nXBBaWy+eg4LvjdIC
 Kj9bLl9HOQ6YClQWDXGnFuuX5Cvb7qjjW0CfxrX/ZNPPBILXI/MoljXJE858T+tW
 3tHbEw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44seq049wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 17:41:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51EHfgdJ024816
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2025 17:41:42 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 14 Feb
 2025 09:41:41 -0800
Message-ID: <c45d8a41-72a9-3685-384b-bd8c2c2766f7@quicinc.com>
Date: Fri, 14 Feb 2025 10:41:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <quic_carlv@quicinc.com>, <quic_yabdulra@quicinc.com>,
 <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>,
 <dan.carpenter@linaro.org>, <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <mhi@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
References: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
 <20250214173416.b6y7o6tqsnkuzkbh@thinkpad>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20250214173416.b6y7o6tqsnkuzkbh@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FA-E0WTdUlx1y-qstC6TxP-VMKNHdPVx
X-Proofpoint-ORIG-GUID: FA-E0WTdUlx1y-qstC6TxP-VMKNHdPVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140122
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

On 2/14/2025 10:34 AM, Manivannan Sadhasivam wrote:
> On Fri, Feb 14, 2025 at 09:21:09AM -0700, Jeffrey Hugo wrote:
>> If mhi_fw_load_handler() bails out early because the EE is not capable
>> of loading firmware, we may reference fw_load_type in cleanup which is
>> uninitialized at this point. The cleanup code checks fw_load_type as a
>> proxy for knowing if fbc_image was allocated and needs to be freed, but
>> we can directly test for that. This avoids the possible uninitialized
>> access and appears to be clearer code.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
>> Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")
> 
> The best thing would be to squash this fix into the offending commit as the
> fixes tag would become meaningless once merged upstream.

I see your point, however the offending commit is already part of a pull 
request. I think we've missed the window for squashing.

Thank you for the very quick review.

-Jeff
