Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FC76C6BD3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 16:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463A310E41A;
	Thu, 23 Mar 2023 15:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69DA10E41A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 15:02:44 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32NAHFuG027128; Thu, 23 Mar 2023 15:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6tIOMIUdsVrcGao4k/FAPTYQo0ow1uhKqbDw6umNCDc=;
 b=SdJyUs248A36mH25DWZY3z7xgbS+DnTVZi59mfkc53YNEP5UGNk9GWj7sIexpPCN38Az
 /3BQDS2kNl1kkEHDm9KrE5qVsOdk8BsrPoE4VFXUXBj0Gysw3ovG8boZ6VrzzvDZOnE4
 poY1sq2AgJeUg60hZn30BZhQoRMcEZh55BE3E0eCaQ7iuGwjtR6cemOpOs1uoVw+V0BN
 /rTGvlwoQoVAHMiSVwDRREaNxpLnuCIVpyYj+m0+fU+XPMrCZjMUV9k5lvBNmvwiVoxg
 LHOXlkBkyzJWJdpN61oUUgrIXbAzlzMlO9kPiAERkQOAnUJTkcR7/kpo25DM9hJbB2de Aw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pg64k2nx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 15:02:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32NF2X3W020019
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 15:02:33 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 23 Mar
 2023 08:02:33 -0700
Message-ID: <90291d32-4253-ff91-8f96-e1028c6cd65c@quicinc.com>
Date: Thu, 23 Mar 2023 09:02:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 8/8] accel/ivpu: Fix IPC buffer header status field
 value
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230323125504.2586442-1-stanislaw.gruszka@linux.intel.com>
 <20230323125504.2586442-9-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230323125504.2586442-9-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gG7uCI6vIhgtNJod8KPfdE8BUyeI8-NC
X-Proofpoint-ORIG-GUID: gG7uCI6vIhgtNJod8KPfdE8BUyeI8-NC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 mlxlogscore=895 phishscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230110
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

On 3/23/2023 6:55 AM, Stanislaw Gruszka wrote:
> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> 
> IPC messages transmitted to the device must be marked as
> allocated - status field must be set to 1. The VPU driver
> has IVPU_IPC_HDR_ALLOCATED incorrectly defined. Future VPU
> firmware versions will reject all IPC messages with invalid
> status and will not work with a VPU driver that is missing
> this fix.
> 
> Fixes: 5d7422cfb498 ("accel/ivpu: Add IPC driver and JSM messages")
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
