Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D54720852
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 19:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2131610E5D5;
	Fri,  2 Jun 2023 17:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364E910E5D5
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 17:24:04 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 352D4BEU021610; Fri, 2 Jun 2023 17:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=maYypMQGIwP4bf1FSYvI7yxRhFoAcNH9RNlpBvkMNFI=;
 b=TZtoXKGy/jXmVHhRa9V1WxKHV5bGtqZSiqxyJitwSIoHiZLJ7/Iu535s/LA25AVrELQ6
 55FW2qyRtz8vctxha05KM3qZ/1Pk7iSkCahNA6JC66642qWoYRaeOD5SQoW/jzgihhIY
 HAPtdQysWbAGbbx0yLdjEtY29ayyjBnuOiHJS9zWW5/+BIgQr70y1U0FewqqI47lHvCM
 KECRvYfMnBqMd8dbYw4yIPoGmDh1ph3zKcK+mUBkw9UEGnocbIeT+mSgn+n5E5ag58n8
 wUtEKVMRPwtfcoCB1VM4O2XYTUnWYNkr5IK/roA7txa+2WnuEwWbgkyDQAuptzEHUq3/ wg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qydr5h2gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jun 2023 17:23:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 352HNx7D023039
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jun 2023 17:23:59 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 2 Jun 2023
 10:23:58 -0700
Message-ID: <63a0383b-fa2f-84f4-db4a-bcd21b695fdb@quicinc.com>
Date: Fri, 2 Jun 2023 11:23:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] accel/ivpu: Do not trigger extra VPU reset if the VPU
 is idle
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230525103818.877590-1-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mVWOkxuvBX8_oBMeUvKQt1MDyvsLwSmr
X-Proofpoint-GUID: mVWOkxuvBX8_oBMeUvKQt1MDyvsLwSmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_13,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020132
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/2023 4:38 AM, Stanislaw Gruszka wrote:
> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> 
> Turning off the PLL and entering D0i3 will reset the VPU so
> an explicit IP reset is redundant.
> But if the VPU is active, it may interfere with PLL disabling
> and to avoid that, we have to issue an additional IP reset
> to silence the VPU before turning off the PLL.
> 
> Fixes: a8fed6d1e0b9 ("accel/ivpu: Fix power down sequence")
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
