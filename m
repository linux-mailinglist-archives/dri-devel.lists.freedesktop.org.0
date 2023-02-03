Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA5689C6D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 15:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5636510E7C5;
	Fri,  3 Feb 2023 14:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1884710E7CD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 14:58:41 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 313DIMsh026730; Fri, 3 Feb 2023 14:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0PQP4A8dAare4KfXL72pPNTYekxeMdU+AQKYRDX+50A=;
 b=kWPx1gXtKbiq87Y2sAzOWb7WCsplJwYaS8xuYezlqlntJit/14NRPyYD5rg6PhzNb9wu
 kPhM9JSDHIm11gQGsJq5f78ytyuM2Un4wBZYBSW+BjiK+XIjuqQtw7vMsS8XwYymsFOj
 msWjivz0KnbWuhxvkNphcxOWa16cHREshu/o3ZnfOK9qe0rES3LTjVuCtjKk1AGEAPOA
 R49HZpfwVoszxZ6vz8FOJdjDNEIW0Qry0D2RRg5c1dVQjS14ggkq9LVn7iemykKzUHxj
 dgEHuDYhJAqX/DZznDS8sVw/Catq3AtWuRv9mS9oFhSUW4y63zNKwrWwWZF1iKEm9RQv oA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngwt58w61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Feb 2023 14:58:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313EwWfK019867
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 3 Feb 2023 14:58:32 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 06:58:32 -0800
Message-ID: <107a6141-83e0-e454-10f6-b0ba8507060c@quicinc.com>
Date: Fri, 3 Feb 2023 07:58:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/4] accel/ivpu: Fix FW API data alignment issues
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, <dri-devel@lists.freedesktop.org>
References: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
 <20230202092114.2637452-2-stanislaw.gruszka@linux.intel.com>
 <64efca60-2625-9b85-8d39-fb637b6d8b99@quicinc.com>
 <7085c059-11f3-b113-13ac-a5ed0e4103f9@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <7085c059-11f3-b113-13ac-a5ed0e4103f9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dV5gIAVoMzjs2lE9rvsVMUWJ45ZjdUum
X-Proofpoint-ORIG-GUID: dV5gIAVoMzjs2lE9rvsVMUWJ45ZjdUum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_13,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030136
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
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/3/2023 1:05 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 02.02.2023 16:04, Jeffrey Hugo wrote:
>> On 2/2/2023 2:21 AM, Stanislaw Gruszka wrote:
>>> From: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>>>
>>> FW API structures have been updated to fix misaligned
>>> structure members.
>>>
>>> Also changed JSM message header format to account for
>>> future improvements.
>>>
>>> Added explicit check for minimum supported JSM API version.
>>>
>>> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>>> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>>
>>
>>>    /*
>>>     * Job format.
>>> @@ -119,7 +119,7 @@ struct vpu_job_queue_entry {
>>>        u64 root_page_table_update_counter; /**< Page tables update events counter */
>>>        u64 preemption_buffer_address; /**< Address of the preemption buffer to use for this job */
>>>        u64 preemption_buffer_size; /**< Size of the preemption buffer to use for this job */
>>> -    u8 reserved[VPU_JOB_RESERVED_BYTES];
>>> +    u8 reserved_0[VPU_JOB_RESERVED_BYTES];
>>
>> This seems spurious, just adding "_0" to the name.  Seems like the majority of the changes are like this (although you have a _1 at the very end).  Are you anticipating adding additional reserved fields in the near future?
>>
> 
> These headers are our HW/FW interface and we (as a KMD team) do not have full control over them.
> The FW team has its own conventions which could probably treated the same as some auto generated HW interface headers accepted as-is.
> We could modify them on import but it would be harder then maintain them.
> If this doesn't bug you too much I would prefer to leave them as-is, OK?

Ah, these are pulled direct from the FW.  Fair enough.

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
