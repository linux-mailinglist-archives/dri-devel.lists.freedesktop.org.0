Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 561327EF554
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 16:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B3310E2F4;
	Fri, 17 Nov 2023 15:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5582A10E2F4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 15:35:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AHFRSjn005579; Fri, 17 Nov 2023 15:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zE76RVvQdTjbIKZpErLaCmCfmefFMQzHvzbYKRe7gZU=;
 b=UipgFoqDXK0gK611YCISdJsU2ngKtmPHDq2XzL0r1lAOpeymMLFDJOFh3JszL/ywiLLS
 ntibDdhl/DgMBspcwaAcd8XegIRqCdqK22ka9gvuwaPAQsDo1PbOlJdBpD5T39pru02S
 OZlVcOFbbTKH20rzXcdJ5cS0x/OFZUFYQob7OkLWh9oXRBnqjlD4RGPQaYNkZYe277GB
 VvJwc7ihg9O43ywZ2ApAEj0CsF8NVHQcDcm1d/WHGDU3xUKE/2oZjDU1fBMcpOCU5R6v
 3zTfOE15erZcrHcfhNUROQWPvb0Qfp75srxx51n4JF7nwGK5ieWd1pVNnZunIeyPWZ/f sg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udw46spb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 15:35:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHFZaGS004321
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 15:35:36 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 17 Nov
 2023 07:35:35 -0800
Message-ID: <49235bcb-746e-626c-6998-abb0c20ce4e8@quicinc.com>
Date: Fri, 17 Nov 2023 08:35:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/ivpu/37xx: Fix hangs related to MMIO reset
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231115111004.1304092-1-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231115111004.1304092-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QQg9NGxmm54MX6Q8m27avcO7uPhHvaut
X-Proofpoint-ORIG-GUID: QQg9NGxmm54MX6Q8m27avcO7uPhHvaut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_14,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=628 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170116
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

On 11/15/2023 4:10 AM, Jacek Lawrynowicz wrote:
> There is no need to call MMIO reset using VPU_37XX_BUTTRESS_VPU_IP_RESET
> register. IP will be reset by FLR or by entering d0i3. Also IP reset
> during power_up is not needed as the VPU is already in reset.
> 
> Removing MMIO reset improves stability as it a partial device reset
> that is not safe in some corner cases.
> 
> This change also brings back ivpu_boot_pwr_domain_disable() that
> helps to properly power down VPU when it is hung by a buggy workload.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Fixes: 828d63042aec ("accel/ivpu: Don't enter d0i3 during FLR")

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
