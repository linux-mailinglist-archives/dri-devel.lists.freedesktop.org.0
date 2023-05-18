Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58AA70839A
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 16:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255C010E0C7;
	Thu, 18 May 2023 14:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C2010E0C7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 14:11:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34IBBPEM007164; Thu, 18 May 2023 14:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MgrfDLoLXI4x/aGMt+ZNAcTpL6wKrq5ZO2kCUZCD/O8=;
 b=VRdmBJJmXZNs96N43QWABxb12G+wJpEWcQ1ND3RGy4SzXFIOCiTjLpUJSMTOL6CNdsox
 nA4Nv0nRRGOy2SZ89aSjkiJJbjsFYN3Pff1aQErwfpjOhWHKAiVBFQbEw+EZSqj6E++a
 aD6/mxWA1sPDgeo/jOHMyD2uKasB8GyDykTWvWUUcD62vMCQe51wrjdpWUU1x4wsx+V0
 vs5LwBUnU7y195pM0fupQv+MPKdycOV3aBUphjFYDNaNi+epHaRluSj3jlSSnMsEo5UQ
 js6U/7pVCQyt+icezXZLptbfwog593QYaLd5ww3gbesy1kvZNPGQex4FIh+Ql/DsC5Fl qw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qnb7h9b9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 14:11:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34IEBOn0010001
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 May 2023 14:11:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 18 May
 2023 07:11:23 -0700
Message-ID: <45704044-4491-2811-8635-e5244711a0ce@quicinc.com>
Date: Thu, 18 May 2023 08:11:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 4/5] accel/ivpu: Rename and cleanup MMU600 page tables
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230518131605.650622-1-stanislaw.gruszka@linux.intel.com>
 <20230518131605.650622-5-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230518131605.650622-5-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: kWrJPbRUjyx7cws0PfVKVPGQtDooqyJV
X-Proofpoint-GUID: kWrJPbRUjyx7cws0PfVKVPGQtDooqyJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-18_11,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305180113
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/18/2023 7:16 AM, Stanislaw Gruszka wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Simplify and unify naming convention in MMU600 page tables
> configuration.
> 
> All DMA addresses in page tables directly accessed by VPU are called
> with _dma sufix and all CPU pointers to those page tables have _ptr
> sufix.
> 
> Base pointers used to do a page walk on the CPU have corresponding
> names:
> 
>   pud_ptrs (pointers used to get access to PUD DMA)
>   pmd_ptrs (pointers used to get access to PMD DMA)
>   pte_ptrs (pointers used to get access to PTE DMA)
> 
> with the following convention:
> 
>   u64 *pud_dma_ptr = pud_ptrs[pgd_idx];
>   *pud_dma_ptr = pud_dma;
> 
>   u64 *pmd_dma_ptr = pmd_ptrs[pgd_idx][pud_idx];
>   *pmd_dma_ptr = pmd_dma;
> 
>   u64 *pte_dma_ptr = pte_ptrs[pgd_idx][pud_idx][pmd_idx];
>   *pte_dma_ptr = pte_dma;
> 
> On the way change to coherent dma allocation, _wc is only valid on ARM
> and was used by mistake.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
