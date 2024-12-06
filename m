Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D279E7C07
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 23:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C35410E068;
	Fri,  6 Dec 2024 22:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="GP1fDdkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36A810E068
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 22:55:35 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6MKlpA026638;
 Fri, 6 Dec 2024 22:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 54knlSjvEGPrvDlxBgLu/xm6+Q4wLdDfKz4RQSiI+Dc=; b=GP1fDdkjDelGVuEN
 pVJfAoAvst41001Sd5kQ08wW3vaGVJZBzQHJLb+3b7YZVAzH4DhiokRYA6KECOQ/
 ND8KIycpHkq+hPdsfoBWF6G+8UaYY1icpIXo8/v8UcW+pZZGBgFjr36kRPSjv+bX
 Tan+kmzW6oGCFNBihatvCxJ2CCOxeTCR/5ofWpsZOX8OH/Vdi/xcdnYbcPpwBF0G
 +Bv/EvPc8696G2dVXxMFjcFZDUzMUXZJns+HCpwoZF1HsO20RtMJX5rC1ONAKq21
 ZYiO/XilUHwfHN9G5INScWXNg+H7JDqqQzZQ8mu9MZ9uSjpgaMawyMtvcf1LTyxq
 eH182A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxtc9wsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 22:55:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6MtVN2000664
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 22:55:31 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 14:55:31 -0800
Message-ID: <89496055-5564-edcf-ff25-cbbb2bf9dd33@quicinc.com>
Date: Fri, 6 Dec 2024 15:55:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, Mike Lothian <mike@fireburn.co.uk>
CC: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
 <f094ae61-04a9-8bd9-7b43-72ccdca22d5a@quicinc.com>
 <CAHbf0-HBYFTHqdC1w8Nhw1oVErXeMdtcdHZbebwmt8x20VwkHA@mail.gmail.com>
 <CAHbf0-H3jk17+aKTYUMTHMFT=KGAVh_xWMfe+VYrqXS-0jdQ5w@mail.gmail.com>
 <d7b0cc20-1ee9-8d21-7a8f-4dc84be3b7f9@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <d7b0cc20-1ee9-8d21-7a8f-4dc84be3b7f9@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _mnWO9UGYMBujQ2lbhB4dY9HSg35YfEl
X-Proofpoint-ORIG-GUID: _mnWO9UGYMBujQ2lbhB4dY9HSg35YfEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060174
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

On 12/6/2024 11:47 AM, Lizhi Hou wrote:
> 
> On 12/6/24 09:01, Mike Lothian wrote:
>> On Fri, 6 Dec 2024 at 16:41, Mike Lothian <mike@fireburn.co.uk> wrote:
>>> On Fri, 6 Dec 2024 at 16:26, Jeffrey Hugo <quic_jhugo@quicinc.com> 
>>> wrote:
>>>> On 12/5/2024 8:44 AM, Mike Lothian wrote:
>>>>> Hi
>>>>>
>>>>> I needed to add the following to get things compiling for me
>>>>>
>>>>>
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>> b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>> index fe684f463b945..79b9801935e71 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>> @@ -6,6 +6,7 @@
>>>>> #include <drm/drm_device.h>
>>>>> #include <drm/drm_managed.h>
>>>>> #include <linux/bitfield.h>
>>>>> +#include <linux/interrupt.h>
>>>>> #include <linux/iopoll.h>
>>>> Looking at the code, this is valid.  However, I'm not sure why this is
>>>> broken for you and not others.  Do you have any ideas?  How are you
>>>> building this?  Is the tree and/or defconfig unique in some way?
>>>>
>>>>> #define CREATE_TRACE_POINTS
>>>>>
>>>>>
>>>>> I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
>>>>> from npu.sbin.1.5.2.380 to npu.sbin
>>>>>
>>>>> Cheers
>>>>>
>>>>> Mike
>>>>>
>>> I'm building with clang 19.1.5, this is on linus's tree 6.13-rc1
>>>
>>> I've applied AMD-XDNA-driver and AMD-NPU-driver-improvements series
>>>
>>> These are the errors I see without the above patch:
>>>
>>> drivers/accel/amdxdna/amdxdna_mailbox.c:342:8: error: unknown type
>>> name 'irqreturn_t'
>>>    342 | static irqreturn_t mailbox_irq_handler(int irq, void *p)
>>>        |        ^
>>> drivers/accel/amdxdna/amdxdna_mailbox.c:352:9: error: use of
>>> undeclared identifier 'IRQ_HANDLED'
>>>    352 |         return IRQ_HANDLED;
>>>        |                ^
>>> drivers/accel/amdxdna/amdxdna_mailbox.c:380:4: error: call to
>>> undeclared function 'disable_irq'; ISO C99 and later do not support
>>> implicit function declarations [-Wimplicit-function-declaration]
>>>    380 |                         disable_irq(mb_chann->msix_irq);
>>>        |                         ^
>>> drivers/accel/amdxdna/amdxdna_mailbox.c:497:8: error: call to
>>> undeclared function 'request_irq'; ISO C99 and later do not support
>>> implicit function declarations [-Wimplicit-function-declaration]
>>>    497 |         ret = request_irq(mb_irq, mailbox_irq_handler, 0,
>>> MAILBOX_NAME, mb_chann);
>>>        |               ^
>>> drivers/accel/amdxdna/amdxdna_mailbox.c:521:2: error: call to
>>> undeclared function 'free_irq'; ISO C99 and later do not support
>>> implicit function declarations [-Wimplicit-function-declaration]
>>>    521 |         free_irq(mb_chann->msix_irq, mb_chann);
>>>        |         ^
>>> drivers/accel/amdxdna/amdxdna_mailbox.c:538:2: error: call to
>>> undeclared function 'disable_irq'; ISO C99 and later do not support
>>> implicit function declarations [-Wimplicit-function-declaration]
>>>    538 |         disable_irq(mb_chann->msix_irq);
>>>        |         ^
>>> 6 errors generated.
>>>
>>> With the patch applied I then got firmware issues so I had to rename
>>> the newly upstreamed firmware, I'm not sure of the code needs to load
>>> the versioned file or if the file needs renamed in linux-firmware
>>>
>>> I'm attaching my .config
>>>
>>> Cheers
>>>
>>> Mike
>> The attachment bounced so heres a link to the .config on github
>> https://github.com/FireBurn/KernelStuff/blob/quark/dot_config_tip
> 
> I am able to reproduce with your .config. I believe it is because 
> CONFIG_TRACING is disabled.
> 
> If you are ok, I can include your fix to 
> https://lore.kernel.org/dri-devel/20241204213729.3113941-1-lizhi.hou@amd.com/T/#t 

It should be a separate patch, with a reported-by and a fixes tag.

-Jeff
