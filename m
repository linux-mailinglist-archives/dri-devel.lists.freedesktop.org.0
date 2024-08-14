Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEA69524FC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 23:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC0410E260;
	Wed, 14 Aug 2024 21:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="n1rdlBgD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB4A10E260
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 21:53:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EAcph4021306;
 Wed, 14 Aug 2024 21:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6NOji1WoQ2gXhNPX+EBnZLo1uYDshqz4BbckRQus3i8=; b=n1rdlBgDcynmTxux
 D4VYWOItFQpLb+svZlrL27sGLPGed5IM2nbG5O4/pUsvzrioTn59FdCJbPeo5OFj
 2uobiEjizM9Dt5O/wazJyf+xHqfE1gUwSI+CwYWlGSny6VQeO0OHwnqS3/5B4o1x
 mtHxSndDElTcAAggMCberhVsyIAm3OEsShZXMzqqhc8joAoW/D0iTcsuD1tTXjOn
 RLEmlVn+yI4IYjvO3qEjpESkgJ5JNZTzGVjYhHGwoNhe0MzAXzA8mYrU1Pfk81jh
 C01rMIYEEV3H6xtRwv1/cwmJeBaF+plkkGm8FigQZrwwMbH2Kcoua0JTXtH+aa5S
 FXcyuw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4mkuc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2024 21:53:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47ELrplN014446
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2024 21:53:51 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 14 Aug
 2024 14:53:50 -0700
Message-ID: <754b747e-abf6-e70c-4091-2bea95576b81@quicinc.com>
Date: Wed, 14 Aug 2024 15:53:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 01/10] accel/amdxdna: Add a new driver for AMD AI Engine
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, Narendra Gutta
 <VenkataNarendraKumar.Gutta@amd.com>, George Yang <George.Yang@amd.com>
References: <20240805173959.3181199-1-lizhi.hou@amd.com>
 <20240805173959.3181199-2-lizhi.hou@amd.com>
 <f5e9f517-77b8-998d-9bf7-d9bf4ee2fbb8@quicinc.com>
 <172cde68-930f-381e-df9f-da2a48955828@amd.com>
 <edaa7f7d-a3e8-1b1a-37b8-3fd5a8a7790d@quicinc.com>
 <6f50a3d7-0aca-e1a8-423f-75bc5cb6e744@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <6f50a3d7-0aca-e1a8-423f-75bc5cb6e744@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: u7qj2A9y2cHbzSVbWTxmUzEwK543egNb
X-Proofpoint-GUID: u7qj2A9y2cHbzSVbWTxmUzEwK543egNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_18,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140151
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

On 8/14/2024 2:24 PM, Lizhi Hou wrote:
> 
> On 8/14/24 11:46, Jeffrey Hugo wrote:
>> On 8/14/2024 12:16 PM, Lizhi Hou wrote:
>>>
>>> On 8/9/24 09:11, Jeffrey Hugo wrote:
>>>> On 8/5/2024 11:39 AM, Lizhi Hou wrote:
>>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c 
>>>>> b/drivers/accel/amdxdna/aie2_pci.c
>>>>> new file mode 100644
>>>>> index 000000000000..3660967c00e6
>>>>> --- /dev/null
>>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>>> @@ -0,0 +1,182 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +/*
>>>>> + * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>>>>> + */
>>>>> +
>>>>> +#include <linux/amd-iommu.h>
>>>>> +#include <linux/errno.h>
>>>>> +#include <linux/firmware.h>
>>>>> +#include <linux/iommu.h>
>>>>
>>>> You are clearly missing linux/pci.h and I suspect many more.
>>> Other headers are indirectly included by "aie2_pci.h" underneath.
>>
>> aie2_pci.h also does not directly include linux/pci.h
> 
> it is aie2_pci.h --> amdxdna_pci_drv.h --> linux/pci.h.
> 
> It compiles without any issue.

I did not doubt that it compiled.  To be clear, I'm pointing out what I 
believe is poor style - relying on implicit includes.

There is no reason that amdxdna_pci_drv.h needs to include linux/pci.h 
(at-least in this patch).  That header file doesn't use any of the 
content from pci.h.  If this were merged, I suspect it would be valid 
for someone to post a cleanup patch that removes pci.h from 
amdxdna_pci_drv.h.

The problem comes when someone does a tree wide refactor of some header 
- perhaps moving a function out of pci.h into something else.  If they 
grep the source tree, they'll find amdxdna_pci_drv.h includes pci.h but 
really doesn't use it.  They likely won't see aie2_pci.c which may break 
because of the refactor.  Even more problematic is if pci.h is including 
something that you need, and you are not including it anywhere.  The 
code will still compile, but maybe in the next kernel cycle pci.h no 
longer includes that thing.  Your code will break.

The 4 includes you have here seems entirely too little, and I'm not 
clearly seeing the logic of what gets explicitly included vs what is 
implicitly included.  firmware.h is explicitly included, but pci.h is 
not, yet it seems like you use a lot more from pci.h.

There is the include what you use project that attempts to automate 
this, although I don't know how well it works with kernel code - 
https://github.com/include-what-you-use/include-what-you-use

> 
>>
>>>>> +
>>>>> +    ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>>>>> +    if (ret) {
>>>>> +        XDNA_ERR(xdna, "Failed to set DMA mask: %d", ret);
>>>>> +        goto release_fw;
>>>>> +    }
>>>>> +
>>>>> +    nvec = pci_msix_vec_count(pdev);
>>>>
>>>> This feels weird.  Can your device advertise variable number of 
>>>> MSI-X vectors?  It only works if all of the vectors are used?
>>> That is possible. the driver supports different hardware. And the fw 
>>> assigns vector for hardware context dynamically. So the driver needs 
>>> to allocate all vectors ahead.
>>
>> So, if the device requests N MSIs, but the host is only able to 
>> satisfy 1 (or some number less than N), the fw is completely unable to 
>> function?
> The fw may return interrupt 2 is assigned to hardware context. Then the 
> driver may not deal with it in this case. I think it is ok to fail if 
> the system has very limited resource.

Ok.  I suspect you'll want to change that behavior in the future with a 
fw update, but if this is how things work today, then this is how the 
driver must be.
