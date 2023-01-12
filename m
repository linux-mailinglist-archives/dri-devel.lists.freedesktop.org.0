Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0CB667CCF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 18:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591F010E321;
	Thu, 12 Jan 2023 17:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3999D10E1A8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 17:41:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CGKgBG000693; Thu, 12 Jan 2023 17:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=2gpNMbzb+AElwgJIfZ/Y6wQz3sjmUGe5+rVLzN5HrlE=;
 b=joBhJJox2MeiC0D+xsCqtu+DBEotQkkf8uSSJgUViWlMvqJShWKTacvqJ2mazXrQd+Yn
 mR3Pi15nsEmW7VdQZhDJfnLRhmx5YBqh6HyDpXKZv5/tp1Ec6Ft5/F+N2vfmsHED5XQI
 Y6bsI19Q5+68gDG5t35rBTksag+rba5j+2MMEX1S366jJl2y22EC2E6JZjxAm7oaFBAJ
 xgzPItFiwSPVHgyLf4kOmMyMlbs5URFEDEyjDgUNkGEl4WjMuvJ4i+4prcILyBKe+Adg
 /EyP+0hF+KjXd+u2/CPgo0JrvE1+qe8M32oyw/GN9fzmeu8s+1UBbI1L30cLLgmo4YZb xw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2edus979-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 17:41:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30CHfrXf002150
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 17:41:53 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 09:41:53 -0800
Message-ID: <4961e348-e869-b05f-98ea-f972b7e581c6@quicinc.com>
Date: Thu, 12 Jan 2023 10:41:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 2/7] accel/ivpu: Add Intel VPU MMU support
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oded.gabbay@gmail.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <tzimmermann@suse.de>
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-3-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230109122344.253994-3-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: A-nwoc-tVoUhLZr2M49wEEtNuZs5Gb8L
X-Proofpoint-ORIG-GUID: A-nwoc-tVoUhLZr2M49wEEtNuZs5Gb8L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=762 mlxscore=0 phishscore=0 clxscore=1011 adultscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120126
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
Cc: andrzej.kacprowski@linux.intel.com,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
> VPU Memory Management Unit is based on ARM MMU-600.
> It allows the creation of multiple virtual address spaces for
> the device and map noncontinuous host memory (there is no dedicated
> memory on the VPU).
> 
> Address space is implemented as a struct ivpu_mmu_context, it has an ID,
> drm_mm allocator for VPU addresses and struct ivpu_mmu_pgtable that
> holds actual 3-level, 4KB page table.
> Context with ID 0 (global context) is created upon driver initialization
> and it's mainly used for mapping memory required to execute
> the firmware.
> Contexts with non-zero IDs are user contexts allocated each time
> the devices is open()-ed and they map command buffers and other
> workload-related memory.
> Workloads executing in a given contexts have access only
> to the memory mapped in this context.
> 
> This patch is has two main files:
>    - ivpu_mmu_context.c handles MMU page tables and memory mapping
>    - ivpu_mmu.c implements a driver that programs the MMU device
> 
> Co-developed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
