Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6897AB57A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 18:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CE510E6A1;
	Fri, 22 Sep 2023 16:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFA010E6A1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 16:04:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38MBmMxU032189; Fri, 22 Sep 2023 16:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=l7AmTVTzXoIiRVrIjYhANwxigIxShTI+6Loa741uNHQ=;
 b=R4PoL4A6BPPre97911jDUdxE6k44LiYaIdrOVuF5qblsxlzfjR0+0SQ0vXIQV/BQk35F
 YTW+Ggn2AJ01CqREN31sgv/VVsGpDch7bt7pOimepHksVLGXAaOUmCNFKonmM0h6mcsX
 WW892DL8p8yLCTs4K0Mx4SwL3a5ynjffrZv1gvyUv277qL0VrE1981zPQPyauIk/HdMI
 tgeCxsWWgGqpDexNaQsN28x/2Hx6YDEEIaMjZfT0o6540D8Qh5isP8LbRHfBKGlRByvS
 sA/WXUxjeekpxiQbdZVGWI+32DF4o84OfEqhr3LPdBuCOqKMsRmGv6Ar+wV2KzM2xVV3 GQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u6ajajr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 16:04:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MG4Y3B030661
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 16:04:34 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 09:04:33 -0700
Message-ID: <fdd8dc93-33eb-c414-3584-7cfd69e6bac7@quicinc.com>
Date: Fri, 22 Sep 2023 10:04:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/7] accel/qaic: Extend uAPI to support undoing
 ATTACH_SLICE_BO
Content-Language: en-US
To: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <stanislaw.gruszka@linux.intel.com>, <ogabbay@kernel.org>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230901172247.11410-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: lfZNc1hMIyXzOQr51m827dWoLuk1v8yP
X-Proofpoint-ORIG-GUID: lfZNc1hMIyXzOQr51m827dWoLuk1v8yP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_14,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=877 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220138
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/2023 11:22 AM, Jeffrey Hugo wrote:
> A BO for a QAIC device has two states -
> 1. Allocated
> 2. Sliced
> 
> A BO can be allocated at any time, and is initialized in the allocated state.
> A BO can transition to the sliced state via ATTACH_SLICE_BO.  This prepares the
> BO for use with an active workload.  Currently a BO in the sliced state can
> only be used with a single workload, and will only transition back to the
> allocated state once the workload is deactivated.
> 
> Userspace would like the ability to trigger a BO transition from the sliced
> state to the allocated state. This would support the usecase of a userspace
> client that has two active workloads, where the output of the first workload
> becomes the input of the second workload. Currently, the client would need
> two BOs, once for each workload, and copy from one BO to the other.
> 
> To support this usecase, we create the detach slice concept which is the
> inverse operation of ATTACH_SLICE_BO.  We extend the uAPI with a new
> DETACH_SLICE_BO ioctl that allows userspace to perform this operation.
> 
> Since ATTACH_SLICE_BO and DETACH_SLICE_BO are related operations, they share
> a decent amount of code. This series starts with restructuring the common code
> for use in both ioctls before finally adding the DETACH_SLICE_BO.
> 
> Pranjal Ramajor Asha Kanojiya (7):
>    accel/qaic: Remove ->size field from struct qaic_bo
>    accel/qaic: Update BO metadata in a central location
>    accel/qaic: Declare BO 'sliced' after all the operations are complete
>    accel/qaic: Undo slicing setup done in qaic_attach_slicing_bo()
>    accel/qaic: Clean up BO during flushing of transfer list
>    accel/qaic: Create a function to initialize BO
>    accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL
> 
>   Documentation/accel/qaic/qaic.rst |  10 ++
>   drivers/accel/qaic/qaic.h         |   6 +-
>   drivers/accel/qaic/qaic_data.c    | 187 +++++++++++++++++++++++-------
>   drivers/accel/qaic/qaic_drv.c     |   1 +
>   include/uapi/drm/qaic_accel.h     |  24 +++-
>   5 files changed, 175 insertions(+), 53 deletions(-)
> 

Pushed to drm-misc-next

-Jeff
