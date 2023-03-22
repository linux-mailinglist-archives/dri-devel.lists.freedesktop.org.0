Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AACDE6C4DA6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADD010E978;
	Wed, 22 Mar 2023 14:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B1510E96C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:28:45 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MALJov028679; Wed, 22 Mar 2023 14:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ORrFBNr8/QSUzxOVFVHYtxaZKj8WYyev4/gpukgJzaA=;
 b=To06BX7RgVy8hBGx8619QnP72tKABJAJgihVA6nmm2/JfoxSxgQIsbXZvBsPfEvQas6K
 1646ulQOOKg+HwDmkPzBTkpzFSLDG8sx/4pcpM1AKQVns+cVBVq4qQlKmGl0PEcHSNRB
 9G5/SPcWL66PXFwCvt2r6D6DiVz5MBFT6AXwiTNfoeZUlz8ciPaa3lioqBFtmoFWgh6s
 OMb5LCnn7FmWK94o/JDcC0FMHSbx3VvMX6g0OOWlaVmHkVO1DEWufR9RZ5PE2x2v/zzj
 5dXJJl2gHCVJmwFciCmlWocVZgHFX2XxoaaMJs9OMPDnRDc2IciU7aFHIaI3teHLCf3H IQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pfbx03ptp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:28:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32MESdJY017624
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Mar 2023 14:28:39 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 22 Mar
 2023 07:28:39 -0700
Message-ID: <621c314d-af6c-0713-d262-e3d6b18f8c86@quicinc.com>
Date: Wed, 22 Mar 2023 08:28:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 4/7] accel/ivpu: Fix power down sequence
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
 <20230322091900.1982453-5-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230322091900.1982453-5-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: zVmVMqMfWu3xaGoA-GrR7fKbRV9bLVs4
X-Proofpoint-ORIG-GUID: zVmVMqMfWu3xaGoA-GrR7fKbRV9bLVs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_11,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 mlxlogscore=996 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303220105
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/2023 3:18 AM, Stanislaw Gruszka wrote:
> Remove FPGA WA on power_down to skip checking for noc quiescent state.

WA is workaround, right?  Maybe spell it out here?

> Put VPU in reset before powering it down and skip manipulating
> registers that are reset by the VPU reset.
> 
> This fixes power down errors there VPU is powered down just after VPU
> is booted.

there -> where ?

> Co-developed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

With the above addressed,
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
