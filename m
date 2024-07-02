Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C091EFB9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 09:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D55710E0EF;
	Tue,  2 Jul 2024 07:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iinhIyCc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 475D810E0EF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 07:07:39 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461L0Y9h013083;
 Tue, 2 Jul 2024 07:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B/tDdP2Z1keyEASbG3gxexaFA29gWOsTfObNOgHDdoM=; b=iinhIyCc65Cwmfmj
 7mlmSav7clUGbmcbQDEZUSD6SI7yNMaGDWyRNAscb7IIPQa8JYUouldQIhLWERhh
 hBX0y4TLS8cm8fW1a7VAF0ijLGEtjOr21pNkT91bqiPvcyhRcOflWc+Wcni7Z4u5
 KdQw5mZGXJPTmHZaBwnqCnZQ8vczNi32PRndv14yhzsxIt7ZIMBS12jrtt/JMhge
 zGP6nBicBPUadBUWeXvaad1+Wxst/FMoxz2UvU3mhl0WBLjanJFwQfGVxh35aHcH
 XX6Y3lu7EA0H2gZHtZBM8DQnXZgeuhrao7kFXCDY8zwUbuc/MjyBwBKsN/xhU36y
 im6MLg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402ag2ebp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jul 2024 07:07:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46277VIY012507
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 2 Jul 2024 07:07:31 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 2 Jul 2024
 00:07:28 -0700
Message-ID: <3b07be20-e0c9-4ee2-a37b-34400e63862b@quicinc.com>
Date: Tue, 2 Jul 2024 12:37:25 +0530
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
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <foe6khsckzdvd5ccwitzfpdwoigdgu3uostuar3zk5d5stcd4s@hkrdg7vp4mqt>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: B9XM07VYNaMfDIjZ_s349d8y1bzur172
X-Proofpoint-GUID: B9XM07VYNaMfDIjZ_s349d8y1bzur172
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_02,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 mlxlogscore=916 bulkscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020053
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



On 7/1/2024 10:41 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 01, 2024 at 10:50:38AM GMT, Ekansh Gupta wrote:
>>
>> On 6/28/2024 7:51 PM, Greg KH wrote:
>>> On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
>>>> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
>>>>> On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
>>>>>> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
>>>>>>> For user PD initialization, initmem is allocated and sent to DSP for
>>>>>>> initial memory requirements like shell loading. This size is passed
>>>>>>> by user space and is checked against a max size. For unsigned PD
>>>>>>> offloading, more than 2MB size could be passed by user which would
>>>>>>> result in PD initialization failure. Remove the user PD initmem size
>>>>>>> check and allow buffer allocation for user passed size. Any additional
>>>>>>> memory sent to DSP during PD init is used as the PD heap.
>>>>>> Would it allow malicious userspace to allocate big enough buffers and
>>>>>> reduce the amount of memory available to the system? To other DSP
>>>>>> programs?
>>>>> The allocation here is happening from SMMU context bank which is uniquely assigned
>>>>> to processes going to DSP. As per my understanding process can allocate maximum
>>>>> 4GB of memory from the context bank and the memory availability will be taken care
>>>>> by kernel memory management. Please correct me if my understanding is incorrect.
>>>> Just wanted to add 1 question here:
>>>> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
>>>> allocated huge memory?
>>> No, because any userspace program that takes up too much memory will be
>>> killed by the kernel.
>>>
>>> You can not have userspace tell the kernel to allocate 100Gb of memory,
>>> as then the kernel is the one that just took it all up, and then
>>> userspace applications will start to be killed off.
>>>
>>> You MUST bounds check your userspace-supplied memory requests.  Remember
>>> the 4 words of kernel development:
>>>
>>> 	All input is evil.
>> Thanks for the detailed explanation, Greg. I'll remember this going forward.
>>
>> For this change, I'll increase the max size limit to 5MB which is the requirement for
>> unsigned PD to run on DSP.
> So we are back to the quesiton of why 5MB is considered to be enough,
> see
>
> https://lore.kernel.org/linux-arm-msm/2024061755-snare-french-de38@gregkh/
This is based on the initial memory requirement for unsigned PD. This includes memory for shell loading on DSP
+ memory for static heap allocations(heap allocations are dynamic for Signed PD). This requirement tends to
around 5MB. I'll update this  also information in commit text. There will be some additional memory passed to
the PD which will get added to the PD heap.

--Ekansh
>
>> --Ekansh
>>> thanks,
>>>
>>> greg k-h

