Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDAE9253DC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 08:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACA610E048;
	Wed,  3 Jul 2024 06:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NenHOlnR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F6710E048
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 06:44:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4635IuEg023216;
 Wed, 3 Jul 2024 06:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LBnJNdNihFNWFLg/yGpphb/wqfN22TBekYfvklVf0NU=; b=NenHOlnRelxIX3v2
 HGp9On1kf1vr2fhXnYhPZ4J8jvUcAGzoT9LQVDqhRZggHDkyogreezXJxPbsNyax
 aViSLt3PlywcAkA6ekOXlJ0Hn+wxA/u2GzF9CL2X8L3aKuB/GzqwudhZSF2l7Xes
 RnqR1wAdK7vf+T9aiudhCh4Q884+c8nFYCkqdC0R6x+J0b/qgrR1wHbPquKYqzEp
 w0dPoUlU8dppm4gdMQC9CBD2v2qWcuYnMOIzoxb4ZYIP0zgeBJf79pZ4wWUHsOMn
 inSTUhy8+dFU/Ztr5im2NXhgumZzxVUQX1COpIHoNAtMVuzdxpG+/Z96Pzq6I8dz
 +2UMUw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4050cy85b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jul 2024 06:44:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4636iFfp001144
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Jul 2024 06:44:15 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 23:44:12 -0700
Message-ID: <c48e17df-1806-439d-b0c9-2c6b7c208505@quicinc.com>
Date: Wed, 3 Jul 2024 12:14:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Greg KH <gregkh@linuxfoundation.org>, <srinivas.kandagatla@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>, stable
 <stable@kernel.org>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
 <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com>
 <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
 <2024062849-brunt-humvee-d338@gregkh>
 <2e616e9d-fc04-4826-b784-4c6ee45bfbc2@quicinc.com>
 <foe6khsckzdvd5ccwitzfpdwoigdgu3uostuar3zk5d5stcd4s@hkrdg7vp4mqt>
 <3b07be20-e0c9-4ee2-a37b-34400e63862b@quicinc.com>
 <CAA8EJpoxwNv-wpJvqEf9U+Dg9=BJXG++GWB+2DES92MSqXN-3w@mail.gmail.com>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <CAA8EJpoxwNv-wpJvqEf9U+Dg9=BJXG++GWB+2DES92MSqXN-3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WrNEgocS_7TlX9dniu_Kv0D2ipA8uwYF
X-Proofpoint-ORIG-GUID: WrNEgocS_7TlX9dniu_Kv0D2ipA8uwYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_03,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030048
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



On 7/2/2024 3:10 PM, Dmitry Baryshkov wrote:
> On Tue, 2 Jul 2024 at 10:07, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>>
>>
>> On 7/1/2024 10:41 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 01, 2024 at 10:50:38AM GMT, Ekansh Gupta wrote:
>>>> On 6/28/2024 7:51 PM, Greg KH wrote:
>>>>> On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
>>>>>> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
>>>>>>> On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
>>>>>>>>> For user PD initialization, initmem is allocated and sent to DSP for
>>>>>>>>> initial memory requirements like shell loading. This size is passed
>>>>>>>>> by user space and is checked against a max size. For unsigned PD
>>>>>>>>> offloading, more than 2MB size could be passed by user which would
>>>>>>>>> result in PD initialization failure. Remove the user PD initmem size
>>>>>>>>> check and allow buffer allocation for user passed size. Any additional
>>>>>>>>> memory sent to DSP during PD init is used as the PD heap.
>>>>>>>> Would it allow malicious userspace to allocate big enough buffers and
>>>>>>>> reduce the amount of memory available to the system? To other DSP
>>>>>>>> programs?
>>>>>>> The allocation here is happening from SMMU context bank which is uniquely assigned
>>>>>>> to processes going to DSP. As per my understanding process can allocate maximum
>>>>>>> 4GB of memory from the context bank and the memory availability will be taken care
>>>>>>> by kernel memory management. Please correct me if my understanding is incorrect.
>>>>>> Just wanted to add 1 question here:
>>>>>> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
>>>>>> allocated huge memory?
>>>>> No, because any userspace program that takes up too much memory will be
>>>>> killed by the kernel.
>>>>>
>>>>> You can not have userspace tell the kernel to allocate 100Gb of memory,
>>>>> as then the kernel is the one that just took it all up, and then
>>>>> userspace applications will start to be killed off.
>>>>>
>>>>> You MUST bounds check your userspace-supplied memory requests.  Remember
>>>>> the 4 words of kernel development:
>>>>>
>>>>>     All input is evil.
>>>> Thanks for the detailed explanation, Greg. I'll remember this going forward.
>>>>
>>>> For this change, I'll increase the max size limit to 5MB which is the requirement for
>>>> unsigned PD to run on DSP.
>>> So we are back to the quesiton of why 5MB is considered to be enough,
>>> see
>>>
>>> https://lore.kernel.org/linux-arm-msm/2024061755-snare-french-de38@gregkh/
>> This is based on the initial memory requirement for unsigned PD. This includes memory for shell loading on DSP
>> + memory for static heap allocations(heap allocations are dynamic for Signed PD). This requirement tends to
>> around 5MB. I'll update this  also information in commit text. There will be some additional memory passed to
>> the PD which will get added to the PD heap.
> Could you please clarify, are these 2MB and 5MB requirements coming
> from the DSP side or from the userspace side? In other words, is it
> coming from the shell / firmware / etc?
I did some more checking here, I'll summarize the problem and try to propose a
better solution:
init.filelen is actually the size of fastrpc shell file which is close to 900kb for both
signed and unsigned shells. User space passes this memory and size after opening
and reading the shell file. The bound check is for this filelen which looks correct also
as this size is not expected to be more than 2MB.

Now for PD initmem, this memory is needed for PD initialization which includes
loading of shell and other initialization requirements eg. PD heap. As of today, the
initmem allocation is taken as the max of FASTRPC_FILELEN_MAX(2MB bound check
macro) and 4 times of filelen(~4MB). So every time, atleast 2MB memory is allocated
for this initmem for PD initialization.

For unsigned PD, there are some additional read-write segments loaded on DSP which
takes the size requirement to slightly more than 4MB. Therefore allocating 5MB is
helping unsigned PD to be spawned.

I hope this helps in understanding the problem.

Proposed solution:
I believe the bound check macro should not be used for initmem size. I can add some
new definition with FASTRPC_INITMEM_MIN.

In the create_process function, the "memlen" will be set to FASTRPC_INITMEM_MIN
initially and it will get increased to 5MB if "unsigned_module" is requested.

Or I can add different MACRO definitions for both signed(3MB) and unsigned PD(5MB)
minimum initmem size.

Please let me know if this is not clear, I'll send a patch for better understanding.

--Ekansh

>> --Ekansh
>>>> --Ekansh
>>>>> thanks,
>>>>>
>>>>> greg k-h
>

